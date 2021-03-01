//
//  JSONLoader.swift
//  CoreDataPro (iOS)
//
//  Created by Daniel on 01.03.2021.
//

import Foundation

struct JSONLoader {
    static func loadFile(with name: String) -> Data? {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return nil
        }
        return data
    }
}
