import XCTest
@testable import structLinkedList

final class LinkedListTests: XCTestCase {
    func testToString() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let nodes: LinkedList<LinkedList<String>.Node> = [
            .value("Wow"),
            .node(value: "Hello", next: .value("World"))
        ]
        XCTAssertEqual(nodes.description, "[Wow, Hello, World]")
        XCTAssertEqual(nodes.debugDescription, #"["Wow", "Hello", "World"]"#)

        /*
         var list: LinkedList = [0,1,2,3,4,5,6,7,8,9]
         list.description
         list.debugDescription
         list.count
         list.reversed()
         for e in list {
         print(e)
         }
         list.reverse()
         list.append(-1)
         list.count
         // list[-1]
         // list[-1] = 0
         list[0]
         list[0] = 5
         list[1]
         list[1] = 6
         list[2]
         list[2] = 7
         list[3]
         list[3] = 8
         list[4]
         list[4] = 9
         // list[5]
         // list[5] = 0
         list
         list.count
         list.underestimatedCount
         */
    }

    func testCount() {
        var list: LinkedList = [0,1,2,3,4,5,6,7,8,9]
        XCTAssertEqual(list.count, 10)

        list.reverse()
        XCTAssertEqual(list.count, 10)

        list.append(-1)
        XCTAssertEqual(list.count, 11)

        list.remove(at: 0)
        XCTAssertEqual(list, [8,7,6,5,4,3,2,1,0,-1] as LinkedList)

        list.removeSubrange(1...3)
        XCTAssertEqual(list, [8,4,3,2,1,0,-1] as LinkedList)

        list.replaceSubrange(2..<4, with: [5,6,7])
        XCTAssertEqual(list, [8,4,5,6,7,1,0,-1] as LinkedList)

        list += [-2,-3,-4]
        XCTAssertEqual(list, [8,4,5,6,7,1,0,-1,-2,-3,-4] as LinkedList)

        list = [1,2,3] + list
        XCTAssertEqual(list, [1,2,3,8,4,5,6,7,1,0,-1,-2,-3,-4] as LinkedList)

        list.insert(0, at: 0)
        XCTAssertEqual(list, [0,1,2,3,8,4,5,6,7,1,0,-1,-2,-3,-4] as LinkedList)

        list.insert(contentsOf: [8,9].lazy, at: 9)
        XCTAssertEqual(list, [0,1,2,3,8,4,5,6,7,8,9,1,0,-1,-2,-3,-4] as LinkedList)

        list.removeFirst(12)
        XCTAssertEqual(list, [0,-1,-2,-3,-4] as LinkedList)

        list.removeAll { $0.isMultiple(of: 2) }
        XCTAssertEqual(list, [-1, -3] as LinkedList)
    }

    static var allTests = [
        ("testExample", testToString),
    ]
}
