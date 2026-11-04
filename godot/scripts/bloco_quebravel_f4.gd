extends StaticBody2D

@export var tempo_para_cair: float = 0.5
@export var tempo_para_voltar: float = 3.0
@export var distancia_queda: float = 250.0

@onready var imagem: Sprite2D = $Sprite2D
@onready var colisao: CollisionShape2D = $CollisionShape2D
@onready var detector: Area2D = $Detector

var ativado: bool = false
var posicao_inicial: Vector2


func _ready() -> void:
	posicao_inicial = imagem.position
	detector.body_entered.connect(_ao_pisar)


func _ao_pisar(corpo: Node2D) -> void:
	if ativado:
		return

	if not corpo.has_method("receber_dano"):
		return

	ativado = true
	detector.set_deferred("monitoring", false)

	# Avisa que o bloco vai cair.
	imagem.modulate = Color(1.0, 0.6, 0.6)
	await get_tree().create_timer(tempo_para_cair, false).timeout

	# Desliga o chão do bloco e anima sua queda.
	colisao.set_deferred("disabled", true)

	var queda := create_tween()
	queda.set_parallel(true)
	queda.tween_property(
		imagem,
		"position",
		posicao_inicial + Vector2(0, distancia_queda),
		0.5
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

	queda.tween_property(imagem, "modulate:a", 0.0, 0.5)

	await queda.finished
	await get_tree().create_timer(tempo_para_voltar, false).timeout

	# Restaura o bloco para permitir outra tentativa.
	imagem.position = posicao_inicial
	imagem.modulate = Color.WHITE
	colisao.set_deferred("disabled", false)

	ativado = false
	detector.set_deferred("monitoring", true)
