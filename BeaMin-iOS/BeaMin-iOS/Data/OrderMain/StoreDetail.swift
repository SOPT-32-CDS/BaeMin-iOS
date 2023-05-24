//
//  StoreDetail.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/16.
//

import Foundation

import CustomExtension

struct StoreDetail {
    /// header
    let storeName: String
    let storeStars: Float
    let storeReviews: Int
    let minPrice: Int
    let deliverTime: String
    let deliverTips: Int
    
    let menuOrder: [MenuOrderInfo]
}

struct MenuOrderInfo {
    let menuName: String
    let menuDetail: [OrderMenu]
}

struct OrderMenu {
    let menuName: String
    let menuContent: String
    let menuPrice: Int
}

extension StoreDetail {
    static var storeDetailDummy: StoreDetail {
        return .init(storeName: "정담초밥 송파점",
                     storeStars: 4.9,
                     storeReviews: 176,
                     minPrice: 15000,
                     deliverTime: "38~48",
                     deliverTips: 4440,
                     menuOrder: MenuOrderInfo.menuDummy)
    }
}

extension MenuOrderInfo {
    static var menuDummy: [MenuOrderInfo] {
        return [.init(menuName: "인기 메뉴",
                     menuDetail: [.init(menuName: "[재주문 1위] 특초밥+미니우동",
                                        menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                        menuPrice: 16000),
                                  .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                        menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                        menuPrice: 16000),
                                  .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                        menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                        menuPrice: 16000)]),
                .init(menuName: "세트 메뉴",
                     menuDetail: [.init(menuName: "[재주문 1위] 특초밥+미니우동",
                                        menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                        menuPrice: 16000),
                                  .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                        menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                        menuPrice: 16000),
                                  .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                        menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                        menuPrice: 16000)]),
                .init(menuName: "단품 초밥",
                      menuDetail: [.init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000),
                                   .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000),
                                   .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000)]),
                .init(menuName: "사시미",
                      menuDetail: [.init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000),
                                   .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000),
                                   .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000)]),
                .init(menuName: "일품류",
                      menuDetail: [.init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000),
                                   .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000),
                                   .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000)]),
                .init(menuName: "음료",
                      menuDetail: [.init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000),
                                   .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000),
                                   .init(menuName: "[재주문 1위] 특초밥+미니우동",
                                         menuContent: "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,초새우1p, 간장새우1p, 생새우1p, 소...",
                                         menuPrice: 16000)])
        ]
    }
}
