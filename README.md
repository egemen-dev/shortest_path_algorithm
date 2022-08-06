# Shortest Path Algorithm

I had practiced BFS algorithm with the [Binary Tree](https://github.com/egemen-github/binary_search_trees) and [Knight Travails](https://github.com/egemen-github/knights_travails) projects before. However, those graph projects were not involving weighted edges.

This project is all about weighted edges (e.g., vertices are not equally distanced, or cost of reaching the next node varies) which also means it's way more challenging. 

I am trying to come up with a solution right now.

Edit 1: I was able to come up with a logic but stil far away from the solution. I was thinking of using the objects in this project and I might be taking the wrong approach as I'm just using arrays.

Output I get now:

```
 Memphis makes an edge with
  * Neworelans with a cost of: $3
  * Mobile with a cost of: $7
  * Atlanta with a cost of: $10
  * Nashvile with a cost of: $15

 Neworelans makes an edge with
  * Memphis with a cost of: $3
  * Mobile with a cost of: $3

 Mobile makes an edge with
  * Memphis with a cost of: $7
  * Neworelans with a cost of: $3
  * Atlanta with a cost of: $2
  * Savannah with a cost of: $6

 Atlanta makes an edge with
  * Memphis with a cost of: $10
  * Nashvile with a cost of: $1
  * Mobile with a cost of: $2
  * Savannah with a cost of: $1

 Nashvile makes an edge with
  * Memphis with a cost of: $15
  * Atlanta with a cost of: $1

 Savannah makes an edge with
  * Mobile with a cost of: $6
  * Atlanta with a cost of: $1 
````