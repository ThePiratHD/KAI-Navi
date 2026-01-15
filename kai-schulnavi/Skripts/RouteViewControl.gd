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
	for i in route.size():
		var label := Label.new()
		label.text = "%d. %s" % [i + 1, route[i]]
		route_list.add_child(label)
