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
    ///
    /// - Note: Includes a 2-second delay to simulate network latency for testing loading states.
    func fetchCountries() -> AnyPublisher<[Country], Error> {
        Result { try loadLocalData() }
            .publisher
            .delay(for: 2.0, scheduler: DispatchQueue.main)
            .decode(type: [Country].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
