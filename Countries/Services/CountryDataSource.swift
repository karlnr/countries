//
//  CountryDataSource.swift
//  Countries
//
//  Created by karl on 10/5/25.
//

protocol CountryDataSource {
    func fetchCountries() -> [Country]
}
