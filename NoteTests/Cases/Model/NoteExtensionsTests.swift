//
//  NoteExtensionsTests.swift
//  NoteTests
//
//  Created by Roman Brovko on 6/18/19.
//  Copyright © 2019 Roman Brovko. All rights reserved.
//

import XCTest
@testable import Note

class NoteExtensionsTests: XCTestCase {

    var sut: Note!
    
    override func setUp() {
        super.setUp()
        sut = Note(title: "Title", content: "text", importance: .important)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testNoteExtensions_whenParseEmptyDict_isOptionalNote() {
        let note = Note.parse(json: [:])
        
        XCTAssertNil(note)
    }
    
    func testNoteExtensions_whenGetJson_dictIsNotEmpty() {
        let json = sut.json
        
        XCTAssertFalse(json.isEmpty)
    }
    
    func testNoteExtensions_whenGetJsonWithWhiteColor_hasNotSaveColor() {
        let note = Note(title: "Text", content: "More", color: .red, importance: .important)
        let json = note.json
        let jsonWithoutColor = sut.json
        
        XCTAssertTrue(json.count > jsonWithoutColor.count)
    }
    
    func testNoteExtensions_whenGetJsonWithNormalImportant_hasNotSaveImportant() {
        let note = Note(title: "Text", content: "More", importance: .normal)
        let json = sut.json
        let jsonWithoutImportant = note.json
        
        XCTAssertTrue(json.count > jsonWithoutImportant.count)
    }

    func testNoteExtensions_whenGetJsonWithoutDate_hasNotSaveDate() {
        let note = Note(title: "Text", content: "More", importance: .important, destructDate: Date())
        let json = note.json
        let jsonWithoutDate = sut.json
        
        XCTAssertTrue(json.count > jsonWithoutDate.count)
    }

    func testNoteExtensions_whenGetJsonAndParseJson_isNote() {
        let note = getNoteThroughJsonFrom(sut)
        
        XCTAssertNotNil(note)
    }
    
    func testNoteExtensions_whenGetJsonAndParseJson_isEqualsNotes() {
        let _note = getNoteThroughJsonFrom(sut)
        
        guard let note = _note else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(sut.uid, note.uid)
        XCTAssertEqual(sut.title, note.title)
        XCTAssertEqual(sut.content, note.content)
        XCTAssertEqual(sut.importance, note.importance)
        XCTAssertEqual(sut.color, note.color)
        
        XCTAssertNil(sut.selfDestructDate)
        XCTAssertNil(note.selfDestructDate)
    }

    func testNoteExtensions_whenGetJsonAndParseJsonForFullNote_isEqualsNotes() {
        let originNote = Note(uid: "1234", title: "Title1", content: "My text", color: .red, importance: .unimportant, destructDate: Date())
        let _note = getNoteThroughJsonFrom(originNote)
        
        guard let note = _note else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(originNote.uid, note.uid)
        XCTAssertEqual(originNote.title, note.title)
        XCTAssertEqual(originNote.content, note.content)
        XCTAssertEqual(originNote.importance, note.importance)
        XCTAssertEqual(originNote.color, note.color)
        
        guard let originDate = originNote.selfDestructDate,
            let date = note.selfDestructDate else {
                XCTFail()
                return
        }
        
        XCTAssertEqual(originDate, date)
    }

    
    private func getNoteThroughJsonFrom(_ note: Note) -> Note? {
        return Note.parse(json: note.json)
    }
}
