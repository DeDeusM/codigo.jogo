extends Node2D

@export var tempo_espera: float = 2.0
@export var atraso_inicial: float = 0.0

@onready var area_dano: Area2D = $Area2D
@onready var visual: AnimatedSprite2D = $Sprite2D

var ativa: bool = false
var reiniciando: bool = false

func _ready() -> void:
	area_dano.collision_layer = 2
	area_dano.collision_mask = 1
	area_dano.monitoring = true

	visual.visible = false

	await get_tree().create_timer(atraso_inicial, false).timeout
	ciclo_labareda()


func ciclo_labareda() -> void:
	while is_inside_tree():
		visual.visible = true
		visual.frame = 0
		ativa = true
		visual.play("default")

		await visual.animation_finished

		ativa = false
		visual.visible = false

		await get_tree().create_timer(tempo_espera, false).timeout


func _physics_process(_delta: float) -> void:
	if not ativa or reiniciando:
		return

	for corpo in area_dano.get_overlapping_bodies():
		if not corpo.has_method("receber_dano"):
			continue

		var vidas_antes := EstadoJogo.vidas
		corpo.receber_dano()

		# Só reinicia se o jogador realmente perdeu uma vida.
		if EstadoJogo.vidas < vidas_antes:
			if EstadoJogo.vidas > 0:
				reiniciando = true
				call_deferred("_reiniciar_fase")
			return


func _reiniciar_fase() -> void:
	get_tree().reload_current_scene()
