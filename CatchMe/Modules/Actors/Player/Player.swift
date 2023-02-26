import UIKit

class PlayerCustom: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .red
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 8
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        widthAnchor.constraint(equalToConstant: 160).isActive = true
    }
}
