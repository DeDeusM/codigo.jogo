extends CanvasLayer
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	$TelaPause.hide()
	$BotaoPause.button_pressed = false
	$BotaoPause.toggled.connect(_alternar_pausa)
	$TelaPause/BotaoContinuar.pressed.connect(_continuar)
	$TelaPause/BotaoReiniciar.pressed.connect(_reiniciar)
	$TelaPause/BotaoMenu.pressed.connect(_voltar_menu)
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and not event.is_echo():
		_alternar_pausa(not get_tree().paused)
		get_viewport().set_input_as_handled()
func _alternar_pausa(pausado: bool) -> void:
	get_tree().paused = pausado
	$TelaPause.visible = pausado
	$BotaoPause.set_pressed_no_signal(pausado)
func _continuar() -> void:
	_alternar_pausa(false)
func _reiniciar() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
func _voltar_menu() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu_inicial.tscn")
