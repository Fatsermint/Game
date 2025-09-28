extends Control


@onready var colorrect: ColorRect = $MarginContainer2/ColorRect
@onready var timer: Timer = $Timer
@onready var button: Button = $MarginContainer3/Button
@onready var margincontainer3: MarginContainer = $MarginContainer3
@onready var label: Label = $MarginContainer2/ColorRect/Label
@onready var mlabel: Label = $MarginContainer4/ColorRect/Seconds/label
@onready var slabel: Label = $MarginContainer4/ColorRect/mSeconds/label
@onready var popuptime: MarginContainer = $MarginContainer4
@onready var exitbutton: Button = $MarginContainer4/ColorRect/MarginContainer/Button


var time_elapsed := 0.0
var time = randfn(1, 3)
var notclicked = true
var seconds: int = 0
var mseconds: int = 0
var timetaken = 0.0
	
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://control.tscn")

func _process(delta: float) -> void:
	timetaken += delta
	mseconds = fmod(timetaken, 1) * 100
	seconds = fmod(timetaken, 60)
	slabel.text = "%02d" % mseconds
	mlabel.text = "%02d:" % seconds
func _ready():
	set_process(false)
	print(slabel.text, mlabel.text)
	timer.wait_time = time
	timer.start()
	print("started")



func _on_timer_timeout() -> void:
	set_process(true)
	colorrect.color = Color(0.256, 1.161, 0.0, 1.0)
	button.visible = true
	label.text = "Click!"
	print("karhu")
	margincontainer3.visible = true

	


func _on_button_pressed() -> void:
	print("hit")
	set_process(false)
	notclicked = false
	popuptime.visible = true
	set_process(false)
	margincontainer3.visible = false
	


func _on_exitbutton_pressed() -> void:
	get_tree().reload_current_scene()
