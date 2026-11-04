extends Node2D

var terminais_ativos: int = 0
var final_acionado: bool = false

@onready var botao_final: Area2D = $BotaoFinal
@onready var botao_solto: Sprite2D = $BotaoFinal/Sprite2D
@onready var botao_pressionado: Sprite2D = $BotaoFinal/Pressionado
@onready var win_exe: AnimatedSprite2D = $WinExe
@onready var alerta: AnimatedSprite2D = $AlertaDanger


func _ready() -> void:
	Musica.tocar("res://assets/audio/boss.mp3")
	$Terminal1.ativado.connect(_ao_ativar_terminal)
	$Terminal2.ativado.connect(_ao_ativar_terminal)
	$Terminal3.ativado.connect(_ao_ativar_terminal)

	botao_final.body_entered.connect(_ao_pisar_no_botao_final)
	win_exe.animation_finished.connect(_ao_terminar_animacao)

	botao_solto.modulate = Color.WHITE
	botao_pressionado.modulate = Color.WHITE
	botao_solto.show()
	botao_pressionado.hide()

	win_exe.show()
	win_exe.play("olhando")

	alerta.show()
	alerta.play("piscando")


func _ao_ativar_terminal() -> void:
	if terminais_ativos >= 3:
		return

	terminais_ativos += 1
	print("Terminais ativados: ", terminais_ativos, "/3")

	win_exe.stop()
	win_exe.animation = "enfraquecendo"
	win_exe.frame = terminais_ativos

	if terminais_ativos == 3:
		print("Botão final liberado!")

		for corpo in botao_final.get_overlapping_bodies():
			_ao_pisar_no_botao_final(corpo)


func _ao_pisar_no_botao_final(corpo: Node2D) -> void:
	if final_acionado or terminais_ativos < 3:
		return

	if not corpo.has_method("receber_dano"):
		return

	if EstadoJogo.vidas <= 0:
		return

	final_acionado = true
	botao_solto.hide()
	botao_pressionado.show()

	win_exe.play("morrendo")
	print("ANTIVÍRUS ATIVADO!")


func _ao_terminar_animacao() -> void:
	if win_exe.animation == "morrendo":
		win_exe.hide()
		alerta.stop()
		alerta.hide()
		call_deferred("_abrir_vitoria")


func _abrir_vitoria() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/vitoria.tscn")
