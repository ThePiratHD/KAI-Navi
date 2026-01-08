extends Node2D  # oder Control, je nachdem welche Node du hast

# Lade die Logikklasse direkt
var SchoolMapClass = preload("res://Navigation/school_map.gd")
var school_map

# Fahrstuhl aus (Schlüssel nötig)
var barrierefrei : bool = false

func _ready():
	# Logik-Objekt instanziieren
	school_map = SchoolMapClass.new(barrierefrei)

	# Beispiel-Navigation
	var start = "Mensa"
	var target = "A33"
	print("Neue Route")


	var path = school_map.find_path(start, target)
	print("Route:")
	for step in path:
		print(" → ", step)
