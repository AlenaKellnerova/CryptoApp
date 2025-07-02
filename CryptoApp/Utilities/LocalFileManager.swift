//
//  LocalFileManager.swift
//  CryptoApp
//
//  Created by Heimdal Data on 30.06.2025.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() {}
    
    private func createFolderIfNeeded(folderName: String) {
        
        guard let url = getURLForFolder(folderName: folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path()) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory: \(folderName). \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        
        return url.appendingPathComponent(folderName)
    }
    
    // ...directory/folderName/imageId.png
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderUrl = getURLForFolder(folderName: folderName) else { return nil }
        
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // 1. create folder if needed
        // 2. get url + data for image
        // 3. save image
        
        createFolderIfNeeded(folderName: folderName)
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            let data = image.pngData()
                else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image: \(imageName). Error: \(error)")
        }
    }
    
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
        FileManager.default.fileExists(atPath: url.path())
        else { return nil }
        
        return UIImage(contentsOfFile: url.path())
    }
}
