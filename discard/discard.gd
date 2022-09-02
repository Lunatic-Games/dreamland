extends TextureRect


var cards: Array = []

onready var counter: Label = $Counter


# Add a card to the player's discard
func add(card: CardData) -> void:
	cards.append(card)
	_update_counter()


# Draw all cards from the discard
func refill_deck() -> void:
	while cards:
		var card = cards.pop_front()
		Globals.deck.add(card)

	_update_counter()


func _update_counter() -> void:
	counter.text = str(cards.size())
