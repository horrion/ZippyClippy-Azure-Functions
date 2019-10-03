//
//  DragReceiver.swift
//  ZippyClippy
//
//  Created by Robert Horrion on 10/3/19.
//  Copyright © 2019 Robert Horrion. All rights reserved.
//

import Cocoa

class DragReceiver: NSView {
    
    // MARK: - VC Lifecycle
    override func awakeFromNib() {
      registerForDraggedTypes([NSPasteboard.PasteboardType.URL])
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // uncomment the following line for UI debugging
//        NSColor.red.setFill()
        NSColor.underPageBackgroundColor.setFill()
        dirtyRect.fill()
        
        self.layer?.cornerRadius = 8
        self.layer?.masksToBounds = true
        
        
        if enteredDraggingView == true {
            NSColor.selectedControlColor.set()
            
            let path = NSBezierPath(rect:bounds)
            path.lineWidth = 10.0
            path.stroke()
        }
    }
    
    
    var enteredDraggingView = false {
        didSet {
            needsDisplay = true
        }
    }
    
    
    
    
    // MARK: - NSDraggingDestination protocol
    func shouldAllowDrag(_ draggingInfo: NSDraggingInfo) -> Bool {
        
        var sourceIsValid = false
        
        let pasteBoard = draggingInfo.draggingPasteboard
        
        if pasteBoard.canReadObject(forClasses: [NSURL.self], options: nil) {
            sourceIsValid = true
        }
        return sourceIsValid
        
    }
    
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
      let allow = shouldAllowDrag(sender)
      enteredDraggingView = true
      return allow ? .copy : NSDragOperation()
    }
    
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
      enteredDraggingView = false
    }
    
    
    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let allow = shouldAllowDrag(sender)
        return allow
    }

    
    override func performDragOperation(_ draggingInfo: NSDraggingInfo) -> Bool {
        
        enteredDraggingView = false
        let pasteBoard = draggingInfo.draggingPasteboard
        
        if let urls = pasteBoard.readObjects(forClasses: [NSURL.self], options: nil) as? [URL], urls.count > 0 {
            processFileUploads(urls)
            return true
        }
        return false
        
    }
    
    
    
    
    // MARK: - Networking/File Uploads
    func processFileUploads(_ urls: [URL]) {
        print("Files selected: ", urls)
        
//        Handle File Upload here
//
// ______________________________________
//< Paste Network handling code below 👻 >
// --------------------------------------
// \
//  \
//     __
//    /  \
//    |  |
//    @  @
//    |  |
//    || |/
//    || ||
//    |\_/|
//    \___/
//
//
        
        
        
        
    }
    
    
    
    
    
}
