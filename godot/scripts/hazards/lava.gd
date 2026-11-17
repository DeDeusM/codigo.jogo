extends Area2D

var ativada: bool = false


func _ready() -> void:
	body_entered.connect(_ao_entrar)


func _ao_entrar(body: Node2D) -> void:
	if ativada or EstadoJogo.vidas <= 0:
		return

	if not body.has_method("receber_dano"):
		return

	ativada = true
	body.set_physics_process(false)
	EstadoJogo.perder_vida()

	if EstadoJogo.vidas > 0:
		get_tree().call_deferred("reload_current_scene")
