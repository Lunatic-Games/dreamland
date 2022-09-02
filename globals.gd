extends Node


var hand = null setget , get_hand
var deck = null setget , get_deck
var discard = null setget , get_discard


# Return the already found hand or search for it in the scene tree
func get_hand():
	if hand and is_instance_valid(hand):
		return hand
	return _get_unique_node_from_group("hand")


# Return the already found deck or search for it in the scene tree
func get_deck():
	if deck and is_instance_valid(deck):
		return deck
	return _get_unique_node_from_group("deck")


# Return the already found discard pile or search for it in the scene tree
func get_discard():
	if discard and is_instance_valid(discard):
		return discard
	return _get_unique_node_from_group("discard")


# Reset global variables
func reset() -> void:
	hand = null
	deck = null


# Used to get a node from the scene tree that is unique to a group
func _get_unique_node_from_group(group: String) -> Node:
	var nodes = get_tree().get_nodes_in_group(group)
	assert(nodes, "Trying to get unique node in group " + group + " but it cannot be found")
	assert(nodes.size() == 1, "Trying to get unique node in group " + group + " but there is multiple")
	return nodes[0]
