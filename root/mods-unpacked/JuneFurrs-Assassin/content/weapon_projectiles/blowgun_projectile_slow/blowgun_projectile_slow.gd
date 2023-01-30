extends PlayerProjectile

onready var _slow_hitbox = $SlowHitbox


func _ready()->void :
	_slow_hitbox.deals_damage = false


func _on_SlowHitbox_hit_something(thing_hit:Node, damage_dealt:int)->void :
	thing_hit.add_decaying_speed( - 200)
	thing_hit.emit_signal("speed_removed", thing_hit)
