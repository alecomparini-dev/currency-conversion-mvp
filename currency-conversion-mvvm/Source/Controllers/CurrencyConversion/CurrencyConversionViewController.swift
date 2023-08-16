//
//  CurrencyConversionViewController.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit

protocol CurrencyConversionViewControllerCoordinator: AnyObject {
    func goToSearchCurrenciesVC()
}

class CurrencyConversionViewController: UIViewController {
    weak var coordinator: CurrencyConversionViewControllerCoordinator?
    
    lazy var screen: CurrencyConversionView = {
        let view = CurrencyConversionView()
        return view
    }()
    
    override func loadView() {
//        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        hideKeyboardOnTap()
        configDelegate()
    }
    
    private func configDelegate() {
        screen.delegate = self
    }
    
}


//  MARK: - EXTENSION CURRENCY CONVERSION VIEW
extension CurrencyConversionViewController: CurrencyConversionViewDelegate {
    func currencyOfButtonTapped() {
        coordinator?.goToSearchCurrenciesVC()
    }
    
    func currencyToButtonTapped() {
        coordinator?.goToSearchCurrenciesVC()
    }
    
    
}











// MARK: - Coordinators

class FirstScreenCoordinator: Coordinator {
    var childCoordinators: Coordinator?
    
    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        childCoordinators = self
        let firstViewController = FirstViewController(coordinator: self)
        if let vc = navigationController.containsViewController(ofType: FirstViewController.self) {
            navigationController.popToViewController(vc, animated: true)
            return
        }
        navigationController.pushViewController(firstViewController, animated: true)
        
//        navigationController.containsViewController(ofType: FirstViewController.self)
//        navigationController.pushViewController(firstViewController, animated: true)
    }
    
    func goToSecondScreen() {
        childCoordinators = nil
        let coordinator = SecondScreenCoordinator(navigationController)
        coordinator.start()
    }

    func goToThirdScreen() {
        childCoordinators = nil
        let coordinator = ThirdScreenCoordinator(navigationController)
        coordinator.start()
    }
}

class SecondScreenCoordinator: Coordinator {
    var childCoordinators: Coordinator?

    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinators = self
        let secondViewController = SecondViewController(coordinator: self)
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
    func goToFirstScreen() {
        childCoordinators = nil
        let coordinator = FirstScreenCoordinator(navigationController)
        coordinator.start()
    }
    
    func goToThirdScreen() {
        childCoordinators = nil
        let coordinator = ThirdScreenCoordinator(navigationController)
        coordinator.start()
    }
}

class ThirdScreenCoordinator: Coordinator {
    var childCoordinators: Coordinator?
    
    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinators = self
        let thirdViewController = ThirdViewController(coordinator: self)
        navigationController.pushViewController(thirdViewController, animated: true)
    }

    func goToFirstScreen() {
        childCoordinators = nil
        let coordinator = FirstScreenCoordinator(navigationController)
        coordinator.start()
    }

    func goToSecondScreen() {
        childCoordinators = nil
        let coordinator = SecondScreenCoordinator(navigationController)
        coordinator.start()
    }
}

// MARK: - ViewControllers

class FirstViewController: UIViewController {
    weak var coordinator: FirstScreenCoordinator?
    
    init(coordinator: FirstScreenCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let goToSecondButton = UIButton(type: .system)
        goToSecondButton.setTitle("[Tela 1] - Ir para TELA 2", for: .normal)
        goToSecondButton.addTarget(self, action: #selector(goToSecondButtonTapped), for: .touchUpInside)
        
        let goToThirdButton = UIButton(type: .system)
        goToThirdButton.setTitle("[Tela 1] - Ir para a TELA 3", for: .normal)
        goToThirdButton.addTarget(self, action: #selector(goToThirdButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [goToSecondButton, goToThirdButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func goToSecondButtonTapped() {
        coordinator?.goToSecondScreen()
    }
    
    @objc func goToThirdButtonTapped() {
        coordinator?.goToThirdScreen()
    }
}

class SecondViewController: UIViewController {
    weak var coordinator: SecondScreenCoordinator?
    
    init(coordinator: SecondScreenCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let goToFirstButton = UIButton(type: .system)
        goToFirstButton.setTitle("[Tela 2] - Ir para TELA 1", for: .normal)
        goToFirstButton.addTarget(self, action: #selector(goToFirstButtonTapped), for: .touchUpInside)
        
        let goToThirdButton = UIButton(type: .system)
        goToThirdButton.setTitle("[Tela 2] - Ir para TELA 3", for: .normal)
        goToThirdButton.addTarget(self, action: #selector(goToThirdButtonTapped), for: .touchUpInside)
        
        let img = UIImageView(image: UIImage(named: "foto"))
        
        let stackView = UIStackView(arrangedSubviews: [goToFirstButton, goToThirdButton, img])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        img.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        img.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func goToFirstButtonTapped() {
        coordinator?.goToFirstScreen()
    }
    
    @objc func goToThirdButtonTapped() {
        coordinator?.goToThirdScreen()
    }
}

class ThirdViewController: UIViewController {
    weak var coordinator: ThirdScreenCoordinator?

    init(coordinator: ThirdScreenCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let goToFirstButton = UIButton(type: .system)
        goToFirstButton.setTitle("[Tela 3] - Ir para TELA 1", for: .normal)
        goToFirstButton.addTarget(self, action: #selector(goToFirstButtonTapped), for: .touchUpInside)

        let goToSecondButton = UIButton(type: .system)
        goToSecondButton.setTitle("[Tela 3] - Ir para TELA 2", for: .normal)
        goToSecondButton.addTarget(self, action: #selector(goToSecondButtonTapped), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [goToFirstButton, goToSecondButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func goToFirstButtonTapped() {
        coordinator?.goToFirstScreen()
    }

    @objc func goToSecondButtonTapped() {
        coordinator?.goToSecondScreen()
    }
}

