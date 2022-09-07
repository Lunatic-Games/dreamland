extends Resource

class_name CharacterData

enum AffectionTypes {
	STRENGTH,
	ATHLETICS,
	CHARISMA,
	INTELLIGENCE
}

export (AffectionTypes) var affection_type
export (int) var affection_difficulty_check = 2
export (int) var max_affection = 8
export (int) var min_affection = -8

# TODO: These shouldn't be raw filepaths
export (Dictionary) var positive_affection_reward_thresholds = {
	2:["res://card/card_data/pencil.tres"],
	4:["res://card/card_data/pencil.tres"],
	6:["res://card/card_data/pencil.tres"],
	8:["res://card/card_data/pencil.tres", "res://card/card_data/pencil.tres"]
}
export (Dictionary) var negative_affection_reward_thresholds = {
	-2:["res://card/card_data/pencil.tres"],
	-4:["res://card/card_data/pencil.tres"],
	-6:["res://card/card_data/pencil.tres"],
	-8:["res://card/card_data/pencil.tres", "res://card/card_data/pencil.tres"]
}
