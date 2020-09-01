//
//  DottedCircleProgressLayer.swift
//
//
//  Created by sergey on 01.09.2020.
//

import Foundation
import UIKit

open class DottedCircleProgressView: UIView {

  let progressLayer: DottedCircleProgressLayer

  public init(frame: CGRect, progressConfigurator: ProgressLayerConfigurator) {
    self.progressLayer = DottedCircleProgressLayer(progressConfig: progressConfigurator)
    super.init(frame: frame)
    self.layer.addSublayer(self.progressLayer)
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
