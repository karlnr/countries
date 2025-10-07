//
//  CountryListView.swift
//  Countries
//
//  Created by karl on 10/4/25.
//

import SwiftUI

struct CountryListView: View {
    let viewModel: CountryListViewModel
    private let defaultErrorMessage = "An error occurred. Please try again."
    
    var body: some View {
        List(viewModel.countries) { country in
            CountryRowView(country: country)
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            } else if viewModel.countries.isEmpty {
                ContentUnavailableView(
                    "Unable to Load Countries",
                    systemImage: "exclamationmark.triangle",
                    description: Text("Pull to refresh")
                )
            }
        }
        .alert(viewModel.errorMessage ?? defaultErrorMessage, isPresented: Binding(
            get: { viewModel.errorMessage != nil },
            set: { if !$0 { viewModel.errorMessage = nil } }
        )) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        }
        .refreshable {
            viewModel.loadCountries()
        }
        .onAppear {
            viewModel.loadCountries()
        }
    }
}

#Preview {
    let mockDataSource = MockCountryDataSource()
    let mockViewModel = CountryListViewModel(dataSource: mockDataSource)
    CountryListView(viewModel: mockViewModel)
}
