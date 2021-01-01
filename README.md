# Zig-Heap
Minimum and Maximum heaps implemented in Zig

There are four functions:

heapBuild builds a min or max heap from an arraylist. It takes an arraylist, it's length, and a boolean where true = max heap and false = min heap.

heapInsert appends an item to the back of the heap, and then rebuilds the heap. It takes the arraylist, item, and the same boolean.

heapGetRoot non-destructively returns the root, and only requires the arraylist as an argument.

heapPopRoot destructively returnd the root, and requires the a pointer to the arraylist, and the max/min boolean. 
