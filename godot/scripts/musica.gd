extends Node

var player := AudioStreamPlayer.new()
var faixa_atual: String = ""


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(player)
	player.volume_db = -12.0


func tocar(caminho: String) -> void:
	if faixa_atual == caminho and player.playing:
		return

	var audio := load(caminho) as AudioStream

	if audio == null:
		push_error("Não foi possível carregar a música: " + caminho)
		return

	if audio is AudioStreamMP3:
		audio.loop = true

	faixa_atual = caminho
	player.stream = audio
	player.play()


func parar() -> void:
	player.stop()
	faixa_atual = ""
