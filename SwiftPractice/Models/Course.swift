//
//  Course.swift
//  SwiftPractice
//
//  Created by brubru on 04.07.2023.
//

import Foundation

struct TopicList: Decodable {
	let topics: [Topic]
	
	static var topicList: TopicList {
		TopicList(
			topics:
				[
					Topic(
						title: "UIKit",
						courses: [
							Course(
								title: "Модуль 1",
								color: "block1",
								active: "true",
								subTitle: "Основы языка Swift",
								image: "baseSwift",
								desctiption: "",
								presentImages: [],
								lessons: []
							)
						]
					),
					Topic(
						title: "SwiftUI",
						courses: []
					),
					Topic(
						title: "Алгоритмы",
						courses: []
					)
				]
		)
	}
}

struct Topic: Decodable {
	let title: String
	let courses: [Course]
}

struct Course: Decodable {
	let title: String
	let color: String
	//платный контент сделать isActive: Bool
	let active: String
	let subTitle: String
	let image: String
	let desctiption: String
	let presentImages: [String]
	let lessons: [Lesson]
	
	static var courses: [Course] {
		[
			Course(
				title: "Модуль 1",
				color: "gray",
				active: "true",
				subTitle: "Основы языка Swift",
				image: "baseSwift",
				desctiption: "",
				presentImages: [],
				lessons: []
			)
		]
	}
}

struct Lesson: Decodable {
	var date: String
	let isMain: Bool
	let title: String
	var isCompleted: Bool
	let htmlID: String
	let htmlFilePath: String
	let task: Task?
	let subheads: [Subhead]
	
	static func getMockLesson() -> Lesson {
		Lesson(
			date: "03.03.87",
			isMain: true,
			title: "Oсновы Swift",
			isCompleted: false,
			htmlID: "lesson1",
			htmlFilePath: "FilesOfLessons/BaseSwift/Lesson1/lesson1", 
			task: Task(
				title: "Oсновы Swift",
				htmlFilePath: "FilesOfLessons/BaseSwift/Lesson1/Tasks/Task1/task1"
			),
			subheads: [Subhead(
				   date: "30 Октября 2022",
				   isMain: false,
				   title: "Где найти xcode?",
				   htmlID: "xcode",
				   htmlFilePath: "FilesOfLessons/BaseSwift/Lesson1/xcode"
			   )]
		)
	}
	
	static func getDefaultPage() -> Lesson {
		Lesson(
			date: "",
			isMain: true,
			title: "",
			isCompleted: false,
			htmlID: "",
			htmlFilePath: "FilesOfLessons/BaseSwift/Lesson1/defaultLesson", 
			task: nil,
			subheads: []
		)
	}
}

struct Subhead: Decodable {
	var date: String
	let isMain: Bool
	let title: String
	let htmlID: String
	let htmlFilePath: String
}

struct Task: Decodable {
	let title: String
	let htmlFilePath: String
}
