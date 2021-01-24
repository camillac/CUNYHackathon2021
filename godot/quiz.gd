extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bone = preload("res://bone-textbox.png")
var humerusPath = "res://.import/Osto-Missing-Humerus.png-5296ba2db1e6641c203e0852c8ee944a.stex"
var mandiblePath = "res://.import/Osto-Missing-Mandible.png-5ce2d548c35f927e03f2fb09d1ededdc.stex"
var femurPath = "res://.import/Osto-Missing-Femur.png-f54ba5cc291035ae21f9718497a3fdae.stex"
var humerus = preload("res://Osto-Missing-Humerus.png")
var mandible = preload("res://Osto-Missing-Mandible.png")
var femur = preload("res://Osto-Missing-Femur.png")
var brokenBone = preload("res://bone-textbox-cracked.png")
var ostoImgs = [humerus, mandible, femur]
var questionText = ["Oh no! I tripped and one of my bones fell out! What’s the missing one called again?", "Thanks for helping me get my bone back! I’m just really clumsy today, and seem to have misplaced another one! Can you tell me what this one is called?", "Thanks for helping me get my bone back! I got distracted talking to my friend Serif and didn’t notice as another one fell out! What’s this one called?"]
var questionChoices = ["mandible", "femur", "tibia", "humerus"]
var ctr =0
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("TextureRect/startButton").connect("pressed", self, "_on_startButton_pressed")
	get_node("TextureRect/Choice1Box").connect("pressed", self, "_on_choice1_pressed")
	get_node("TextureRect/Choice2Box").connect("pressed", self, "_on_choice2_pressed")
	get_node("TextureRect/Choice3Box").connect("pressed", self, "_on_choice3_pressed")
	get_node("TextureRect/Choice4Box").connect("pressed", self, "_on_choice4_pressed")
func _on_startButton_pressed():
		$TextureRect/startButton.hide()
		if(ctr> 2):
			return
		else: 
			var shuffeledArr = shuffleList([0,1,2,3])
			$TextureRect/questionTextBox.text = questionText[ctr]
			$TextureRect/Choice1Box/Choice1.text = questionChoices[shuffeledArr[0]]
			$TextureRect/Choice2Box/Choice2.text = questionChoices[shuffeledArr[1]]		
			$TextureRect/Choice3Box/Choice3.text = questionChoices[shuffeledArr[2]]
			$TextureRect/Choice4Box/Choice4.text = questionChoices[shuffeledArr[3]]
			$TextureRect/Choice1Box.set_normal_texture(bone)
			$TextureRect/Choice2Box.set_normal_texture(bone)
			$TextureRect/Choice3Box.set_normal_texture(bone)
			$TextureRect/Choice4Box.set_normal_texture(bone)
			$TextureRect/osto.set_normal_texture(ostoImgs[ctr])
func shuffleList(list):
	var shuffledList = []
	var indexList = range(list.size())
	for i in range(list.size()):
		randomize()
		var x = randi()%indexList.size()
		shuffledList.append(list[x])
		indexList.remove(x)
		list.remove(x)
	return shuffledList

func isCorrect(var choiceNumber):
	var thing
	if(choiceNumber==1):
		thing = $TextureRect/Choice1Box/Choice1.text
	elif(choiceNumber==2):
		thing = $TextureRect/Choice2Box/Choice2.text
	elif(choiceNumber==3):
		thing = $TextureRect/Choice3Box/Choice3.text
	else:
		thing = $TextureRect/Choice4Box/Choice4.text
	return $TextureRect/osto.get_normal_texture().get_load_path() == get((str(thing) +'Path'))
	
func whenCorrect():
	$TextureRect/startButton/startText.text = "Go to next question"	
	$TextureRect/startButton.show()
	$TextureRect/questionTextBox.text = "That's correct"
	ctr = ctr+1
func _on_choice1_pressed():
	if(isCorrect(1)):
		whenCorrect()
	else:
		$TextureRect/questionTextBox.text = "Oh no that's wrong! Try again!"
		$TextureRect/Choice1Box.set_normal_texture(brokenBone)
		print($TextureRect/osto.get_normal_texture().get_load_path())
		print(get((str($TextureRect/Choice1Box/Choice1.text) +'Path')))
func _on_choice2_pressed():
	if(isCorrect(2)):
		whenCorrect()
	else:
		$TextureRect/questionTextBox.text = "Oh no that's wrong! Try again!"
		$TextureRect/Choice2Box.set_normal_texture(brokenBone)
		print($TextureRect/osto.get_normal_texture().get_load_path())
		print(get((str($TextureRect/Choice1Box/Choice1.text) +'Path')))
func _on_choice4_pressed():
	if(isCorrect(4)):
		whenCorrect()
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
		$TextureRect/Choice4Box.set_normal_texture(brokenBone)
func _on_choice3_pressed():
	$TextureRect/questionTextBox.text = "Oh no that's wrong! Try again!"
	$TextureRect/Choice3Box.set_normal_texture(brokenBone)

	#if($TextureRect/osto.get_normal_texture().get_load_path() == get((str($TextureRect/Choice1Box/Choice1.text) +'Path'))):
		#print($TextureRect/osto.get_normal_texture().get_load_path())
		#print(get((str($TextureRect/Choice1Box/Choice1.text) +'Path')))
		#$TextureRect/startButton/startText.text = "Go to next question"	
		#$TextureRect/startButton.show()
		#$TextureRect/questionTextBox.text = "That's correct"
		#ctr = ctr+1
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
