//
//  CoursePlannerApp.swift
//  Shared
//
//  Created by Rickey Chiu on 7/19/23.
//

import SwiftUI

@main
struct CoursePlannerApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: CoursePlannerDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
