extends Control


const CARD_SIZE: Vector2 = Vector2(64.0, 107.0)
const SPACE_BETWEEN_CARDS: float = 5.0
const TILT_STRENGTH: float = 2.5

var cards_to_sort: Array = []


func _ready() -> void:
	cards_to_sort = get_children()
	for card in get_children():
		card.connect("drag_started", self, "_on_card_drag_started", [card])
		card.connect("drag_ended", self, "_on_card_drag_ended", [card])
	sort()


func sort() -> void:
	var num_cards: int = cards_to_sort.size()
	var x: float = -(num_cards * CARD_SIZE.x + SPACE_BETWEEN_CARDS * (num_cards - 1)) / 2.0
	var i: int = 0
	
	for card in cards_to_sort:
		card.rect_position.x = x
		card.rect_position.y = -CARD_SIZE.y / 2.0
		i += 1
		
		x += CARD_SIZE.x
		if i < num_cards :
			x += SPACE_BETWEEN_CARDS


func _process(_delta: float) -> void:
	var num_cards: int = cards_to_sort.size()
	
	for card in cards_to_sort:
		if card.is_hovered():
			card.rect_position.y = -CARD_SIZE.y / 2.0 - 20.0
			card.scale_up()
			card.rect_rotation = 0.0
			move_child(card, num_cards - 1)
		else:
			card.rect_position.y = -CARD_SIZE.y / 2.0
			card.scale_down()


func _on_card_drag_started(card: TextureRect) -> void:
	if cards_to_sort.has(card):
		cards_to_sort.erase(card)
	card.rect_rotation = 0.0
	sort()


func _on_card_drag_ended(card: TextureRect) -> void:
	if not cards_to_sort.has(card):
		cards_to_sort.append(card)
	sort()
	
