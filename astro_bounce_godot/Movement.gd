extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func bounce_from_obstacle(node, collision, velocity, delta):
	if collision:
		velocity = -velocity.reflect(collision.get_normal())
		node.move_and_collide((velocity * 0.1) * delta)
	return velocity
		
func reenter_screen(node, screen_rect):
	var max_x = screen_rect.size.x
	var max_y = screen_rect.size.y
	var p = node.position
	p.x = stay_within_range(p.x, 0, max_x)
	p.y = stay_within_range(p.y, 0, max_y)
	node.position.x = p.x
	node.position.y = p.y
	
func stay_within_range(value, min_val, max_val):
	var ret_value = max_val + (value - min_val) if value < min_val else value
	ret_value = min_val + ret_value - max_val if ret_value > max_val else ret_value
	return ret_value