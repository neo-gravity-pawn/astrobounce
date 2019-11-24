extends Node2D
var asteroid_resource = preload("Asteroid.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	create_asteroids()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func create_asteroids():
	for i in range(10):
		var a = asteroid_resource.instance()
		a.pos = Vector2(randi() % 500, randi() % 500)
		a.velocity = Vector2( randi() % 200 - 100, randi() % 200 - 100)
		self.add_child(a)
