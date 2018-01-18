//
//  ViewController.swift
//  TimerSample
//
//  Created by Satoshi Fukai on 2017/12/05.
//  Copyright © 2017年 Satoshi Fukai. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    // タイマーのタイトル用
    @IBOutlet weak var timerTitle: UILabel!
    
    // 時間表示用のラベル
    @IBOutlet weak var timerDisp: UILabel!
    
    @IBOutlet weak var timerBtn: UIButton!
    // 時間計測用の変数
    var cnt : Double = 60.0
    let formatter = DateComponentsFormatter()

    // スイッチ用のフラグ
    var swflg : Bool = false
    
    
    // shutter
//    var soundIdRing:SystemSoundID = 1108
    
    // bell
    var soundIdRing:SystemSoundID = 1000
    
    // update
    //var soundIdRing:SystemSoundID = 1336
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 時刻表示用設定
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = DateComponentsFormatter.ZeroFormattingBehavior.pad
        
        // 時刻表示
        timerDisp.text = "Time: ".appendingFormat(formatter.string(from: cnt)!)
        timerBtn.setTitle("Start", for:UIControlState.normal)
        // タイマーを作る
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.onUpdate(timer:)), userInfo: nil, repeats: true)
    }

    //    タイマーボタンを押下した時の処理
    @IBAction func OnClickButton(_ sender: Any) {
        if (swflg){
            swflg = false
            timerBtn.setTitle("Start", for:UIControlState.normal)

        } else {
            swflg = true
            timerBtn.setTitle("Stop", for:UIControlState.normal)
        }
    }

    // NSTierIntervalで指定された数秒ごとに呼び出されるメソッド
    @objc
    func onUpdate(timer : Timer){
        if (swflg) {
            cnt -= 0.1
            let str = "Time: ".appendingFormat(formatter.string(from: cnt)!)
            timerDisp.text = str
            if (cnt < 0.1){
                swflg = false
                alertAction()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertAction() {
        let myAlert = UIAlertController(title:"alert", message: "ring ding", preferredStyle: .actionSheet)
        let myAction = UIAlertAction(title: "dong", style: .default) {
            action in print("foo!!")
        }
        myAlert.addAction(myAction)
        present(myAlert, animated: true, completion: nil)
        if let soundUrl = CFBundleCopyResourceURL(CFBundleGetMainBundle(), nil, nil, nil){
            AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
            AudioServicesPlaySystemSound(soundIdRing)
        }
    }


}

