//
//  ViewController.swift
//  TimerSample
//
//  Created by Satoshi Fukai on 2017/12/05.
//  Copyright © 2017年 Satoshi Fukai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerDisp: UILabel!
    
    @IBOutlet weak var timerBtn: UIButton!
    // 時間計測用の変数
    var cnt : Float = 0
    
    // スイッチ用のフラグ
    var swflg : Bool = false
    
    // 時間表示用のラベル
//      var myLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ラベルを作る
//        myLabel = UILabel(frame: CGRect(x:0,y:0, width:200,height:50))
//        myLabel.backgroundColor = UIColor.orange
//        myLabel.layer.masksToBounds = true
//        myLabel.layer.cornerRadius = 20.0
        timerDisp.text = "Time:".appendingFormat("%.1f",cnt)
//        myLabel.textColor = UIColor.white
//        myLabel.shadowColor = UIColor.gray
//        myLabel.textAlignment = NSTextAlignment.center
//        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
//        self.view.backgroundColor = UIColor.cyan
//        self.view.addSubview(myLabel)
        timerBtn.setTitle("Start", for:UIControlState.normal)
        // タイマーを作る
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.onUpdate(timer:)), userInfo: nil, repeats: true)
    }

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
            cnt += 0.1
            
            // 桁数を指定して文字列を作る
            let str = "Time:".appendingFormat("%.1f",cnt)
            
            timerDisp.text = str
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

