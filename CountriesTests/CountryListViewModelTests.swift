//
//  CountriesTests.swift
//  CountriesTests
//
//  Created by karl on 10/4/25.
//

import Combine
import Testing
@testable import Countries
import Foundation

@Suite("CountryListViewModel Tests")
struct CountryListViewModelTests {
    
    // MARK: - Success Cases
    
    @Test("Load countries successfully")
    @MainActor
    func loadCountriesSuccess() async throws {
        let mockDataSource = MockCountryDataSource()
        let mockViewModel = CountryListViewModel(dataSource: mockDataSource)
        
        mockViewModel.loadCountries()
        
        try await Task.sleep(for: .milliseconds(100))
        
        #expect(mockViewModel.countries.count > 0)
        #expect(mockViewModel.errorMessage == nil)
        #expect(mockViewModel.isLoading == false)
    }
    
    @Test("Countries preserve JSON order")
    @MainActor
    func countriesOrderPreserved() async throws {
        let mockDataSource = MockCountryDataSource()
        let viewModel = CountryListViewModel(dataSource: mockDataSource)
        
        viewModel.loadCountries()
        try await Task.sleep(for: .milliseconds(100))
        
        // Verify first country matches expected from your JSON
        #expect(viewModel.countries.first?.code == "AF")
        #expect(viewModel.countries.last?.code == "ZW")
    }
    
    @Test("Loading state is true during fetch")
    @MainActor
    func loadingStateDuringFetch() {
        let mockDataSource = MockCountryDataSource()
        let viewModel = CountryListViewModel(dataSource: mockDataSource)
        
        viewModel.loadCountries()
        
        // Immediately after calling, should be loading
        #expect(viewModel.isLoading == true)
    }
    
    @Test("Loading state clears after success")
    @MainActor
    func loadingStateClearsAfterSuccess() async throws {
        let mockDataSource = MockCountryDataSource()
        let viewModel = CountryListViewModel(dataSource: mockDataSource)
        
        viewModel.loadCountries()
        try await Task.sleep(for: .milliseconds(100))
        
        #expect(viewModel.isLoading == false)
    }
    
    // MARK: - Error Handling
    
    @Test("Handle network error gracefully")
    @MainActor
    func handleNetworkError() async throws {
        let errorDataSource = ErrorMockDataSource()
        let viewModel = CountryListViewModel(dataSource: errorDataSource)
        
        viewModel.loadCountries()
        try await Task.sleep(for: .milliseconds(100))
        
        #expect(viewModel.countries.isEmpty)
        #expect(viewModel.errorMessage != nil)
        #expect(viewModel.isLoading == false)
    }
    
    // MARK: - Edge Cases
    
    @Test("Handle empty country list")
    @MainActor
    func handleEmptyCountryList() async throws {
        let emptyDataSource = EmptyMockDataSource()
        let viewModel = CountryListViewModel(dataSource: emptyDataSource)
        
        viewModel.loadCountries()
        try await Task.sleep(for: .milliseconds(100))
        
        #expect(viewModel.countries.isEmpty)
        #expect(viewModel.errorMessage == nil)
    }
}

// MARK: - Test Helpers

struct ErrorMockDataSource: CountryDataSource {
    func fetchCountries() -> AnyPublisher<[Country], any Error> {
        return Fail(error: URLError(.badURL))
            .eraseToAnyPublisher()
    }
}

struct EmptyMockDataSource: CountryDataSource {
    func fetchCountries() -> AnyPublisher<[Country], any Error> {
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
