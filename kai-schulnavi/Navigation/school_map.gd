class_name School_map
extends RefCounted

var graph := Graph.new()
var barrierefrei: bool = false

func _init(_barrierefrei: bool = false):
	barrierefrei = _barrierefrei
	_build_map()

func _build_map():
	# Beispiel-Knoten (Flure, Räume, Treppen, Fahrstuhl, Innenhof)
	var _rooms = [
		"W101", "West_1_Raum_102",
		"West_2_Raum_201", "West_2_Raum_202",
		"Alt_3_Raum_301"
	]

	var _flure = [
		"W1 Flur", "W2 Flur", "W3 Flur", "W4 Flur", "W0 Flur", "A0 Flur", "A1 Flur", "A2 Flur", "A3 Flur", "A4 Flur", "S0 Flur", "S1 Flur", "S2 Flur", "S3 Flur", "S4 Flur" 
	]

	# Treppen
	var _stairs = [
		"TreppeS1", "TreppeS2", "TreppeA1", "TreppeA2", "TreppeW1", "TreppeW2" 
	]

	# Fahrstühle (nur wenn barrierefrei)
	var lifts = []
	if barrierefrei:
		lifts = ["Westflügel Fahrstuhl", "Südflügel Fahrstuhll", "Altbau Fahrstuhl"]

	# Innenhof
	var courtyard = "Innenhof"

	var S0 = "Forum"
	var W0 = "Mensa"
	var TreppeA1 = "Treppe Wesflügel Richtung Altbau"
	var TreppeA2 = "Treppe Westflügel"
	var TreppeS1 = "Treppe Altbau klein"
	var TreppeS2 = "Treppe Altbau groß"
	var TreppeW1 = "Treppe Südflügel vorne"
	var TreppeW2 = "Treppe Südflügel hinten"

	# Flure ↔ Räume
	graph.add_edge(S0, "Otium", 8)
	graph.add_edge(TreppeS1, "West_2_Raum_201", 2)
	graph.add_edge(TreppeS1, "West_2_Raum_202", 2)
	graph.add_edge("A0", "A", 5)
	#Altbau 
	graph.add_edge("A0", "A03", 5)	
	graph.add_edge("A0", "A0B", 5) #Was ist das
	graph.add_edge("A0", "A0BIB", 5)
	graph.add_edge("A0", "Bibliothek", 5)
	graph.add_edge("A0", "A0SII", 5) #Was ist das
	graph.add_edge("A0", "SV-Raum", 5)
	graph.add_edge("A0", "A02", 5)
	graph.add_edge("A0", "A0LA", 5)
	graph.add_edge("A0", "Lehrerzimmer", 5)
	graph.add_edge("A0", "A01", 5)
	graph.add_edge("A1", "Aula", 5) # Ich weiß nicht ob das stimmt
	graph.add_edge("A1", "A11", 5)
	graph.add_edge("A1", "A16MU", 5)
	graph.add_edge("A1", "Technik", 5)
	graph.add_edge("A1", "A15", 5)
	graph.add_edge("A1", "A14", 5)
	graph.add_edge("A1", "A13", 5)
	graph.add_edge("A1", "ML", 5) #WTF
	graph.add_edge("A2", "A26", 5)
	graph.add_edge("A2", "A25", 5)
	graph.add_edge("A2", "A24", 5)
	graph.add_edge("A2", "A23", 5)
	graph.add_edge("A2", "A22", 5)
	graph.add_edge("A2", "A21", 5)
	graph.add_edge("A3", "Kunstsammlung", 5)
	graph.add_edge("A3", "Atelier", 5)
	graph.add_edge("A3", "A33", 5)
	graph.add_edge("A3", "A32", 5)
	graph.add_edge("A3", "A31", 5)
	#Westflügel
	graph.add_edge(W0, "Klo", 5)
	graph.add_edge(W0, "Toilette ", 5)
	graph.add_edge(W0, "WC ", 5)
	graph.add_edge(W0, "WC", 5)
	graph.add_edge(W0, "WC Damen", 5)
	graph.add_edge(W0, "WC Herren", 5)
	
	
	
	
	
	
	
	
	
	
	

	#  Treppen ↔ Innenhof
	graph.add_edge(TreppeS1, "Innenhof", 15)
	graph.add_edge(TreppeS2, "Innenhof", 15)
	graph.add_edge(TreppeA1, "Innenhof", 15)
	graph.add_edge(TreppeW2, "Innenhof", 15)
	graph.add_edge(TreppeW1, "Innenhof", 15)
	graph.add_edge(TreppeA2, "Innenhof", 15)

	# 3️ Treppen vertikal
	graph.add_edge(TreppeS1, W0, 4)
	graph.add_edge(TreppeS1, "W1", 4)
	graph.add_edge(TreppeS1, "W2", 4)
	graph.add_edge(TreppeS1, "W3", 4)
	graph.add_edge(TreppeS2, W0, 4)
	graph.add_edge(TreppeS2, "W1", 4)
	graph.add_edge(TreppeS2, "W2", 4)
	graph.add_edge(TreppeS2, "W3", 4)
	graph.add_edge(TreppeA1, "A0", 4)
	graph.add_edge(TreppeA1, "A1", 4)
	graph.add_edge(TreppeA1, "A2", 4)
	graph.add_edge(TreppeA1, "A3", 4)
	graph.add_edge(TreppeA1, "A4", 4)
	graph.add_edge(TreppeA2, "A0", 4)
	graph.add_edge(TreppeA2, "A1", 4)
	graph.add_edge(TreppeA2, "A2", 4)
	graph.add_edge(TreppeA2, "A3", 4)
	graph.add_edge(TreppeA2, "A4", 4) 
	graph.add_edge(TreppeW1, S0, 4) 
	graph.add_edge(TreppeW1, "S1", 4) 
	graph.add_edge(TreppeW1, "S2", 4) 
	graph.add_edge(TreppeW1, "S3", 4) 
	graph.add_edge(TreppeW1, "S4", 4)  
	graph.add_edge(TreppeW2, S0, 4)
	graph.add_edge(TreppeW2, "S1", 4)
	graph.add_edge(TreppeW2, "S2", 4)
	graph.add_edge(TreppeW2, "S3", 4)
	graph.add_edge(TreppeW2, "S4", 4)
	

	# Flure ↔ Fahrstühle (optional)
	for lift in lifts:
		var floor = lift.split("_")[0] + "_" + lift.split("_")[1]
		graph.add_edge("%s_Flur" % floor, lift, 3)

	# Innenhof verbindungen 
	graph.add_edge(W0, courtyard, 10)
	graph.add_edge(courtyard, "A0", 10)
	graph.add_edge(courtyard, S0, 10)

func find_path(start: String, goal: String) -> Array[String]:
	return Dijkstra.find_path(graph, start, goal)
