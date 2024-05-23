//
//  TaskButton.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 22.07.2023.
//

import SwiftUI

struct TaskButton: View {
	let color: Color
	let title: String
	let action: () -> Void
	
	var body: some View {
		Button {
			action()
		} label: {
			Text(title)
				.foregroundColor(.white)
				.font(.system(size: 15))
				.fontWeight(.bold)
				.padding(.horizontal, 16)

		}
		.frame(height: 45)
		.background(color)
		.cornerRadius(10)
		.buttonStyle(.borderless)
	}
}

struct TaskButton_Previews: PreviewProvider {
    static var previews: some View {
        TaskButton(color: .red, title: "Читать") {
			
		}
    }
}
