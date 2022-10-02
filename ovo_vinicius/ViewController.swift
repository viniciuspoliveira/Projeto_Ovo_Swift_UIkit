//
//  ViewController.swift
//  ovo_vinicius
//
//  Created by Vinicius Pinheiro de Oliveira on 01/10/22.
//

import UIKit
import AVFoundation //import pra tocar o alarm_sound

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Gema Mole": 3, "Gema Cremosa": 4, "Gema Cozida": 7]
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer? //Var pra tocar o alarm sound
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = "Como você gostaria da fritura dos ovos?"
        
        
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
  
    
        timer.invalidate()
        

        let hardness = sender.currentTitle! //Soft, Medium, Hard
    
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness

        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }

    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float (secondsPassed) / Float (totalTime)
            print(Float(secondsPassed) / Float(totalTime))




        } else {
            timer.invalidate()
            titleLabel.text = "Seu ovo ta pronto amigo! Corra pra panela!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()

        }
    }
}
