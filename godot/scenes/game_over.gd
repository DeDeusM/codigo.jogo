extends Control


func _ready() -> void:
	get_tree().paused = false
	$BotaoInicio.pressed.connect(_voltar_inicio)
	$BotaoSair.pressed.connect(_sair)


func _voltar_inicio() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_inicial.tscn")


func _sair() -> void:
	get_tree().quit()
	
