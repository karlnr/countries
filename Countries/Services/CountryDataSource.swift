//
//  CountryDataSource.swift
//  Countries
//
//  Created by karl on 10/5/25.
//

import Combine

protocol CountryDataSource {
    func fetchCountries() -> AnyPublisher<[Country], Error>
}
