extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -500.0

var invulneravel: bool = false


func _physics_process(delta: float) -> void:
	if EstadoJogo.vidas <= 0:
		return

	# Gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Pulo
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movimento
	var direction := Input.get_axis("left", "right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Virar o personagem
	if direction > 0:
		anim.flip_h = false
	elif direction < 0:
		anim.flip_h = true

	# Animações
	if not is_on_floor():
		anim.play("jump")
	elif direction != 0:
		anim.play("run")
	else:
		anim.play("idle")

	move_and_slide()


func receber_dano() -> void:
	if invulneravel or EstadoJogo.vidas <= 0:
		return

	invulneravel = true
	EstadoJogo.perder_vida()

	if EstadoJogo.vidas <= 0:
		anim.stop()
		return

	# Fica transparente durante a proteção
	anim.modulate.a = 0.5

	await get_tree().create_timer(1.0, false).timeout

	anim.modulate.a = 1.0
	invulneravel = false
