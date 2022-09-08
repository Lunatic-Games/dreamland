extends Resource

class_name LocationData

export (Texture) var texture

export (int) var required_athletics = 1
export (int) var required_charisma = 1
export (int) var required_intelligence = 1
export (int) var required_strength = 1

export (Array) var success_rewards = []
export (Array) var failure_rewards = []
export (Array) var success_encounters = [preload("res://_resources/encounters/balloon_floats_me_away/part_1.tres")]
export (Array) var failure_encounters = [preload("res://_resources/encounters/balloon_floats_me_away/part_1.tres")]
