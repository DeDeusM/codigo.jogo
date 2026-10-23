extends Node2D

@export var tempo_espera: float = 2.0
@export var atraso_inicial: float = 0.0

var reiniciando: bool = false

func _ready():
	$Area2D.collision_layer = 2
	$Area2D.collision_mask = 1
	$Area2D.body_entered.connect(_quando_entrou_no_fogo)

	$Sprite2D.visible = false
	$Area2D.monitoring = false

	await get_tree().create_timer(atraso_inicial).timeout
	ciclo_labareda()

func ciclo_labareda():
	while true:
		$Sprite2D.visible = true
		$Area2D.monitoring = true
		$Sprite2D.frame = 0
		$Sprite2D.play("default")

		await $Sprite2D.animation_finished

		$Sprite2D.visible = false
		$Area2D.monitoring = false

		await get_tree().create_timer(tempo_espera).timeout

func _quando_entrou_no_fogo(corpo):
	print("Corpo detectado pelo fogo: ", corpo.name)

	if reiniciando:
		return

	if corpo is CharacterBody2D:
		reiniciando = true
		get_tree().reload_current_scene()
