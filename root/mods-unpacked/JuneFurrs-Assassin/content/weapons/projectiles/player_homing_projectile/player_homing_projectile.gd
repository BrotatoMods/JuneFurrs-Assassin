class_name PlayerHomingProjectile
extends PlayerProjectile


export (float) var drifting_factor = 0.1

var target = null
var player = null
var speed = - 1
var homing = false
var _homing_timer

onready var distance_travelled = 0.0


func _ready():
	player = TempStats.player


func _physics_process(delta):
	if speed == - 1:
		speed = velocity.length()
		drifting_factor *= speed / 3000

	if player.cleaning_up:
		set_to_be_destroyed()

	var target_direction = velocity.normalized()
	if homing:
		if target == null or target.dead:
			set_target()
		else :
			target_direction = global_position.direction_to(target.global_position)

		var target_velocity = target_direction * speed
		velocity += (target_velocity - velocity) * drifting_factor
		velocity = velocity.normalized() * speed
		rotation = velocity.angle()

	distance_travelled += speed * delta

	if distance_travelled > weapon_stats.max_range and not to_be_destroyed and target == null:
		set_to_be_destroyed()


func set_target():
	if not player == null:
		var possible_targets = []
		var actual_targets = {}
		var spawner_ref = player._entity_spawner_ref

		possible_targets.append_array(spawner_ref.enemies)
		possible_targets.append_array(spawner_ref.bosses)
		possible_targets.append_array(spawner_ref.neutrals)

		for target in possible_targets:
			actual_targets[(target.global_position - global_position).length()] = target

		if actual_targets.size() > 0:
			target = actual_targets[actual_targets.keys().min()]


func attach_script(p_enable_physics_process, p_destroy_on_leaving_screen, p_rotation_speed, p_weapon_stats):

	enable_physics_process = p_enable_physics_process
	destroy_on_leaving_screen = p_destroy_on_leaving_screen
	rotation_speed = p_rotation_speed
	weapon_stats = p_weapon_stats


	_hitbox = $Hitbox
	_destroy_timer = $DestroyTimer as Timer
	if get_tree():
		_homing_timer = get_tree().create_timer(0.05)

		_homing_timer.connect("timeout", self, "_on_HomingTimer_timeout")



	_ready()


func _on_HomingTimer_timeout():
	homing = true
