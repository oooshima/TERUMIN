//
//  MatomeruViewController.swift
//  TERUMIN
//
//  Created by IkukoHiraga on 2018/06/17.
//  Copyright © 2018年 IkukoHiraga. All rights reserved.
//

import UIKit
import AVKit

class MatomeruViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundlePath = Bundle.main.path(forResource: "001", ofType: "mp4")
        var pathList = [bundlePath]
        
        if let bundlePath = Bundle.main.path(forResource: "002", ofType: "mp4"){
            pathList += [bundlePath]
        }
        
        if let bundlePath = Bundle.main.path(forResource: "003", ofType: "mp4"){
            pathList += [bundlePath]
        }

        let BoundSize_w: CGFloat = UIScreen.main.bounds.width //横幅
        let BoundSize_h: CGFloat = UIScreen.main.bounds.height//縦幅
        
        for path in pathList{
            let player = AVPlayer(url: URL(fileURLWithPath: path!))
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = CGRect(x: 0, y: 0, width: BoundSize_w, height:BoundSize_h)
            //self.view.layer.insetSublayer(playerLayer)
            self.view.layer.addSublayer(playerLayer)
            player.play()
        // Do any additional setup after loading the view.
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
