//
//  ReadFile.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

protocol ReadFile {
    func getData(fileName: String, fileExtension: String) throws -> Data
}
