class_name WaveManager extends Node2D

signal start_wave
signal end_wave

@export var target: Node2D
@export var spawners: Array[Spawner]

var current_wave: int = 0
var running: bool = false
var spawners_complete: int = 0

func _ready() -> void:
	for spawner in spawners:
		spawner.wave_complete.connect(_on_spawner_wave_complete)
	
func init(available_mutations: Array[Enums.Mutation]) -> void:
	var number_of_enemies: int = _compute_number_of_enemies(current_wave)
	var spawn_time_min: int = _compute_spawn_time_min(current_wave)
	var spawn_time_max: int = _compute_spawn_time_max(current_wave)
	var max_enemy_mutations: int = _compute_max_enemy_mutations(current_wave)
	
	for spawner in spawners:
		spawner.init(target, number_of_enemies, spawn_time_min, spawn_time_max, available_mutations, max_enemy_mutations)

func start_next_wave() -> void:
	current_wave += 1
	running = true
	start_wave.emit()
	
func is_wave_running() -> bool:
	for spawner in spawners:
		if spawner.is_running():
			return true
	return false

func get_current_wave() -> int:
	return current_wave

func _compute_spawn_time_min(wave: int) -> float:
	if wave < 3:
		return 3
	elif wave < 5:
		return 2.5
	elif wave < 10:
		return 2
	elif wave < 15: 
		return 1
	else:
		return 0.5
		
func _compute_spawn_time_max(wave: int) -> float:
	if wave < 3:
		return 10
	elif wave < 5:
		return 8
	elif wave < 10:
		return 6
	elif wave < 15: 
		return 5
	else:
		return 0.5

func _compute_max_enemy_mutations(wave: int) -> int:
	if wave < 3:
		return 0
	elif wave < 5:
		return 1
	elif wave < 10:
		return 2
	elif wave < 15: 
		return 3
	else:
		return 4

func _compute_number_of_enemies(wave: int) -> int:
	if wave < 3:
		return 2
	elif wave < 5:
		return 4
	elif wave < 10:
		return 6
	elif wave < 15: 
		return 10
	else:
		return 10 + wave

func _on_spawner_wave_complete() -> void:
	if !is_wave_running():
		end_wave.emit()
