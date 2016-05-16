//
//  PreviewView.swift
//  XcodeColorSense
//
//  Created by Khoa Pham on 16/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Cocoa

class PreviewView: NSColorWell {

  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)

    bordered = false
    layer?.borderColor = NSColor.brownColor().CGColor
    layer?.borderWidth = 1.0
  }

  required init?(coder: NSCoder) {
    fatalError()
  }
}
