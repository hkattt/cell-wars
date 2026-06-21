class_name UpgradeMenu extends Control

signal close_menu(upgrade: Enums.Upgrade)

@export var upgrade_manager: UpgradeManager

@onready var upgrade_card_left: UpgradeCard = $MarginContainer/VBoxContainer/HBoxContainer/UpgradeCardLeft
@onready var upgrade_card_centre: UpgradeCard = $MarginContainer/VBoxContainer/HBoxContainer/UpgradeCardCentre
@onready var upgrade_card_right: UpgradeCard = $MarginContainer/VBoxContainer/HBoxContainer/UpgradeCardRight

func _ready() -> void:
	upgrade_card_left.selected.connect(_on_card_selected)
	upgrade_card_centre.selected.connect(_on_card_selected)
	upgrade_card_right.selected.connect(_on_card_selected)

func open() -> void:
	visible = true
	var upgrade_options: Array[Enums.Upgrade] = upgrade_manager.generate_upgrade_options()
	upgrade_card_left.set_upgrade(upgrade_options[0])
	upgrade_card_centre.set_upgrade(upgrade_options[1])
	upgrade_card_right.set_upgrade(upgrade_options[2])

func _on_card_selected(upgrade: Enums.Upgrade) -> void:
	visible = false
	close_menu.emit(upgrade)
