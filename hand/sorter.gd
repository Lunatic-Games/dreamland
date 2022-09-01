extends Control


const CARD_SIZE: Vector2 = Vector2(64.0, 107.0)
const SPACE_BETWEEN_CARDS: float = 5.0


func _ready() -> void:
	sort()


func sort() -> void:
	var num_cards: int = get_child_count()
	var x: float = -(num_cards * CARD_SIZE.x + SPACE_BETWEEN_CARDS * (num_cards - 1)) / 2.0
	var i: int = 0
	
	for card in get_children():
		card.rect_position.x = x
		card.rect_position.y = -CARD_SIZE.y / 2.0
		i += 1
		
		x += CARD_SIZE.x
		if i < num_cards :
			x += SPACE_BETWEEN_CARDS


func _process(_delta: float) -> void:
	var num_cards: int = get_child_count()
	
	for card in get_children():
		if card.is_hovered():
			card.rect_position.y = -CARD_SIZE.y / 2.0 - 20.0
			card.scale_up()
			move_child(card, num_cards - 1)
		else:
			card.rect_position.y = -CARD_SIZE.y / 2.0
			card.scale_down()
