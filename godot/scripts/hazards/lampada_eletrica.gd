extends Node2D

@export var tempo_ligada: float = 5.0
@export var tempo_desligada: float = 2.5
@export var duracao_transicao: float = 0.9
@export var atraso_inicial: float = 0.0
@export var sempre_ligada: bool = false

@onready var lanterna: AnimatedSprite2D = $Lanterna
@onready var raio: Sprite2D = $Raio
@onready var area_dano: Area2D = $AreaDano
@onready var colisao: CollisionShape2D = $AreaDano/CollisionShape2D

var tempo: float = 0.0
var ligada: bool = false
var ultimo_quadro: int = 0


func _ready() -> void:
	area_dano.collision_mask = 1
	area_dano.monitoring = true

	lanterna.stop()
	lanterna.animation = "default"

	ultimo_quadro = (
		lanterna.sprite_frames.get_frame_count("default") - 1
	)

	tempo = -atraso_inicial
	definir_ligada(sempre_ligada)


func _process(delta: float) -> void:
	if sempre_ligada:
		return

	tempo += delta

	if tempo < 0.0:
		return

	if ligada:
		if tempo >= tempo_ligada:
			tempo = 0.0
			definir_ligada(false)
	else:
		if tempo >= tempo_desligada:
			tempo = 0.0
			definir_ligada(true)
		else:
			atualizar_transicao()


func atualizar_transicao() -> void:
	var duracao := clampf(
		duracao_transicao,
		0.01,
		maxf(tempo_desligada, 0.01)
	)

	var inicio := tempo_desligada - duracao

	if tempo < inicio:
		lanterna.frame = 0
		return

	var progresso := clampf(
		(tempo - inicio) / duracao,
		0.0,
		1.0
	)

	# O último quadro aparece apenas com o raio ligado.
	lanterna.frame = mini(
		int(progresso * ultimo_quadro),
		maxi(ultimo_quadro - 1, 0)
	)


func definir_ligada(valor: bool) -> void:
	ligada = valor
	raio.visible = ligada
	colisao.set_deferred("disabled", not ligada)

	if ligada:
		lanterna.frame = ultimo_quadro
	else:
		lanterna.frame = 0


func _physics_process(_delta: float) -> void:
	if not ligada:
		return

	for corpo in area_dano.get_overlapping_bodies():
		if corpo.has_method("receber_dano"):
			corpo.receber_dano()
