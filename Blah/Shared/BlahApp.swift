//
//  BlahApp.swift
//  Shared
//
//  Created by Rickey Chiu on 6/3/23.
//

import SwiftUI

@main
struct BlahApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: BlahDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
