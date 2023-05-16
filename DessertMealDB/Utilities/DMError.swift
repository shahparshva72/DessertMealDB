//
//  DMError.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/11/23.
//

import Foundation

enum DMError: String, Error {
    case badURL = "invalid URL Error"
    case responseError = "Connection to server failed"
    case decodeError = "Decoding Error."
}
