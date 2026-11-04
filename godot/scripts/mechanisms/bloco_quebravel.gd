extends AnimatableBody2D
@export var tempo_antes_de_cair: float = 0.35
@export var velocidade_inicial: float = 200.0
@export var gravidade: float = 900.0
var ativado: bool = false
var caindo: bool = false
var velocidade: float = 0.0
@onready var colisao: CollisionShape2D = $Colisao
@onready var detector: Area2D = $DetectorPlayer
func _ready():
	detector.body_entered.connect(_quando_player_pisar)
func _physics_process(delta):
	if caindo:
		velocidade += gravidade * delta
		position.y += velocidade * delta
		if position.y > 1200:
			queue_free()
func _quando_player_pisar(body):
	if ativado:
		return
	if body is CharacterBody2D:
		ativado = true
		await get_tree().create_timer(tempo_antes_de_cair).timeout
		colisao.set_deferred("disabled", true)
		detector.set_deferred("monitoring", false)
		velocidade = velocidade_inicial
		caindo = true
