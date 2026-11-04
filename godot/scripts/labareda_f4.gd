extends Area2D

@export var tempo_espera: float = 2.0
@export var atraso_inicial: float = 0.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var disparando: bool = false


func _ready() -> void:
	monitoring = true
	anim.stop()
	anim.animation = "disparar"
	anim.frame = 0
	_iniciar_ciclo()


func _iniciar_ciclo() -> void:
	if atraso_inicial > 0:
		await get_tree().create_timer(atraso_inicial, false).timeout

	while is_inside_tree():
		await get_tree().create_timer(tempo_espera, false).timeout

		anim.stop()
		anim.frame = 0
		disparando = true
		anim.play("disparar")

		await anim.animation_finished

		disparando = false
		anim.frame = 0


func _physics_process(_delta: float) -> void:
	# Dano apenas nos dois quadros de chama alta.
	if not disparando or anim.frame < 3 or anim.frame > 4:
		return

	for corpo in get_overlapping_bodies():
		if corpo.has_method("receber_dano"):
			corpo.receber_dano()
