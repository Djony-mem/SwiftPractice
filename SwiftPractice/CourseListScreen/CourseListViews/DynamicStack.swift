//
//  DynamicStack.swift
//  SwiftPractice
//
//  Created by brubru on 17.07.2023.
//

import SwiftUI

struct DynamicStack<Content: View>: View {
	var horizontalAlignment = HorizontalAlignment.center
	var verticalAlignment = VerticalAlignment.center
	
	@ViewBuilder var content: () -> Content
	
	var body: some View {
		GeometryReader { proxy in
			Group {
				if proxy.size.width > 600 {
					HStack(
						alignment: verticalAlignment,
						spacing: 50,
						content: content
					)
				} else {
					VStack(
						alignment: horizontalAlignment,
						spacing: 0,
						content: content
					)
				}
			}
			.frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
		}
	}
}

struct DynamicStack_Previews: PreviewProvider {
	static var previews: some View {
		DynamicStack {
			
		}
	}
}
