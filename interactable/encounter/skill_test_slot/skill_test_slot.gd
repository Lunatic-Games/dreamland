extends "res://interactable/interactable.gd"

var encounter

func interact(card_data: CardData) -> void:
	print("SkillTest: Interact triggered")
	var encounter_data = encounter.encounter_data
	match encounter_data.skill_test_type:
		encounter_data.SkillTestTypes.ATHLETICS:
			_resolve_result(card_data.athletics_modifier)
		
		encounter_data.SkillTestTypes.STRENGTH:
			_resolve_result(card_data.strength_modifier)
			
		encounter_data.SkillTestTypes.INTELLIGENCE:
			_resolve_result(card_data.intelligence_modifier)
			
		encounter_data.SkillTestTypes.CHARISMA:
			_resolve_result(card_data.charisma_modifier)

# Determine if they pass the check
func _resolve_result(value: int) -> void:
	print("SkillTest: ResolveResult")
	if _succeeded_stat_test(encounter.encounter_data.skill_test_difficulty, value):
		encounter.setup(encounter.encounter_data.success_dialog)
	else:
		encounter.setup(encounter.encounter_data.failure_dialog)
