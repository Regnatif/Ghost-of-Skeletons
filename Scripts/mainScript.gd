extends Node2D

var lightning = preload("res://Lightning.tscn")
var lightnings = lightning.instance()
var timer = 0
func _ready():
	pass 

func _process(delta):
	timer += delta
	if(timer >= 4):
		spawnRandomLightnings()
		timer = 0
	pass

func spawnRandomLightnings():
	var lightnings = lightning.instance()
	lightnings.position.x = rand_range(0,1026)
	lightnings.position.y = 304
	add_child(lightnings)
	get_node("LightningSound").play()
	lightnings.get_node("MainLightning").emitting = true
	pass
