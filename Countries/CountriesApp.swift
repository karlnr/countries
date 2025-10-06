//
//  CountriesApp.swift
//  Countries
//
//  Created by karl on 10/4/25.
//

import SwiftUI

@main
struct CountriesApp: App {
    var body: some Scene {
        @State var viewModel = CountryListViewModel(dataSource: NetworkCountryDataSource())
        
        WindowGroup {
            CountryListView(viewModel: viewModel)
        }
    }
}
