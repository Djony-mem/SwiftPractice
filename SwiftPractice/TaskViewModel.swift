//
//  TaskViewModel.swift
//  SwiftPractice
//
//  Created by brubru on 06.03.2024.
//

import Foundation

struct TaskViewModel: Identifiable {
	var id = UUID()
	
	private var task: Task
	
	init(task: Task) {
		self.task = task
	}
	
	var title: String {
		task.title
	}
	
	var htmlFilePath: String {
		task.htmlFilePath
	}
}
