extends Area2D

@export var tempo_desligada: float = 2.0
@export var tempo_ligada: float = 1.5
@export var atraso_inicial: float = 0.0

@onready var imagem_desligada: Sprite2D = $Desligada
@onready var imagem_ligada: Sprite2D = $Ligada

var ligada: bool = false


func _ready() -> void:
	monitoring = true
	_atualizar_visual()
	_iniciar_ciclo()


func _iniciar_ciclo() -> void:
	if atraso_inicial > 0:
		await get_tree().create_timer(atraso_inicial, false).timeout

	while is_inside_tree():
		await get_tree().create_timer(tempo_desligada, false).timeout
		ligada = true
		_atualizar_visual()

		await get_tree().create_timer(tempo_ligada, false).timeout
		ligada = false
		_atualizar_visual()


func _physics_process(_delta: float) -> void:
	if not ligada:
		return

	for corpo in get_overlapping_bodies():
		if corpo.has_method("receber_dano"):
			corpo.receber_dano()


func _atualizar_visual() -> void:
	imagem_desligada.visible = not ligada
	imagem_ligada.visible = ligada
