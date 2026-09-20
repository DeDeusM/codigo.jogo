extends AnimatableBody2D
@export var distancia: float = 150.0
@export var velocidade: float = 1.5
var posicao_inicial: Vector2
var tempo: float = 0.0
func _ready():
	posicao_inicial = position
func _physics_process(delta):
	tempo += delta * velocidade
	position.y = posicao_inicial.y + sin(tempo) * distancia
