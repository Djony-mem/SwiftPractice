	//
	//  CourseDescriptionScreen.swift
	//  SwiftPractice
	//
	//  Created by Наталья Миронова on 07.08.2023.
	//

import SwiftUI

struct CourseDescriptionScreen: View {
	let course: CourseViewModel
	
	@State private var currentSub: [AnyView] = []
	
	var body: some View {
		CustomNavigationStack(currentSubviews: $currentSub) {
			ScrollView {
				HederView(course: course)
					.padding(20)
				DynamicVGrid {
					ForEach(course.lessons) { lesson in
						LessonCellView(currentSubviews: $currentSub,
									   lesson: lesson,
									   onSelected: {
							withAnimation(.easeOut(duration: 0.5)) {
								currentSub.append(
									AnyView(
										LessonScreen(currentSubViews: $currentSub, lesson: lesson)
									)
								)
								currentSub.append(AnyView(Text("")))
							}
						})
					}
				}
				.padding(50)
			}
			.background(Image("bgHeader").resizable().scaledToFill())
			.frame(minWidth: 910, minHeight: 650)
			.scrollIndicators(.hidden)
			.navigationTitle("")
		}
	}
}

