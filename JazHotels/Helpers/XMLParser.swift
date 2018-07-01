//
//  XMLParser.swift
//  JazHotels
//
//  Created by Nada Gamal Mohamed on 6/30/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import Foundation
private class ParserDelegate:NSObject, XMLParserDelegate{
    
    init(element:String){
        self.element=element
        super.init()
    }
    
    var text=""
    var element:String
    var recordingElementValue:Bool=false
    
    func parser(parser: XMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        print("element start: \(elementName)")
        if elementName==element{
            recordingElementValue=true
        }
    }
    
    func parser(parser: XMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        print("element finish: \(elementName)")
        if elementName==element{
            recordingElementValue=false
        }
    }
    
    func parser(parser: XMLParser!, foundCharacters string: String!) {
        if recordingElementValue{
            text+=string
        }
    }
    
}

class JXMLParser{
    
    init(xml:String, element:String){
        self.xmlString=xml
        self.parserDelegate=ParserDelegate(element:element)
    }
    
    private var xmlString:String
    var returnValue:String?
    private var parserDelegate:ParserDelegate
    
    func parse()->Bool{
        let p=XMLParser(data: xmlString.data(using: String.Encoding.utf8, allowLossyConversion: false)!)
        p.delegate=parserDelegate
        if p.parse(){
            returnValue=parserDelegate.text
            return true
        }
        return false
    }
    
}
