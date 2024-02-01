//
//  FileSystemUtil.swift
//  researchTwo
//
//  Created by Łukasz Kubok on 06/12/2023.
//

import Foundation

class FileSystemUtil
{
  internal class func createReplaysFolder()
  {
     let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
     if let documentDirectoryPath = documentDirectoryPath {
        // create the custom folder path
        let replayDirectoryPath = documentDirectoryPath.appending("/Replays")
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: replayDirectoryPath) {
          do {
            try fileManager.createDirectory(atPath: replayDirectoryPath, withIntermediateDirectories: false, attributes: nil)
          } catch {
            print("Error creating Replays folder in documents dir: \(error)")
          }
       }
     }
  }
  internal class func filePath(_ fileName: String) -> String
  {
    createReplaysFolder()
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0] as String
    let filePath : String = "\(documentsDirectory)/Replays/\(fileName).mp4"
    return filePath
  }
}
