extends Node2D

var beam = preload("res://Beam.tscn")
var beams = beam.instance()
var timer = 0
var beamOffset =  Vector2(0,40)

onready var TweenNodestart = get_node("Tweenstart")
onready var TweenNodeexit = get_node("Tweenexit")

#ARTIK PLAYERI A CAN SİSTEMİ EKLE NOLUR ALLAH RIZASI İÇİN 

func _ready():
	var player_dir = get_parent().get_node("Heart").global_position - global_position
	rotation = player_dir.angle() + -PI / 2 
	$Tweenstart.interpolate_property(self, "modulate",Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN)
	TweenNodestart.start()

func _process(delta):
	timer += delta
	if(timer >= 3):
		$Tweenexit.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3,Tween.TRANS_LINEAR, Tween.EASE_IN)
		TweenNodeexit.start()
		timer = 0
	pass


func _on_Timer_timeout():
	spawnBeam()
	pass 

func spawnBeam():
	var beams = beam.instance()
	beams.rotation = rotation + PI / 2
	beams.global_position = global_position + Vector2(-55,0).rotated(rotation - PI / 2)
	get_parent().add_child(beams)
	$"../BeamSound".play()


func _on_Tweenexit_tween_all_completed():
	queue_free()
	pass 
