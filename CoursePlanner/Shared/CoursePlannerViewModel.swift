//
//  CoursePlannerViewModel.swift
//  CoursePlanner
//
//  Created by Rickey Chiu on 5/29/23.
//

import SwiftUI

class CoursePlannerViewModel: ObservableObject {
    let idToCourse: [String: Course] = [
        
        //ENGLISH
        "1010P": Course(name: "Lit & Writing", id: "1010P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [9]),
        "1013P": Course(name: "Lit & Writing (EL)", id: "1013P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [9, 10]),
        "1020P": Course(name: "World Lit", id: "1020P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [10]),
        "1023P": Course(name: "World Lit (EL)", id: "1023P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [10, 11]),
        "1130P": Course(name: "American Lit", id: "1130P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [11]),
        "1133P": Course(name: "American Lit (EL)", id: "1133P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [11, 12]),
        "1190AP": Course(name: "AP Eng Lang & Comp", id: "1190AP", description: "", recommended: [], department: Department.english, type: CourseType.ap, grade: [11]),
        "1260P": Course(name: "Story & Style", id: "1260P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [12]),
        "1410AP": Course(name: "AP Eng Lit & Comp", id: "1410AP", description: "", recommended: [], department: Department.english, type: CourseType.ap, grade: [12]),
        "1360P": Course(name: "Journalism/EPIC", id: "1360P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [10, 11, 12]),
        "1450": Course(name: "Eng. Lang Dev 2", id: "1450", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [9, 10, 11, 12]),
        "1460P": Course(name: "Eng. Lang Dev 3", id: "1460P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [9, 10, 11, 12]),
        
        //SOCIAL STUDIES
        
        
        //WL
        "4010P": Course(name: "Japanese 1", id: "4010P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [9, 10, 11, 12]),
        "4020P": Course(name: "Japanese 2", id: "4020P", description: "", recommended: ["4010P"], department: Department.wl, type: CourseType.standard, grade: [9, 10, 11, 12]),
        
        //MATH
        "2210P": Course(name: "Algebra 1", id: "2210P", description: "", recommended: [], department: Department.math, type: CourseType.standard, grade: [9, 10, 11, 12]),
        "2230P": Course(name: "Geometry", id: "2230P", description: "", recommended: [], department: Department.math, type: CourseType.standard, grade: [9, 10, 11, 12]),
        "2310P": Course(name: "Algebra 2", id: "2310P", description: "", recommended: ["2210P"], department: Department.math, type: CourseType.standard,  grade: [9, 10, 11, 12])
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
    case other
}

enum Department {
    case english
    case social
    case pe
    case art
    case science
    case math
    case drama
    case music
    case wl
    case business
    case living
    case none
}

class Course: Identifiable {
    let name: String
    let id: String
    let description: String
    let recommended: [String]
    let department: Department
    let type: CourseType
    let grade: [Int]
    
    init(name: String, id: String, description: String, recommended: [String], department: Department, type: CourseType, grade: [Int]) {
        self.name = name
        self.id = id
        self.description = description
        self.recommended = recommended
        self.department = department
        self.type = type
        self.grade = grade
    }
    
    
}
