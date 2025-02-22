extends Sprite2D

@export var rotation_speed :float=2.0 
@export var value_change_speed: float=5.0
@export var rotate_clockwise: String
@export var rotate_counterclockwise: String
@export var initial_value: int = 10
@export var max_value: float= 1000
@export var label: Label
var value: float
func _ready() -> void:
	value = initial_value;
	if label:
		label.text = str(value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(value)
	if Input.is_action_pressed(rotate_counterclockwise):
		rotation -= rotation_speed * delta
		value -= value_change_speed * delta
		value = max(0, value)
		if label:
			label.text = str(int(value))
	if Input.is_action_pressed(rotate_clockwise):
		rotation += rotation_speed * delta
		value += value_change_speed * delta
		value = min(max_value, value)
		if label:
			label.text = str(int(value))
