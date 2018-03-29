//: Playground - noun: a place where people can play
//Solution for chanllenges https://www.hackerrank.com/challenges/reduced-string/problem
/*
 
 Steve has a string, , consisting of  lowercase English alphabetic letters. In one operation, he can delete any pair of adjacent letters with same value. For example, string "aabcc" would become either "aab" or "bcc" after operation.
 
 Steve wants to reduce  as much as possible. To do this, he will repeat the above operation as many times as it can be performed. Help Steve out by finding and printing 's non-reducible form!
 
 Note: If the final string is empty, print Empty String .
 
 Input Format
 
 A single string, .
 
 Constraints
 
 
 Output Format
 
 If the final string is empty, print Empty String; otherwise, print the final non-reducible string.
 
 Sample Input 0
 
 aaabccddd
 Sample Output 0
 
 abd
 Explanation 0
 
 Steve can perform the following sequence of operations to get the final string:
 
 aaabccddd → abccddd
 abccddd → abddd
 abddd → abd
 Thus, we print abd.
 
 Sample Input 1
 
 baab
 Sample Output 1
 
 Empty String
 Explanation 1
 
 Steve can perform the following sequence of operations to get the final string:
 
 baab → bb
 bb → Empty String
 Thus, we print Empty String.
 
 Sample Input 2
 
 aa
 Sample Output 2
 
 Empty String
 Explanation 2
 
 Steve can perform the following sequence of operations to get the final string:
 
 aa → Empty String
 Thus, we print Empty String.
 
 */

import UIKit

var stevenString = "aaabccddd"
var end = false
while (!end) {
    if stevenString.isEmpty {
        end = true
    }
    let array = stevenString.indices[stevenString.startIndex..<stevenString.endIndex]
    for index in array
    {
        if (index < stevenString.index(before: stevenString.endIndex)) {
            let nextIndex = stevenString.index(after: index)
            if stevenString[index] == stevenString[nextIndex] {
                stevenString.remove(at: nextIndex)
                stevenString.remove(at: index)
                break
            }
        }
        else {
            end = true
        }
    }
}
if stevenString.isEmpty {
    print("Empty String")
}
else {
    print(stevenString)
}
