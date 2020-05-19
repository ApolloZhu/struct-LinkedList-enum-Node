import XCTest
@testable import structLinkedList

final class LinkedListTests: XCTestCase {
    func testExample() {
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

    static var allTests = [
        ("testExample", testExample),
    ]
}
