//
//  HederMainView.swift
//  SwiftPractice
//
//  Created by brubru on 17.07.2023.
//

import SwiftUI

struct HederMainView: View {
	var body: some View {
		HStack {
			DynamicStack {
				Image("logoLight")
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 100)
				VStack(spacing: 15) {
					Text("Список доступных курсов:")
						.foregroundColor(.white)
						.font(.system(size: 30))
					Text("Список доступных курсов:")
						.foregroundColor(.white)
						.font(.system(size: 17))
				}
			}
		}
		.frame(height: 250)
	}
}


struct HederMainView_Previews: PreviewProvider {
	static var previews: some View {
		HederMainView()
	}
}
