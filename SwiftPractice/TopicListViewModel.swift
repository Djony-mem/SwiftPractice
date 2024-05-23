//
//  TypeListViewModel.swift
//  SwiftPractice
//
//  Created by brubru on 17.07.2023.
//

import Foundation

struct TopicListViewModel {
	private let topicList: TopicList
	
	init(topicList: TopicList) {
		self.topicList = topicList
	}
	
	var topics: [TopicViewModel] {
		topicList.topics.map { TopicViewModel(topic: $0) }
	}
}
