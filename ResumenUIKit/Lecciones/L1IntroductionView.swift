//
//  OnboardingView.swift
//  ResumenUIKit
//
//  Created by Gonzalo Arques on 13/3/24.
//

import UIKit

// Esta clase se trata de una introducción de cosas que iremos viendo en profundidad en cada lección

final class L1IntroductionView: UIView { // Extendemos de UIView, porque esta clase representa una vista de diseño (de forma programática)
    
    // Creamos la pantalla de forma programática utilizando closures:
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // Hacemos que se adapte al tamaño del width y height proporcionado en las constraints
        imageView.image = UIImage(named: "umbrella")
        imageView.translatesAutoresizingMaskIntoConstraints = false // Indicamos que las constraints las configuraremos nosotros por código (y no por diseño visual (storyboards, .xibs))
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0 // Líneas infinitas (hasta que se pueda ver todo el texto, es decir, no pondrá puntos suspensivos en caso de que no quepa)
        label.textAlignment = .center
        label.text = "Bienvenido"
        label.font = UIFont(name: "Arial Rounded MT bold", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var skipOnboardingButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Pulsa para continuar"
        config.subtitle = "onboarding"
        
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(showMessage), for: .touchUpInside) // Veremos otra forma de incluir una acción a un botón. Esta "depende" de Objective-C.
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Esta función es necesaria para inicializar la view con un tamaño por defecto (.zero)
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    // Esto es obligatorio al incluir el init, más o menos es para indicar que no estamos usando un diseño visual
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        [onboardingImageView,
         textLabel,
         skipOnboardingButton
        ].forEach(addSubview)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            onboardingImageView.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            onboardingImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textLabel.topAnchor.constraint(equalTo: onboardingImageView.bottomAnchor, constant: 32),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            skipOnboardingButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 42),
            skipOnboardingButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    @objc func showMessage() {
        print("Skip onboarding")
    }
    
}