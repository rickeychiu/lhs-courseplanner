//
//  CoursePlannerViewModel.swift
//  CoursePlanner
//
//  Created by Rickey Chiu on 5/29/23.
//

import SwiftUI

class CoursePlannerViewModel: ObservableObject {
    let idToCourse: [String: Course] = [
        //WL
        "4010P": Course(name: "Japanese 1", id: "4010P", description: "", recommended: [], department: Department.worldlanguage, type: CourseType.standard),
        "4020P": Course(name: "Japanese 2", id: "4020P", description: "", recommended: ["4010P"], department: Department.worldlanguage, type: CourseType.standard),
        
        //MATH
        "2210P": Course(name: "Algebra 1", id: "2210P", description: "", recommended: [], department: Department.math, type: CourseType.standard),
        "2230P": Course(name: "Geometry", id: "2230P", description: "", recommended: [], department: Department.math, type: CourseType.standard),
        "2310P": Course(name: "Algebra 2", id: "2310P", description: "", recommended: ["2210P"], department: Department.math, type: CourseType.standard)
    ]
}

let exampleDictionary: [String: String] = [:]
let exampleDictionary2: [String: String] = [
    "happy" : "feet",
    "ugly" : "bunny"
]

enum CourseType {
    case standard
    case honors
    case ap
}

enum Department {
    case english
    case socialstudies
    case physicaleducation
    case worldlanguage
    case math
}

class Course: Identifiable {
    let name: String
    let id: String
    let description: String
    let recommended: [String]
    let department: Department
    let type: CourseType
    
    init(name: String, id: String, description: String, recommended: [String], department: Department, type: CourseType) {
        self.name = name
        self.id = id
        self.description = description
        self.recommended = recommended
        self.department = department
        self.type = type
    }
    
    
}
