//
//  CourseRectengleView.swift
//  SwiftPractice
//
//  Created by brubru on 04.07.2023.
//

import SwiftUI

struct CourseRectengleView: View {
	let course: CourseViewModel
	var onSelected: (CourseViewModel) -> Void
	
	var body: some View {
		Button(action: {
			onSelected(course)
		}) {
			HStack(alignment: .top) {
				VStack(alignment: .leading, spacing: 10) {
					Text(course.title.uppercased())
						.foregroundColor(.white)
						.font(.system(size: 18))
					Text(course.subTitle)
						.foregroundColor(.white)
						.font(.system(size: 18))
					Text(course.description)
						.foregroundColor(.white)
						.font(.system(size: 12))
				}
				
				Spacer(minLength: 20)
				
				Image(course.image)
					.resizable()
					.scaledToFit()
					.frame(height: 200)
			}
			.padding(10)
			.background(Gradient(colors: [Color(course.color), ConstantsColor.blueLight]))
			.cornerRadius(15)
			.shadow(color: Color(.white), radius: 7)
			.overlay {
				RoundedRectangle(cornerRadius: 10)
					.stroke(.gray, lineWidth: 1)
			}
			.frame(width: 390)
		}
		.buttonStyle(PlainButtonStyle())
		//.padding(.leading, 20) //этот паддинг применяется не к внутренностям прямоугольника а к нему и благодаря это паддингу мы видим слева подсветку и она не срезается то есть увеличиваем область видимости прямоугольник
	}
}


//struct CourseRectengleView_Previews: PreviewProvider {
//	static var previews: some View {
//		VStack {
//			CourseRectengleView(course: CourseViewModel(course: Course.courses[0])) { _ in
//				print("hi")
//			}
//		}
//	}
//}
