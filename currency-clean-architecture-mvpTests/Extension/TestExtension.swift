//
//  TestExtension.swift
//  DataTests
//
//  Created by Alessandro Comparini on 07/08/23.
//

import Foundation
import XCTest

//  MARK: - MEMORY LEAK
extension XCTestCase {
    func checkMemoryLeak(for instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, file: file, line: line)
        }
    }
}
