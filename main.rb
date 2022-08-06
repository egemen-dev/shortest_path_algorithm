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

vertices.times do
  adacency << []
end

add_edge(adacency, 0, 1, 3)
add_edge(adacency, 0, 2, 7)
add_edge(adacency, 0, 3, 10)
add_edge(adacency, 0, 4, 15)
add_edge(adacency, 1, 2, 3)
add_edge(adacency, 3, 4, 1)
add_edge(adacency, 2, 3, 2)
add_edge(adacency, 2, 5, 6)
p adacency_list = add_edge(adacency, 3, 5, 1)

print_graph(adacency, vertices)






