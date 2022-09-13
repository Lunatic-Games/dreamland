extends Resource

class_name EncounterData

enum SkillTestTypes {
	STRENGTH,
	ATHLETICS,
	CHARISMA,
	INTELLIGENCE
}

export (Texture) var splash_background
export (String) var dialog_text
export (String) var confirmation_text
export (Resource) var success_dialog = null
export (Resource) var failure_dialog = null
export (Array) var rewards = []
export (bool) var is_skill_test = false
export (SkillTestTypes) var skill_test_type
export (int) var skill_test_difficulty = 1
