//
//  NavigationStack.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 07.08.2023.
//

import SwiftUI

struct CustomNavigationStack<RootContent>: View where RootContent: View {
	@Binding var currentSubviews: [AnyView]
	let rootView: () -> RootContent
	
	init(currentSubviews: Binding<[AnyView]>, @ViewBuilder rootView: @escaping () -> RootContent) {
		self._currentSubviews = currentSubviews
		self.rootView = rootView
	}
	
	var body: some View {
		VStack {
			if currentSubviews.isEmpty {
				rootView()
			} else {
				ZStack {
					ForEach(0..<currentSubviews.count, id: \.self) { indexView in
						currentSubviews[indexView]
							.transition(.move(edge: .trailing))
					}
				}
				.transition(.move(edge: .trailing))
				.toolbar {
					if currentSubviews.count < 2 {
						ToolbarItem(placement: .navigation) {
							Button(action: {
								withAnimation(.easeOut(duration: 0.6)) {
									_ = currentSubviews.popLast()
									
								}
							}, label: {
								Image(systemName: "house.fill")
									.foregroundStyle(.cyan)
							})
						}
					}
				}
			}
		}
	}
}
