//
//  ViewController.swift
//  nuanceapp
//
//  Created by Tanmay Bakshi on 2016-04-21.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import UIKit
import SpeechKit

class ViewController: UIViewController, SKTransactionDelegate {
    
    @IBOutlet var recordButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnClicked() {
        recordButton.setTitle("Listening", forState: .Normal)
        let session = SKSession(URL: NSURL(string: "nmsps://NMDPTRIAL_tajy_many_gmail_com20160421150722@sslsandbox.nmdp.nuancemobility.net:443"), appToken: "25758f3a7d733d7c677a3b52fa0126199a329054d5e92f823bdf44aedf413904b6c83f343b7cb0a2f6ebf5f1ec1b0a874d9adb23840aa5bfe9e96dc92aa7cde0")
        session.recognizeWithType(SKTransactionSpeechTypeDictation,
            detection: .Long,
            language: "eng-USA",
            delegate: self)
    }

    func transaction(transaction: SKTransaction!, didReceiveRecognition recognition: SKRecognition!) {
        resultLabel.text = recognition.text
        recordButton.setTitle("Listen", forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

