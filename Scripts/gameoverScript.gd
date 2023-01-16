extends Control

var heart = load("res://Heart.tscn")

func _ready():
	ControlScript.chooseTime = 2 
	get_node("RichTextLabel2").text = "You Have Survived " + str(int(ControlScript.surviveTime)) + " Seconds"
	pass 



func _process(delta):
	
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://GasterAttack1.tscn")
	pass


func _on_Button2_pressed():
	get_tree().change_scene("res://MainMenuScene.tscn")
	pass 
