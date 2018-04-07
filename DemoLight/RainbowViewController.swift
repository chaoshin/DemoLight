//
//  RainbowViewController.swift
//  DemoLight
//
//  Created by Chao Shin on 2018/4/7.
//  Copyright © 2018 Chao Shin. All rights reserved.
//

import UIKit
import GameplayKit

class RainbowViewController: UIViewController {

    // 利用Array儲存彩虹顏色的UIColor，因為RGB是用CGFloat，所以範圍是0-1之間，而網頁上提供的是0-255所以要/255
    let rainbowColor:[UIColor] = [.init(red: 1, green: 0, blue: 0, alpha: 1),
                                  .init(red: 1, green: 127/255, blue: 0, alpha: 1),
                                  .init(red: 1, green: 1, blue: 0, alpha: 1),
                                  .init(red: 0, green: 1, blue: 0, alpha: 1),
                                  .init(red: 0, green: 0, blue: 1, alpha: 1),
                                  .init(red: 75/255, green: 0, blue: 130/255, alpha: 1),
                                  .init(red: 148/255, green: 0, blue: 211/255, alpha: 1)]
  
    let randomDistribution = GKRandomDistribution(lowestValue: 0, highestValue: 6)
    var rainbowNumber:Int?
    var rainbowCount:Int = 0
    
    @IBAction func buttonPress(_ sender: Any) { // 觸碰螢幕後要改變螢幕顯示顏色
        updateUI()  // 呼叫更新螢幕顏色的Function
    }
    
    func initUI() {
        rainbowNumber = randomDistribution.nextInt()// 從亂數取出第一個顏色
        if let number = rainbowNumber{
            view.backgroundColor = rainbowColor[number] // 變更螢幕顯示顏色
            rainbowCount = number   // 儲存第一個起始顏色
        }
    }
    
    func updateUI() {
        rainbowCount = rainbowCount < 6 ? rainbowCount + 1 : 0  // 簡化程式利用?判斷真假然後設定顯示的顏色
        view.backgroundColor = rainbowColor[rainbowCount]   // 變更螢幕顯示顏色
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()    // 呼叫初始化螢幕的Function
        // Do any additional setup after loading the view.
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
