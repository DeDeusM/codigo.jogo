extends Area2D

signal jogador_atingido

@export var velocidade: float = 250.0
@export var atraso_inicial: float = 0.0
@export var limite_esquerdo: float = -100.0
@export var limite_direito: float = 1780.0

var pode_voar: bool = false

func _ready():
	body_entered.connect(_on_body_entered)

	$AnimatedSprite2D.play("default")
	position.x = limite_esquerdo

	await get_tree().create_timer(atraso_inicial).timeout
	pode_voar = true

func _process(delta):
	if not pode_voar:
		return

	position.x += velocidade * delta

	if position.x >= limite_direito:
		position.x = limite_esquerdo

func _on_body_entered(corpo):
	if corpo is CharacterBody2D:
		print("Jogador atingido pelo pterodáctilo")
		jogador_atingido.emit()
