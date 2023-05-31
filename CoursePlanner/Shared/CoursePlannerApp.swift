//
//  CoursePlannerApp.swift
//  Shared
//
//  Created by Rickey Chiu on 5/29/23.
//

import SwiftUI

@main
struct CoursePlannerApp: App {
    @ObservedObject var viewModel = CoursePlannerViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
