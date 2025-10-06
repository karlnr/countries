//
//  CountryListView.swift
//  Countries
//
//  Created by karl on 10/4/25.
//

import SwiftUI

struct CountryListView: View {
    let viewModel: CountryListViewModel
    
    var body: some View {
        List(viewModel.countries) { country in
            CountryRowView(country: country)
        }
        .padding()
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert(viewModel.errorMessage ?? "Unknown Error", isPresented: Binding(
            get: { viewModel.errorMessage != nil },
            set: { if !$0 { viewModel.errorMessage = nil } }
        )) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
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
