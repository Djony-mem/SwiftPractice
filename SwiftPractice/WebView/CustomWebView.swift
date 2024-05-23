//
//  CustomWebView.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 27.07.2023.
//

import SwiftUI

struct CustomWebView: View {
	@State private var opacity = 0.0
	var scrollToAnchor: String
	let htmlContent: String
	
	var body: some View {
		VStack {
			WebView(scrollToAnchor: scrollToAnchor, htmlContent: htmlContent)
				.frame(maxWidth: .infinity)
				.padding(.bottom, 0)
				.opacity(opacity)
		}
		.onAppear {
			withAnimation(.easeIn(duration: 1.0)) {
				opacity = 1
			}
		}
	}
}
//
//struct CustomWebView_Previews: PreviewProvider {
//    static var previews: some View {
//		CustomWebView(scrollToAnchor: "", htmlContent: "")
//    }
//}
