//
//  TopicState.swift
//  SwiftPractice
//
//  Created by brubru on 18.07.2023.
//

import Foundation

@MainActor
class TopicState: ObservableObject {
	@Published var topicListVM: TopicListViewModel = TopicListViewModel(
		topicList: TopicList(topics: [Topic(title: "", courses: [])])
	)
	
		/// свойство для хранения имени JSON с курсами.
	private let mainResource = "courses"
	
		/// Метод по загрузки данных из JSON courses
	func fetchTopicList() async {
		do {
			let topicList = try await JSONManager.shared.fetch(dataType: TopicList.self, for: mainResource)
			topicListVM = TopicListViewModel(topicList: topicList)
		} catch {
			print(error)
		}
	}
}
