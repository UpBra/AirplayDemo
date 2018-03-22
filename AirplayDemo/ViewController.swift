//
//  ViewController.swift
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController {

	// MARK: - UIViewController Overrides

	override func viewDidLoad() {
		super.viewDidLoad()

		configurePlayers()
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)

		guard let identifier = segue.identifier else { return }

		switch identifier {
		case Constant.SegueName.PlayerOne:
			playerOneViewController = segue.destination as? AVPlayerViewController

		case Constant.SegueName.PlayerTwo:
			playerTwoViewController = segue.destination as? PlayerViewController

		default:
			break
		}
	}


	// MARK: - Private

	fileprivate var playerOneViewController: AVPlayerContaining?
	fileprivate var playerTwoViewController: AVPlayerContaining?


	fileprivate func configurePlayers() {
		let playerOne = AVPlayer()
		playerOne.allowsExternalPlayback = true
		playerOneViewController?.avPlayer = playerOne

		let playerTwo = AVPlayer()
		playerTwo.allowsExternalPlayback = false
		playerTwo.usesExternalPlaybackWhileExternalScreenIsActive = false
		playerTwo.isMuted = true
		playerTwoViewController?.avPlayer = playerTwo
	}

	@IBAction fileprivate func didTouchUpInside(playOneButton button: UIBarButtonItem) {
		guard let url = Constant.SampleURL.BipBop else { return }

		let item = AVPlayerItem(url: url)
		playerOneViewController?.avPlayer?.replaceCurrentItem(with: item)
		playerOneViewController?.avPlayer?.play()
	}

	@IBAction fileprivate func didTouchUpInside(playTwoButton button: UIBarButtonItem) {
		guard let url = Constant.SampleURL.ShortClip else { return }

		let item = AVPlayerItem(url: url)
		playerTwoViewController?.avPlayer?.replaceCurrentItem(with: item)

		playerTwoViewController?.avPlayer?.allowsExternalPlayback = false
		playerTwoViewController?.avPlayer?.isMuted = true

		playerTwoViewController?.avPlayer?.play()
	}
}


extension ViewController {

	fileprivate struct Constant {

		struct SegueName {
			static let PlayerOne = "embedPlayer1"
			static let PlayerTwo = "embedPlayer2"
		}

		struct SampleURL {
			static let BipBop = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8")
			static let ShortClip = Bundle.main.url(forResource: "ElephantSeals", withExtension: "mov")
		}
	}
}
