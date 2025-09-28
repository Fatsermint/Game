extends Control

var clicking = false
var Clicks = 0
var finished = false
var time = 5
var cpstime = 0
var tulos = 0
var menuOpenn = false
@onready var smalltimer: Timer = $SmallTimer
@onready var cps: Label = $Cps3/ColorRect/MarginContainer/Label
@onready var headlabel: Label = $Time/ColorRect/MarginContainer/Label
@onready var label: Label = $Clicks/ColorRect/MarginContainer/Label


@onready var timer: Timer = $MarginContainer2/Timer
@onready var button: Button = $MarginContainer2/Button
@onready var margin_container_2: MarginContainer = $MarginContainer2


#window
@onready var clicks_label: Label = $WindoW/Window/ClicksLabel/Label
@onready var cpslabel: Label = $WindoW/Window/CpsLabel/Label
@onready var window: ColorRect = $WindoW/Window
@onready var exitbutton: Button = $WindoW/Window/MarginContainer/Button
@onready var windo_w: MarginContainer = $WindoW
@onready var very_small_timer: Timer = $WindoW/Window/MarginContainer/VerySmallTimer
#startwindow
@onready var startcolorrect: ColorRect = $MarginContainer/ColorRect
@onready var start5: Button = $"MarginContainer/ColorRect/5/5Button"
@onready var start1: Button = $"MarginContainer/ColorRect/1/1Button"
@onready var start10: Button = $"MarginContainer/ColorRect/10/10Button"
@onready var startlabel: Label = $MarginContainer/ColorRect/Otsikko/Label
@onready var startmargincontainer: MarginContainer = $MarginContainer





func _ready() -> void:
	button.disabled = true
	window.visible = false
func _on_button_pressed() -> void:
	if clicking == false and menuOpenn == false:
		Clicks = 1
		clicking = true
		label.text = str(Clicks)
		finished = false
		print(time)
		smalltimer.start()
		timer.start()
	else:
		if menuOpenn == false:
			Clicks += 1
			label.text = str(Clicks)
	pass

		



func _on_timer_timeout() -> void:
	if finished == false:
		window.visible = true
		button.disabled = true
		clicking = false
		finished = true
		clicks_label.text = "You Clicked " + str(Clicks) + " Times"
		cpslabel.text = "Your Avarage Cps" + "\nWas "+str(snapped(tulos, 0.1))
		mouse_filter = Control.MOUSE_FILTER_PASS
		menuOpenn = true
		print("karhu")
		margin_container_2.visible = false
		startmargincontainer.visible = false
		


func _on_small_timer_timeout() -> void:
	if clicking == true:
		time = timer.time_left
		cpstime += 0.1
		tulos = Clicks / cpstime
		headlabel.text = str(snapped(tulos,0.1))
		print(tulos)
		cps.text = str(snapped(timer.time_left, 0.1))
		
	
	



	
func _on_1button_pressed() -> void:
	time = 1
	timer.wait_time = 1
	button.disabled = false
	startmargincontainer.visible = false
func _on_10button_pressed() -> void:
	time = 10
	timer.wait_time = 10
	print(timer.wait_time)
	button.disabled = false
	startmargincontainer.visible = false


func _on_buttona_pressed() -> void:
	get_tree().reload_current_scene()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://control.tscn")


func _on_button5_pressed() -> void:
	time = 5
	timer.wait_time = 5
	button.disabled = false
	print(timer.wait_time)
	startmargincontainer.visible = false
