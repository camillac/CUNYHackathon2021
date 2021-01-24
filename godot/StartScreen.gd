extends TextureRect

func _ready():
	 get_node("imgButton").connect("pressed", self, "_on_imgButton_pressed")

func _on_imgButton_pressed():
	#get_node("Label").text = "HELLO!"
	get_tree().change_scene("res://learn.tscn")
