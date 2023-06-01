//
//  CoursePlannerViewModel.swift
//  CoursePlanner
//
//  Created by Rickey Chiu on 5/29/23.
//

import SwiftUI

let idToCourse: [CourseIdentifier: Course] = [
    
    //ADD
    "0000": Course(name: "+", id: "0000", description: "", recommended: [], department: .misc, type: .other, grade: [0,1,2,3]),
    
    //ENGLISH
    "1010P": Course(name: "Lit & Writing", id: "1010P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [0]),
    "1013P": Course(name: "Lit & Writing (EL)", id: "1013P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [0, 1]),
    "1020P": Course(name: "World Lit", id: "1020P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [1]),
    "1023P": Course(name: "World Lit (EL)", id: "1023P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [1, 2]),
    "1130P": Course(name: "American Lit", id: "1130P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [2]),
    "1133P": Course(name: "American Lit (EL)", id: "1133P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [2, 3]),
    "1190AP": Course(name: "AP Eng Lang & Comp", id: "1190AP", description: "", recommended: [], department: Department.english, type: CourseType.ap, grade: [2]),
    "1260P": Course(name: "Story & Style", id: "1260P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [3]),
    "1410AP": Course(name: "AP Eng Lit & Comp", id: "1410AP", description: "", recommended: [], department: Department.english, type: CourseType.ap, grade: [3]),
    "1360P": Course(name: "Journalism/EPIC", id: "1360P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [1, 2, 3]),
    "1450": Course(name: "Eng. Lang Dev 2", id: "1450", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "1460P": Course(name: "Eng. Lang Dev 3", id: "1460P", description: "", recommended: [], department: Department.english, type: CourseType.standard, grade: [0, 1, 2, 3]),
    
    //SOCIAL STUDIES
    
    
    //WL
    "4010P": Course(name: "Japanese 1", id: "4010P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4020P": Course(name: "Japanese 2", id: "4020P", description: "", recommended: ["4010P"], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    
    //MATH
    "2210P": Course(name: "Algebra 1", id: "2210P", description: "", recommended: [], department: Department.math, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "2230P": Course(name: "Geometry", id: "2230P", description: "", recommended: [], department: Department.math, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "2310P": Course(name: "Algebra 2", id: "2310P", description: "", recommended: ["2210P"], department: Department.math, type: CourseType.standard,  grade: [0, 1, 2, 3])
]

class CoursePlannerViewModel: ObservableObject {
    @Published var schedule: Schedule = Schedule()
}

typealias CourseIdentifier = String

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
    case misc
}

class Course: Identifiable {
    let name: String
    let id: CourseIdentifier
    let description: String
    let recommended: [String]
    let department: Department
    let type: CourseType
    let grade: [Int]
    
    init(name: String, id: CourseIdentifier, description: String, recommended: [CourseIdentifier], department: Department, type: CourseType, grade: [Int]) {
        self.name = name
        self.id = id
        self.description = description
        self.recommended = recommended
        self.department = department
        self.type = type
        self.grade = grade
    }
    
    
}

class Schedule: Identifiable {
    var years: [[CourseIdentifier]] = [
        ["0000", "0000", "0000", "0000", "0000", "0000", "0000"],
        ["0000", "0000", "0000", "0000", "0000", "0000", "0000"],
        ["0000", "0000", "0000", "0000", "0000", "0000", "0000"],
        ["0000", "0000", "0000", "0000", "0000", "0000", "0000"]
    ]
    
    init() {
        
    }
    
}
