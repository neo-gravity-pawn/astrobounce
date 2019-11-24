extends KinematicBody2D
export (Vector2) var velocity
export (Vector2) var pos
onready var move = get_node("Movement")
onready var screen_rect = get_tree().get_root().get_visible_rect()

# Called when the node enters the scene tree for the first time.
func _ready():
	position = pos
	pass # Replace with function body.

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	move.reenter_screen(self, screen_rect)
	self.velocity = move.bounce_from_obstacle(self, collision, self.velocity, delta)
