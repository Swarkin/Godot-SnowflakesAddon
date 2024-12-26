@tool
extends Node
class_name Snowflake

const INTERVAL := 0.5
const VARIANCE := 0.1
const SPEED := 50.0

var time := 0.0
var snowflakes: Array[Flake]

class Flake:
	var node := Label.new()
	var lifetime := 0.0

	func _init() -> void:
		node.text = "*"


func _process(dt: float) -> void:
	time += dt

	while time > INTERVAL:
		time -= INTERVAL
		var snowflake := Flake.new()
		snowflakes.append(snowflake)
		snowflake.node.position = Vector2(randi_range(0, EditorInterface.get_base_control().size.x), -40)
		add_child(snowflake.node)

	var bottom := EditorInterface.get_base_control().size.y

	for s in snowflakes:
		s.lifetime += dt
		s.node.position += Vector2(sin(s.lifetime) * VARIANCE, SPEED * dt)

		if s.node.position.y > bottom:
			snowflakes.erase(s)
			s.node.queue_free()
