## Travelling Salesman Problem
Given a list of cities and pair of distance between cities, what is the shortest possible route one can take in order to vist a ciy once and return back to the original city? 

This is a project done in university for the module CN4238R - Chemical and Biochemical Process Modelling. In this project, my team explore the possibility of optimizing bus routes in the university so the total distance a bus has to cover is minimzed, thus (hopefully) improving the efficiency of the bus system.

## How to read the output
The output from this script will return the total distance that is covered as well as a pair of start and end locations. If you use the distance matrix M as defined in the code, the output will be:
```markdown
1   4
2   7
3   6
4   3
5   1
6   2
7   5
```
Starting from location 1, the next place to go would be location 4. From location 4, the next place would be location 3. The route the bus would take is 1 > 4 > 3 > 6 > 2 > 7 > 5 > 1.
