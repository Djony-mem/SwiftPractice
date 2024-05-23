//
//  CourseLiseViewModel.swift
//  SwiftPractice
//
//  Created by brubru on 04.07.2023.
//

import Foundation


final class CourseListViewModel: ObservableObject, Identifiable {

	@Published var courseViewModels = [CourseViewModel]()
	let id = UUID()
	
	func getCourses() {
		let courses = Course.courses
		
		courses.forEach { course in
			let courseVM = CourseViewModel(course: course)
			courseViewModels.append(courseVM)
		}
		
	}
 }
