//
//  NetworkCountryDataSource.swift
//  Countries
//
//  Created by karl on 10/6/25.
//

import Combine
import Foundation

struct NetworkCountryDataSource: CountryDataSource {
    private let remoteURL = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
    
    func fetchCountries() -> AnyPublisher<[Country], any Error> {
        guard let url = URL(string: remoteURL) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Country].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
