//
//  TaskScreen.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 17.11.2023.
//

import SwiftUI

struct TaskScreen: View {
	@Environment(\.dismiss) private var dismiss
	@EnvironmentObject var selectedLessonView: SelectedLessonView
	var lessonid = Int()
	
    var body: some View {
		VStack(spacing: 0) {
			
			CustomWebView(scrollToAnchor: "",
						  htmlContent: selectedLessonView.selectedLesson?.task?.htmlFilePath ?? ""
			)
		}
		.background(ConstantsColor.darkGray)
    }
}

