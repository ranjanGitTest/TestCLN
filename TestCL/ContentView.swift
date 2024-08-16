//
//  ContentView.swift
//  TestCL
//
//  Created by Ranjan on 16/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var photoViewModel = PhotoListViewModel(service: HTTPServices())
    var body: some View {
        NavigationView {
            List {
                ForEach(photoViewModel.photosHits, id: \.id) {  photo in
                    HStack {
                        URLImage(urlString: photo.previewURL, dataImg: nil)
                        Text("\(photo.type)")
                        Spacer()
                    }
                }
            }
            .onAppear{
                photoViewModel.getPhotoslistResponse()
            }
            .listStyle(.plain)
            .navigationTitle(" Photo List")
        }
    }
        
}


#Preview {
    ContentView()
}
