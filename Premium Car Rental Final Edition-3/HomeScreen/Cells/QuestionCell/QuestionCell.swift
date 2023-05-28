//
//  QuestionCell.swift
//  HomeScreen
//
//  Created by TDI Student on 8.10.22.
//

import UIKit

protocol FAQDelegate {
    func expandButtonPressed(faq: FAQ)
}

class QuestionCell: UITableViewCell {
    @IBOutlet weak var expandImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    var delegate: FAQDelegate?
    var faq = FAQ(id: 0, question: "", answer: "", isOpen: false)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDetails(faq: FAQ) {
        self.faq = faq
        let expandImagee = faq.isOpen ? "expanded" : "collapsed"
//        expandImage(UIImage(named: expandImage), for: .normal)
        expandImage.image = UIImage(named: expandImagee)
    }
    
    @IBAction func expandButtonPressed(_ sender: Any) {
        delegate?.expandButtonPressed(faq: faq)
    }
}
