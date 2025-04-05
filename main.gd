extends Node2D

var sprite_scene = preload("res://PR02Sprite2D.tscn") 
var current_sprite = null

func _ready():
	
	current_sprite = $Sprite2D
	print("Press H to hide/show, C to create, D to delete")

func _input(event):

	if event is InputEventKey and event.pressed and event.keycode == KEY_H:
		if current_sprite != null:
			current_sprite.visible = !current_sprite.visible  
			print("Sprite Hidden")
	
	if event is InputEventKey and event.pressed and event.keycode == KEY_C:
		var new_sprite = sprite_scene.instantiate()  
		new_sprite.position = Vector2(randi() % 500, randi() % 500)
		add_child(new_sprite)
		current_sprite = new_sprite
		print("New sprite created at: ", new_sprite.position)

	if event is InputEventKey and event.pressed and event.keycode == KEY_D:
		if current_sprite != null:
			current_sprite.queue_free()
			current_sprite = null
			print("Sprite deleted")
