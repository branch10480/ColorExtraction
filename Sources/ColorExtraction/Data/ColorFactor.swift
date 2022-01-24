//
//  ColorFactor.swift
//  
//
//  Created by branch10480 on 2022/01/20.
//

import UIKit

public struct ColorFactor: Equatable {
  public var red: CGFloat
  public var green: CGFloat
  public var blue: CGFloat
  public var alpha: CGFloat
  
  public static var zero: ColorFactor {
    .init(red: 0, green: 0, blue: 0, alpha: 0)
  }
  
  public var uiColor: UIColor {
    .init(
      red: red / 255.0,
      green: green / 255.0,
      blue: blue / 255.0,
      alpha: alpha / 255.0
    )
  }
  
}

extension ColorFactor: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(uiColor)
  }
}
