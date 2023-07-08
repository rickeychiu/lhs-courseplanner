//
//  CoursePlannerDocument.swift
//  CoursePlanner
//
//  Created by Rickey Chiu on 6/3/23.
//

import SwiftUI
import UniformTypeIdentifiers

//extension UTType {
//    static var exampleText: UTType {
//        UTType(importedAs: "com.example.plain-text")
//    }
//}

struct CoursePlannerDocument: FileDocument {
    var schedule: Schedule

    init(schedule: Schedule = Schedule()) {
        self.schedule = schedule
    }

    static var readableContentTypes: [UTType] { [.json] }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let schedule = try? JSONDecoder().decode(Schedule.self, from: data)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        
        self.schedule = schedule
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        print("[ERIC] encoding")
        let data = try JSONEncoder().encode(schedule)
        print("[ERIC] \(data)")
        return .init(regularFileWithContents: data)
    }
}
