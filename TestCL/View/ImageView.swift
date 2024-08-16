//
//  ImageView.swift
//  TestCL
//
//  Created by Ranjan on 16/08/24.
//

import SwiftUI

struct URLImage: View {
    var urlString: String
    @State var dataImg: Data?
    var body: some View {
        if let imageData = dataImg, let currentImage = UIImage(data: imageData)  {
            Image(uiImage: currentImage)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .backgroundStyle(Color.gray)
        } else {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 150, height: 150)
                .backgroundStyle(Color.gray)
                .tint(.blue)
                .onAppear(perform: {
                    Task {
                        do {
                            _ = try await fetchData()
                        } catch let error {
                            print(error.localizedDescription)
                        }
                    }
                })
        }
    }
    
   @MainActor private func fetchData() async throws {
       do {
           let apiData = try await HTTPServices().getPhotosFromURL(urlString: urlString)
           self.dataImg = apiData
       } catch let error {
           print(error.localizedDescription)
       }
        
    }
}
