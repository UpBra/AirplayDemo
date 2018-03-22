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


	@IBAction fileprivate func didTouchUpInside(playOneButton button: UIBarButtonItem) {
		guard let url = Constant.SampleURL.BipBop else { return }

		let item = AVPlayerItem(url: url)
		let player = AVPlayer(playerItem: item)
		player.allowsExternalPlayback = true

		playerOneViewController?.avPlayer = player
		player.play()
	}

	@IBAction fileprivate func didTouchUpInside(playTwoButton button: UIBarButtonItem) {
		guard let url = Constant.SampleURL.ShortClip else { return }

		let item = AVPlayerItem(url: url)
		let player = AVPlayer(playerItem: item)
		player.allowsExternalPlayback = false
		player.isMuted = true

		playerTwoViewController?.avPlayer = player
		player.play()
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
