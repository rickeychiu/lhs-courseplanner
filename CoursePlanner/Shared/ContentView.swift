//
//  ContentView.swift
//  Shared
//
//  Created by Rickey Chiu on 5/29/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: CoursePlannerViewModel
    @State var currentYear: Int = 0
    
    init(viewModel: CoursePlannerViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        HStack {
            //L button
                //if legal
            Button(action: {
                if currentYear > 0 {
                    currentYear -= 1
                }
            }, label: {
                Image(systemName: "chevron.left.circle")
            })
            .buttonStyle(PlainButtonStyle())
            
            //year column
            
            VStack {
                if currentYear == 0 {
                    Text("Freshman")
                }
                else if currentYear == 1 {
                    Text("Sophomore")
                }
                else if currentYear == 2 {
                    Text("Junior")
                }
                else if currentYear == 3 {
                    Text("Senior")
                }
                            
                YearColumn(year: Binding(get: { viewModel.schedule.years[currentYear] },
                                         set: { newValue in viewModel.schedule.years[currentYear] = newValue }), validYear: currentYear)
            }

            Button(action: {
                if currentYear < 3 {
                    currentYear += 1
                }
            }, label: {
                Image(systemName: "chevron.right.circle")
            })
            .buttonStyle(PlainButtonStyle())
        }
        
    }

}

struct YearColumn: View {
    
    @Binding var year: [CourseIdentifier]
    @State var isSheetVisible: Int = -1
    var validYear: Int
    
    var body: some View {
        
        VStack {
            ForEach(Array(year.enumerated()), id: \.offset) { courseIdentifierEnumerated in
                if let course = idToCourse[courseIdentifierEnumerated.element] {
                    CourseRow(course: course, validYear: validYear)
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

struct CourseRow: View {
    
    let course: Course
    let validYear: Int
    
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
        Label(course.name, image: "")
            .foregroundColor(course.department == .zero ? .gray : .white)
            .padding(.all, 8)
            .frame(width: 256)
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
                        CourseRow(course: course, validYear: validYear)
                            .onTapGesture {
                                
                                if course.grade.contains(validYear) {
                                    year[isSheetVisible] = course.id
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
