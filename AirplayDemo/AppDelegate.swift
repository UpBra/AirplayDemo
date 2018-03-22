//
//  AppDelegate.swift
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit
import AVFoundation


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
		try? AVAudioSession.sharedInstance().setActive(true)

		return true
	}
}
