//
//  DynamicVGrid.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 20.09.2023.
//
//
import SwiftUI

struct DynamicVGrid<Content: View>: View {
	@ViewBuilder var content: () -> Content
	
	var body: some View {
		
		LazyVGrid(columns: [GridItem(.adaptive(minimum: 250), spacing: 30)], alignment: .center, spacing: 30, content: content)
	}
}
