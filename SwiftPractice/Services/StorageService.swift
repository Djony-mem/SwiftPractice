//
//  StorageService.swift
//  SwiftPractice
//
//  Created by brubru on 30.04.2024.
//

import Foundation
import FirebaseStorage

class CourseList {
	let falderName: String
	let lessons: [LessonList]
	
	init(falderName: String, lessons: [LessonList]) {
		self.falderName = falderName
		self.lessons = lessons
	}
}

class LessonList {
	let title: String
	let lessons: String
	
	init(title: String, lessons: String) {
		self.title = title
		self.lessons = lessons
	}
}


class StorageService: ObservableObject {
	private let storage = Storage.storage()
	
	private var basicLessons = [String: String]()
	
	func getBasicLessons() -> [String: String] {
		basicLessons
	}
	
	private func listAllFiles(falderName: String) -> [String: String] {
		let storageRef = storage.reference().child(falderName)
		var htmlContent = [String: String]()
		
		storageRef.listAll { result, error in
			if let error = error {
				print("Error while listing all files: ", error)
			}
			
			for item in result!.items {
				item.getData(maxSize: 1 * 1024 * 1024) { result in
					switch result {
					case .success(let data):
						htmlContent[item.name] = String(data: data, encoding: .utf8)
					case .failure(let error):
						print(error)
					}
				}
			}
		}
		
		return htmlContent
	}
}

