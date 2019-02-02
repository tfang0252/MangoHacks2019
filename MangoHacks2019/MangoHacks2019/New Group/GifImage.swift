//
//  GifImage.swift
//  MangoHacks2019
//
//  Created by Danny Santos on 2/2/19.
//  Copyright © 2019 Tony Fang. All rights reserved.
//

import UIKit

class GifImage: UIImage {
    public class func gif(asset: String) -> UIImage? {
        if let asset = NSDataAsset(name: asset) {
            return UIImage.gif(data: asset.data)
        }
        return nil
    }
}
