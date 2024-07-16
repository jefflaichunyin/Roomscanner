//
//  Device.swift
//  Roomscanner
//
//  Created by User on 5/7/2024.
//

import Foundation
import RealityKit
import RoomPlan

class Device{
    private var location: simd_float3
    private var tag: Int
    private var onCeiling: Bool
    private var size: Float
    enum category: String, CaseIterable, Identifiable{
        case Sensor
        case AirConditioning
        case Heater
        case Fan
        case AirSupply
        case AirReturn
        case AirExchange
        case DoorOpen
        case WindowOpen
        
        var id: Self { self }
    }
    private var type = category.Sensor
    
    enum conditioningType: String, CaseIterable, Identifiable{
        case window
        case split
        case NA
        
        var id: Self { self }
    }
    private var conditioner = conditioningType.NA
    
    enum supplyType: String, CaseIterable, Identifiable{
        case freshAirDuct
        case exhaustAirDuct
        case supplyAirDuct
        case NA
        
        var id: Self { self }
    }
    private var supplier = supplyType.NA
    
    init(location: simd_float3 = simd_make_float3(0, 0, 0), 
         tag: Int = 0,
         onCeiling: Bool = false,
         size: Float = 0,
         type: category = category.Sensor,
         conditioner: conditioningType = conditioningType.NA,
         supplier: supplyType = supplyType.NA)
    {
        self.location = location
        self.tag = tag
        self.onCeiling = onCeiling
        self.size = size
        self.type = type
        self.conditioner = conditioner
        self.supplier = supplier
    }
    
    func getRawType() -> category{
        return type
    }
    
    func getType() -> String{
        return self.categoryConverter(category: self.getRawType())
    }
    
    func categoryConverter(category: Device.category) -> String{
        switch category {
        case .Sensor: return "Sensor"
        case .AirConditioning: return "Air Conditioner"
        case .Heater: return "Heater"
        case .Fan: return "Fan"
        case .AirSupply: return "Air Supplier"
        case .AirReturn: return "Air Return"
        case .AirExchange: return "Air Exchanger"
        case .DoorOpen: return "Open door"
        case .WindowOpen: return "Open window"
        default: return "Unknown Device"
        }
    }
    
    func getRawConditioner() -> conditioningType{
        return conditioner
    }
    
    func getConditionerType() -> String{
        return self.conditionerConverter(conditioner: self.getRawConditioner())
    }
    
    func conditionerConverter(conditioner: Device.conditioningType) -> String{
        switch conditioner {
        case .window: return "Window Air Conditioner"
        case .split: return "Split Air Conditioner"
        case .NA: return "N/A"
        default: return "Unknown Air Conditioner"
        }
    }
    
    func getRawSupplier() -> supplyType{
        return supplier
    }
    
    func getSupplierType() -> String{
        return self.supplierConverter(supplier: self.getRawSupplier())
    }
    
    func supplierConverter(supplier: Device.supplyType) -> String{
        switch supplier{
        case .freshAirDuct: return "Fresh Air Duct"
        case .exhaustAirDuct: return "Exhaust Air Duct"
        case .supplyAirDuct: return "Supply Air Duct"
        case .NA: return "N/A"
        default: return "Unknown Air Supplier"
        }
    }
    
    func getLocation() -> simd_float3{
        return self.location
    }
    
    func setLocation(location: simd_float3){
        self.location = location
    }
    
    func getTag() -> Int{
        return self.tag
    }
    
    func setTag(tag: Int){
        self.tag = tag
    }
    
    func getOnCeiling() -> Bool{
        return self.onCeiling
    }
    
    func setOnCeiling(onCeiling: Bool){
        self.onCeiling = onCeiling
    }
    
    func getSize() -> Float{
        return self.size
    }
    
    func setSize(size: Float){
        self.size = size
    }
}

