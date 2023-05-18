//
//  OrderDetail.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/15.
//

import Foundation

import CustomExtension

struct OrderDetail {
    /// header
    let menuImage: Constant.ImageName
    let menuName: String
    let menuDetail: String
    let menuPrice: Int
    
    /// footer
    let menuAmount: Int
    let minPriceForDelivery: Int
    
    let addOrder: [AddOrderInfo]

}

struct AddOrderInfo {
    let addMenuName: String
    let addMenu: [Menu]
}

struct Menu {
    var isChecked: Bool = false
    let addMenuName: String
    let addMenuPrice: Int
}

extension OrderDetail {
    static var orderDetailDummy: OrderDetail {
        return .init(menuImage: .menuImage,
                     menuName: "[커플주문율1위]2인세트A+미니우동2",
                     menuDetail: "초밥24p+날치알대마끼2p+고로케2p\n(흰살생선2p, 연어2p, 토핑연어2p,초새우2p,생새우2p,\n간장새우2p,한치2p,계란2p,소고기 스테이크",
                     menuPrice: 34000,
                     menuAmount: 1,
                     minPriceForDelivery: 15000,
                     addOrder: AddOrderInfo.addOrderInfoDummy)
    }
}

extension AddOrderInfo {
    static var addOrderInfoDummy: [AddOrderInfo] {
        return [.init(addMenuName: "사이드 추가선택",
                      addMenu: [.init(addMenuName: "새우튀김 6p 추가", addMenuPrice: 7000),
                                .init(addMenuName: "새우튀김 12p 추가", addMenuPrice: 13000),
                                .init(addMenuName: "모듬튀김 추가", addMenuPrice: 13000),
                                .init(addMenuName: "고로케 4p추가", addMenuPrice: 7000),
                                .init(addMenuName: "새우장 6p추가", addMenuPrice: 10000)]),
                .init(addMenuName: "와사비 밥양 추가 선택",
                      addMenu: [.init(addMenuName: "밥양 조금 (변경)", addMenuPrice: 0),
                                .init(addMenuName: "밥양 많이 (변경)", addMenuPrice: 0),
                                .init(addMenuName: "와사비 x (변경)", addMenuPrice: 0)]),
                .init(addMenuName: "단품 1p 추가선택",
                      addMenu: [.init(addMenuName: "성게알 (우니) 2p 추가", addMenuPrice: 8000),
                                .init(addMenuName: "오도로 추가", addMenuPrice: 4500),
                                .init(addMenuName: "주도로 추가", addMenuPrice: 3500),
                                .init(addMenuName: "대광어 추가", addMenuPrice: 2000),
                                .init(addMenuName: "대광어묵은지 추가", addMenuPrice: 2100)])
        ]
    }
}
