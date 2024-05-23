//
//  CourseListScreen.swift
//  SwiftPractice
//
//  Created by brubru on 05.07.2023.
//

import SwiftUI

struct CourseListScreen: View {
	@StateObject private var topicState = TopicState()
	@State private var currentSubviews: [AnyView] = []
	
	var storageService = StorageService()
	
	var body: some View {
		CustomNavigationStack(currentSubviews: $currentSubviews) {
			ScrollView {
				HederMainView()
				ForEach(topicState.topicListVM.topics, id: \.id) { topic in
					VStack(alignment: .leading, spacing: 20) {
						Text(topic.title)
							.font(.largeTitle)
							.padding(.leading, 30)
						
						CourseListView(courses: topic.courseViewModel) { course in
							withAnimation(.easeOut(duration: 0.6)) {
								currentSubviews.append(AnyView(CourseDescriptionScreen(course: course)))
							}
						}
						
						Divider()
							.background(ConstantsColor.blueLight)
							.padding(.leading, 30)
					}
				}
			}
			.scrollIndicators(.hidden)
			.task {
				await topicState.fetchTopicList()
			}
			.frame(minWidth: 910, minHeight: 650)
			.background(Image("bgHeader").resizable().scaledToFill())
			.toolbar {
				Text("")
			}
		}
	}
}



