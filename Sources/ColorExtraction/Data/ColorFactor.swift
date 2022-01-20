//
//  ColorFactor.swift
//  
//
//  Created by branch10480 on 2022/01/20.
//

import UIKit

public struct ColorFactor: Equatable {
  public var red: Int
  public var green: Int
  public var blue: Int
  public var alpha: Int
  
  public static var zero: ColorFactor {
    .init(red: 0, green: 0, blue: 0, alpha: 0)
  }
  
  public var uiColor: UIColor {
    .init(
      red: CGFloat(red) / 255.0,
      green: CGFloat(green) / 255.0,
      blue: CGFloat(blue) / 255.0,
      alpha: CGFloat(alpha) / 255.0
    )
  }
  
}

extension ColorFactor: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(red.description)
    hasher.combine(green.description)
    hasher.combine(blue.description)
    hasher.combine(alpha.description)
  }
}
