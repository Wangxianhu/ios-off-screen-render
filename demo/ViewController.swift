//
//  ViewController.swift
//  demo
//
//  Created by Chris on 2018/4/16.
//  Copyright © 2018年 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var singleview: UIView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var containerOK: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageOK: UIImageView!
    
    @IBOutlet weak var maskview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //圆角没有子视图 不会离屏渲染
        singleview.layer.cornerRadius = 10
        singleview.layer.masksToBounds = true
        
        //圆角有子视图 会离屏渲染
        container.layer.cornerRadius = 10
        container.layer.masksToBounds = true
        
        //圆角有子视图 使用add layerh解决离屏
        let maskCornor = CAShapeLayer()
        maskCornor.path = UIBezierPath(roundedRect: container.bounds, cornerRadius: 10).cgPath
        maskCornor.fillColor = UIColor.red.cgColor
        containerOK.layer.addSublayer(maskCornor);
        
        //设置阴影造成离屏渲染
        image.layer.shadowOffset = CGSize(width: 10, height: 10)
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOpacity = 0.5
        image.layer.shadowRadius = 3
        
        //添加shadowPath 不会造成离屏渲染
        imageOK.layer.shadowOffset = CGSize(width: 10, height: 10)
        imageOK.layer.shadowColor = UIColor.black.cgColor
        imageOK.layer.shadowOpacity = 0.5
        imageOK.layer.shadowRadius = 3
        let bezierPath = UIBezierPath(rect: imageOK.bounds)
        imageOK.layer.shadowPath = bezierPath.cgPath;//***
        
        //添加mask 造成离屏渲染
        let layershaper = CAShapeLayer();
        layershaper.frame = self.maskview.bounds
        layershaper.contents = UIImage(named: "mask")!.cgImage

        self.maskview.layer.mask = layershaper

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
