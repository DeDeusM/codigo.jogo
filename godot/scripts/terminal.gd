extends Node2D

signal ativado

var esta_ativo: bool = false

@onready var botao: Area2D = $Botao
@onready var tela_desligada: Sprite2D = $TelaDesligada
@onready var tela_ligada: Sprite2D = $TelaLigada
@onready var botao_solto: Sprite2D = $Botao/BotaoSolto
@onready var botao_pressionado: Sprite2D = $Botao/BotaoPressionado


func _ready() -> void:
	tela_desligada.show()
	tela_ligada.hide()
	botao_solto.show()
	botao_pressionado.hide()

	botao.body_entered.connect(_ao_encostar_no_botao)


func _ao_encostar_no_botao(corpo: Node2D) -> void:
	if esta_ativo:
		return

	if not corpo.has_method("receber_dano"):
		return

	esta_ativo = true

	tela_desligada.hide()
	tela_ligada.show()
	botao_solto.hide()
	botao_pressionado.show()

	print("Terminal ativado!")
	ativado.emit()
