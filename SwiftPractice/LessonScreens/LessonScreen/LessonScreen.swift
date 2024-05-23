//
//  LessonView.swift
//  SwiftPractice
//
//  Created by brubru on 02.07.2023.
//

import SwiftUI
import WebKit

struct LessonScreen: View {
	
	@Binding var currentSubViews: [AnyView]
	@Environment(\.openWindow) private var openWindow
	@EnvironmentObject var selectedLessonView: SelectedLessonView
	@StateObject private var selectedLesson: LessonViewModel
	
	init(currentSubViews: Binding<[AnyView]>, lesson: LessonViewModel) {
		_currentSubViews = currentSubViews
		_selectedLesson = StateObject(wrappedValue: lesson)
	}
	
	var body: some View {
		VStack(spacing: 0) {
			
			CustomWebView(scrollToAnchor: selectedLesson.htmlID,
						  htmlContent: selectedLesson.htmlFilePath
			)
		}
		.background(ConstantsColor.darkGray)
		
		VStack {
			if selectedLesson.task != nil {
				HStack {
					Spacer()
					Button(action: showTaskScreen ) {
						ZStack {
							RoundedRectangle(cornerRadius: 10)
								.fill(ConstantsColor.redRich)
							Text("Решать задачи")
								.font(.system(size: 18))
						}
						.frame(width: 140, height: 40)
					}
					.buttonStyle(PlainButtonStyle())
				}
				.padding(20)
				Spacer()
			}
		}
		
		.toolbar {
			ToolbarItem(placement: .navigation) {
				Button(action: { withAnimation(.easeOut(duration: 0.6)) {
					currentSubViews.removeAll()
				}
				}) {
					Image(systemName: "chevron.backward")
				}
			}

			ToolbarItem(placement: .cancellationAction) {
				Button(action: {
						selectedLesson.pressButton()
				}) {
					HStack {
						if selectedLesson.isCompleted {
							Text("Отменить")
							Image(systemName: "checkmark.square")
						} else {
							Text("Отметить как выполненный")
							Image(systemName: "square")
						}
					}
				}
			}
		}
	}
	
	private func showTaskScreen() {
		selectedLessonView.selectedLesson = selectedLesson
		openWindow(id: "task-window")
	}
}
