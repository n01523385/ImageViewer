//
//  images.swift
//  ImageViewer
//
//  Created by Arunima Das on 2023-04-04.
//

import Foundation

class ImageList {
    
    private var listOfimages = [imagesadded]()
    
    func addNewImage(ns:imagesadded){
        listOfimages.append(ns)
        print(listOfimages)
    }
    
    func getAllImages() -> [imagesadded]{
        return listOfimages
    }
    
}
