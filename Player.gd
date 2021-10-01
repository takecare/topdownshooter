extends KinematicBody2D

const bullets_group: String = "bullets"

export (float) var speed = 100
export (PackedScene) var Bullet = null

onready var end_of_gun: Position2D = $EndOfGun
onready var bullets: Node2D = $Bullets

func _ready() -> void:
  pass # Replace with function body.

func _physics_process(delta: float) -> void:
  handle_movement_input()

func handle_movement_input() -> void:
  var movement_direction := Vector2.ZERO
  if Input.is_action_pressed("up"):
    movement_direction.y = -1
  if Input.is_action_pressed("left"):
    movement_direction.x = -1
  if Input.is_action_pressed("down"):
    movement_direction.y = 1
  if Input.is_action_pressed("right"):
    movement_direction.x = 1
  movement_direction = movement_direction.normalized()
  var _ignored = move_and_slide(movement_direction * speed)
  look_at(get_global_mouse_position())

func _unhandled_input(event: InputEvent) -> void:
  if event.is_action_pressed("shoot"):
    shoot()

func shoot() -> void:
  print("shoot")
  var bullet = Bullet.instance()
  bullets.add_child(bullet, true)
  bullet.owner = bullets
  bullet.add_to_group(bullets_group)
  bullet.global_position = end_of_gun.global_position
  var direction_to_target = bullet.global_position.direction_to(get_global_mouse_position()).normalized()
  bullet.set_direction(direction_to_target)
# TODO clear if collided or out out screen
