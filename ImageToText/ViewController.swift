//
//  ViewController.swift
//  ImageToText
//
//  Created by Md Zahidul Islam Mazumder on 20/5/19.
//  Copyright © 2019 Md Zahidul islam. All rights reserved.
//

import UIKit
import TesseractOCR
class ViewController: UIViewController,G8TesseractDelegate {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tesseract = G8Tesseract(language: "eng"){
            tesseract.delegate = self
            tesseract.image = UIImage(named: "sc")
            tesseract.recognize()
            
            textView.text = tesseract.recognizedText
        }
        
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print(tesseract.progress)
        progressLabel.text = String( tesseract.progress )
    }


}

