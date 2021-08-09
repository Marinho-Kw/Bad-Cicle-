extends KinematicBody2D
var raio = Vector2.ZERO
var velocidade = 600
onready var anim_jogador = $AnimationPlayer
onready var anim_est = $anim
onready var anim_ar = anim_est.get('parameters/playback')

func _physics_process(delta):
	_get_input()
	
	
	
func _get_input():
	var move = Vector2.ZERO
	move.x = int(Input.is_action_pressed("dir")) - int(Input.is_action_pressed("esq"))
	move.y = int(Input.is_action_pressed("ba")) - int(Input.is_action_pressed("cim"))
	
	if move != Vector2.ZERO:
		anim_est.set('parameters/correndo/blend_position', move)
		anim_est.set('parameters/parado;blend_position', move)
		anim_ar.travel('correndo')
		raio = move * velocidade
		
	else:
		anim_ar.travel('parado')
		raio = Vector2.ZERO
	move_and_slide(raio)
		
	 
