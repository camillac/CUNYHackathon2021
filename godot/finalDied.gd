extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("TextureRect/practiceButton").connect("pressed", self, "_on_practiceButton_pressed") # Replace with function body.

func _on_practiceButton_pressed():
	get_tree().change_scene("res://StartScreen.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
