//
//  HexMatcher.swift
//  XcodeColorSense
//
//  Created by Khoa Pham on 17/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Cocoa

public struct HexStringMatcher: Matcher {

  func check(line: String, selectedText: String) -> (color: NSColor, range: NSRange)? {
    let pattern = "\"#?[A-Fa-f0-9]{6}\""
    
    guard let range = Regex.check(line, pattern: pattern)
      else { return nil }

    let text = (line as NSString).substringWithRange(range).replace("\"", with: "")
    let color = NSColor.hex(text)

    return (color: color, range: range)
  }
}

public struct HexIntMatcher: Matcher {
    
    func check(line: String, selectedText: String) -> (color: NSColor, range: NSRange)? {
        guard line.contains("UIColor") || line.contains("NSColor") else { return nil }
        
        let pattern = "0x[A-Fa-f0-9]{6}"
        
        guard let range = Regex.check(line, pattern: pattern)
            else { return nil }
        
        let text = (line as NSString).substringWithRange(range).replace("0x", with: "")
        let color = NSColor.hex(text)
        
        return (color: color, range: range)
    }
}
