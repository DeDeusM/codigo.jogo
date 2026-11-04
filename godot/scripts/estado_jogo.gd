extends Node

signal vidas_alteradas(vidas: int)
signal game_over

var vidas: int = 3


func perder_vida() -> void:
	if vidas <= 0:
		return

	vidas -= 1
	vidas_alteradas.emit(vidas)

	if vidas == 0:
		game_over.emit()
		call_deferred("_abrir_game_over")


func _abrir_game_over() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func novo_jogo() -> void:
	vidas = 3
	vidas_alteradas.emit(vidas)
