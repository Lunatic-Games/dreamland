extends TextureRect


var cards: Array = [preload("res://card/card_data/pencil.tres"),
	preload("res://card/card_data/pencil.tres"),
	preload("res://card/card_data/pencil.tres"),
	preload("res://card/card_data/pencil.tres"),
	preload("res://card/card_data/pencil.tres"),
	preload("res://card/card_data/pencil.tres"),
	preload("res://card/card_data/pencil.tres"),
	preload("res://card/card_data/pencil.tres"),
	preload("res://card/card_data/pencil.tres")]

onready var counter: Label = $Counter


# Add a card to the player's deck
func add(card: CardData) -> void:
	cards.append(card)
	_update_counter()


# Draw a random card from the player's deck
func draw() -> CardData:
	if !cards:
		Globals.discard.refill_deck()
	assert(cards, "There is no cards to draw from the deck!")
	var card = cards.pop_at(randi() % cards.size())
	_update_counter()
	return card


# Update the label to display current deck size
func _update_counter() -> void:
	counter.text = str(cards.size())
