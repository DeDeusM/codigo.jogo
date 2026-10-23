extends Node2D

@export var intervalo: float = 0.5
@export var tempo_aberto: float = 0.2
@export var bola_referencia: Node2D

const CENA_BOLA = preload(
	"res://scenes/hazards/bola_energia.tscn"
)

@onready var visual: AnimatedSprite2D = $Visual

var transformacao_bola: Transform2D


func _ready() -> void:
	if bola_referencia == null:
		push_error("Arraste a BolaEnergia para o campo Bola Referencia.")
		return

	if not visual.sprite_frames.has_animation("abrir"):
		push_error("Falta a animação abrir.")
		return

	if not visual.sprite_frames.has_animation("fechar"):
		push_error("Falta a animação fechar.")
		return

	# Guarda a posição e o tamanho da bola já ajustada.
	transformacao_bola = bola_referencia.global_transform

	# Remove a bola de teste. As próximas surgem pelo lançador.
	bola_referencia.queue_free()

	visual.sprite_frames.set_animation_loop("abrir", false)
	visual.sprite_frames.set_animation_loop("fechar", false)

	visual.stop()
	visual.animation = "fechar"
	visual.frame = (
		visual.sprite_frames.get_frame_count("fechar") - 1
	)

	executar_ciclo()


func executar_ciclo() -> void:
	while is_inside_tree():
		await get_tree().create_timer(intervalo).timeout

		visual.play("abrir")
		await visual.animation_finished

		criar_bola()

		await get_tree().create_timer(tempo_aberto).timeout

		visual.play("fechar")
		await visual.animation_finished


func criar_bola() -> void:
	var bola := CENA_BOLA.instantiate() as Node2D

	get_parent().add_child(bola)
	bola.global_transform = transformacao_bola
