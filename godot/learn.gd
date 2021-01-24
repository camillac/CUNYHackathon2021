extends TextureRect

var first = preload("res://Osto-Highlighted-Humerus.png")
var second = preload("res://Osto-Highlighted-Femur.png")
var third = preload("res://Osto-Highlighted-Mandible.png")
var arrOfImg = [first, second, third]
var ctr = 0
var textWithBones = ["This is my humerus. It is the funniest bone in the body, that connects the shoulder to the elbow.","This is my femur. It is the longest and strongest bone in the body, that connects the hip to the knee.","This is my mandible! It is the lower jawbone, the strongest bone in the human skull."]
var arr
func _ready():
	 get_node("nextButton").connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	#get_node("Label").text = "HELLO!"
	#var first = load("res://lily.png.jpg")
	if(ctr == 3):
		get_tree().change_scene("res://quiz.tscn")
	else:
		$nextButton/TextureButton.set_normal_texture(arrOfImg[ctr])
		$nextButton/skelsay.text = textWithBones[ctr]
		ctr = ctr+1
	


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
