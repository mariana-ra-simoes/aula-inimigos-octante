extends CharacterBody2D

var speed: float = 50.0
var jogador: CharacterBody2D

@onready var animacao = $AnimatedSprite2D

func _ready() -> void:
	jogador = get_tree().get_first_node_in_group("jogador")

func _physics_process(_delta: float) -> void:
	if jogador == null:
		velocity = Vector2.ZERO
		move_and_slide()
		animacao.stop()
		return

	var direcao = global_position.direction_to(jogador.global_position)
	velocity = direcao * speed
	move_and_slide()

	atualizar_animacao(direcao)

func atualizar_animacao(direcao: Vector2) -> void:
	# Escolhe o eixo com maior movimento
	if abs(direcao.x) > abs(direcao.y):
		if direcao.x > 0:
			animacao.play("walk_right")
		else:
			animacao.play("walk_left")
	else:
		if direcao.y > 0:
			animacao.play("walk_down")
		else:
			animacao.play("walk_front")  # veja a observação abaixo
