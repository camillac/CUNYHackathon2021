extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cursor = preload("res://cursor.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(cursor)
	get_node("startButtonHome").connect("pressed", self, "_on_startButtonHome_pressed")

func _on_startButtonHome_pressed():
	#get_node("Label").text = "HELLO!"
	get_tree().change_scene("res://StartScreen.tscn")
	
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
