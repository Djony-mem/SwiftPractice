//
//  HederView.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 28.09.2023.
//

import SwiftUI

struct HederView: View {
	let course: CourseViewModel
	
	var body: some View {
		HStack(spacing: 20) {
			Image(course.image)
				.resizable()
				.scaledToFit()
			
			VStack(alignment: .leading) {
				Text(course.subTitle)
					.foregroundColor(.red)
					.font(.system(size: 30))
					.padding(.bottom, 20)

				Text(course.description)
					.font(.system(size: 22))
				Spacer()
			}
			Spacer()
		}
		.frame(width: 800, height: 200)
	}
}

