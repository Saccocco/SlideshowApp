//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Sachiko Nakagiri on 2020/08/29.
//  Copyright © 2020 sachiko.nakagiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //変数を宣言
    var imageIndex = 0
    //画像の配列
    let images = ["orange.jpg", "orangetxt.png", "apple.png", "appletxt.png", "banana.jpg", "bananatxt.png"]
    
    var timer: Timer!
    
    var count:Int = 0
    
    var dispImageNo = 0
    
    var imageView = UIImageView()
    
    
    //outletの接続
    
    @IBOutlet weak var GoButton: UIButton!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var PlayPauseButton: UIButton!
    @IBOutlet weak var ScaleButton: UIButton!
    
    //?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageView.image = UIImage(named: images[imageIndex])
    }
    
    
    @IBAction func GoButtonAction(_ sender: Any) {
        //Goボタンで進む
        imageIndex += 1
        
        if imageIndex == 6 {
            imageIndex = 0
        }
        print("imageIndex:\(imageIndex)")
        ImageView.image = UIImage(named: images[imageIndex])
    }
    
    @IBAction func BackButtonAction(_ sender: Any) {
        //Backボタンで戻る
        imageIndex -= 1
        
        if imageIndex < 0 {
            imageIndex = 5
        }
        print("imageIndex:\(imageIndex)")
        ImageView.image = UIImage(named: images[imageIndex])
    }
    
    @IBAction func PlayPauseButton(_ sender: Any) {
        //一度再生したらスピードを一定にする
        if timer != nil {
            timer.invalidate()
            timer = nil
            //ボタンが押せるようにする
            GoButton.isEnabled = true
            BackButton.isEnabled = true
            //ボタンをPlayにする
            PlayPauseButton.setTitle("Play", for: .normal)
        } else {
            // タイマーの作成、始動
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            //他のボタンを押せないようにする
            GoButton.isEnabled = false
            BackButton.isEnabled = false
            //ボタンをPauseにする
            PlayPauseButton.setTitle("Pause", for: .normal)
        }
    }
    //タイマー式で自動再生する
    @objc func updateTimer(_ timer: Timer) {
        imageIndex += 1
        
        if imageIndex == 6 {
            imageIndex = 0
        }
        print("imageIndex:\(imageIndex)")
        ImageView.image = UIImage(named: images[imageIndex])
           }
    //画像拡大ボタンを押したら、タイマーが止まる
    @IBAction func ScaleButton(_ sender: Any) {
        if timer != nil{
        timer.invalidate()
           timer = nil
      }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let nextViewController:ScaleDisplayViewController = segue.destination as! ScaleDisplayViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        nextViewController.imageName = images[imageIndex]
    }
}











