//
//  DynamicHGrid.swift
//  SwiftPractice
//
//  Created by brubru on 17.07.2023.
//

import SwiftUI

struct DynamicHGrid<Content: View>: View {
	@ViewBuilder var content: () -> Content
	
	var body: some View {
			ScrollView(.horizontal) {
				LazyHGrid(rows: [GridItem(.fixed(250))], alignment: .center, spacing: 30, content: content)
					.padding(.horizontal, 30)
			}
			.scrollIndicators(.hidden)
	}
}

struct DynamicHGrid_Previews: PreviewProvider {
	static var previews: some View {
		DynamicHGrid {
			
		}
	}
}
