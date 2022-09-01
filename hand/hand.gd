extends Control


const CARD: PackedScene = preload("res://hand/card.tscn")
const SPACE_BETWEEN_CARDS: float = 5.0
const HOVER_Y_OFFSET: float = 20.0

onready var card_size: Vector2 = calculate_card_size()
onready var cards_to_sort: Array = get_children()


# Connect signals and sort starting hand
func _ready() -> void:
	for card in get_children():
		card.connect("drag_started", self, "_on_card_drag_started", [card])
		card.connect("drag_ended", self, "_on_card_drag_ended", [card])
	sort()


# Position cards in cards_to_sort
func sort() -> void:
	var n_cards: int = cards_to_sort.size()
	var x: float = -(n_cards * card_size.x + SPACE_BETWEEN_CARDS * (n_cards - 1)) / 2.0
	var i: int = 0
	
	for card in cards_to_sort:
		card.rect_position = Vector2(x, -card_size.y / 2.0)
		x += card_size.x
		if i < n_cards - 1:
			x += SPACE_BETWEEN_CARDS
		i += 1


# Check for hovering
func _process(_delta: float) -> void:
	var n_cards: int = cards_to_sort.size()
	
	for card in cards_to_sort:
		if card.is_hovered():
			card.rect_position.y = -card_size.y / 2.0 - HOVER_Y_OFFSET
			card.scale_up()
			move_child(card, n_cards - 1)  # Bring to front so it isn't obscured
		else:
			card.rect_position.y = -card_size.y / 2.0
			card.scale_down()


# Sort card hand without dragged card
func _on_card_drag_started(card: TextureRect) -> void:
	assert(cards_to_sort.has(card), "Trying to drag a card that isn't in hand somehow")
	cards_to_sort.erase(card)
	sort()


# Sort card back into hand after drag
func _on_card_drag_ended(card: TextureRect) -> void:
	assert(not cards_to_sort.has(card), "Releasing a card that is sorted in hand somehow")
	cards_to_sort.append(card)
	sort()


# Calculates the size of a card by instancing a reference card (so it doesn't have to be hardcoded)
func calculate_card_size() -> Vector2:
	var reference_card = CARD.instance()
	reference_card.queue_free()  # The card size can still be accessed until the next idle frame
	return reference_card.rect_size
