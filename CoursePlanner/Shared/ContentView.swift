//
//  ContentView.swift
//  Shared
//
//  Created by Rickey Chiu on 5/29/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: CoursePlannerViewModel
    @State var isSheetVisible: Bool = false
    
    init(viewModel: CoursePlannerViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Array(viewModel.schedule.years.enumerated()), id: \.offset) { yearEnumerated in
                    YearColumn(year: Binding(get: { viewModel.schedule.years[yearEnumerated.offset] },
                                             set: { newValue in viewModel.schedule.years[yearEnumerated.offset] = newValue }),
                               isSheetVisible: $isSheetVisible)
                }
                .padding(.horizontal, 20)
            
            }
            .padding(.vertical, 10)
        }
        
    }

}

struct YearColumn: View {
    
    @Binding var year: [CourseIdentifier]
    @Binding var isSheetVisible: Bool
    
    var body: some View {
        
        VStack {
            ForEach(Array(year.enumerated()), id: \.offset) { courseIdentifierEnumerated in
                if let course = idToCourse[courseIdentifierEnumerated.element] {
                    CourseRow(name: course.name)
                        .onTapGesture {
                            isSheetVisible = true
                        }
                        .sheet(isPresented: $isSheetVisible) {
                            PopupView(year: $year, index: courseIdentifierEnumerated.offset, isSheetVisible: $isSheetVisible)
                        }
                }
            }
        }
    }
}

struct CourseRow: View {
    
    let name: String
    
    var body: some View {
        Label(name, image: "")
            .foregroundColor(.white)
            .padding(.all, 8)
            .frame(width: 256)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct PopupView: View {
    
    @Binding var year: [CourseIdentifier]
    var index: Int
    @Binding var isSheetVisible: Bool
    
    var body: some View {
        ScrollView {
            ForEach(Array(idToCourse.values)) { course in
                CourseRow(name: course.name)
                    .onTapGesture {
                        year[index] = course.id
                        isSheetVisible = false
                    }
            }
            .padding(.horizontal, 8)
        }
    }

}
