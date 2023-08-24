//
//  ReadFile.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

protocol ReadFile {
    func read() async throws -> Data
}
