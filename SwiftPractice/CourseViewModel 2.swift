//
//  CourseViewModel.swift
//  SwiftPractice
//
//  Created by brubru on 04.07.2023.
//

import Foundation

struct CourseViewModel: Identifiable {
	let id = UUID()
	private let course: Course
	
	init(course: Course) {
		self.course = course
	}
	
	var title: String {
		course.title
	}
	
	var subTitle: String {
		course.subTitle
	}
	
	var image: String {
		course.image
	}
	
	var jsonLessons: String {
		course.jsonLessons
	}
}
