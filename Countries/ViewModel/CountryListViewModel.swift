//
//  File.swift
//  Countries
//
//  Created by karl on 10/6/25.
//

import Combine
import Observation
import Foundation

@Observable
class CountryListViewModel {
    var countries: [Country] = []
    var isLoading = false
    var errorMessage: String?
    
    private let dataSource: CountryDataSource
    private var cancellables = Set<AnyCancellable>()
    
    init(dataSource: CountryDataSource) {
        self.dataSource = dataSource
    }
    
    func loadCountries() {
        isLoading = true
        errorMessage = nil
        
        dataSource.fetchCountries()
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = "Failed to load countries: \(error.localizedDescription)"
                }
            } receiveValue: { [weak self] countries in
                self?.countries = countries
            }
            .store(in: &cancellables)
    }
}
