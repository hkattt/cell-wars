class_name Game extends Node

@onready var game_arena: GameArena = $GameArena
@onready var upgrade_menu: UpgradeMenu = $UpgradeMenu

func _ready() -> void:
	game_arena.wave_complete.connect(_on_wave_complete)
	upgrade_menu.close_menu.connect(_on_close_menu)
	game_arena.start()

func _on_wave_complete() -> void:
	upgrade_menu.open()

func _on_close_menu(_upgrade: Enums.Upgrade) -> void:
	game_arena.start()
