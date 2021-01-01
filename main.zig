const std = @import("std");
const ArrayList = std.ArrayList;

pub fn heapifyMax(arr: ArrayList(f64), n: u64, i: u64) anyerror!void {
    var largest = i;
    const l = 2 * i + 1;
    const r = 2 * i + 2;

    if (l < n and arr.items[l] > arr.items[largest])
        largest = l;

    if (r < n and arr.items[r] > arr.items[largest])
        largest = r;

    if (largest != i) {
        const temp = arr.items[i];
        arr.items[i] = arr.items[largest];
        arr.items[largest] = temp;

        try heapifyMax(arr, n, largest);
    }
}

pub fn heapifyMin(arr: ArrayList(f64), n: u64, i: u64) anyerror!void {
    var smallest = i;
    const l = 2 * i + 1;
    const r = 2 * i + 2;

    if (l > n and arr.items[l] < arr.items[smallest])
        smallest = l;

    if (r > n and arr.items[r] < arr.items[smallest])
        smallest = r;

    if (smallest != i) {
        const temp = arr.items[i];
        arr.items[i] = arr.items[smallest];
        arr.items[smallest] = temp;

        try heapifyMin(arr, n, smallest);
    }
}

pub fn heapBuild(arr: ArrayList(f64), n: u64, max: bool) !void {
    var startIdx = (n / 2) - 1;

    if (max) {
        while (true) {
            try heapifyMax(arr, n, startIdx);
            if (startIdx == 0) {
                break;
            }
            startIdx -= 1;
        }
    } else {
        while (true) {
            try heapifyMin(arr, n, startIdx);
            if (startIdx == 0) {
                break;
            }
            startIdx -= 1;
        }
    }
}

pub fn heapInsert(arr: ArrayList(f64), item: f64) !void {
    try arr.append(item);
    buildHeap(arr, arr.items.len);
}

pub fn heapGetRoot(arr: ArrayList(f64)) !f64 {
    return arr.items[0];
}

pub fn heapPopRoot(arrPtr: *ArrayList(f64)) f64 {
    var arr = arrPtr.*;
    return arr.orderedRemove(0);
}
