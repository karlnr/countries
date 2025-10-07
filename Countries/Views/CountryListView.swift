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
        NavigationStack {
            List(viewModel.countries) { country in
                CountryRowView(country: country)
            }
            .navigationTitle("Countries")
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
            .alert(errorMessage, isPresented: isErrorPresented, actions: dismissErrorButton)
            .refreshable(action: viewModel.loadCountries)
            .onAppear(perform: viewModel.loadCountries)
        }
    }
}

// MARK: - Alert

extension CountryListView {
    private var errorMessage: String {
        viewModel.errorMessage ?? defaultErrorMessage
    }
    
    private func dismissErrorButton() -> some View {
        Button("Dismiss") {
            viewModel.errorMessage = nil
        }
    }
    
    private var isErrorPresented: Binding<Bool> {
        Binding(
            get: { viewModel.errorMessage != nil },
            set: { if !$0 { viewModel.errorMessage = nil } }
        )
    }
}

// MARK: - Preview

#Preview {
    let mockDataSource = MockCountryDataSource()
    let mockViewModel = CountryListViewModel(dataSource: mockDataSource)
    CountryListView(viewModel: mockViewModel)
}
