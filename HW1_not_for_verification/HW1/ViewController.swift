//
//  ViewController.swift
//  HW1
//
//  Created by Михаил Прозорский on 14.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet var back: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonWasPressed(_ sender: Any) {
        let views = [view1, view2, view3]
        var colors = Set<UIColor>()
        
        while colors.count != views.count {
            let color = UIColor(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1)
            var different = true
            for view in views {
                if color == view?.backgroundColor
                {
                    different = false
                    break
                }
            }
                if color != back.backgroundColor && different {
                    colors.insert(color)
                }
        }

        let button = sender as? UIButton
                button?.isEnabled = true
        UIView.animate(withDuration: 0.5, animations: {
                    for view in views {
                        view?.layer.cornerRadius = self.randomRadius()
                        view?.backgroundColor = colors.first
                        colors.removeFirst()
                    }
                })
    }
    
    func randomRadius() -> CGFloat {
        CGFloat.random(in: 0 ... 50)
    }

}
