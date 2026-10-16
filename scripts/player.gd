extends CharacterBody2D
var ataque: bool = true
var ulti_direcao: String = "baixo"
var speed = 100
@onready var animacao = $AnimatedSprite2D


func andar() -> void:
	var direcao_input: Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = speed * direcao_input


func atacar() -> void: 
	if(Input.is_action_just_pressed("ui_accept") and ataque):
		ataque = false 
		set_physics_process(false)

func animacoes() -> void:
	if ataque == false:
		animacao.play("ataque_" + ulti_direcao)
		await get_tree().create_timer(1).timeout
		set_physics_process(true)
		ataque = true
	elif velocity != Vector2.ZERO:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				ulti_direcao = "dir"
			else:
				ulti_direcao = "esq"
		else:
			if velocity.y > 0:
				ulti_direcao = "baixo"
			else:
				ulti_direcao = "cima"
		animacao.play("andar_" + ulti_direcao)
	else:
		animacao.play("idle_" + ulti_direcao)

func _ready() -> void:
	animacao.play("idle_baixo")

func _physics_process(_delta: float) -> void:
	andar()
	atacar()
	animacoes()
	move_and_slide()
