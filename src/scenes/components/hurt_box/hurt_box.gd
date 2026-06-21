class_name HurtBox extends Area2D

signal dealt_damage

@export var box_size: Vector2
@export var damage_source: Enums.DamageSource

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var current_target = null

func _ready() -> void:
	add_to_group("hit_boxes", true)
	collision_shape.shape.size = box_size

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("hit_boxes"):
		current_target = area as HitBox
		if current_target:
			current_target.handle_damage_event(damage_source)
			dealt_damage.emit()
		
func _on_area_exited(area: Area2D) -> void:
	if area == current_target:
		current_target = null

func _on_timer_timeout() -> void:
	if current_target:
		current_target.handle_damage_event(damage_source)
		dealt_damage.emit()
