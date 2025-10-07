//
//  MockCountryDataSource.swift
//  Countries
//
//  Created by karl on 10/5/25.
//

import Combine
import Foundation

struct MockCountryDataSource: CountryDataSource {
    private func loadLocalData() throws -> Data {
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            fatalError("countries.json not found in bundle")
        }
        return try Data(contentsOf: url)
    }
    
    /// Fetches countries from local JSON bundle.
    func fetchCountries() -> AnyPublisher<[Country], Error> {
        Result { try loadLocalData() }
            .publisher
            .decode(type: [Country].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
