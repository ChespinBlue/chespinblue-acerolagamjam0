extends Control

@onready var screenWait = $screen_wait


@onready var email1 = $Panel/emails/email1
@onready var email2 = $Panel/emails/email2
@onready var email2p = $Panel/emails/email2p
@onready var email3 = $Panel/emails/email3
@onready var email3p = $Panel/emails/email3p


var orderguess = false
signal ordererror
signal ordersuccess

var order1F = false
@onready var order1 = $Panel/orders/order1
@onready var order1button = $Panel/orders/order1button
@onready var profileC1 = $Panel/orders/order1/profileC1
var order2F = true
@onready var order2 = $Panel/orders/order2
@onready var order2button = $Panel/orders/order2button
@onready var profileC2 = $Panel/orders/order2/profileC2
var order3F = true
@onready var order3 = $Panel/orders/order3
@onready var order3button = $Panel/orders/order3button
@onready var profileC3 = $Panel/orders/order3/profileC3
var order4F = false
var order4done = false
@onready var order4 = $Panel/orders/order4
@onready var order4button = $Panel/orders/order4button
@onready var profileC4 = $Panel/orders/order4/profileC4
var order5F = true
var order5done = false
@onready var order5 = $Panel/orders/order5
@onready var order5button = $Panel/orders/order5button
@onready var profileC5 = $Panel/orders/order5/profileC5


var incomputerrange = false


func _process(_delta):
	if global.usingComputer == true:
		visible = true
	if global.day == 2:
		email2p.visible = true
		email3p.visible = true
		if order4done == false:
			order4button.visible = true
		if order5done == false:
			order5button.visible = true
	
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
		profileC3.visible = false
		profileC4.visible = false
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

func _on_email_3p_pressed():
	if email3.visible == false:
		email3.visible = true
	else:
		email3.visible = false

################################################################################ ORDERS!!!!!!!!!!!!!!!!!!!!
func checkorderF(x, y, z):
	# xyz answer, reward, punishment
	if orderguess == x:
		global.workscore += y
		ordersuccess.emit()
	else:
		global.workscore -= z
		ordererror.emit()

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
	checkorderF(order1F, 10, 5)
	order1.visible = false
	order1button.visible = false
func _on_real_1_pressed():
	orderguess = false
	checkorderF(order1F, 10, 5)
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
	checkorderF(order2F, 10, 5)
	order2.visible = false
	order2button.visible = false
	## day 1 done
	global.workdone = true
func _on_real_2_pressed():
	orderguess = false
	checkorderF(order2F, 10, 5)
	order2.visible = false
	order2button.visible = false
	## day 1 done
	global.workdone = true

#####order3
func _on_order_3_button_pressed():
	if order3.visible == false:
		order3.visible = true
	else:
		order3.visible = false
func _on_profile_3_pressed():
	if profileC3.visible == false:
		profileC3.visible = true
	else:
		profileC3.visible = false

func _on_fraud_3_pressed():
	orderguess = true
	checkorderF(order3F, 5, 15)
	order3.visible = false
	order3button.visible = false
func _on_real_3_pressed():
	orderguess = false
	checkorderF(order3F, 5, 15)
	order3.visible = false
	order3button.visible = false

#####order4
func _on_order_4_button_pressed():
	if order4.visible == false:
		order4.visible = true
	else:
		order4.visible = false
func _on_profile_4_pressed():
	if profileC4.visible == false:
		profileC4.visible = true
	else:
		profileC4.visible = false

func _on_fraud_4_pressed():
	orderguess = true
	checkorderF(order4F, 5, 10)
	order4.visible = false
	order4button.visible = false
	order4done = true
func _on_real_4_pressed():
	orderguess = false
	checkorderF(order4F, 5, 10)
	order4.visible = false
	order4button.visible = false
	order4done = true
#####order5
func _on_order_5_button_pressed():
	if order5.visible == false:
		order5.visible = true
	else:
		order5.visible = false
func _on_profile_5_pressed():
	if profileC5.visible == false:
		profileC5.visible = true
	else:
		profileC5.visible = false

func _on_fraud_5_pressed():
	orderguess = true
	checkorderF(order5F, 5, 15)
	order5.visible = false
	order5button.visible = false
	order5done = true
func _on_real_5_pressed():
	orderguess = false
	checkorderF(order5F, 5, 15)
	order5.visible = false
	order5button.visible = false
	order5done = true
