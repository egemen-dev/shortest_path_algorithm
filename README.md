# Shortest Path Algorithm

I had practiced BFS algorithm with the [Binary Tree](https://github.com/egemen-github/binary_search_trees) and [Knight Travails](https://github.com/egemen-github/knights_travails) projects before. However, those graph projects were not involving weighted edges.

This project is all about weighted edges (e.g., vertices are not equally distanced, or cost of reaching the next node varies) which also means it's way more challenging. 

I am trying to come up with a solution right now.

Edit 1: I was able to come up with a logic but stil far away from the solution. I was thinking of using the objects in this project and I might be taking the wrong approach as I'm just using arrays.

Edit 2: Completed the Dijkstra's algorithm.

## How it works?
* Mark all nodes/vertices unvisited.
* Mark all nodes/vertices with ∞ infinite tdistance except the source node.
* Repeat the following V times:
  1. Select the minimum value node which is the unprocessed/unvisited, initially it's the source node.
  2. Mark selected node as processed (put it in `processed` array).
  3. Update all adjacent vertices.

### How to select the minimum value node which is the unvisited?

1. Check the processed array and get the indexes of `false` values from the array. It means from the indexes of false values we haven't visited those nodes in the graph.
2. Store the indexes in an array in my case `indexes`.
3. Each value in `indexes` array is a representation of the nodes we can find minimum amongst.
4. Find the minimum value.
5. **Most important part**, find the index of the new minimum value from the `value` array.
6. Retrun it.

### How to update adjacent vertices?
If there is a path from `U` --> `V` then `cost[u] + c[u,v] < cost[v]`

### About the implementation
* Because I used arrays to store the necessary information to keep track of the nodes e.g., *current minimum value from the source*, and *parent of the visited node*, this only works with **sequential labels** (0 to N).
* In the example below where node Memphis is labeled with 0, New Orleans with 1 and there is a connection at the cost of $3.
* In the code it has to be like this `CITIES = ["Memphis", "Neworelans", "Mobile", "Atlanta", "Nashvile", "Savannah"]`
* To store the edge between Memphis and New Orleans, `add_edge(adacency, 0, 1, 3)`
* This algorithm works for where the soruce node Memphis at the index of '0'. Finds the shortest path from Memphis to anywhere.
* If you want to find the shortest path from for example Atlanta, you have to relabel the graph and make Atlanta the source node at the index of '0'.

<p align="center">
  <img width="440" height="430" src="https://user-images.githubusercontent.com/93445248/183308795-34f995bb-c662-4561-9051-30605fa534ae.jpg">
</p>

After the creation of the graph -> `dijkstra(adacency_list, 0, 5)`

Printed Output:

```
 Memphis makes an edge with
  * Memphis with a cost of: $0
  * Neworelans with a cost of: $3
  * Mobile with a cost of: $7
  * Atlanta with a cost of: $10
  * Nashvile with a cost of: $15

 Neworelans makes an edge with
  * Neworelans with a cost of: $0
  * Memphis with a cost of: $3
  * Mobile with a cost of: $3

 Mobile makes an edge with
  * Mobile with a cost of: $0
  * Memphis with a cost of: $7
  * Neworelans with a cost of: $3
  * Atlanta with a cost of: $2
  * Savannah with a cost of: $6

 Atlanta makes an edge with
  * Atlanta with a cost of: $0
  * Memphis with a cost of: $10
  * Nashvile with a cost of: $1
  * Mobile with a cost of: $2
  * Savannah with a cost of: $1

 Nashvile makes an edge with
  * Nashvile with a cost of: $0
  * Memphis with a cost of: $15
  * Atlanta with a cost of: $1

 Savannah makes an edge with
  * Savannah with a cost of: $0
  * Mobile with a cost of: $6
  * Atlanta with a cost of: $1

Cheapest journey from Memphis to Savannah:

  Total number of cities: 5
  Total cost: $9
 
  1 > Memphis
  2 > Neworelans
  3 > Mobile
  4 > Atlanta
  5 > Savannah
````
