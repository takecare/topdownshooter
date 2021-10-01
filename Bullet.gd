extends Area2D

export (float) var speed = 350

var direction := Vector2.ZERO setget set_direction,get_direction

func _ready() -> void:
  pass # Replace with function body.

func _physics_process(delta: float) -> void:
  pass

func _process(delta: float) -> void:
  # TODO move to physics process (and drop *delta)
  var velocity = direction * speed * delta
  global_position += velocity

func get_direction() -> Vector2:
  return direction

func set_direction(new_direction: Vector2) -> void:
  direction = new_direction
