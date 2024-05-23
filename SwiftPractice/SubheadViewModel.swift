//
//  SubheadViewModel.swift
//  SwiftPractice
//
//  Created by Наталья Миронова on 24.09.2023.
//

import Foundation

struct SubheadViewModel: Identifiable, Equatable {

	let id = UUID()

	private var subhead: Subhead
	
	init(subhead: Subhead) {
		self.subhead = subhead
	}
	
	var date: String {
		subhead.date
	}
	
	var isMain: Bool {
		subhead.isMain
	}
	
	var title: String {
		subhead.title
	}
	
	var htmlID: String {
		subhead.htmlID
	}
	
	var htmlFilePath: String {
		subhead.htmlFilePath
	}

	static func == (lhs: SubheadViewModel, rhs: SubheadViewModel) -> Bool {
		lhs.id == rhs.id
	}
}

