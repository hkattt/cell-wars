class_name HitBox extends Area2D

@export var health: Health
@export var box_size: Vector2
@export var entity: Enums.Entity

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	add_to_group("hit_boxes", true)
	collision_shape.shape.size = box_size

func take_damage(damage: float):
	health.take_damage(damage)
