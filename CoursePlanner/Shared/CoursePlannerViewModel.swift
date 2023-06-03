//
//  CoursePlannerViewModel.swift
//  CoursePlanner
//
//  Created by Rickey Chiu on 5/29/23.
//

import SwiftUI

let idToCourse: [CourseIdentifier: Course] = [
    
    //ADD
    "0000": Course(name: "+", id: "0000", description: "", recommended: [], department: .zero, type: .other, grade: [0,1,2,3]),
    
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
    "1620P": Course(name: "World History", id: "1620P", description: "", recommended: [], department: Department.social, type: CourseType.standard, grade: [1]),
    "1623P": Course(name: "World History (EL)", id: "1623P", description: "", recommended: [], department: Department.social, type: CourseType.standard, grade: [1]),
    "1730P": Course(name: "U.S. History", id: "1730P", description: "", recommended: [], department: Department.social, type: CourseType.standard, grade: [2]),
    "1750AP": Course(name: "AP U.S. History", id: "1750AP", description: "", recommended: [], department: Department.social, type: CourseType.ap, grade: [2]),
    "1835P": Course(name: "Economics*", id: "1835P", description: "", recommended: [], department: Department.social, type: CourseType.standard, grade: [3]),
    "1845P": Course(name: "U.S. Government*", id: "1845P", description: "", recommended: [], department: Department.social, type: CourseType.standard, grade: [3]),
    "1855AP": Course(name: "AP U.S. Gov/Politics*", id: "1855AP", description: "", recommended: [], department: Department.social, type: CourseType.ap, grade: [3]),
    
    //PE
    "2510": Course(name: "P.E. 9", id: "2510", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [0]),
    "2530": Course(name: "P.E. 10-12", id: "2530", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    "2720": Course(name: "P.E. Racquet Sports", id: "2720", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    "2740": Course(name: "P.E. Weight Training", id: "2740", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    "2780": Course(name: "P.E. Total Fitness", id: "2780", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    "2590": Course(name: "P.E. Athletics*", id: "2720", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    
    //ART
    "7670P": Course(name: "Photography & Design", id: "7670P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [1, 2, 3]),
    "6110P": Course(name: "Art 1", id: "6110P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "6120P": Course(name: "Art 2", id: "6120P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [1, 2, 3]),
    "6130P": Course(name: "Art 3", id: "6130P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [2, 3]),
    "6210P": Course(name: "3D Sculpture & Design 1", id: "6210P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "6220P": Course(name: "3D Sculpture & Design 2", id: "6220P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [1, 2, 3]),
    "6230P": Course(name: "3D Sculpture & Design 3", id: "6230P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [2, 3]),
    "6360P": Course(name: "Cermaics 1", id: "6360P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "6370P": Course(name: "Cermaics 2", id: "6370P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [1, 2, 3]),
    "6380P": Course(name: "Cermaics 3", id: "6380P", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [1, 2, 3]),
    "6450AP": Course(name: "AP 2D Art & Design", id: "6450AP", description: "", recommended: [], department: Department.art, type: CourseType.ap, grade: [2, 3]),
    "7790": Course(name: "Studio Art", id: "7790", description: "", recommended: [], department: Department.art, type: CourseType.standard, grade: [2, 3]),
    
    //SCIENCE
    "3110P": Course(name: "SCIENCE FILLER", id: "3110P", description: "", recommended: [], department: Department.science, type: CourseType.standard, grade: [0, 1, 2, 3]),
    
    //MATH
    "2210P": Course(name: "Algebra 1", id: "2210P", description: "", recommended: [], department: Department.math, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "2230P": Course(name: "Geometry", id: "2230P", description: "", recommended: [], department: Department.math, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "2310P": Course(name: "Algebra 2", id: "2310P", description: "", recommended: ["2210P"], department: Department.math, type: CourseType.standard,  grade: [0, 1, 2, 3]),
    
    //DRAMA
    "6710P": Course(name: "DRAMA FILLER", id: "6710P", description: "", recommended: [], department: Department.drama, type: CourseType.standard, grade: [0, 1, 2, 3]),
    
    //MUSIC
    "7030P": Course(name: "MUSIC FILLER", id: "7030P", description: "", recommended: [], department: Department.music, type: CourseType.standard, grade: [0, 1, 2, 3]),
    
    //WL
    "4010P": Course(name: "Japanese 1", id: "4010P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4020P": Course(name: "Japanese 2", id: "4020P", description: "", recommended: ["4010P"], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    
    //BUSINESS
    "4580P": Course(name: "BUSINESS FILLER", id: "4580P", description: "", recommended: [], department: Department.business, type: CourseType.standard, grade: [0, 1, 2, 3]),
    
    //LIVING SKILLS
    "5710": Course(name: "COOKING FILLER", id: "5710", description: "", recommended: [], department: Department.living, type: CourseType.standard, grade: [0, 1, 2, 3]),
    
    //NON-DEPARTMENTAL
    "8040": Course(name: "MISC FILLER", id: "8040", description: "", recommended: [], department: Department.misc, type: CourseType.standard, grade: [0, 1, 2, 3])
    
    
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

enum Department: Comparable {
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
    
    case zero
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

extension Course: Comparable {
    static func < (lhs: Course, rhs: Course) -> Bool {
        return lhs.department < rhs.department
    }
    
    static func == (lhs: Course, rhs: Course) -> Bool {
        return lhs.department == rhs.department
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
