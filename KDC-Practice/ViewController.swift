//
//  ViewController.swift
//  KDC-01-FamousSayingGenerator
//
//  Created by Daye on 2022/02/28.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

  @IBOutlet weak var contentsLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.rightBarButtonItem?.tintColor = .blue
    self.contentsLabel.textColor = .yellow
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let settingViewController = segue.destination as? LEDSettingViewController {
      settingViewController.delegate = self
      settingViewController.ledText = self.contentsLabel.text
      settingViewController.textColor = self.contentsLabel.textColor
      settingViewController.backgroundColor = self.view.backgroundColor ?? .black
    }
  }

  func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
    if let text = text {
      self.contentsLabel.text = text
    }
    self.contentsLabel.textColor = textColor
    self.view.backgroundColor = backgroundColor
  }
}

