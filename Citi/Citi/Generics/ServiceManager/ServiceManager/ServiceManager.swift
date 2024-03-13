//
//  ServiceManager.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import Foundation
import Combine

enum ProviderName : String{
    case baseCore = "https://waseemtabrez.github.io/"
}

enum FlowSelected: String {
    case exchange = "CurrencyTest/CurrencyList.json"
}

final class ServiceManager {
    var cancellables = Set<AnyCancellable>()
    var currencies: DataModelExchange?
    
    private func loadUrl(_ caseSelected:FlowSelected) -> AnyPublisher<DataModelExchange,Error> {
        
        guard let url = URL(string: getUrl(caseSelected)) else { return Just<DataModelExchange>(DataModelExchange(baseCurrency: "", currencies: [Currencies(country: "", code: "", name: "", tradeValue: 0, flagURL: "")]))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: DataModelExchange.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func loadCurrencies(_ caseSelected:FlowSelected) -> AnyPublisher<DataModelExchange,Error> {
        return loadUrl(caseSelected)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    private func getUrl(_ caseSelected:FlowSelected, _ provider: ProviderName = .baseCore) -> String {
        return "\(provider.rawValue.description)\(caseSelected.rawValue.description)"
    }
}
