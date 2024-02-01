//
//  SharedFileSystemRCT.swift
//  researchTwo
//
//  Created by Łukasz Kubok on 06/12/2023.
//

import Foundation


@objc(SharedFileSystemRCT)
class SharedFileSystemRCT: NSObject {
  
  var groupIdentifier = "group.org.reactjs.native.example.ScreenRecordingDemo"
  
  @objc
  func getAllFiles(_ resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
    let sharedContainerURL :URL?  = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupIdentifier)
    let directoryContents = try! FileManager.default.contentsOfDirectory(at: sharedContainerURL!, includingPropertiesForKeys: [.contentModificationDateKey], options: [])
    //sort the files by last modified date
    let sortedContents = directoryContents.sorted { (a, b) -> Bool in
      let adate = (try? a.resourceValues(forKeys: [.contentModificationDateKey]))?.contentModificationDate ?? Date.distantPast
      let bdate = (try? b.resourceValues(forKeys: [.contentModificationDateKey]))?.contentModificationDate ?? Date.distantPast
      return adate > bdate
    }
    
    // create a simple list of objects for javascript
    let finalData = sortedContents.map { (URL) -> Dictionary<String, Any> in
      return [
        "absolutePath": URL.absoluteString,
        "relativePath": URL.relativePath
      ]
    }
    resolve(finalData)
  }
}
