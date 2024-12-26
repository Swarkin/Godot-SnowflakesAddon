@tool
extends EditorPlugin

var snowflake: Snowflake

func _enter_tree() -> void:
	print("->")
	snowflake = Snowflake.new()
	EditorInterface.get_base_control().add_child(snowflake)

func _exit_tree() -> void:
	snowflake.queue_free()
