//
//  SecondViewController.swift
//  UserDefault
//
//  Created by Даша Волошина on 17.10.22.

//Создать 5 файлов в папке Cache. Назвать их как myImage, myPhoto, myData, myFile, myDocument. Переместить эти файлы в папку документы. Если этот файл myImage, то запретить его перемещать.

import UIKit

class SecondViewController: UIViewController, FileManagerDelegate {
  
    let fileManager = FileManager()
    
    var cashUrl = try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    
    var documentUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    
    var myImageUrl:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileManager.delegate = self
        
        myImageUrl = cashUrl.appending(component: "myImage")
        var myPhotoUrl = cashUrl.appending(component: "myPhoto")
        var myDataUrl = cashUrl.appending(component: "myData")
        var myFileUrl = cashUrl.appending(component: "myFile")
        var myDocumentUrl = cashUrl.appending(component: "myDocument")
        
        let image = UIImage(named: "cat")!

        
        do {
                let data = image.pngData()!
                try data.write(to: myImageUrl!)
                try data.write(to: myPhotoUrl)
                try data.write(to: myDataUrl)
                try data.write(to: myFileUrl)
                try data.write(to: myDocumentUrl)
                
               
            } catch(let error) {
                  print(error)
            }
        print (cashUrl)
        
        do {
            try fileManager.moveItem(at: myImageUrl!, to: documentUrl.appending(component: myImageUrl!.lastPathComponent))
            
            try fileManager.moveItem(at:myPhotoUrl, to: documentUrl.appending(component: myPhotoUrl.lastPathComponent))
            
            try fileManager.moveItem(at:myDataUrl, to: documentUrl.appending(component: myDataUrl.lastPathComponent))
            
            try fileManager.moveItem(at:myFileUrl, to: documentUrl.appending(component: myFileUrl.lastPathComponent))
            
            try fileManager.moveItem(at:myDocumentUrl, to: documentUrl.appending(component: myDocumentUrl.lastPathComponent))
            
            
        } catch let error {
            print(error)
        }
        
        print (documentUrl)
    }
    
    func fileManager(_ fileManager: FileManager, shouldMoveItemAt srcURL: URL, to dstURL: URL) -> Bool{

        if fileManager.fileExists(atPath: myImageUrl!.absoluteString){

            return true
        }
        
       

         return false
    }
  
}


