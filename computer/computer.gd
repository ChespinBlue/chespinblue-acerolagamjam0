extends Control

@onready var screenWait = $screen_wait
@onready var email1 = $Panel/emails/email1


@onready var email2 = $Panel/emails/email2
@onready var email2p = $Panel/emails/email2p


var orderguess = false

var order1F = false
@onready var order1 = $Panel/orders/order1
@onready var order1button = $Panel/orders/order1button
@onready var profileC1 = $Panel/orders/order1/profileC1
var order2F = true
@onready var order2 = $Panel/orders/order2
@onready var order2button = $Panel/orders/order2button
@onready var profileC2 = $Panel/orders/order2/profileC2


var incomputerrange = false


func _process(_delta):
	if global.usingComputer == true:
		visible = true
	if global.day == 2:
		pass
	
func _input(event):
	if event.is_action_pressed("interact"):
		if incomputerrange == true:
			if global.usingComputer == false:
				global.usingComputer = true
				visible = true
				position.y = 210
	if event.is_action_pressed("cancel"):
		global.usingComputer = false
		
		screenWait.start()
	if event.is_action_pressed("click"):
		profileC1.visible = false
		profileC2.visible = false
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_computer_area_body_exited(_body):
	incomputerrange = false
func _on_computer_area_body_entered(_body):
	incomputerrange = true

func _on_screen_transiton_timeout():
	if global.usingComputer == true:
		if position.y > 0:
			position.y -= 21
	elif global.usingComputer == false:
		if position.y > -200:
			position.y -= 21
func _on_screen_wait_timeout():
	visible = false
func _on_computertelepathybugfix_timeout():
	incomputerrange = false



############################################################################### EMAILS!!!
func _on_email_1p_pressed():
	if email1.visible == false:
		email1.visible = true
	else:
		email1.visible = false


func _on_email_2p_pressed():
	if email2.visible == false:
		email2.visible = true
	else:
		email2.visible = false
func _on_email_2_timer_timeout():
	email2p.visible = true

################################################################################ ORDERS!!!!!!!!!!!!!!!!!!!!
func checkorderF(x, y, z):
	# xyz answer, reward, punishment
	if orderguess == x:
		global.workscore += y
	else:
		global.workscore -= z

#####order1
func _on_order_1_button_pressed():
	if order1.visible == false:
		order1.visible = true
	else:
		order1.visible = false
func _on_profile_1_pressed():
	if profileC1.visible == false:
		profileC1.visible = true
	else:
		profileC1.visible = false

func _on_fraud_1_pressed():
	orderguess = true
	checkorderF(order1F, 20, 10)
	order1.visible = false
	order1button.visible = false
func _on_real_1_pressed():
	orderguess = false
	checkorderF(order1F, 20, 10)
	order1.visible = false
	order1button.visible = false

#####order2
func _on_order_2_button_pressed():
	if order2.visible == false:
		order2.visible = true
	else:
		order2.visible = false
func _on_profile_2_pressed():
	if profileC2.visible == false:
		profileC2.visible = true
	else:
		profileC2.visible = false


func _on_fraud_2_pressed():
	orderguess = true
	checkorderF(order2F, 20, 10)
	order2.visible = false
	order2button.visible = false
	global.workdone = true
func _on_real_2_pressed():
	orderguess = false
	checkorderF(order2F, 20, 10)
	order2.visible = false
	order2button.visible = false
	global.workdone = true

