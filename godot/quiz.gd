extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var humerusPath = "res://.import/Osto-Missing-Humerus.png-5296ba2db1e6641c203e0852c8ee944a.stex"
var humerus = preload("res://Osto-Missing-Humerus.png")
var mandible = preload("res://Osto-Missing-Mandible.png")
var femur = preload("res://Osto-Missing-Femur.png")
var ostoImgs = [humerus, mandible, femur]
var questionText = ["Oh no! I tripped and one of my bones fell out! What’s the missing one called again?", "Thanks for helping me get my bone back! I’m just really clumsy today, and seem to have misplaced another one! Can you tell me what this one is called?", "Thanks for helping me get my bone back! I got distracted talking to my friend Serif and didn’t notice as another one fell out! What’s this one called?"]
var questionChoices = ["mandible", "femur", "tibia", "humerus"]
var ctr =0
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("TextureRect/startButton").connect("pressed", self, "_on_startButton_pressed")

func _on_startButton_pressed():
		$TextureRect/startButton.hide()
		if(ctr> 2):
			return
		else: 
			$TextureRect/questionTextBox.text = questionText[ctr]
			$TextureRect/Choice1Box/Choice1.text = questionChoices[0]
			$TextureRect/Choice2Box/Choice2.text = questionChoices[1]		
			$TextureRect/Choice3Box/Choice3.text = questionChoices[2]
			$TextureRect/Choice4Box/Choice4.text = questionChoices[3]
			$TextureRect/osto.set_normal_texture(ostoImgs[ctr])
			get_node("TextureRect/Choice1Box").connect("pressed", self, "_on_choice1_pressed")
			get_node("TextureRect/Choice2Box").connect("pressed", self, "_on_choice2_pressed")
			get_node("TextureRect/Choice3Box").connect("pressed", self, "_on_choice3_pressed")
			get_node("TextureRect/Choice4Box").connect("pressed", self, "_on_choice4_pressed")
		
func _on_choice1_pressed():
	if(ctr == 1):
		$TextureRect/startButton/startText.text = "Go to next question"	
		$TextureRect/startButton.show()
		$TextureRect/questionTextBox.text = "That's correct"
		ctr = ctr+1
func _on_choice2_pressed():
	if(ctr == 2):
		$TextureRect/startButton/startText.text = "Go to next question"	
		$TextureRect/startButton.show()
		$TextureRect/questionTextBox.text = "That's correct"
		ctr = ctr+1
func _on_choice4_pressed():
	if($TextureRect/osto.get_normal_texture().get_load_path() == str2var((str($TextureRect/Choice4Box/Choice4.text) +'Path'))):
		$TextureRect/startButton/startText.text = "Go to next question"
		$TextureRect/startButton.show()
		$TextureRect/questionTextBox.text = "That's correct"
		ctr = ctr+1
	else:
		print(humerusPath)
		print("fheuhfei")
		print((str($TextureRect/Choice4Box/Choice4.text) +"Path"))
		print(str2var((str($TextureRect/Choice4Box/Choice4.text) +'Path')))
		print($TextureRect/osto.get_normal_texture().get_load_path())
		#print(str($TextureRect/osto.get_normal_texture()))
		#print($TextureRect/osto.get_normal_texture().get_object_id())
		print("fuehfe")
		$TextureRect/questionTextBox.text = "Oh no that's wrong! Try again!"
		$TextureRect/Choice4Box.set_normal_texture(humerus)


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
