extends Area2D

@export_file("*.tscn") var proxima_fase: String = \
	"res://scenes/levels/fase_2.tscn"

var trocando: bool = false


func _ready() -> void:
	collision_mask = 1
	monitoring = true
	body_entered.connect(_ao_entrar)


func _ao_entrar(corpo: Node2D) -> void:
	if trocando or EstadoJogo.vidas <= 0:
		return

	if not corpo.has_method("receber_dano"):
		return

	if proxima_fase.is_empty():
		return

	trocando = true
	call_deferred("_trocar_fase")


func _trocar_fase() -> void:
	var erro := get_tree().change_scene_to_file(proxima_fase)

	if erro != OK:
		trocando = false
		push_error("Não foi possível abrir: " + proxima_fase)
