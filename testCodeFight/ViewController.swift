//
//  ViewController.swift
//  testCodeFight
//
//  Created by Trinh Thai on 11/18/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func firstDuplicate(a: [Int]) -> Int {
        var set = Set<Int>() // mang Int() k dc
        
        for i in a {
            print(i)
            print(set)
            if set.contains(i) {
                return i
            }else {
                set.insert(i)
            }
        }
        return -1
       
    }
    
    func firstNotRepeatingCharacter(s: String) -> Character {
        var dict = [Character : Int]()
        var test : Character = "_"
        
        for item in s {
            dict[item] = (dict[item] ?? 0) + 1
        }
        print(dict)
        for item in s {
            if dict[item] == 1{
                test = item
                break
            }
        }
        
        return test
    }

    func rotateImage(a: [[Int]]) -> [[Int]] {
        var b = a
        
        let n = a.count // matrix size
        
        for i in 0..<n / 2 {         // iterate the first row

            print("i \(i)")
            //itera
            for j in i..<n-1-i {
                let array = a[i][j]
               b[i][j] = b[n-1-j][i]
                b[n-1-j][i] = b[n-1-i][n-1-j]
                b[n-1-i][n-1-j] = b[j][n-1-i]
                b[j][n-1-i] = array
                print("j \(j)")
            }
        }
        return b
    }
    
    func rotate(_ matrix: inout [[Int]]) -> [[Int]]{
        var ar = [[Int]]()
        for j in 0..<matrix.count {
            var tempAr = [Int]()
            for i in (0..<matrix.count).reversed(){
                print(i)

                let element = matrix[i][j]
                tempAr.append(element)
            }
            print(tempAr)
            ar.append(tempAr)
        }
        matrix = ar
        return matrix
    }
    
    
    func removeKFromList(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
        let node = ListNode<Int>(0)
        node.next = l
        
        var p = node
        
        while let next = p.next {
            if (p.next?.value == k) {
                p.next = next.next
            } else {
                p = next
            }
            
        }
        return node.next
    }
    
    func groupingDishes(dishes: [[String]]) -> [[String]] {
        var ingredientDictionary: [String: [String]] = [:]
        var resultArray: [[String]] = []
        dishes.map { value in //moi value la 1 array [String]
            value[1...].map {//bo phan tu dau la mon an ra
                if ingredientDictionary[$0] != nil {
                    print(value)
                    print([value.first!])

                }
                ingredientDictionary[$0] = ingredientDictionary[$0] != nil ? ingredientDictionary[$0]! + [value.first!] : [value.first!]
            }
        }
        //ingredientDictionary bay gio la key chua ten thanh phan, value chua mon an
        let newDictionary = ingredientDictionary.filter {
            $0.value.count > 1
            }.mapValues {
                $0.sorted()
        }
        newDictionary.keys.sorted(){ $0.compare($1) == .orderedAscending }.map {
            resultArray.append([$0] + newDictionary[$0]!)
        }
        return resultArray
    }
    
    func decodeString(s: String) -> String {
        guard s.characters.count > 0 else { return "" }
        var array = Array(s.characters)
        var stack = [Character]()
        for i in 0 ..< array.count {
            let current = array[i]
            if current != "]" {
                stack.append(current)
            } else {
                var temp = [Character]()
                while stack.count > 0 && stack.last! != "[" {
                    temp.insert(stack.removeLast(), at: 0)
                }
                stack.removeLast()
                var num = ""
                while stack.count > 0 && (stack.last! >= "0" && stack.last! <= "9") {
                    num = String(stack.removeLast()) + num
                }
                for _ in 0 ..< Int(num)! {
                    stack.append(contentsOf: temp)
                }
            }
        }
        return String(stack)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ///bai1
//        var a = [2, 1, 3, 5, 3, 2]
//        print(firstDuplicate(a: a))
        
        ///bai2
//        var s = "abacabad"
//        print(firstNotRepeatingCharacter(s: s))
        
        ///bai3
//        var matrix =
//            [[1, 2, 3],
//             [4, 5, 6],
//             [7, 8, 9]]
//
//
//        print(rotateImage(a: matrix))
//        var matrix = [
//            [1,2,3],
//            [4,5,6],
//            [7,8,9]
//        ]
//        print(rotate(&matrix))
        
//        var node1 = ListNode<Int>(3)
//        var node2 = ListNode<Int>(1)
//        var node3 = ListNode<Int>(2)
//        var node4 = ListNode<Int>(3)
//        var node5 = ListNode<Int>(4)
//        var node6 = ListNode<Int>(5)
//
//        node1.next = node2
//        node2.next = node3
//        node3.next = node4
//        node4.next = node5
//        node5.next = node6
//
//        let r = removeKFromList(l: node1, k: 3)
//        r?.value
        
        
        print(groupingDishes(dishes: [["Pasta", "Tomato Sauce", "Onions", "Garlic"],
                                      ["Chicken Curry", "Chicken", "Curry Sauce"],
                                      ["Fried Rice", "Rice", "Onions", "Nuts"],
                                      ["Salad", "Spinach", "Nuts"],
                                      ["Sandwich", "Cheese", "Bread"],
                                      ["Quesadilla", "Chicken", "Cheese"]]))
    }

}
public class ListNode<T> {
    public var value: T
    public var next: ListNode<T>?
    public init(_ x: T) {
        self.value = x
        self.next = nil
    }
}


