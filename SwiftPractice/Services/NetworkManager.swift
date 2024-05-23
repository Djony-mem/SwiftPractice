//
//  NetworkManager.swift
//  SwiftPractice
//
//  Created by brubru on 28.04.2024.
//

import Foundation

enum NetworkError: Error {
	case invalidURL
	case failedConvertHTML
}

final class NetworkManager {
	
	static let shared = NetworkManager()
	
	private init() {}
	
	func fetchHTML(url: String) async throws -> String {
		guard let htmlFileURL = URL(string: url) else {
			throw NetworkError.invalidURL
		}
		
		let (data, _) = try await URLSession.shared.data(from: htmlFileURL)
		
		if let htmlString = String(data: data, encoding: .utf8) {
			return htmlString
		} else {
			throw NetworkError.failedConvertHTML
		}
	}
}
