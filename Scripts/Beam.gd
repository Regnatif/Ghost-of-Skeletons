extends Area2D


onready var TweenNode = get_node("Tween")
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 1
	TweenNode.interpolate_property(self, "scale",
	Vector2(1, 0), Vector2(1, 1), 0.09,
	Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	TweenNode.start()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if(timer >= 1.5):
		queue_free()
	pass
