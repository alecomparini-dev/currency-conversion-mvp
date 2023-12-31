//
//  URLFactory.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 21/08/23.
//

import Foundation

func makeApiURL(path: String = "") -> URL {
    return URL(string: "\(Environment.variable(.apiBaseUrl))\(path)")!
}
