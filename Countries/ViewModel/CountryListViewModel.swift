//
//  File.swift
//  Countries
//
//  Created by karl on 10/6/25.
//

import Observation

@Observable
class CountryListViewModel {
    var countries: [Country] = []
    var isLoading = false
    var errorMessage: String?
    
    private let dataSource: CountryDataSource
    
    init(dataSource: CountryDataSource) {
        self.dataSource = dataSource
    }
    
    func loadCountries() {
        isLoading = true
        errorMessage = nil
        countries = dataSource.fetchCountries()
        isLoading = false
    }
    
}
