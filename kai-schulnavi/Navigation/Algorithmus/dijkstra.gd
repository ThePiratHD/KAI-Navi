class_name Dijkstra
extends RefCounted

static func find_path(graph: Graph, start: String, goal: String) -> Array[String]:
	var distances: Dictionary = {}
	var previous: Dictionary = {}
	var unvisited: Array[String] = []

	for node in graph.nodes.keys():
		distances[node] = INF
		previous[node] = null
		unvisited.append(node)

	distances[start] = 0

	while unvisited.size() > 0:
		unvisited.sort_custom(func(a, b): return distances[a] < distances[b])
		var current = unvisited.pop_front()

		if current == goal:
			break

		for neighbor in graph.get_neighbors(current).keys():
			var cost = graph.nodes[current][neighbor]
			var alt = distances[current] + cost

			if alt < distances[neighbor]:
				distances[neighbor] = alt
				previous[neighbor] = current

	var path: Array[String] = []
	var step = goal

	while step != null:
		path.push_front(step)
		step = previous[step]

	if path.size() > 0 and path[0] == start:
		return path
	return []
