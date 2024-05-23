//
//  HomeView.swift
//  SwiftPractice
//
//  Created by brubru on 30.06.2023.
//

import SwiftUI

struct HomeView: View {
	@StateObject private var viewModel = CourseListViewModel()
	
    var body: some View {
		VStack {
			Text("Список доступных курсов:")
				.foregroundColor(.red)
				.font(.system(size: 30))
			CoursList(courses: viewModel.courseViewModels)
				.frame(width: 900, height: 600)
		}.task {
			viewModel.getCourses()
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

