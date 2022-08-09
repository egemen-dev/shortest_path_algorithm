INFINITY = 999_999_999

# Create the adacency list

def add_edge(adacency, u, v, weight)
  adacency[u].<<([v, weight])
  adacency[v].<<([u, weight])
  adacency
end

def print_graph(adacency, vertices)
  vertex, weight = 0, 0
  
  vertices.times do |u|
    puts "\n #{CITIES[u]} makes an edge with"

    adacency[u].length.times do |iter|
      vertex = adacency[u][iter][0]
      weight = adacency[u][iter][1]
      puts "  * #{CITIES[vertex]} with a cost of: $#{weight}"
    end
  end
end

# Number of vertices
vertices = 6
adacency = []

# Adding cost of it's value to itself which is 0
itr = 0
vertices.times do
  adacency <<[[itr, 0]]
  itr += 1
end

# -------------------------------------

# Dijkstra's algorithm

def select_min_vertex(value, porcessed)
  indexes = []
  vertex_arr = []
  porcessed.each_with_index do |val, idx|
    indexes << idx if val == false
  end

  indexes.each do |idx|
    vertex_arr << value[idx]
  end

  min = vertex_arr.min
  value.find_index(min)
end

def dijkstra(graph, source, destination)
  # Initialize arrays to keep information about nodes
  # Note: It only work with sequential arrays
  porcessed = []
  parent = []
  value = []

  graph.length.times do |vertex|
    value[vertex] = INFINITY
    porcessed << false
    parent << -1
  end          

  # Start node has value=0 to get picked 1st
  value[source] = 0

  graph.length.times do |i|

    # Select the best vertex by applying greedy method
    u = select_min_vertex(value, porcessed)

    # Mark it as precessed
    porcessed[u] = true
    
    graph.length.times do |i|
      # Relaxation - updating the cost of the vertex if new path has a lower cost to it
      unless graph[u][i].nil?

        cost = graph[u][i][1]
        vertex = graph[u][i][0]

        if value[u] + cost < value[vertex]
          value[vertex] = value[u] + cost
          parent[vertex] = u
        end
      end
    end
  end

  # Find the parent nodes
  def trace_parent(parent, destination, trace = [])
    if destination == 0
      trace << destination
      return trace.reverse
    else
      trace << destination
      destination = parent[destination]
      trace_parent(parent, destination, trace)
    end
  end
  
  def print_result(parent_nodes, expense, source, destination)
    puts "\nCheapest journey from #{CITIES[source]} to #{CITIES[destination]}:"
    puts "\n  Total number of cities: #{parent_nodes.length}"
    puts "  Total cost: $#{expense}\n "
    parent_nodes.each_with_index { |node, index| puts "  #{index+1} > #{CITIES[node]}" }
  end
  
  expense = value[destination]
  parent_nodes = trace_parent(parent, destination)

  print_result(parent_nodes, expense, source, destination)
end           


# -------------------------------------


# Add city names in sequential order
CITIES = ["Memphis", "Neworelans", "Mobile", "Atlanta", "Nashvile", "Savannah"]

# Create the graph by adding edges
add_edge(adacency, 0, 1, 3)
add_edge(adacency, 0, 2, 7)
add_edge(adacency, 0, 3, 10)
add_edge(adacency, 0, 4, 15)
add_edge(adacency, 1, 2, 3)
add_edge(adacency, 3, 4, 1)
add_edge(adacency, 2, 3, 2)
add_edge(adacency, 5, 2, 6)
adacency_list = add_edge(adacency, 5, 3, 1)

print_graph(adacency_list, vertices)

dijkstra(adacency_list, 0, 5)
