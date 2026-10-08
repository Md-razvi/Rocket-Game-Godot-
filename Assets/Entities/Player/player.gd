extends Node2D


# Called when the node enters the scene tree for the first time.
var bullet_scene=preload("res://Assets/Entities/bullet/laser.tscn")
var direction:int =0
var speed:int =300
var player_half_width:int =16
var screen_width: int =400
var shoot_time:=1.0
var shoot_counter=0


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	shoot_counter+=delta
	if Input.is_action_just_pressed("shoot_button"):
		var bullet_instance=bullet_scene.instantiate()
		bullet_instance.position.x=position.x
		bullet_instance.position.y=position.y-50
		get_parent().get_node("Bullets").add_child(bullet_instance)
	if Input.is_action_pressed("move_left"):
		direction=-1
	elif Input.is_action_pressed("move_right"):
		direction=1
	else:
		direction=0
	position.x=clamp(position.x+direction*speed*delta,player_half_width,screen_width-player_half_width)
	
	
	
