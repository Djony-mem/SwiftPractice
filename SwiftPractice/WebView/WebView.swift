	//
	//  WebView.swift
	//  SwiftPractice
	//
	//  Created by brubru on 02.07.2023.
	//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
	var scrollToAnchor: String
	let htmlContent: String

	func makeNSView(context: Context) -> WKWebView {
		
		let userContentController = WKUserContentController()
		userContentController.add(context.coordinator, name: "download")
		
		let configuration = WKWebViewConfiguration()
		configuration.userContentController = userContentController
		
		let webView = WKWebView(frame: .zero, configuration: configuration)
		webView.navigationDelegate = context.coordinator
		webView.setValue(false, forKey: "drawsBackground")
		
		return webView
	}
	
	func updateNSView(_ nsView: WKWebView, context: Context) {
		
		guard let htmlFileURL = Bundle.main.url(forResource: htmlContent, withExtension: "html") else {
			print("HTML file not found")
			return
		}
		
		let htmlString = try? String(contentsOf: htmlFileURL, encoding: .utf8)
		
		context.coordinator.valueChange(scrollToAnchor)
		
		if let htmlString = htmlString {
			let baseUrl = htmlFileURL.deletingLastPathComponent()
			nsView.loadHTMLString(htmlString, baseURL: baseUrl)
			nsView.navigationDelegate = context.coordinator
		}
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
}

extension WebView {
	class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
		var hasAddedScriptMessageHandler = false
		var parent: WebView
		var webView: WKWebView?
		
		init(_ parent: WebView) {
			self.parent = parent
		}
		
		func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
			self.webView = webView
			webView.evaluateJavaScript("document.getElementById('\(parent.scrollToAnchor)').scrollIntoView({ behavior: 'smooth' }).$animate;", completionHandler: nil)
		}

		func valueChange(_ value: String) {
			parent.scrollToAnchor = value
		}
		
		func userContentController(
			_ userContentController: WKUserContentController,
			didReceive message: WKScriptMessage
		) {
			if let urlStr = message.body as? String,
			   let url = URL(string: urlStr) {
				let request = URLRequest(url: url)
				let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
					if let error = error {
						print("Error: \(error)")
					} else if let data = data {
						DispatchQueue.main.async {
							self.messageToWebview(msg: "Загрузка завершена.")
							self.saveFile(data: data, suggestedFileName: url.lastPathComponent)
						}
					}
				}
				task.resume()
			}
		}
		
		func messageToWebview(msg: String) {
			self.webView?.evaluateJavaScript("webkit.messageHandlers.download.onMessage('\(msg)')")
		}
		
		private func saveFile(data: Data, suggestedFileName: String) {
			let openPanel = NSOpenPanel()
			openPanel.canChooseFiles = false
			openPanel.canChooseDirectories = true
			openPanel.canCreateDirectories = true
			openPanel.title = "Choose a Directory"
			openPanel.prompt = "Done"

			openPanel.begin { (result) in
				if result.rawValue == NSApplication.ModalResponse.OK.rawValue, let directoryURL = openPanel.url {
					let fileURL = directoryURL.appendingPathComponent(suggestedFileName)
					
					do {
						try data.write(to: fileURL)
					} catch {
						if let cocoaError = error as? CocoaError,
						   cocoaError.code == .fileWriteNoPermission {
							self.requestPermission(for: directoryURL)
						}
					}
				}
			}
		}
		
		private func requestPermission(for directoryURL: URL) {
			let alert = NSAlert()
			alert.messageText = "Permission Required"
			alert.informativeText = "Your application requires permission to save files in the selected directory. Would you like to grant permission?"
			alert.addButton(withTitle: "Grant Permission")
			alert.addButton(withTitle: "Cancel")
			
			if alert.runModal() == .alertFirstButtonReturn {
				if directoryURL.startAccessingSecurityScopedResource() {
					
					let bookmarkData = try? directoryURL.bookmarkData(options: .withSecurityScope, includingResourceValuesForKeys: nil, relativeTo: nil)
					if let bookmarkData = bookmarkData {
						UserDefaults.standard.set(bookmarkData, forKey: "SavedDirectoryBookmark")
						do {
							try bookmarkData.write(to: directoryURL.appendingPathComponent("archive.zip"))
							print("File saved successfully at: \(directoryURL.path)")
						} catch {
							print("Error saving file: \(error)")
						}
					}
				}
			}
		}
	}
}
