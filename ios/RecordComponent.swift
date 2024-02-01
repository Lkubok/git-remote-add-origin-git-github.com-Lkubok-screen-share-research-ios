//
//  RecordComponent.swift
//  researchTwo
//
//  Created by Łukasz Kubok on 06/12/2023.
//

import Foundation
import ReplayKit
import React

@objc(RecordComponent)
class RecordComponent: RCTViewManager {

  override func view() -> UIView! {
    if #available(iOS 12.0, *) {
      let pickerView = RPSystemBroadcastPickerView(
               frame: CGRect(x: 50, y: 50, width: 150, height:150))
      pickerView.translatesAutoresizingMaskIntoConstraints = false

      // Update the color of the Button
      // to make it visible clearly on a white background
      if let button = pickerView.subviews.first as? UIButton {
        button.imageView?.tintColor = UIColor.red
      }

      return pickerView
    } else {
      let label = UILabel()
      label.text = "Screen Recording Not Supported"
      return label
    }
  }
  
  @objc func showSaveView(_ node:NSNumber, fileName:NSString) {
    let sharedContainerURL :URL?  = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.org.reactjs.native.example.ScreenRecordingDemo")
    let directoryContents = try! FileManager.default.contentsOfDirectory(at: sharedContainerURL!, includingPropertiesForKeys: nil, options: [])
    let sourceUrl = sharedContainerURL?.appendingPathComponent(fileName as String)
    let activityViewController = UIActivityViewController(activityItems: [sourceUrl], applicationActivities: nil)
    DispatchQueue.main.async {
      self.bridge.uiManager.view(forReactTag: node)?.reactViewController()?.present(activityViewController, animated: true, completion: nil)
    }
  }
}
