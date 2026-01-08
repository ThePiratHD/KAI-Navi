# res://navigation/graph.gd
class_name Graph
extends RefCounted

var nodes: Dictionary = {}

func add_node(name: String) -> void:
	if not nodes.has(name):
		nodes[name] = {}

func add_edge(from: String, to: String, cost: float, bidirectional: bool = true) -> void:
	add_node(from)
	add_node(to)
	nodes[from][to] = cost
	if bidirectional:
		nodes[to][from] = cost

func get_neighbors(node: String) -> Dictionary:
	return nodes.get(node, {})
