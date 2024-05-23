//
//  StorageManager.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 06.10.2023.
//

import Foundation

final class StorageManager {
	static let shared = StorageManager()
	
	private let userDefaults = UserDefaults()
	
	func saveIsCompletedStatus(for lessonTitle: String, with status: Bool) {
		userDefaults.set(status, forKey: lessonTitle)
	}
	
	func loadIsCompletedStatus(for lessonTitle: String) -> Bool? {
		userDefaults.bool(forKey: lessonTitle)
	}
}


