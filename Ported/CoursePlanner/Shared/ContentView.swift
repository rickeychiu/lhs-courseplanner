//
//  ContentView.swift
//  Shared
//
//  Created by Rickey Chiu on 5/29/23.
//

import SwiftUI

struct Constants {
    static let spacingHeight: CGFloat = 8
}

struct ContentView: View {

    @Binding var document: CoursePlannerDocument
    @State var currentYear: Int = 0
    
    var backgroundColor: Color {
        #if os(macOS)
        return Color(nsColor: NSColor(named: NSColor.Name("BackgroundColor")) ?? NSColor.white)
        #else
        return Color(uiColor: UIColor(named: "BackgroundColor") ?? UIColor.white)
        #endif
    }
    
    var mainView: some View {
            YearColumn(year: Binding(get: { document.schedule.years[currentYear] },
                                     set: { newValue in document.schedule.years[currentYear] = newValue }),
                       validYear: currentYear)
            .background(backgroundColor)
    }
    
    var body: some View {
        
        VStack {
        
            TabView(selection: $currentYear) {
                mainView
                    .tag(0)
                    .tabItem {
                        Label("Freshman", systemImage: "9.circle")
                    }
                
                mainView
                    .tag(1)
                    .tabItem {
                        Label("Sophomore", systemImage: "10.circle")
                    }
                
                mainView
                    .tag(2)
                    .tabItem {
                        Label("Junior", systemImage: "11.circle")
                    }
                
                mainView
                    .tag(3)
                    .tabItem {
                        Label("Senior", systemImage: "12.circle")
                    }
            }
        }
    }
}

struct YearColumn: View {
    
    @Binding var year: [CourseIdentifier]
    @State var isSheetVisible: Int = -1
    var validYear: Int
    
    func courseRowHeight(totalHeight: CGFloat) -> CGFloat {
        let spacingHeight: CGFloat = CGFloat((max(year.count, 0))) * Constants.spacingHeight
        let divisions: CGFloat = CGFloat((max(year.count, 1)))
        return (totalHeight - spacingHeight) / divisions
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: Constants.spacingHeight) {
                ForEach(Array(year.enumerated()), id: \.offset) { courseIdentifierEnumerated in
                    if let course = idToCourse[courseIdentifierEnumerated.element] {
                        CourseRow(course: course,
                                  validYear: validYear,
                                  showDescription: false)
                            .frame(width: proxy.size.width - 2 * Constants.spacingHeight,
                                   height: courseRowHeight(totalHeight: proxy.size.height))
                            .padding(.horizontal, Constants.spacingHeight)
                            .onTapGesture {
                                isSheetVisible = courseIdentifierEnumerated.offset
                            }
                            .sheet(isPresented: Binding(
                                get: {
                                    isSheetVisible != -1
                                },
                                set: { isPresented in
                                    if !isPresented {
                                        isSheetVisible = -1
                                    }
                                })
                            )
                            {
                                PopupView(year: $year, isSheetVisible: $isSheetVisible, validYear: validYear)
                            }
                    }
                }
            }
        }
    }
}

struct CourseRow: View {
    
    let course: Course
    let validYear: Int
    let showDescription: Bool
    
    var properColor: Color {
        if course.grade.contains(validYear) {
            if course.department == .english {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentEnglishColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentEnglishColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .social {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentSocialColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentSocialColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .pe {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentPEColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentPEColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .art {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentArtColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentArtColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .science {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentScienceColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentScienceColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .math {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentMathColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentMathColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .drama {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentDramaColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentDramaColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .music {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentMusicColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentMusicColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .wl {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentWLColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentWLColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .business {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentBusinessColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentBusinessColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .living {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentLivingColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentLivingColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .misc {
                #if os(macOS)
                return Color(nsColor: NSColor(named: NSColor.Name("DepartmentMiscColor")) ?? NSColor.white)
                #else
                return Color(uiColor: UIColor(named: "DepartmentMiscColor") ?? UIColor.white)
                #endif
            }
            else if course.department == .zero {
                return Color.gray.opacity(0.00001)
            }
        }
        
        return Color(.sRGB, red: 200/255, green: 200/255, blue: 200/255, opacity: 1)
    }
    
    var isEmptyCourse: Bool {
        return course.department == .zero
    }
    
    var shadowColor: Color {
        #if os(macOS)
        return Color(nsColor: NSColor(named: NSColor.Name("ShadowColor")) ?? NSColor.white)
        #else
        return Color(uiColor: UIColor(named: "ShadowColor") ?? UIColor.white)
        #endif
    }
    
    var body: some View {
        Group {
            if isEmptyCourse {
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Label(course.name, image: "")
                            .font(.system(size: 24))
                            .foregroundColor(isEmptyCourse ? .gray : .white)
                            .frame(height: showDescription ? 24 + 48 : 24)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
            else {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Label(course.name, image: "")
                            .font(.system(size: 24))
                            .foregroundColor(isEmptyCourse ? .gray : .white)
                        
                        Spacer()
                        
                        Group {
                            if course.type == .honors {
                                Image(systemName: "graduationcap.circle")
                                    .resizable()
                                    .scaledToFit()
                            }
                            else if course.type == .ap {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .frame(width: 24, height: 24)
                        .foregroundColor(isEmptyCourse ? .gray : .white)
                    }
                    
                    if showDescription {
                        Text(course.description)
                            .font(.system(size: 12))
                            .foregroundColor(isEmptyCourse ? .gray : .white)
                            .truncationMode(.tail)
                            .frame(height: 48, alignment: .topLeading)
                            .padding(.horizontal, 8)
                    }
                    
                    Spacer()
                }
            }
        }
        .padding(.all, 8)
        .background(isEmptyCourse ? Color.gray.opacity(0.00001) : properColor)
        .cornerRadius(16)
        .overlay(
            Group {
                if isEmptyCourse {
                    RoundedRectangle(cornerRadius: 16).stroke(shadowColor, lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2)
                        .mask(RoundedRectangle(cornerRadius: 16)
                    )
                }
                else {
                    EmptyView()
                }
            }
        )
        .shadow(color: isEmptyCourse ? Color.clear : shadowColor, radius: 4, x: 4, y: 4)
    }
}

struct PopupView: View {
    
    @Binding var year: [CourseIdentifier]
    @Binding var isSheetVisible: Int
    var validYear: Int
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                
                VStack {
                    ForEach(Array(idToCourse.values.sorted().filter({ $0.grade.contains(validYear) }))) { course in
                        CourseRow(course: course, validYear: validYear, showDescription: true)
                            .onTapGesture {
                                if course.grade.contains(validYear) {
                                    year[isSheetVisible] = course.id
                                    print("! course changed")
                                    isSheetVisible = -1
                                }
                            }
                    }
                }
                .padding(.vertical, 8)
                
                Spacer()
            }
        }
    }
}
