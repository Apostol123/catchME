import UIKit

class GameViewController: UIViewController {
    private let presenter: GamePresenterProtocol
    
    private lazy var playerCustom: PlayerCustom = {
        let view = PlayerCustom(frame: .zero)
        return view
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Test"
        return label
    }()
    
    private lazy var lifesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "TestLifes"
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [scoreLabel, UIView(frame: .zero), lifesLabel])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    init (presenter: GamePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpMainStackViewLayout()
        setUpPlayerCustomLayout()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
        playerCustom.isUserInteractionEnabled = true
        playerCustom.addGestureRecognizer(panGesture)
        
        let waterController = WaterController(view: view)
        waterController.start()
    }
    
    @objc
    private func draggedView(_ sender: UIPanGestureRecognizer) {
        self.view.bringSubviewToFront(playerCustom)
        let translation = sender.translation(in: self.view)
        playerCustom.center = CGPoint(x: playerCustom.center.x + translation.x, y: playerCustom.center.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    private func setUpMainStackViewLayout() {
        view.addSubview(labelsStackView)
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        labelsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        labelsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    }
    
    private func setUpPlayerCustomLayout() {
        view.addSubview(playerCustom)
        playerCustom.translatesAutoresizingMaskIntoConstraints = false
        playerCustom.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playerCustom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
    
}

extension GameViewController: GameViewProtocol {
}
