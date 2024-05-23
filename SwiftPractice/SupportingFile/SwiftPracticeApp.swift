//
//  SwiftPracticeApp.swift
//  SwiftPractice
//
//  Created by brubru on 28.06.2023.
//

import SwiftUI
import Firebase

@main
struct SwiftPracticeApp: App {
	@StateObject var selectedLessonView = SelectedLessonView()
	@State private var isTaskScreenPresented = false
	
	init() {
		FirebaseApp.configure()
	}

    var body: some Scene {
        WindowGroup {
			CourseListScreen()
				.preferredColorScheme(.dark)
				.environmentObject(selectedLessonView)
			
		}
		
		Window("Task", id: "task-window") {
			TaskScreen()
				.preferredColorScheme(.dark)
				.environmentObject(selectedLessonView)
		}
		.windowStyle(HiddenTitleBarWindowStyle())
	}
}

