//
//  CourseDescriptionScreen.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 07.08.2023.
//

import SwiftUI

struct CourseDescriptionScreen: View {
	
	let course: CourseViewModel
	
	var body: some View {
		VStack {
			HStack {
				Image(course.image)
					.resizable()
					.scaledToFit()
				VStack {
					Text(course.subTitle)
						.font(.largeTitle)
					Spacer()
					ActionButton(color: .red, title: "Начать", action: { })
					Spacer()
				}
				Spacer()
			}
			.frame(height: 150)
			Divider()
				.background(.white)
			//TODO: когда появятся данные вызывай через SustomView
			//CustomWebView(scrollToAnchor: "", htmlContent: "")
			Text("Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.")
				.font(.title)
				.foregroundColor(.white)
			List(course.lessons, children: \.subheads) { lesson in
				Text(lesson.title)
					.font(.title2)
			}
			.scrollContentBackground(.hidden)
			.scrollDisabled(true)
			.padding(.vertical, -4)
			Spacer()
		}
		.frame(width: 1000)
		.padding()
		.background(Image("Back"))
	}
}
