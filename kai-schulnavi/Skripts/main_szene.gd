extends Control

var SchoolMapClass = preload("res://navigation/school_map.gd")

@onready var start_option: OptionButton = $VBoxContainer/StartOption
@onready var target_option: OptionButton = $VBoxContainer/TargetOption
@onready var route_button: Button = $VBoxContainer/RouteButton

var school_map
var start_room := ""
var target_room := ""

func _ready():
	school_map = SchoolMapClass.new(false)

	var rooms: Array[String] = []
	for key in school_map.graph.nodes.keys():
		rooms.append(String(key))
	rooms.sort()

	_fill_option_button(start_option, rooms)
	_fill_option_button(target_option, rooms)

	start_option.item_selected.connect(_on_start_selected)
	target_option.item_selected.connect(_on_target_selected)
	route_button.pressed.connect(_on_route_pressed)


func _fill_option_button(button: OptionButton, items: Array[String]) -> void:
	
	
	for item in items:
		button.add_item(item)
	button.select(0)


func _on_start_selected(index: int) -> void:
	if index == 0:
		start_room = ""
		return
	start_room = start_option.get_item_text(index)


func _on_target_selected(index: int) -> void:
	if index == 0:
		target_room = ""
		return
	target_room = target_option.get_item_text(index)


func _on_route_pressed() -> void:
	if start_room == "" or target_room == "":
		push_warning("Start oder Ziel fehlt")
		return

	var path = school_map.find_path(start_room, target_room)

	print("Route von ", start_room, " nach ", target_room)
	for step in path:
		print(" → ", step)
