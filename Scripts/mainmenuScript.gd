extends Control


func _ready():
	ControlScript.chooseTime = 3
	pass 


func _process(delta):
	pass


func _on_Play_pressed():
	get_tree().change_scene("res://GasterAttack1.tscn")
	pass 


func _on_AboutGame_pressed():
	get_tree().change_scene("res://AboutGame.tscn")
	pass


func _on_WhoMadeIt_pressed():
	get_tree().change_scene("res://Credits.tscn")
	pass
