extends Node2D

@export var tempo_desligada: float = 2.0
@export var tempo_aviso: float = 0.6
@export var tempo_ligada: float = 1.5
@export var atraso_inicial: float = 0.0

@onready var visual: AnimatedSprite2D = $Visual
@onready var colisao: CollisionShape2D = $AreaDano/CollisionShape2D


func _ready() -> void:
	definir_estado("desligada")

	if atraso_inicial > 0.0:
		await get_tree().create_timer(atraso_inicial).timeout

	executar_ciclo()


func executar_ciclo() -> void:
	while is_inside_tree():
		definir_estado("desligada")
		await get_tree().create_timer(tempo_desligada).timeout

		definir_estado("aviso")
		await get_tree().create_timer(tempo_aviso).timeout

		definir_estado("ligada")
		await get_tree().create_timer(tempo_ligada).timeout


func definir_estado(estado: String) -> void:
	visual.play(estado)
	colisao.set_deferred("disabled", estado != "ligada")
