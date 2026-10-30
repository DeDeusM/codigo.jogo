extends Node2D

@export var tempo_desligada: float = 2.0
@export var tempo_aviso: float = 0.6
@export var tempo_ligada: float = 1.5
@export var atraso_inicial: float = 0.0

@onready var visual: AnimatedSprite2D = $Visual
@onready var area_dano: Area2D = $AreaDano
@onready var colisao: CollisionShape2D = $AreaDano/CollisionShape2D

var ligada: bool = false


func _ready() -> void:
	area_dano.collision_mask = 1
	area_dano.monitoring = true

	definir_estado("desligada")

	if atraso_inicial > 0.0:
		await get_tree().create_timer(atraso_inicial, false).timeout

	executar_ciclo()


func executar_ciclo() -> void:
	while is_inside_tree():
		definir_estado("desligada")
		await get_tree().create_timer(tempo_desligada, false).timeout

		definir_estado("aviso")
		await get_tree().create_timer(tempo_aviso, false).timeout

		definir_estado("ligada")
		await get_tree().create_timer(tempo_ligada, false).timeout


func definir_estado(estado: String) -> void:
	ligada = estado == "ligada"
	visual.play(estado)
	colisao.set_deferred("disabled", not ligada)


func _physics_process(_delta: float) -> void:
	if not ligada:
		return

	for corpo in area_dano.get_overlapping_bodies():
		if corpo.has_method("receber_dano"):
			corpo.receber_dano()
