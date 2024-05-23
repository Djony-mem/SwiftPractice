//
//  CourseListView.swift
//  SwiftPractice
//
//  Created by brubru on 03.07.2023.
//

import SwiftUI

struct CourseListView: View {
	
	let courses: [CourseViewModel]
	var selectedCourse: (CourseViewModel) -> Void
	
	var body: some View {
		DynamicHGrid {
			ForEach(courses) { course in
				CourseRectengleView(course: course, onSelected: selectedCourse)
			}
		}
	}
}
//
//struct CourseList_Previews: PreviewProvider {
//    static var previews: some View {
//		let viewModel = CourseListViewModel()
//		CoursListView(courses: viewModel.courseViewModels)
//			.frame(width: 900, height: 900)
//    }
//}
