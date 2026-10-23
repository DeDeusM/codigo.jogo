extends Area2D

@export var velocidade: float = 180.0
@export var limite_esquerdo: float = 0.0

@onready var visual: AnimatedSprite2D = $Visual


func _ready() -> void:
	visual.play("default")


func _physics_process(delta: float) -> void:
	position.x -= velocidade * delta

	if global_position.x <= limite_esquerdo:
		queue_free()
