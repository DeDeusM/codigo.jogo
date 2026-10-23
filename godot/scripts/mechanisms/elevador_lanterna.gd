extends AnimatableBody2D

@export var distancia_descida: float = 200.0
@export var velocidade: float = 80.0
@export var espera_em_cima: float = 2.0
@export var espera_embaixo: float = 2.0

var posicao_superior: Vector2
var posicao_inferior: Vector2
var descendo: bool = true
var tempo_espera: float = 0.0


func _ready() -> void:
	sync_to_physics = true

	posicao_superior = position
	posicao_inferior = (
		posicao_superior + Vector2(0.0, distancia_descida)
	)

	tempo_espera = espera_em_cima


func _physics_process(delta: float) -> void:
	if tempo_espera > 0.0:
		tempo_espera = maxf(tempo_espera - delta, 0.0)
		return

	var destino: Vector2

	if descendo:
		destino = posicao_inferior
	else:
		destino = posicao_superior

	position = position.move_toward(
		destino,
		velocidade * delta
	)

	if position.distance_to(destino) < 0.01:
		if descendo:
			tempo_espera = espera_embaixo
		else:
			tempo_espera = espera_em_cima

		descendo = not descendo
		
