class_name Game extends Node2D

@onready var character: Character = $Character
@onready var label: Label = $Label

func _ready() -> void:
	var spawner: Spawner = Spawner.create(character, 5, 1, 5)
	add_child(spawner)

func _process(_delta: float) -> void:
	label.text = "FPS: {fps}".format({"fps": Engine.get_frames_per_second()})
