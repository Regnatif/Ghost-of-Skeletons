extends Area2D

var speed = 300;
var blaster = preload("res://Blaster.tscn")
var blasters = blaster.instance()
var gos = preload("res://GameOverScene.tscn")
#left 1 top 2 right 3 bot 4
var health = 20
var timerblaster = 0
var rng = RandomNumberGenerator.new()

func _ready():
	ControlScript.chooseTime = 3
	pass

func _physics_process(delta):
	denyMovingOut()
	ControlScript.chooseTime = 1
	getInputs(delta);
	spawnBlaster(delta)
	if(health == 0):
		get_tree().change_scene("res://GameOverScene.tscn")
	pass


func spawnBlaster(delta):
	timerblaster += delta
	if(timerblaster >= 2):
		rng.randomize()
		var  choose_site = rng.randi_range(1,4)
		if(choose_site == 1):
			rng.randomize()
			var  spawnx = rng.randf_range(40,166)
			var spawny = rng.randf_range(0,544)
			var blasters = blaster.instance()
			blasters.position.x = spawnx
			blasters.position.y = spawny
			$'..'.add_child(blasters)
			$"../BlasterSound".play()
		if(choose_site == 2):
			rng.randomize()
			var  spawnx = rng.randf_range(0,1000)
			var spawny = rng.randf_range(30,70)
			var blasters = blaster.instance()
			blasters.position.x = spawnx
			blasters.position.y = spawny
			$'..'.add_child(blasters)
			$"../BlasterSound".play()
		if(choose_site == 3):
			rng.randomize()
			var  spawnx = rng.randf_range(888,1000)
			var spawny = rng.randf_range(0,544)
			var blasters = blaster.instance()
			blasters.position.x = spawnx
			blasters.position.y = spawny
			$'..'.add_child(blasters)
			$"../BlasterSound".play()
		if(choose_site == 4):
			rng.randomize()
			var  spawnx = rng.randf_range(0,1000)
			var spawny = rng.randf_range(450,558)
			var blasters = blaster.instance()
			blasters.position.x = spawnx
			blasters.position.y = spawny
			$'..'.add_child(blasters)
			$"../BlasterSound".play()
		timerblaster = 0
	pass


func getInputs(delta):
	if Input.is_action_pressed("move_right") or $"../RightButton".is_pressed():
		position.x += speed * delta 
	if Input.is_action_pressed("move_left") or $"../LeftButton".is_pressed():
		position.x -= speed * delta;
	if Input.is_action_pressed("move_up") or $"../UpButton".is_pressed():
		position.y -= speed * delta;
	if Input.is_action_pressed("move_down") or $"../DownButton".is_pressed():
		position.y += speed * delta;
	pass

func denyMovingOut():
	if(position.x >= 994):
		position.x = 994
	if(position.x <= 30):
		position.x = 30
	if(position.y <= 32):
		position.y = 32
	if(position.y >= 570):
		position.y = 570

func _on_Heart_area_entered(area):
	health -= 5
	$"../HitSound".play()
	$"../ProgressBar".value = health * 5 
	pass 



