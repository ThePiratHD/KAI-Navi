extends Control

# preload the navigation logic
var SchoolMapClass = preload("res://navigation/school_map.gd")

# class-level variables
var school_map
var barrierefrei := false
var start_room := ""
var target_room := ""

# Node references
@onready var start_option: OptionButton = $VBoxContainer/StartOption
@onready var target_option: OptionButton = $VBoxContainer/TargetOption
@onready var route_button: Button = $VBoxContainer/RouteButton
@onready var barrierefrei_toggle: CheckButton = $VBoxContainer/BarrierefreiToggle

func _ready():
	# Connect signals
	start_option.item_selected.connect(_on_start_selected)
	target_option.item_selected.connect(_on_target_selected)
	route_button.pressed.connect(_on_route_pressed)
	barrierefrei_toggle.toggled.connect(_on_barrierefrei_toggled)

	# Create initial navigation map
	_create_school_map()


# Create / rebuild navigation map based on barrierefrei
func _create_school_map() -> void:
	school_map = SchoolMapClass.new(barrierefrei)

	# Get all room names
	var rooms: Array[String] = []
	for key in school_map.graph.nodes.keys():
		rooms.append(String(key))
	rooms.sort()

	# Fill dropdowns
	_fill_option_button(start_option, rooms)
	_fill_option_button(target_option, rooms)


# Fill OptionButton
func _fill_option_button(button: OptionButton, items: Array[String]) -> void:
	button.clear()
	button.add_item("Bitte wählen…")
	for item in items:
		button.add_item(item)
	button.select(0)


# Callbacks
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


func _on_barrierefrei_toggled(enabled: bool) -> void:
	barrierefrei = enabled
	_create_school_map()
	print("Barrierefrei:", barrierefrei)


func _on_route_pressed() -> void:
	if start_room == "" or target_room == "":
		push_warning("Start oder Ziel fehlt")
		return

	var path = school_map.find_path(start_room, target_room)

	print("Route von ", start_room, " nach ", target_room)
	for step in path:
		print(" → ", step)
