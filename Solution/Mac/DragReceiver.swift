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
        
        
        
        let fileName = urls[0].deletingPathExtension().lastPathComponent
        let fileNameExtension = urls[0].pathExtension
        
        print("file Name: " + fileName)
        print("file extension: " + fileNameExtension)
        
        
        let headers = [
          "Accept": "*/*",
          "Cache-Control": "no-cache",
          "Host": "zippyclippy.azurewebsites.net",
          "Accept-Encoding": "gzip, deflate",
          "Connection": "keep-alive",
          "cache-control": "no-cache"
        ]

        let urlString =  "https://zippyclippy.azurewebsites.net/api/ZippyClippy?fileName=" + fileName + "&fileNameExtension=" + fileNameExtension + "&code=4j5Vxza6unwHKftLx0rm5YdDqVv08EL8jQ0FuBC9lXXR0OAOVe9ITA=="
        
        
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers

        do {
            let data = try Data(contentsOf: urls[0])
            
            request.httpBody = data
            
        } catch {
            print(error.localizedDescription)
        }
        
        //request.httpBody = Data(contentsOf: urls[0])

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error!)
          } else {
            let httpResponse = response as? HTTPURLResponse

            //Get binary here and save to disk
            var outputFileURL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!

            outputFileURL.appendPathComponent("output")
            outputFileURL.appendPathExtension("zip")


            do {
                try //FileManager.default.createDirectory(at: downloadsDirectoryWithFolder, withIntermediateDirectories: true, attributes: nil)
                data?.write(to: outputFileURL)
                print("successfully wrote to Downloads")
            } catch let error as NSError {
                print(error.localizedDescription)
            }

            print(httpResponse!)
          }
        })

        dataTask.resume()
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
