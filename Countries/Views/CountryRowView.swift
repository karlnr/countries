//
//  CountryRowView.swift
//  Countries
//
//  Created by karl on 10/6/25.
//

import SwiftUI

struct CountryRowView: View {
    let country: Country

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(country.name), \(country.region)")
                Spacer()
                Text(country.code)
            }
            Text(country.capital)
        }
        .padding()
    }
}

#Preview {
    let mockCountry = Country(
        name: "United States",
        region:"NA",
        code: "US",
        capital: "Washington, D.C."
    )
    CountryRowView(country: mockCountry)
}
