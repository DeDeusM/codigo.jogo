extends Control


func _ready() -> void:
	$BotaoJogar.pressed.connect(_jogar)
	$BotaoSair.pressed.connect(_sair)


func _jogar() -> void:
	EstadoJogo.novo_jogo()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels/fase_1.tscn")


func _sair() -> void:
	get_tree().quit()
