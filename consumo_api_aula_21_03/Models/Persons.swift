//
//  Persons.swift
//  consumo_api_aula_21_03
//
//  Created by Victor Pizetta on 21/03/22.
//

import UIKit

struct Persons: Codable {
    
    let id: Int
    let name: String
    let photo: String
    let company: Company
    
}

struct Company: Codable {
    let name: String
}

