//
//  Alert.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

enum AlertType {
    
    case success
    case error(title: String, message: String = "")
    
    func title() -> String {
        switch self {
        case .success:
            return "Success"
        case .error(title: let title, _):
            return title
        }
    }
    
    func message() -> String {
        switch self {
        case .success:
            return "Por favor intenta en otro momento"
        case .error(_, message: let message):
            return message
        }
    }
    
    /// Left button action text for the alert view
    var leftActionText: String {
        switch self {
        case .success:
            return "Aceptar"
        case .error(_, _):
            return "Reintentar"
        }
    }
    
    /// Right button action text for the alert view
    var rightActionText: String {
        switch self {
        case .success:
            return "Cancelar"
        case .error(_, _):
            return "Cancelar"
        }
    }
}
