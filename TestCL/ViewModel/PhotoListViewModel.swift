//
//  PhotoListViewModel.swift
//  TestCL
//
//  Created by Ranjan on 16/08/24.
//

import SwiftUI



 class PhotoListViewModel: ObservableObject {
     
    @Published var photosHits: [Hit] = []
    var services: ApiServices
     
     init( service: ApiServices) {
         self.services = service
     }
    
    func getPhotoslistResponse() {
            Task { @MainActor in
                let data: PhotosModel = try await services.performAPICallPhotos(urlString: Constant.url)
                photosHits = data.hits
            }
    }
}
