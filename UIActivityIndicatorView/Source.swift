//
//  Source.swift
//  UIActivityIndicatorView
//
//  Created by Damir Chalkarov on 28.07.2022.
//

import Foundation

struct Source {
    static private let tasks = [
    "сходить на Stand Up",
    "сходить на выстаку",
    "сходить в кино",
    "сходить на квест",
    "завалиться смотреть сериал"]
    
    static func getTask() -> String? {
        tasks.randomElement()
    }
    
}
