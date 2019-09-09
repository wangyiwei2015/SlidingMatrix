//  ViewController.swift
//  SlidingMatrixWeb
//
//  !! Important:
//  Please add the WebKit framework in target/Build Phases.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var wv: WKWebView!
    //[!] Connect to a WKWebView on the StoryBoard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 4/255, green: 68/255, blue: 60/255, alpha: 1)
        
        wv.uiDelegate = self
        let smURL = URL(string: "https://eEhyQx.github.io/SlidingMatrix/SlidingMatrix.html")
        let request = URLRequest(url: smURL!)
        wv.load(request)
        
        let swipeLeft = UISwipeGestureRecognizer(target:self, action:#selector(swipeLeft(_:)))
        swipeLeft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target:self, action:#selector(swipeRight(_:)))
        swipeRight.direction = .right
        let swipeUp = UISwipeGestureRecognizer(target:self, action:#selector(swipeUp(_:)))
        swipeUp.direction = .up
        let swipeDown = UISwipeGestureRecognizer(target:self, action:#selector(swipeDown(_:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeUp)
        self.view.addGestureRecognizer(swipeDown)
    }

    @objc func swipeLeft(_ recognizer:UISwipeGestureRecognizer){
        print("swipe left")
        var js: String
        if(recognizer.location(in: self.view).x < UIScreen.main.bounds.width/2) {
            js = "dir=" + keyCode["A"]! + ";cmd=core_location(dir);if (cmd!=null){move(core_position[cmd[0]],cmd[0],cmd[1]);if (is_neat()){if(battle_mod){document.getElementById('solved_window_battle').style.display=\"block\"}else{document.getElementById('more_window_finished').style.display = \"block\"}}}draw();"
        } else {
            js = "dir=" + keyCode["J"]! + ";cmd=core_location(dir);if (cmd!=null){move(core_position[cmd[0]],cmd[0],cmd[1]);if (is_neat()){if(battle_mod){document.getElementById('solved_window_battle').style.display=\"block\"}else{document.getElementById('more_window_finished').style.display = \"block\"}}}draw();"
        }
        wv.evaluateJavaScript(js, completionHandler: nil)
    }
    
    @objc func swipeRight(_ recognizer:UISwipeGestureRecognizer){
        print("swipe right")
        var js: String
        if(recognizer.location(in: self.view).x < UIScreen.main.bounds.width/2) {
            js = "dir=" + keyCode["D"]! + ";cmd=core_location(dir);if (cmd!=null){move(core_position[cmd[0]],cmd[0],cmd[1]);if (is_neat()){if(battle_mod){document.getElementById('solved_window_battle').style.display=\"block\"}else{document.getElementById('more_window_finished').style.display = \"block\"}}}draw();"
        } else {
            js = "dir=" + keyCode["L"]! + ";cmd=core_location(dir);if (cmd!=null){move(core_position[cmd[0]],cmd[0],cmd[1]);if (is_neat()){if(battle_mod){document.getElementById('solved_window_battle').style.display=\"block\"}else{document.getElementById('more_window_finished').style.display = \"block\"}}}draw();"
        }
        wv.evaluateJavaScript(js, completionHandler: nil)
    }
    
    @objc func swipeUp(_ recognizer:UISwipeGestureRecognizer){
        print("swipe up")
        var js: String
        if(recognizer.location(in: self.view).x < UIScreen.main.bounds.width/2) {
            js = "dir=" + keyCode["W"]! + ";cmd=core_location(dir);if (cmd!=null){move(core_position[cmd[0]],cmd[0],cmd[1]);if (is_neat()){if(battle_mod){document.getElementById('solved_window_battle').style.display=\"block\"}else{document.getElementById('more_window_finished').style.display = \"block\"}}}draw();"
        } else {
            js = "dir=" + keyCode["I"]! + ";cmd=core_location(dir);if (cmd!=null){move(core_position[cmd[0]],cmd[0],cmd[1]);if (is_neat()){if(battle_mod){document.getElementById('solved_window_battle').style.display=\"block\"}else{document.getElementById('more_window_finished').style.display = \"block\"}}}draw();"
        }
        wv.evaluateJavaScript(js, completionHandler: nil)
    }
    
    @objc func swipeDown(_ recognizer:UISwipeGestureRecognizer){
        print("swipe down")
        var js: String
        if(recognizer.location(in: self.view).x < UIScreen.main.bounds.width/2) {
            js = "dir=" + keyCode["S"]! + ";cmd=core_location(dir);if (cmd!=null){move(core_position[cmd[0]],cmd[0],cmd[1]);if (is_neat()){if(battle_mod){document.getElementById('solved_window_battle').style.display=\"block\"}else{document.getElementById('more_window_finished').style.display = \"block\"}}}draw();"
        } else {
            js = "dir=" + keyCode["K"]! + ";cmd=core_location(dir);if (cmd!=null){move(core_position[cmd[0]],cmd[0],cmd[1]);if (is_neat()){if(battle_mod){document.getElementById('solved_window_battle').style.display=\"block\"}else{document.getElementById('more_window_finished').style.display = \"block\"}}}draw();"
        }
        wv.evaluateJavaScript(js, completionHandler: nil)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let js = "dir=" + keyCode["O"]! + ";cmd=core_location(dir);if (cmd!=null){move(core_position[cmd[0]],cmd[0],cmd[1]);if (is_neat()){if(battle_mod){document.getElementById('solved_window_battle').style.display=\"block\"}else{document.getElementById('more_window_finished').style.display = \"block\"}}}draw();"
        wv.evaluateJavaScript(js, completionHandler: nil)
    }
}

let keyCode = ["W": "87",
        "A": "65", "S": "83", "D": "68",
            "I": "73",
        "J": "74", "K": "75", "L": "76",
            "O": "79"
] as [String: String]
