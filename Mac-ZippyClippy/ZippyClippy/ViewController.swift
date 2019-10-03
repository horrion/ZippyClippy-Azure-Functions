//
//  ViewController.swift
//  ZippyClippy
//
//  Created by Robert Horrion on 9/27/19.
//  Copyright © 2019 Robert Horrion. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following two lines for UI debugging
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

