//
//  AppError.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/15/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import Foundation
enum AppError: Error {
  case badURL(String)
  case noResponse
  case networkClientError(Error)
  case noData
  case decodingError(Error)
  case encodingError(Error)
  case badStatusCode(Int)
  case badMimeType(String)
}

