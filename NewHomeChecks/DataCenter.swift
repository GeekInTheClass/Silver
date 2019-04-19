//
//  DataCenter.swift
//  DataCenter
//
//  Created by Excelsus on 18/04/2019.
//  Copyright © 2019 MeiGuoFanDian. All rights reserved.
//

import Foundation

// CheckList
class CheckList{
    var ElementArray = Array<Element>()
    
    init(){
        self.ElementArray = []
        let TempElement = Element(Title: "가칭", Type: .Text)
        TempElement.Data.DataInput(Data: "New Home")
        self.ElementArray.append(TempElement)
    }
    
    func AddElement(Type: ElementType){
        let TempElement = Element(Title: "새 항목", Type: Type)
        self.ElementArray.append(TempElement)
    }
    
    func AddElement(Title: String, Type: ElementType){
        let TempElemnt = Element(Title: Title, Type: Type)
        self.ElementArray.append(TempElemnt)
    }
    
    func ChangeTitle(Index: Int, NewTitle: String){
        ElementArray[Index].Title = NewTitle
    }
    
    func DeleteElement(Index: Int){
        ElementArray.remove(at: Index)
    }
    
    func Duplicate() -> CheckList{
        let TempList = CheckList()
        TempList.DeleteElement(Index: 0)
        for EachElement in self.ElementArray {
            TempList.AddElement(Title: EachElement.Title, Type: EachElement.ElType)
        }
        TempList.ElementArray[0].DataInput(Input: "New Home")
        return TempList
    }
}

// 항목타입 열거형
enum ElementType{
    case CheckBox
    case Picture
    case Text
    case Number
}

// 기반 데이터
class Undefined{
    func DataInput(Data: String){
    }
}

// 상속 데이터
class CheckBox: Undefined{
    var Value: Bool
    
    override init(){
        self.Value = false
    }
    
    override func DataInput(Data: String) {
        switch Data {
        case "true":
            self.Value = true
        case "false":
            self.Value = false
        default:
            self.Value = false
        }
    }
}

class Picture: Undefined{
    var Value: String
    
    override init(){
        self.Value = "Some File Directory"
    }
    
    override func DataInput(Data: String) {
        self.Value = Data
    }
}

class Text: Undefined{
    var Value: String
    
    override init(){
        self.Value = ""
    }
    
    override func DataInput(Data: String) {
        self.Value = Data
    }
}

class Number: Undefined{
    var Value: Int
    
    override init(){
        self.Value = 0
    }
    
    override func DataInput(Data: String) {
        self.Value = Int(Data) ?? 0
    }
}

// 항목
struct Element{
    var Title: String
    var ElType: ElementType
    var Data: Undefined
    
    init(Title: String, Type: ElementType){
        self.Title = Title
        self.ElType = Type
        
        switch Type{
        case .CheckBox:
            self.Data = CheckBox()
        case .Picture:
            self.Data = Picture()
        case .Text:
            self.Data = Text()
        case .Number:
            self.Data = Number()
        }
    }
    
    func Show() -> String {
        switch self.ElType{
        case .CheckBox:
            return Title+" is 체크박스 with " + String((self.Data as! CheckBox).Value)
        case .Picture:
            return Title+" is 사진"
        case .Text:
            return (self.Data as! Text).Value
        case .Number:
            return Title+" is 숫자 with " + String((self.Data as! Number).Value)
        }
    }
    
    func DataInput(Input: String){
        self.Data.DataInput(Data: Input)
    }
}

var ListOfElements = Array<CheckList>()

func createCheckDummy(){
    ListOfElements.append(CheckList())
    ListOfElements[0].ElementArray[0].DataInput(Input: "사근동 작은방")
    ListOfElements.append(CheckList())
    ListOfElements[1].ElementArray[0].DataInput(Input: "사근동 중간방")
    ListOfElements.append(CheckList())
    ListOfElements[2].ElementArray[0].DataInput(Input: "사근동 큰방")
    ListOfElements.append(CheckList())
    ListOfElements[3].ElementArray[0].DataInput(Input: "왕십리 작은방")
    ListOfElements.append(CheckList())
    ListOfElements[4].ElementArray[0].DataInput(Input: "왕십리 중간방")
    ListOfElements.append(CheckList())
    ListOfElements[5].ElementArray[0].DataInput(Input: "왕십리 큰방")
    ListOfElements.append(CheckList())
    ListOfElements[6].ElementArray[0].DataInput(Input: "용산동 작은방")
    ListOfElements.append(CheckList())
    ListOfElements[7].ElementArray[0].DataInput(Input: "용답동 작은방")
    ListOfElements.append(CheckList())
    ListOfElements[8].ElementArray[0].DataInput(Input: "성동구 작은방")
    ListOfElements.append(CheckList())
    ListOfElements[9].ElementArray[0].DataInput(Input: "성동구 큰방")
}

