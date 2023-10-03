//
//  File.swift
//  
//
//  Created by Florian Hubl on 03.10.23.
//

import Foundation

public protocol BlockExplorer {
    func addressTXS(address: String) async throws -> Transactions
    func recommendedFees() async throws -> RecommendedFees
    func addressUTXOs(address: String) async throws -> UTXOs
    func sendTransaction(hex: String) async throws -> String
    func transaction(txid: String) async throws -> Transaction
    func transactionOutspends(txid: String) async throws -> TransactionOutspends
}
