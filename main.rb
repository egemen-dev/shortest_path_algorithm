INFINITY = 999_999_999

# To add an edge
def add_edge(adacency, u, v, weight)
  adacency[u].<<([v, weight])
  adacency[v].<<([u, weight])
  adacency
end

def print_graph(adacency, vertices)

  cities = ["Memphis", "Neworelans", "Mobile", "Atlanta", "Nashvile", "Savannah"]

  vertex, weight = 0, 0
  
  vertices.times do |u|
    puts "\n #{cities[u]} makes an edge with"

    adacency[u].length.times do |iter|
      vertex = adacency[u][iter][0]
      weight = adacency[u][iter][1]
      puts "  * #{cities[vertex]} with a cost of: $#{weight}"
    end
  end
end


vertices = 6
adacency = []

itr = 0
vertices.times do
  adacency <<[[itr, 0]]
  itr += 1
end

add_edge(adacency, 0, 1, 3)
add_edge(adacency, 0, 2, 7)
add_edge(adacency, 0, 3, 10)
add_edge(adacency, 0, 4, 15)
add_edge(adacency, 1, 2, 3)
add_edge(adacency, 3, 4, 1)
add_edge(adacency, 2, 3, 2)
add_edge(adacency, 5, 2, 6)
p adacency = add_edge(adacency, 5, 3, 1)

print_graph(adacency, vertices)


adacency.each do |v|
  puts "#{v} \n "
end

def select_min_vertex(value, porcessed)
  indexes = []
  vertex_arr = []
  porcessed.each_with_index do |val, idx|
    indexes << idx if val == false
  end

  indexes.each do |idx|
    p idx
    vertex_arr << value[idx]
  end

  min = vertex_arr.min
  value.find_index(min)
end


def dijkstra(graph, source)
  porcessed = []
  parent = []
  value = []
  
  graph.length.times do |vertex|
    value[vertex] = INFINITY     
    porcessed << false
    parent << -1
  end          

  value[source] = 0

  graph.length.times do |i|
    u = select_min_vertex(value, porcessed)

    puts "min vertex = #{u}"
    porcessed[u] = true
    puts "processed array = #{porcessed}"
    puts "Value array = #{value} \n "
    
    # graph[u].each_with_index do |adj, idx|
    #   puts "\nNode_U (#{u})"
    #   puts "Node_V (#{adj[0]})"
    #   puts "cost (#{adj[1]})"
    #   puts "cost (#{graph[u][idx][1]})"
    #   p adj

    # end
    # puts "TO go node V #{u} "

    graph.length.times do |i|
      puts "u = #{u} v = #{i}"
      puts "d(#{u}) = #{value[u]}"
      puts "c(u,v) = #{cost = graph[u][i][1] unless graph[u][i].nil?}"
      puts "vertex = #{vertex = graph[u][i][0] unless graph[u][i].nil?} | cost= #{cost unless cost.nil?}"
      puts "d(#{vertex}) = #{value[vertex] unless vertex.nil?} \n "

      unless graph[u][i].nil?
        if value[u] + cost < value[vertex]
          value[vertex] = value[u] + graph[u][i][1]
          parent[vertex] = u
          puts " \n --- new d(#{vertex}) = #{value[vertex]} ---\n "
          puts " \n --- parent nodes = #{parent} ---\n "
        end
      end
    end

    p value
    p parent

  end
end           

dijkstra(adacency, 0)
