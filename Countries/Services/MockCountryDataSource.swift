//
//  MockCountryDataSource.swift
//  Countries
//
//  Created by karl on 10/5/25.
//
import Foundation

struct MockCountryDataSource: CountryDataSource {
    private func loadLocalData() throws -> Data {
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            fatalError("countries.json not found in bundle")
        }
        return try Data(contentsOf: url)
    }
    
    func fetchCountries() -> [Country] {
        do {
            let data = try loadLocalData()
            return try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print("Error in mock \(#function): \(error)")
            return []
        }
    }
}
