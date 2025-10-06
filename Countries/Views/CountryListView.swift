//
//  CountryListView.swift
//  Countries
//
//  Created by karl on 10/4/25.
//

import SwiftUI

struct CountryListView: View {
    var countries: [Country] = []
    
    var body: some View {
        List(countries) { country in
            Text(country.code)
        }
        .padding()
    }
}

#Preview {
    let mockDataSource = MockCountryDataSource()
    let mockCountries = mockDataSource.fetchCountries()
    Text("count: \(mockCountries.count)")
    CountryListView(countries: mockCountries)
}
