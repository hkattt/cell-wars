class_name DamageMatrix extends Resource

static var damage_matrix: Dictionary = {
	Enums.DamageSource.BULLET_WHITE: {
		Enums.Entity.PLAYER: 0,
		Enums.Entity.VIRUS_RED: 50,
		Enums.Entity.VIRUS_WHITE: 100,
	},
	Enums.DamageSource.BULLET_RED: {
		Enums.Entity.PLAYER: 0,
		Enums.Entity.VIRUS_RED: 50,
		Enums.Entity.VIRUS_WHITE: 100,
	},
	Enums.DamageSource.VIRUS_RED: {
		Enums.Entity.PLAYER: 0,
		Enums.Entity.VIRUS_RED: 50,
		Enums.Entity.VIRUS_WHITE: 100,
	},
	Enums.DamageSource.VIRUS_WHITE: {
		Enums.Entity.PLAYER: 0,
		Enums.Entity.VIRUS_RED: 50,
		Enums.Entity.VIRUS_WHITE: 100,
	}
}

static func get_damage(source: Enums.DamageSource, entity: Enums.Entity) -> float:
	return damage_matrix[source][entity]
