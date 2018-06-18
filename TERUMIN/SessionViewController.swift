//
//  SessionViewController.swift
//  TERUMIN
//
//  Created by Oshima Haruna on 2018/06/16.
//  Copyright © 2018年 IkukoHiraga. All rights reserved.
//

import UIKit
import AVFoundation
import AudioKit
import CoreMotion
import CoreLocation
import ReplayKit

class SessionViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var soundLabel: UILabel!
    var oscillatorDo = AKOscillator()//waveform: AKTable(.triangle))
    let cmManager = CMMotionManager()
    var myLocationManager : CLLocationManager?
    var x = 0.0//: Double!
    let assetWriter = AssetWriter(fileName: "test.mp4")
    
    func getGyro(motionData:CMDeviceMotion?, error:Error?){
        if let motion = motionData{
            if(motion.attitude.pitch * 180 / Double.pi >= 0 && motion.attitude.pitch * 180 / Double.pi <= 45){
                oscillatorDo.amplitude = 1 - 1.0 * (motion.attitude.pitch * 180 / Double.pi)/2 / 90
            }else{
                oscillatorDo.amplitude = 0
            }
        }
    } //表示してるだけ音量
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        x = newHeading.magneticHeading
        //oscillatorDo.frequency = 261.63 * pow(2, x/120)
        if(0 <= x && x < 10){
            oscillatorDo.frequency = 261.63/2 // ど
            soundLabel.text = "ド"
        }else if(10 <= x && x < 20){
            oscillatorDo.frequency = 277.18/2 //
            soundLabel.text = "ド#"
        }else if(20 <= x && x < 30){
            oscillatorDo.frequency = 293.665/2 // れ
            soundLabel.text = "レ"
        }else if(30 <= x && x < 40){
            oscillatorDo.frequency = 311.127/2
            soundLabel.text = "レ#"
        }else if(40 <= x && x < 50){
            oscillatorDo.frequency = 329.628/2 // み
            soundLabel.text = "ミ"
        }else if(50 <= x && x < 60){
            oscillatorDo.frequency = 349.228/2 // ふぁ
            soundLabel.text = "ファ"
        }else if(60 <= x && x < 70){
            oscillatorDo.frequency = 369.994/2 //
            soundLabel.text = "ファ#"
        }else if(70 <= x && x < 80){
            oscillatorDo.frequency = 391.995/2 // そ
            soundLabel.text = "ソ"
        }else if(80 <= x && x < 90){
            oscillatorDo.frequency = 415.305/2 //
            soundLabel.text = "ソ#"
        }else if(90 <= x && x < 100){
            oscillatorDo.frequency = 440.000/2 // ら
            soundLabel.text = "ラ"
        }else if(100 <= x && x < 110){
            oscillatorDo.frequency = 466.164/2 //
            soundLabel.text = "ラ#"
        }else if(110 <= x && x < 120){
            oscillatorDo.frequency = 493.883/2 // し
            soundLabel.text = "シ"
        }else if(120 <= x && x < 130){
            oscillatorDo.frequency = 523.251/2 // ど
            soundLabel.text = "ド"
        }else if(130 <= x && x < 140){
            oscillatorDo.frequency = 554.365/2 //
            soundLabel.text = "ド#"
        }else if(140 <= x && x < 150){
            oscillatorDo.frequency = 587.330/2 // れ
            soundLabel.text = "レ"
        }
        else if(150 <= x && x < 160){
            oscillatorDo.frequency = 622.254/2
            soundLabel.text = "レ#"
        }else if(160 <= x && x < 170){
            oscillatorDo.frequency = 659.255/2 // み
            soundLabel.text = "ミ"
        }else if(170 <= x && x < 180){
            oscillatorDo.frequency = 698.456/2 // ふぁ
            soundLabel.text = "ファ"
        }else if(180 <= x && x < 190){
            oscillatorDo.frequency = 739.989/2 //
            soundLabel.text = "ファ#"
        }else if(190 <= x && x < 200){
            oscillatorDo.frequency = 783.991/2 // そ
            soundLabel.text = "ソ"
        }else if(200 <= x && x < 210){
            oscillatorDo.frequency = 830.609/2 //
            soundLabel.text = "ソ#"
        }else if(210 <= x && x < 220){
            oscillatorDo.frequency = 880.000/2 // ら
            soundLabel.text = "ラ"
        }else if(220 <= x && x < 230){
            oscillatorDo.frequency = 932.328/2 //
            soundLabel.text = "ラ#"
        }else if(230 <= x && x < 240){
            oscillatorDo.frequency = 987.767/2 // し
            soundLabel.text = "シ"
        }
        else if(240 <= x && x < 250){
            oscillatorDo.frequency = 1046.502/2 // ど
            soundLabel.text = "ド"
        }else if(250 <= x && x < 260){
            oscillatorDo.frequency = 1108.731/2 //
            soundLabel.text = "ド#"
        }else if(260 <= x && x < 270){
            oscillatorDo.frequency = 1174.659/2 // れ
            soundLabel.text = "レ"
        }
        else if(270 <= x && x < 280){
            oscillatorDo.frequency = 1244.508/2
            soundLabel.text = "レ#"
        }else if(280 <= x && x < 290){
            oscillatorDo.frequency = 1318.510/2 // み
            soundLabel.text = "ミ"
        }else if(290 <= x && x < 300){
            oscillatorDo.frequency = 1396.913/2 // ふぁ
            soundLabel.text = "ファ"
        }else if(300 <= x && x < 310){
            oscillatorDo.frequency = 1479.978/2 //
            soundLabel.text = "ファ#"
        }else if(310 <= x && x < 320){
            oscillatorDo.frequency = 1567.982/2 // そ
            soundLabel.text = "ソ"
        }else if(320 <= x && x < 330){
            oscillatorDo.frequency = 1661.219/2 //
            soundLabel.text = "ソ#"
        }else if(330 <= x && x < 340){
            oscillatorDo.frequency = 1760.000/2 // ら
            soundLabel.text = "ラ"
        }else if(340 <= x && x < 350){
            oscillatorDo.frequency = 1864.655/2 //
            soundLabel.text = "ラ#"
        }else if(350 <= x && x < 360){
            oscillatorDo.frequency = 1975.533/2 // し
            soundLabel.text = "シ"
        }
    }//表示してるだけ方角
    
    // ⑤オシレーターを再生・停止する関数
    func playSound(node: AKOscillator) {
        node.start()
        // 再生中なら停止、停止中なら再生する
        //        if node.isPlaying {
        //            node.stop()
        //        } else {
        //            node.start()
        //        }
    }
    
    @objc func changeSound() {
        var i = 10
        print("i: \(i)")
        i += 10
        //oscillatorDo.frequency = oscillatorDo.frequency + i
        //oscillatorDo.amplitude += 0.1
    }

    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        ConnectionManager.sendMessageEvent(message: "stop")
        oscillatorDo.stop()
        stopCapture()
        sceneChange2()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ConnectionManager.onEvent(.Message) { [unowned self] _, object in
            self.receiveMassage(object: object)
        }
        startCapture()
        cmManager.deviceMotionUpdateInterval = 0.1
        let handler:CMDeviceMotionHandler = {(motionData:CMDeviceMotion?, error:Error?) -> Void in self.getGyro(motionData: motionData, error: error)}
        cmManager.startDeviceMotionUpdates(to:OperationQueue.main, withHandler: handler)
        
        myLocationManager = CLLocationManager()
        myLocationManager?.delegate = self
        myLocationManager?.startUpdatingLocation()
        
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.notDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
            self.myLocationManager?.requestAlwaysAuthorization()
            myLocationManager?.headingFilter = kCLHeadingFilterNone
            myLocationManager?.headingOrientation = .portrait
            myLocationManager?.startUpdatingHeading()
            
        }
        
        //oscillatorDo.amplitude = 0.5
        
        let kenban = AKMixer(oscillatorDo) //, oscillatorRe, oscillatorMi, oscillatorFa, oscillatorSo, oscillatorRa, oscillatorSi, oscillatorDo2)
        
        // 音源を「kenban」に設定
        AudioKit.output = kenban
        // 音が鳴るようにする
        try! AudioKit.start()
        
        //kenban.start()
        NSLog("start")
        playSound(node: oscillatorDo)
        //Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.changeSound), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func receiveMassage(object: AnyObject?) {

        print("@@@recieve")
        guard let data = object else {
            return
        }
        if let message = data["message"] as? String, let from = data["from"] as? String{
            if message == "stop" {
                
                stopSession(message:message, from)
                oscillatorDo.stop()
                stopCapture()
            }
        }
    }
    
    private func stopSession(message: String, _ from: String) {
        sceneChange2()
    }
    
    
    private func sceneChange2(){
        let storyboard: UIStoryboard = self.storyboard!
        let endingView = storyboard.instantiateViewController(withIdentifier: "ending") as! EndingViewController
        self.present(endingView, animated: true, completion: nil)
    }

    private func startCapture(){
        RPScreenRecorder.shared().startCapture(handler: {(buffer, bufferType, err) in self.assetWriter.write(buffer: buffer, bufferType: bufferType)
        }, completionHandler: {
            if let error = $0 {
                print(error)
            }
        })
    }
    private func stopCapture(){
        RPScreenRecorder.shared().stopCapture {
            if let error = $0 {
                print(error)
            }
            self.assetWriter.finishWriting()
        }
    }
}
