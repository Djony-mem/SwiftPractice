	//
	//  CourseView.swift
	//  SwiftPractice
	//
	//  Created by brubru on 01.07.2023.
	//

import SwiftUI

struct CourseView: View {
	var body: some View {
		NavigationView {
			SideBarView()
			LessonView(lesson: Lesson.basicLesson[0])
		}
	}
}

struct CourseView_Previews: PreviewProvider {
	static var previews: some View {
		CourseView()
	}
}
