//
//  ViewController.swift
//  ColorExtractionExample
//
//  Created by branch10480 on 2022/01/20.
//

import UIKit
import ColorExtraction

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  private func setup() {
    let color = ColorExtraction.extractColor(from: UIImage())
    view.backgroundColor = color
  }

}

