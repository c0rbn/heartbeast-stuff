extends Area2D

const Bullet = preload("res://Bullet.tscn")
const ExplosionEffect = preload("res://ExplosionEffect.tscn")

export(int) var speed = 100

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		move(0, -speed, delta)
	if Input.is_action_pressed("ui_down"):
		move(0, speed, delta)

	if Input.is_action_just_released("ui_accept"):
		fire_bullet()

func move(xspeed, yspeed, delta):
	position.x += xspeed * delta
	position.y += yspeed * delta

func fire_bullet():
	var bullet = Bullet.instance()
	var main = get_tree().current_scene
	main.add_child(bullet)
	bullet.global_position = global_position

func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()

func _exit_tree():
	var main = get_tree().current_scene
	var explosionEffect = ExplosionEffect.instance()
#	main.add_child(explosionEffect)
	main.call_deferred("add_child", explosionEffect)
	explosionEffect.global_position = global_position

