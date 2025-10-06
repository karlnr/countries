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
            Text(country.code)
        }
        .padding()
        .overlay {
            if viewModel.isLoading {
                ProgressView()
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
