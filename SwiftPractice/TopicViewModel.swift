//
//  TopicViewModel.swift
//  SwiftPractice
//
//  Created by brubru on 17.07.2023.
//

import Foundation

struct TopicViewModel: Identifiable {
	let id = UUID()
	private let topic: Topic
	
	init(topic: Topic) {
		self.topic = topic
	}
	
	var title: String {
		topic.title
	}
	
	var courseViewModel: [CourseViewModel] {
		topic.courses.map { CourseViewModel(course: $0) }
	}
}
