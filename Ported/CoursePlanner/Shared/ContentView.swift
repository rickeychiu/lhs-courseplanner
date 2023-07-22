//
//  ContentView.swift
//  Shared
//
//  Created by Rickey Chiu on 5/29/23.
//

import SwiftUI

struct Constants {
    static let tabHeight: CGFloat = 0
    static let headerHeight: CGFloat = 0
    static let spacingHeight: CGFloat = 8
}

struct ContentView: View {

    
    //@ObservedObject var viewModel: CoursePlannerViewModel
    @Binding var document: CoursePlannerDocument
    @State var currentYear: Int = 0
    
    /*
    init(viewModel: CoursePlannerViewModel) {
        self.viewModel = viewModel
    }
    */
    var mainView: some View {
            YearColumn(year: Binding(get: {
                
                document.schedule.years[currentYear]
            },
                                     set: { newValue in
                print("! setting binding")
                document.schedule.years[currentYear] = newValue
                
            }), validYear: currentYear)
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
        let spacingHeight: CGFloat = CGFloat((max(year.count - 1, 0))) * Constants.spacingHeight
        let divisions: CGFloat = CGFloat((max(year.count, 1)))
        return (totalHeight - Constants.tabHeight - Constants.headerHeight - spacingHeight) / divisions
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
                return Color(.sRGB, red: 237/255, green: 27/255, blue: 29/255, opacity: 1)
            } else if course.department == .social {
                return Color(.sRGB, red: 253/255, green: 185/255, blue: 49/255, opacity: 1)
            } else if course.department == .pe {
                return Color(.sRGB, red: 108/255, green: 213/255, blue: 217/255, opacity: 1)
            }  else if course.department == .art {
                return Color(.sRGB, red: 89/255, green: 191/255, blue: 180/255, opacity: 1)
            } else if course.department == .science {
                return Color(.sRGB, red: 102/255, green: 177/255, blue: 79/255, opacity: 1)
            } else if course.department == .math {
                return Color(.sRGB, red: 1/255, green: 110/255, blue: 180/255, opacity: 1)
            } else if course.department == .drama {
                return Color(.sRGB, red: 215/255, green: 117/255, blue: 173/255, opacity: 1)
            } else if course.department == .music {
                return Color(.sRGB, red: 250/255, green: 163/255, blue: 87/255, opacity: 1)
            } else if course.department == .wl {
                return Color(.sRGB, red: 241/255, green: 112/255, blue: 154/255, opacity: 1)
            } else if course.department == .business {
                return Color(.sRGB, red: 1/255, green: 157/255, blue: 217/255, opacity: 1)
            } else if course.department == .living {
                return Color(.sRGB, red: 53/255, green: 189/255, blue: 119/255, opacity: 1)
            } else if course.department == .misc {
                return Color(.sRGB, red: 242/255, green: 95/255, blue: 99/255, opacity: 1)
            } else if course.department == .zero {
                return Color(.sRGB, red: 249/255, green: 193/255, blue: 203/255, opacity: 0)
            }
        }
        return Color(.sRGB, red: 200/255, green: 200/255, blue: 200/255, opacity: 1)
            
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Label(course.name, image: "")
                    .font(.system(size: 24))
                    .foregroundColor(course.department == .zero ? .gray : .white)
                
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
                .foregroundColor(course.department == .zero ? .gray : .white)
                //.padding(.trailing, 8)
            }
            
            if (showDescription) {
                Text(course.description)
                    .font(.system(size: 12))
                    .foregroundColor(course.department == .zero ? .gray : .white)
                    .truncationMode(.tail)
                    .frame(height: 48, alignment: .topLeading)
                    .padding(.horizontal, 8)
            }
           
            
            Spacer()
        }
        .padding(.all, 8)
        .background(properColor)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: course.department == .zero ? 2 : 0))
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
                    //ForEach(Array(idToCourse.values.sorted())) { course in
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
                
                Spacer()
            }
        }
    }

}
