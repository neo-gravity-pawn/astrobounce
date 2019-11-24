extends KinematicBody2D

export (int) var thrust = 5
export (int) var max_speed = 200
export (float) var rotation_speed = 0.09
var velocity = Vector2(0, 0)
var ship_orientation = Vector2(0, -1)
onready var screen_rect = get_tree().get_root().get_visible_rect()
onready var move = get_node("Movement")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	var collision = move_and_collide(velocity * delta)
	self.velocity = move.bounce_from_obstacle(self, collision, self.velocity, delta)
	move.reenter_screen(self, screen_rect)


func get_input():
	get_node("Flame").emitting = false
	if Input.is_action_pressed("left"):
		self.rotate(-rotation_speed)
	if Input.is_action_pressed("right"):
		self.rotate(rotation_speed)
	if Input.is_action_pressed("up"):
		get_node("Flame").emitting = true
		self.velocity += (ship_orientation.rotated(self.get_rotation()) * thrust)
		self.velocity = self.velocity.clamped(self.max_speed)