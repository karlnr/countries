//
//  Country.swift
//  Countries
//
//  Created by karl on 10/5/25.
//

struct Country: Codable, Identifiable {
    let name: String
    let region: String
    let code: String
    let capital: String
    
    /// Two-letter country code as unique identifier
    var id: String { code }
}
