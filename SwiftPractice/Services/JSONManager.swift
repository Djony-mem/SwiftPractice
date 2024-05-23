//
//  DataManager.swift
//  SwiftPractice
//
//  Created by brubru on 04.07.2023.
//

import Foundation

enum JSONError: Error {
	case invalidPath
	case decodingError
}


final class JSONManager {
	static let shared = JSONManager()
	
	private init() {}
	
	func fetch<T: Decodable>(dataType: T.Type, for resource: String) async throws -> T {
		guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
			throw JSONError.invalidPath
		}
		let url: URL
		if #available(macOS 13.0, *) {
			url = URL(filePath: path)
		} else {
			url = URL(fileURLWithPath: path)
		}
		
		do {
			let data = try Data(contentsOf: url)
			let type = try JSONDecoder().decode(T.self, from: data)
			return type
		} catch {
			throw JSONError.decodingError
		}
	}
}
