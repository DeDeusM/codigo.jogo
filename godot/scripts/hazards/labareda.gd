extends Node2D
@export var tempo_espera: float = 2.0
@export var atraso_inicial: float = 0.0
var ativa: bool = false
func _ready():
	await get_tree().create_timer(atraso_inicial).timeout
	ciclo_labareda()
func ciclo_labareda():
	while true:
		ativa = false
		$Sprite2D.visible = false
		$Area2D.monitoring = false
		await get_tree().create_timer(tempo_espera).timeout
		ativa = true
		$Sprite2D.visible = true
		$Area2D.monitoring = true
		$Sprite2D.frame = 0
		$Sprite2D.play("default")
		await $Sprite2D.animation_finished
		ativa = false
		$Sprite2D.visible = false
		$Area2D.monitoring = false
