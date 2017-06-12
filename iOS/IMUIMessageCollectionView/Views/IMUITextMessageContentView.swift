//
//  IMUITextMessageContentView.swift
//  sample
//
//  Created by oshumini on 2017/6/11.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import UIKit

class IMUITextMessageContentView: UIView, IMUIMessageContentViewProtocal {
  open static var outGoingTextColor = UIColor(netHex: 0x7587A8)
  open static var inComingTextColor = UIColor.white
  
  open static var outGoingTextFont = UIFont.systemFont(ofSize: 18)
  open static var inComingTextFont = UIFont.systemFont(ofSize: 18)
  
  var textMessageLable = IMUITextView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(textMessageLable)
    textMessageLable.numberOfLines = 0
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func layoutContentView(message: IMUIMessageModelProtocol) {
    
    textMessageLable.frame = CGRect(origin: CGPoint.zero, size: message.layout.bubbleContentSize)
    
    self.layoutToText(with: message.text(), isOutGoing: message.isOutGoing)
  }
  
  func layoutToText(with text: String, isOutGoing: Bool) {
    textMessageLable.text = text
    if isOutGoing {
      textMessageLable.textColor = IMUITextMessageContentView.outGoingTextColor
      textMessageLable.font = IMUITextMessageContentView.outGoingTextFont
    } else {
      textMessageLable.textColor = IMUITextMessageContentView.inComingTextColor
      textMessageLable.font = IMUITextMessageContentView.inComingTextFont
    }
  }
}
