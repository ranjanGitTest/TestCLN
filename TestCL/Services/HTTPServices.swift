//
//  HTTPServices.swift
//  TestCL
//
//  Created by Ranjan on 16/08/24.
//

import Foundation

// MARK: - Handle API Error -
enum APIError: Error {
    case invalidURL
    case nonSuccessResponse
}

protocol ApiServices: AnyObject {
    func performAPICallPhotos<T: Codable>(urlString: String) async throws -> T
    func getPhotosFromURL(urlString: String) async throws -> Data
}

final class HTTPServices: ApiServices {
    
    func performAPICallPhotos<T: Codable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        
        
        let (apiData, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpStatusCode = (urlResponse as? HTTPURLResponse)?.statusCode, httpStatusCode == 200 else {
            throw APIError.nonSuccessResponse
        }
        
        // MARK: - Parse data
        return try JSONDecoder().decode(T.self, from: apiData)
    }
    
     func getPhotosFromURL(urlString: String) async throws -> Data{
         guard let url = URL(string: urlString) else {
             throw APIError.invalidURL
         }
         let urlRequest = URLRequest(url: url)
         
         
         let (apiData, urlResponse) = try await URLSession.shared.data(for: urlRequest)
         
         guard let httpStatusCode = (urlResponse as? HTTPURLResponse)?.statusCode, httpStatusCode == 200 else {
             throw APIError.nonSuccessResponse
         }
        return apiData
     }

}
