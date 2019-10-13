//
//  ViewController.swift
//  StudyCodilityLessons
//
//  Created by Yuan Zhou on 2019/10/13.
//  Copyright © 2019 Genmis.Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // simple test
//        var A = [3, 4, 3, 4, 5, 66, 10000, 7788, 5, 66, 7788]
//        var A = [2, 3, 4, 3, 4, 5, 66, 7788, 5, 66, 7788]
//        var A = [3, 4, 66, 66, 66, 3, 4, 5, 66, 7788, 5, 66, 7788, 7788, 10000]
//        var A = [42]
//        print(solutionForLesson201(&A))
        
//        var A = [3, 1, 2, 4, 3]
        var A = [-1000, 1000]
        print(solutionForLesson303(&A))
    }
}

// MARK: - Lesson 3: Time Complexity

extension ViewController {
    
    // MARK: TapeEquilibrium
    func solutionForLesson303(_ A: inout [Int]) -> Int {
        let sum = A.reduce(0, +)
        var answer = Int.max
        var sum1 = 0
        for (index, _) in A.enumerated() {
            
            // do not calculate based on the last element
            if index == A.count - 1 {
                continue
            }
            
            sum1 += A[index]
            let sum2 = sum - sum1
            let diff = abs(sum1 - sum2)
            if diff < answer {
                answer = diff
            }
        }
        
        return answer
    }
    
    // MARK: PermMissingElem
    func solutionForLesson302(_ A: inout [Int]) -> Int {
        if A.isEmpty { return 1 }
        
        let array = A.sorted()
        for (index, number) in array.enumerated() {
            if index == 0 && number != 1 {
                return 1
            } else if index == array.count - 1 && number != array.count + 1 {
                return array.count + 1
            } else {
                if array[index + 1] - number > 1 {
                    return number + 1
                }
            }
        }
        
        return 0
    }
    
    // MARK: FrogImp
    func solutionForLesson301(_ X: Int, _ Y: Int, _ D: Int) -> Int {
        return Int(ceil(Double(Y - X) / Double(D)))
    }
}

// MARK: - Lesson 2: Arrays

extension ViewController {
    
    // MARK: CyclicRotation
    func solutionForLesson202(_ A: inout [Int], _ K: Int) -> [Int] {
        if A.isEmpty { return A }
        let shiftK = K % A.count
        let array1 = Array(A[(A.count - shiftK)..<A.count])
        let array2 = Array(A[0..<(A.count - shiftK)])
        return array1 + array2
    }
    
    // MARK: OddOccurrencesInArray
    func solutionForLesson201(_ A: inout [Int]) -> Int {
        
        // submit 4: score 55
        /*
        var B = [Int]()
        
        while A.count > 0 {
            let num = A.remove(at: 0)
            
            if A.contains(num) {
                if !B.contains(num) {
                    B.append(num)
                }
                continue
            } else {
                if B.contains(num) {
                    continue
                } else {
                    return num
                }
            }
        }
        return 0
         */
        
        // submit 3: score 66
        if A.count == 1 {
            return A.first!
        }
        
        let array = A.sorted()
        print(array)
        for (index, number) in array.enumerated() {
            if index == 0 {
                if number != array[index + 1] {
                    return number
                }
            } else if index == array.count - 1 {
                return number
            } else {
                if number != array[index + 1] && number != array[index - 1] {
                    return number
                }
            }
        }
        return 0
        
        // submit 2
        /*
        for number in A {
            if A.firstIndex(of: number) != A.lastIndex(of: number) {
                A.removeAll { (value) -> Bool in
                    value == number
                }
            }
        }
        
        return A.first!
         */
        
        // submit 1
        /*
        var dictionary = [Int: Int]()
        for (index, value) in A.enumerated() {
            dictionary[index] = value
        }
        
        for (index, number) in A.enumerated() {
            let pair = dictionary.first { (key, value) -> Bool in
                (value == number) && (key != index)
            }
            if pair != nil {
                continue
            } else {
                return number
            }
        }
        
        return 0
         */
    }
}

// MARK: - Lesson 1: Iterations

extension ViewController {
    
    // MARK: BinaryGap
    func solutionFor101(_ N: Int) -> Int {
        var answer = 0
        var temp = 0
        
        let array = Array(String(N, radix: 2))
        for char in array {
            if char == "0" {
                temp += 1
            } else if char == "1" {
                if answer < temp {
                    answer = temp
                }
                temp = 0
            }
        }
        
        return answer
    }
}

