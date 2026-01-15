extends Control


@onready var route_list: VBoxContainer = $Panel/VBoxContainer/ScrollContainer/RouteList
@onready var close_button: Button = $Panel/VBoxContainer/Close_Button
@onready var title_label: Label = $Panel/TitelLabel



func _ready() -> void:
	print("RouteView geöffnet!")
	close_button.pressed.connect(queue_free)


func set_route(route: Array, start: String, target: String) -> void:
	title_label.text = "Route von %s nach %s" % [start, target]

	# alte Einträge löschen
	for child in route_list.get_children():
		child.queue_free()

	# Route anzeigen
	for step in route:
		var label = Label.new()
		label.text = "→ " + str(step)

		# FontFile laden (TTF/OTF)
		var font_file := load("res://fonts/Roboto-Regular.ttf")
		# override the font
		label.add_theme_font_override("font", font_file)

		# Sichtbar machen
		label.size_flags_vertical = Control.SIZE_FILL | Control.SIZE_EXPAND
		label.size_flags_horizontal = Control.SIZE_FILL

		route_list.add_child(label)
