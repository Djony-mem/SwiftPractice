//
//  LessonCellView.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 28.09.2023.
//

import SwiftUI

struct LessonCellView: View {
	@Binding var currentSubviews: [AnyView]
	@ObservedObject var lesson: LessonViewModel
	var onSelected: () -> Void
	
	var body: some View {
		Button(action: { onSelected()
		}) {
		VStack {
			VStack(spacing: 3) {
				Text(lesson.title)
					.multilineTextAlignment(.center)
					.foregroundColor(.white)
					.font(.title2)
					.fontWeight(.bold)
					.padding(.horizontal, 15)
			}
			.padding()
			
			HStack {
				VStack(alignment: .leading) {
					ForEach(lesson.subheads) { subhead in
						Text("♦️ \(subhead.title)")
							.lineLimit(1)
							.multilineTextAlignment(.leading)
					}
				}
				Spacer()
			}
			.padding(.leading, 15)
			
			Spacer()
			HStack {
				Spacer()
				Image(systemName: lesson.isCompleted ? "checkmark.seal.fill" : "")
					.resizable()
					.frame(width: 20, height: 20)
					.foregroundStyle(.cyan)
					.padding()
			}
		}
		.frame(width: 250, height: 210)
		.background(ConstantsColor.darkGrayPurple)
		.cornerRadius(20)
		.shadow(color: .black, radius: 7)
		.overlay(
			RoundedRectangle(cornerRadius: 20)
				.stroke(Color.gray, lineWidth: 1)
		)
											}
											.buttonStyle(PlainButtonStyle())
	}
}
