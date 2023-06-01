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
            return .red
        } else {
            return .gray
        }
    }
    
    
    
    var body: some View {
        Label(course.name, image: "")
            .foregroundColor(.white)
            .padding(.all, 8)
            .frame(width: 256)
            .background(properColor)
        
        
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct PopupView: View {
    
    @Binding var year: [CourseIdentifier]
    @Binding var isSheetVisible: Int
    var validYear: Int
    
    var body: some View {
        ScrollView {
            ForEach(Array(idToCourse.values)) { course in
                CourseRow(course: course, validYear: validYear)
                    .onTapGesture {
                        
                        if course.grade.contains(validYear) {
                            year[isSheetVisible] = course.id
                            isSheetVisible = -1
                        }
                       
                    }
            }
            .padding(.horizontal, 8)
        }
    }

}
