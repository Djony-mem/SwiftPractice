//
//  LessonViewModel.swift
//  SwiftPractice
//
//  Created by brubru on 04.07.2023.
//

import Foundation
import Combine

class LessonViewModel: Identifiable, Equatable, ObservableObject {
	let objectWillChange = PassthroughSubject<LessonViewModel, Never>()

	let id = UUID()

	private var lesson: Lesson
	private weak var parentViewModel: CourseViewModel?

	init(lesson: Lesson, parentViewModel: CourseViewModel) {
		self.lesson = lesson
		self.parentViewModel = parentViewModel
	}
	
	var book: String {
		"📖"
	}
	
	var date: String {
		lesson.date
	}
	
	var isMain: Bool {
		lesson.isMain
	}
	
	var title: String {
		lesson.title
	}
	
	var isCompleted: Bool {
		if let isCompleted = StorageManager.shared.loadIsCompletedStatus(for: lesson.title) {
			return isCompleted
		} else {
			return lesson.isCompleted
		}
	}
	
	var htmlID: String {
		lesson.htmlID
	}
	
	var htmlFilePath: String {
		lesson.htmlFilePath
	}
	
	var task: TaskViewModel? {
		if let task = lesson.task {
			return TaskViewModel(task: task)
		}
		return nil
	}
	
	var subheads: [SubheadViewModel] {
		lesson.subheads.map { SubheadViewModel(subhead: $0) }
	}

	static func == (lhs: LessonViewModel, rhs: LessonViewModel) -> Bool {
		lhs.id == rhs.id
	}
	
	func pressButton() {
		StorageManager.shared.saveIsCompletedStatus(for: lesson.title, with: !isCompleted)
		objectWillChange.send(self)
	}
	
	func updateLesson(_ newLesson: Lesson) {
		lesson = newLesson
	}
	
	func update() {
		parentViewModel?.updateCourse()
	}
}


