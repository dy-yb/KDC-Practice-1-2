//
//  LEDSettingViewController.swift
//  KDC-Practice
//
//  Created by Daye on 2022/03/02.
//

import UIKit

protocol LEDBoardSettingDelegate: Any {
  func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class LEDSettingViewController: UIViewController {
  var delegate: LEDBoardSettingDelegate?
  var ledText: String?
  var textColor: UIColor = .yellow
  var backgroundColor: UIColor = .black

  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var yellowButton: UIButton!
  @IBOutlet weak var purpleButton: UIButton!
  @IBOutlet weak var greenButton: UIButton!
  @IBOutlet weak var blackButton: UIButton!
  @IBOutlet weak var blueButton: UIButton!
  @IBOutlet weak var orangeButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }

  private func configureView() {
    if let ledText = ledText {
      self.textField.text = ledText
    }
    self.changeTextColor(color: self.textColor)
    self.changeBackgroundColorButton(color: self.backgroundColor)
  }

  @IBAction func tapTextColorButton(_ sender: UIButton) {
    switch sender {
    case self.yellowButton:
      changeTextColor(color: .yellow)
      textColor = .yellow
    case self.purpleButton:
      changeTextColor(color: .purple)
      textColor = .purple
    case self.greenButton:
      changeTextColor(color: .green)
      textColor = .green
    default:
      return
    }
  }

  @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
    switch sender {
    case self.blackButton:
      changeBackgroundColorButton(color: .black)
      backgroundColor = .black
    case self.blueButton:
      changeBackgroundColorButton(color: .blue)
      backgroundColor = .blue
    case self.orangeButton:
      changeBackgroundColorButton(color: .orange)
      backgroundColor = .orange
    default:
      return
    }
  }
  
  @IBAction func tapSaveButton(_ sender: UIButton) {
    self.delegate?.changedSetting(text: textField.text,
                                  textColor: textColor,
                                  backgroundColor: backgroundColor)
  }

  private func changeTextColor(color: UIColor) {
    self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
    self.purpleButton.alpha = color == UIColor.purple ? 1: 0.2
    self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
  }

  private func changeBackgroundColorButton(color: UIColor) {
    self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
    self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
    self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
  }
}
