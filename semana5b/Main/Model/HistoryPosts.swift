//
//  HistoryPosts.swift
//  semana5b
//
//  Created by Linder Hassinger on 15/09/21.
//

import Foundation

// Codable: Permite que mi clase no necesite un constrcutor porque entiende que esta clase es para el consumo de un API
class HistoryPosts: Codable {
    
    // ojo: Los nombre de los atributos de mi clase deben ser iguales a los del modelo de mi API
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
