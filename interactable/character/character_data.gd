extends Resource

class_name CharacterData

enum AffectionTypes {
	STRENGTH,
	ATHLETICS,
	CHARISMA,
	ITELLIGENCE
}

export (AffectionTypes) var affection_type
export (int) var affection_threshold = 2
export (int) var max_affection = 8
export (int) var min_affection = -8
export (Dictionary) var positive_affection_reward_threshold = {
	2:["res://card/card_datas/pencil.tres"],
	4:["res://card/card_datas/pencil.tres"],
	6:["res://card/card_datas/pencil.tres"],
	8:["res://card/card_datas/pencil.tres", "res://card/card_datas/pencil.tres"]
}
export (Dictionary) var negative_affection_reward_threshold = {
	-2:["res://card/card_datas/pencil.tres"],
	-4:["res://card/card_datas/pencil.tres"],
	-6:["res://card/card_datas/pencil.tres"],
	-8:["res://card/card_datas/pencil.tres", "res://card/card_datas/pencil.tres"]
}
