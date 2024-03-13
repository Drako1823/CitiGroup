//
//  MenuTabDomain.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import Combine

protocol MenuTabDomainProtocol: AnyObject {
    func execute() -> AnyPublisher<DataModelExchange, Error>
}

final class MenuTabDomain: MenuTabDomainProtocol {
    private let serviceManager : ServiceManager
    
    init(serviceManager: ServiceManager) {
        self.serviceManager = serviceManager
    }
    
    func execute() -> AnyPublisher<DataModelExchange, Error> {
        serviceManager.loadCurrencies(.exchange)
    }
}
