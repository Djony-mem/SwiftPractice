//
//  ConstantColor.swift
//  SwiftPractice
//
//  Created by brubru on 08.07.2023.
//

import SwiftUI

enum ConstantsColor {
	//silver используется в боковом меню, как цвет текста, когда строка не выбрана
	static let silver = Color(
		cgColor: CGColor(
			red: 0.604,
			green: 0.604,
			blue: 0.604,
			alpha: 1
		)
	)
	// как задний фон, он схож с darkGrayPurple точно ли оба нужны
	static let darkGray = Color(
		nsColor: NSColor(
			red: 46/255,
			green: 48/255,
			blue: 51/255,
			alpha: 1
		)
	)
	//используется как background(с прозрачностью 0,4) в боковом меню
	static let darkGrayPurple = Color(
		cgColor: CGColor(
			red: 0.160,
			green: 0.165,
			blue: 0.186,
			alpha: 1
		)
	)
	// подсветка блоков, разделительная полоска, обводка хедервью на главном экране
	static let blueLight = Color(
		cgColor: CGColor(
			red: 0.712,
			green: 0.720,
			blue: 0.804,
			alpha: 1
		)
	)
	//оранжевый у нас везде
	static let orangeRich = Color(
		nsColor: NSColor(
			red: 237/255,
			green: 112/255,
			blue: 45/255,
			alpha: 1
		)
	)
	
	static let lightGreen = Color(
		nsColor: NSColor(
			red: 184/255,
			green: 226/255,
			blue: 151/255,
			alpha: 1
		)
	)
	
	static let redRich = Color(
		nsColor: NSColor(
			red: 235/255,
			green: 87/255,
			blue: 80/255,
			alpha: 1
		)
	)
}
