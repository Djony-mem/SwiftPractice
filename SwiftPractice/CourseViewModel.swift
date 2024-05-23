//
//  CourseViewModel.swift
//  SwiftPractice
//
//  Created by brubru on 04.07.2023.
//

import Foundation
import Combine

class CourseViewModel: Identifiable, ObservableObject {
	
	let objectWillChange = PassthroughSubject<LessonViewModel, Never>()
	
	@Published var flag = false
	
	let id = UUID()
	private let course: Course
		
	init(course: Course) {
		self.course = course
	}
	
	var title: String {
		course.title
	}
	
	var color: String {
		course.color
	}
	
	var active: Bool {
		Bool(course.active) ?? false
	}
	
	var subTitle: String {
		course.subTitle
	}
	
	var image: String {
		course.image
	}
	
	var description: String {
		course.desctiption
	}
	
	var presentImage: [String] {
		course.presentImages
	}
	
	var lessons: [LessonViewModel] {
		course.lessons.map {
			LessonViewModel(lesson: $0, parentViewModel: self)
		}
	}
	
	func updateCourse() {
		flag.toggle()
	}
}
