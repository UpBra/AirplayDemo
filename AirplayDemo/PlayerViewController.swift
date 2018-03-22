//
//  PlayerViewController.swift
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit
import AVKit


protocol AVPlayerContaining {
	var avPlayer: AVPlayer? { get set }
}


extension AVPlayerViewController : AVPlayerContaining {

	var avPlayer: AVPlayer? {
		get {
			return player
		}

		set {
			player = newValue
		}
	}
}


class PlayerViewController: UIViewController, AVPlayerContaining {

	// MARK: - UIViewController Overrides

	override func loadView() {
		super.loadView()

		view.embedSubview(playerView)
	}


	// MARK: - Properties

	var playerView = PlayerView()

	var avPlayer: AVPlayer? {
		didSet {
			playerView.playerLayer.player = avPlayer
			playerView.playerLayer.frame = view.bounds
		}
	}
}


class PlayerView: UIView {

	override static var layerClass: AnyClass {
		return AVPlayerLayer.self
	}

	var playerLayer: AVPlayerLayer {
		return layer as! AVPlayerLayer
	}
}


extension UIView {

	func embedSubview(_ subview: UIView, insets: UIEdgeInsets = .zero) {
		subview.translatesAutoresizingMaskIntoConstraints = false

		addSubview(subview)

		subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
		subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left).isActive = true
		subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom).isActive = true
		subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.right).isActive = true
	}
}
