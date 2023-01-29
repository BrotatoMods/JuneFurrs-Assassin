extends "res://singletons/weapon_service.gd"

const ASSASSIN_LOG = "JuneFurrs-Assassin"
const ASSASSIN_HOMING_PROJECTILE_SCRIPT = preload("res://mods-unpacked/JuneFurrs-Assassin/content/weapons/projectiles/player_homing_projectile.gd")


# Extensions
# =============================================================================

func spawn_projectile(rotation:float, weapon_stats:RangedWeaponStats, pos:Vector2, knockback_direction:Vector2 = Vector2.ZERO, deferred:bool = false, effects:Array = [], from:Node = null, damage_tracking_key:String = "") -> Node:

	var _proj = .spawn_projectile(rotation, weapon_stats, pos, knockback_direction, deferred, effects, from, damage_tracking_key)

	if RunData.effects["all_homing_projectiles"]:
		_proj = _assassin_make_projectile_homing(_proj)

	return _proj


# Custom
# =============================================================================


func _assassin_make_projectile_homing(projectile:PlayerProjectile)->PlayerProjectile:
	var enable_physics_process = projectile.enable_physics_process
	var destroy_on_leaving_screen = projectile.destroy_on_leaving_screen
	var rotation_speed = projectile.rotation_speed
	var weapon_stats = projectile.weapon_stats
	projectile.set_script(ASSASSIN_HOMING_PROJECTILE_SCRIPT)
	projectile.attach_script(enable_physics_process, destroy_on_leaving_screen, rotation_speed, weapon_stats)
	return projectile
