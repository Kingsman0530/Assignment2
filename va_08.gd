extends Node2D

@onready var welcome_label = $WelcomeLabel
@onready var start_button = $StartButton
@onready var starting_label = $StartingLabel
@onready var gamestarted_label = $GameStartedLabel

func _ready():
	start_button.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed():
	welcome_label.hide()
	start_button.hide()
	starting_label.hide()
	
	gamestarted_label.show()
	print("Game Started!") 
