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
    "1835P": Course(name: "Economics (1/2)", id: "1835P", description: "", recommended: [], department: Department.social, type: CourseType.standard, grade: [3]),
    "1845P": Course(name: "U.S. Government (2/2)", id: "1845P", description: "", recommended: [], department: Department.social, type: CourseType.standard, grade: [3]),
    "1855AP": Course(name: "AP U.S. Gov/Politics (2/2)", id: "1855AP", description: "", recommended: [], department: Department.social, type: CourseType.ap, grade: [3]),
    
    //PE
    "2510": Course(name: "P.E. 9", id: "2510", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [0]),
    "2530": Course(name: "P.E. 10-12", id: "2530", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    "2720": Course(name: "P.E. Racquet Sports", id: "2720", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    "2740": Course(name: "P.E. Weight Training", id: "2740", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    "2780": Course(name: "P.E. Total Fitness", id: "2780", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    "2590": Course(name: "P.E. Athletics*", id: "2590", description: "", recommended: [], department: Department.pe, type: CourseType.other, grade: [1, 2, 3]),
    
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
    "3110P": Course(name: "Biology", id: "3110P", description: "", recommended: [], department: Department.science, type: CourseType.standard, grade: [0]),
    "3113P": Course(name: "Biology EL", id: "3113P", description: "", recommended: [], department: Department.science, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "3120AP": Course(name: "AP Biology", id: "3120P", description: "", recommended: [], department: Department.science, type: CourseType.ap, grade: [2, 3]),
    "3130P": Course(name: "Physiology", id: "3130P", description: "", recommended: [], department: Department.science, type: CourseType.standard, grade: [2, 3]),
    "3610P": Course(name: "Chemistry", id: "3610P", description: "", recommended: [], department: Department.science, type: CourseType.standard, grade: [1, 2, 3]),
    "3620H": Course(name: "Chemistry - Honors", id: "3620H", description: "", recommended: [], department: Department.science, type: CourseType.honors, grade: [1, 2, 3]),
    "3630AP": Course(name: "AP Chemistry", id: "3630AP", description: "", recommended: [], department: Department.science, type: CourseType.ap, grade: [2, 3]),
    "3710P": Course(name: "Physics", id: "3710P", description: "", recommended: [], department: Department.science, type: CourseType.standard, grade: [1, 2, 3]),
    "3720H": Course(name: "Physics - Honors", id: "3720H", description: "", recommended: [], department: Department.science, type: CourseType.honors, grade: [1, 2, 3]),
    "3730AP": Course(name: "AP Physics C: Mech", id: "3730AP", description: "", recommended: [], department: Department.science, type: CourseType.ap, grade: [2, 3]),
    "3850P": Course(name: "Science & Society", id: "3850P", description: "", recommended: [], department: Department.science, type: CourseType.standard, grade: [1, 2, 3]),
    
    //MATH
    "2210P": Course(name: "Algebra 1", id: "2210P", description: "", recommended: [], department: Department.math, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "2230P": Course(name: "Geometry", id: "2230P", description: "", recommended: [], department: Department.math, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "2310P": Course(name: "Algebra 2", id: "2310P", description: "", recommended: ["2210P"], department: Department.math, type: CourseType.standard,  grade: [0, 1, 2, 3]),
    "2320P": Course(name: "Alg 2/Trignometry", id: "2320P", description: "", recommended: [], department: Department.math, type: CourseType.standard,  grade: [0, 1, 2, 3]),
    "2390P": Course(name: "Pre-Calculus", id: "2390P", description: "", recommended: [], department: Department.math, type: CourseType.standard,  grade: [0, 1, 2, 3]),
    "2420H": Course(name: "Pre-Calculus Honors", id: "2420H", description: "", recommended: [], department: Department.math, type: CourseType.honors,  grade: [0, 1, 2, 3]),
    "2430AP": Course(name: "AP Calculus AB", id: "2430AP", description: "", recommended: [], department: Department.math, type: CourseType.ap,  grade: [0, 1, 2, 3]),
    "2440AP": Course(name: "AP Calculus BC", id: "2440AP", description: "", recommended: [], department: Department.math, type: CourseType.ap,  grade: [0, 1, 2, 3]),
    "2460AP": Course(name: "AP Statistics", id: "2460AP", description: "", recommended: [], department: Department.math, type: CourseType.ap,  grade: [1, 2, 3]),
    "2370P": Course(name: "Comp Prog Java", id: "2370P", description: "", recommended: [], department: Department.math, type: CourseType.standard,  grade: [0, 1, 2, 3]),
    "2350AP": Course(name: "AP Comp Sci A", id: "2350AP", description: "", recommended: [], department: Department.math, type: CourseType.ap,  grade: [1, 2, 3]),
    "7820AP": Course(name: "AP Comp Sci Principles", id: "7820AP", description: "", recommended: [], department: Department.math, type: CourseType.ap,  grade: [1, 2, 3]),
    
    
    //DRAMA
    "6710P": Course(name: "Drama", id: "6710P", description: "", recommended: [], department: Department.drama, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "6720P": Course(name: "Advanced Drama", id: "6720P", description: "", recommended: [], department: Department.drama, type: CourseType.standard, grade: [1, 2, 3]),
    "6730H": Course(name: "Adv. Drama Honors", id: "6730H", description: "", recommended: [], department: Department.drama, type: CourseType.standard, grade: [2, 3]),
    
    //MUSIC
    "7030P": Course(name: "B Choir", id: "7030P", description: "", recommended: [], department: Department.music, type: CourseType.standard, grade: [0, 1, 2, 3]),
    
    //WL
    "4110P": Course(name: "French 1", id: "4110P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4120P": Course(name: "French 2", id: "4120P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4130P": Course(name: "French 3", id: "4130P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4140H": Course(name: "French 4 - Honors", id: "4140H", description: "", recommended: [], department: Department.wl, type: CourseType.honors, grade: [0, 1, 2, 3]),
    "4150AP": Course(name: "AP French Lang/Culture", id: "4150AP", description: "", recommended: [], department: Department.wl, type: CourseType.ap, grade: [0, 1, 2, 3]),
    
    "4010P": Course(name: "Japanese 1", id: "4010P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4020P": Course(name: "Japanese 2", id: "4020P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4030P": Course(name: "Japanese 3", id: "4030P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4040H": Course(name: "Japanese 4 - Honors", id: "4040H", description: "", recommended: [], department: Department.wl, type: CourseType.honors, grade: [0, 1, 2, 3]),
    "4050AP": Course(name: "AP Japanese Lang/Culture", id: "4050AP", description: "", recommended: [], department: Department.wl, type: CourseType.ap, grade: [0, 1, 2, 3]),
    
    "4410P": Course(name: "Chinese 1", id: "4410P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4420P": Course(name: "Chinese 2", id: "4420P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4430P": Course(name: "Chinese 3", id: "4430P", description: "", recommended: [], department: Department.wl, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4440H": Course(name: "Chinese 4 - Honors", id: "4440H", description: "", recommended: [], department: Department.wl, type: CourseType.honors, grade: [0, 1, 2, 3]),
    "4450AP": Course(name: "AP Chinese Lang/Culture", id: "4450AP", description: "", recommended: [], department: Department.wl, type: CourseType.ap, grade: [0, 1, 2, 3]),
    
    
    //BUSINESS
    "4580P": Course(name: "Principle of Business", id: "4580P", description: "", recommended: [], department: Department.business, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "4710P": Course(name: "Accounting 1", id: "4710P", description: "", recommended: [], department: Department.business, type: CourseType.standard, grade: [1, 2, 3]),
    "4720P": Course(name: "Accounting 2", id: "4720P", description: "", recommended: [], department: Department.business, type: CourseType.standard, grade: [1, 2, 3]),
    "4880P": Course(name: "Econ & Virtual Bus", id: "4880P", description: "", recommended: [], department: Department.business, type: CourseType.standard, grade: [1, 2, 3]),
    
    //LIVING SKILLS
    "5710": Course(name: "Culinary Arts 1", id: "5710", description: "", recommended: [], department: Department.living, type: CourseType.standard, grade: [0, 1, 2, 3]),
    "5730P": Course(name: "Culinary Food Science", id: "5730P", description: "", recommended: [], department: Department.living, type: CourseType.standard, grade: [1, 2, 3]),
    
    //NON-DEPARTMENTAL
    "8040": Course(name: "Work Experience", id: "8040", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [2, 3]),
    "8280": Course(name: "IS: STEM Research", id: "8280", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [0, 1]),
    "8290": Course(name: "Leadership*", id: "8040", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [0, 1, 2, 3]),
    "8390": Course(name: "Engage*", id: "8390", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [0, 1, 2, 3]),
    "8400": Course(name: "Engage Tutor*", id: "8400", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [2, 3]),
    "9020": Course(name: "TA/Student Clerk", id: "9020", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [1, 2, 3]),
    "9030": Course(name: "EL Teacher Asst", id: "9030", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [2, 3]),
    "9070": Course(name: "Technology Asst", id: "9070", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [1, 2, 3]),
    "8380": Course(name: "Yearbook", id: "8380", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [0, 1, 2, 3]),
    "1595": Course(name: "Intro to Ethnic Studies (1/2)", id: "1595", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [0, 1]),
    "3025": Course(name: "Health (2/2)", id: "3025", description: "", recommended: [], department: Department.misc, type: CourseType.other, grade: [0, 1])
    
    
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
