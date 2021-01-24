extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("TextureRect/homeButton").connect("pressed", self, "_on_home_pressed")

func _on_home_pressed():
	get_tree().change_scene("res://homeScreen.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
