//  LinearSearch.swift

//  Created by Val I on 2025-03-03.
//  Version 1.0
//  Copyright (c) 2025 Val I. All rights reserved.

//  This program generates an array of random integers, sorts it in numerical order,
//  and allows the user to search for a number using linear search.
//  The program displays the index of the number if found, or a message if not found.
//  The user can quit the program by entering "q".
//
import Foundation

enum InputError: Error {
    case invalidInput
}

let ARRAYSIZE = 10
var arrayOfInts = Array(repeating: 0, count: ARRAYSIZE)
var search: String

repeat {
    // Populate the array with random numbers using a for loop
    for i in 0..<ARRAYSIZE {
        arrayOfInts[i] = Int.random(in: 1...100)
    }
    // Sort the array
    arrayOfInts.sort()

    // Print the array
    print("Array: \(arrayOfInts)")
    print("Enter a number to search for, or q to quit: ")

    // Get user input
    search = readLine()?.lowercased() ?? ""
    // Check if the user wants to quit
    if search == "q" {
        break
    } else {
        // do catch to make sure they enter a valid number
        do {
            guard let searchInt = Int(search) else {
                throw InputError.invalidInput
            }

            var found = -1

            // Perform linear search
            for i in 0..<arrayOfInts.count {
                if arrayOfInts[i] == searchInt {
                    print("Number found at index: \(i)")
                    found = i
                    break
                }
            }

            // If the number is not found
            if found == -1 {
                print("Number not found in the array.")
            }
        } catch InputError.invalidInput {
            // Handle invalid input
            print("Invalid input. Enter a valid number.")
        }
    }
} while search != "q"

// Print goodbye message
print("Goodbye!")