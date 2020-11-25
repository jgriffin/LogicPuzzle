@testable import LogicPuzzle
import XCTest

// The Mazdaysians are worshippers of the Parsi god Ahura Mazda, who is the good god;
// whereas the Aharmanites worship the evil Parsi god Aharman.
// The Mazdaysians always tell the truth — they never lie.
// The Aharmanites never tell the truth — they always lie.
// All members of any one family are of the same type.
// Thus, given any pair of brothers, they are either both Mazdaysians or both Aharmanites.
//
// Now, I heard a story of two brothers, Bahman and Perviz, who were once asked if they were married. They gave the following replies:
// Bahman: We are both married.
// Perviz: I am not married.
//
// “Is Bahman married or not? And what about Perviz?”

final class RiddleOfScheherazadeTests: XCTestCase {
    typealias PL = PredicateLogic

    func testACase() {
        let pTruthTellerFamily = Predicate("truthTellerFamily")
        let pMarried = Predicate("married")

        let bahman = Agent("Bahman", [pTruthTellerFamily, pMarried])
        let perviz = Agent("Perviz", [pMarried])

        let ttBahman = PL.agent(bahman, hasPredicate: pTruthTellerFamily)
        let ttPerviz = PL.agent(perviz, hasPredicate: pTruthTellerFamily)
        let sameFamily = PL.biConditional(ttBahman, ttPerviz)

        let world = World(agents: [bahman, perviz])

        let test = sameFamily(world)
        print(test ? "same family" : "different famlies")
        XCTAssertEqual(test, false)
    }
}
