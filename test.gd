extends ColorRect


func can_drop_data(_position, data):
	return data is CardData


func drop_data(_position, data):
	print(data)
