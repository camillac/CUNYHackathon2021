extends TextureRect

func _ready():
	 get_node("imgButton").connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	#get_node("Label").text = "HELLO!"
	get_tree().change_scene("res://learn.tscn")
