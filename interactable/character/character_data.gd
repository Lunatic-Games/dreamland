extends Resource

class_name CharacterData

enum affection_types {
	strength,
	athletics,
	charisma,
	intelligence
}

export (affection_types) var affection_type
export (int) var affection_threshold = 2
export (int) var max_affection = 8
export (int) var min_affection = -8
export (Dictionary) var affection_reward_thresholds = {
	2:"SomeReward",
	4:"SomeReward",
	6:"SomeReward",
	8:"SomeReward",
	-2:"SomePenalty",
	-4:"SomePenalty",
	-6:"SomePenalty",
	-8:"SomePenalty"
}

