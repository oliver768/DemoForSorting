//
//  ViewController.swift
//  DemoForSorting
//
//  Created by Ravindra Sonkar on 06/07/19.
//  Copyright © 2019 Ravindra Sonkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arr : [Int?] = [49,30,7,77]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mergeSort(l: 0, r: arr.count - 1)
//        mergeSort(array: &arr)
//        let x = arr.sort { (a, b) -> Bool in
//            return a > b
//        }
        var r = arr.compactMap { $0}
//        var y = arr.reduce(0) { $1 + $0}
        print(r)
    }
    
    
    
    func merge<T: Comparable> (array: inout [T], startIndex: Int, middleIndex: Int, endIndex: Int) {
        let leftSubarray = Array(array[startIndex...middleIndex])
        let rightSubarray = Array(array[middleIndex+1...endIndex])
        
        var index = startIndex
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
            if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
                array[index] = leftSubarray[leftIndex]
                leftIndex += 1
            }
            else {
                array[index] = rightSubarray[rightIndex]
                rightIndex += 1
            }
            index += 1
        }
        
        while leftIndex < leftSubarray.count {
            array[index] = leftSubarray[leftIndex]
            index += 1
            leftIndex += 1
        }
        
        while rightIndex < rightSubarray.count {
            array[index] = rightSubarray[rightIndex]
            index += 1
            rightIndex += 1
        }
        print(array)
    }
    
    func mergeSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
        // Base case
        if startIndex >= endIndex {
            return
        }
        
        let middleIndex = (startIndex + endIndex) / 2
        print("nnnnnnn")
        mergeSort(array: &array, startIndex: startIndex, endIndex: middleIndex)
        print("mmmmmm")
        mergeSort(array: &array, startIndex: middleIndex+1, endIndex: endIndex)
        print("vvvvvv")
        merge(array: &array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)
    }
    
    func mergeSort<T: Comparable>(array: inout [T]) {
        mergeSort(array: &array, startIndex: 0, endIndex: array.count-1)
    }

    
//    func mergeSort(l : Int, r : Int) {
//        if l >= r {
//            return
//        }
//        let m = (l + r )/2
//        mergeSort(l: l, r: m)
//        mergeSort(l: (m + 1), r: r)
//        merge(arr: &arr, l: l, r: r, m: m)
//    }
    
    func merge( arr: inout [Int], l : Int, r: Int, m : Int) {
        var temp1 = Array(arr[l...m])
        var temp2 = Array(arr[(m + 1)...r])
        
        var i, j, k : Int!
        i = 0
        j = 0
        k = l
        while (i < temp1.count && j < temp2.count){
            if (temp1[i] <= temp2[j]){
                arr[k] = temp1[i]
                i = i + 1;
            }else{
                arr[k] = temp2[j]
                j = j + 1;
            }
            k = k + 1;
        }
        
        while i < temp1.count {
            arr[k] = temp1[i]
            i = i + 1
            k = k + 1
        }
        
        while j < temp2.count {
            arr[k] = temp2[j]
            j = j + 1
            k = k + 1
        }
                print(arr)
        //    print(arr1)
    }
    
    
    
    
}

