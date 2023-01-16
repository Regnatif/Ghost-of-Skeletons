extends Node

var surviveTime = 0
var start = false
var chooseTime = 0
#1 start 2 stop 3 reset
func _ready():
	surviveTime = 0
	pass 



func _process(delta):
	if(chooseTime == 1):
		surviveTime += delta
	if(chooseTime == 2):
		surviveTime = surviveTime
	if(chooseTime == 3):
		surviveTime = 0
	
	pass
