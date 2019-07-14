//
//  ViewController.swift
//  Edu Tappy Tap SBS
//
//  Created by Stanislav Sidelnikov on 7/2/18.
//  Copyright © 2018 Yandex LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gameFieldView.layer.borderWidth = 1
        gameFieldView.layer.borderColor = UIColor.gray.cgColor
        gameFieldView.layer.cornerRadius = 5

        updateUI()

        gameFieldView.shapeHitHandler = { [weak self] in
            self?.objectTapped()
        }

        gameControl.startStopHandler = { [weak self] in
            self?.actionButtonTapped()
        }
        gameControl.gameDuration = 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var gameFieldView: GameFieldView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameControl: GameControlViewClass!

    private func actionButtonTapped() {
        if isGameActive {
            stopGame()
        } else {
            startGame()
        }
    }

    func objectTapped() {
        guard isGameActive else { return }
        repositionImageWithTimer()
        score += 1
    }

    // MARK: - Private
    private var isGameActive = false
    private var gameTimer: Timer?
    private var timer: Timer?
    private let displayDuration: TimeInterval = 2
    private var score = 0

    private func startGame() {
        score = 0
        isGameActive = true
        gameControl.gameTimeLeft = gameControl.gameDuration
        updateUI()

        gameTimer?.invalidate()
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(gameTimerTick), userInfo: nil, repeats: true)

        repositionImageWithTimer()
    }

    private func stopGame() {
        isGameActive = false
        updateUI()

        gameTimer?.invalidate()
        timer?.invalidate()

        scoreLabel.text = "Последний счет: \(score)"
    }

    private func updateUI() {
        gameFieldView.isShapeHidden = !isGameActive
        gameControl.isGameActive = isGameActive
    }

    @objc private func gameTimerTick() {
        gameControl.gameTimeLeft -= 1
        if gameControl.gameTimeLeft <= 0 {
            stopGame()
        } else {
            updateUI()
        }
    }

    @objc private func moveImage() {
        gameFieldView.randomizeShapes()
    }

    private func repositionImageWithTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: displayDuration, target: self, selector: #selector(moveImage), userInfo: nil, repeats: true)
        timer?.fire()
    }
}

