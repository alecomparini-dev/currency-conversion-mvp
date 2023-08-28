//
//  ReadFileImp.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 25/08/23.
//

import Foundation

class ReadFileImp: ReadFile {

    func getData(fileName: String, withExtension fileExtension: String) throws -> Data {
        if let fileUrl = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            return try Data(contentsOf: fileUrl)
        }
        
        return Data()
    }
        
}
