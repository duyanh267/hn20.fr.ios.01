//
//  ImageFileManager.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/11/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

protocol ImageFileManagerProtocol {
    func saveImageFromDocument(_ image: UIImage, _ imageName: String, _ folder: String) -> Bool
    func loadImageNameFromDocuments(_ imageName: String, _ folder: String?) -> UIImage?
}

class ImageFileManager {
    func creatFolderDirectory(_ folderName: String) {
        guard let folderPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent(folderName) else { fatalError() }
        do {
            try FileManager.default.createDirectory(atPath: folderPath.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error.localizedDescription)
        }
        print(folderPath)
    }
    
    func getDocumentDirectory(_ folderName: String?) -> URL? {
        if let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            if let folderName = folderName {
                let folderPath = path.appendingPathComponent(folderName)
                return folderPath
            } else {
                return path
            }
        } else {
            return nil
        }
    }
}

extension ImageFileManager: ImageFileManagerProtocol {
    func saveImageFromDocument(_ image: UIImage, _ imageName: String, _ folder: String) -> Bool {
        guard let url = getDocumentDirectory(folder)?.appendingPathComponent(imageName) else { return false }
        do {
            if let imageData = image.pngData() {
                try imageData.write(to: url)
                return true
            } else {
                return false
            }
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
    
    func loadImageNameFromDocuments(_ imageName: String, _ folder: String?) -> UIImage? {
        guard let url = getDocumentDirectory(folder)?.appendingPathComponent(imageName) else { return nil }
        let image = UIImage(contentsOfFile: url.path)
        return image
    }
}
