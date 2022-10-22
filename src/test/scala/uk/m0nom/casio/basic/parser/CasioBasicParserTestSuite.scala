package uk.m0nom.casio.basic.parser

import fastparse.Parsed
import org.scalatest.funsuite.AnyFunSuite
import uk.m0nom.casio.basic.parser.CasioBasicParser.expr

class CasioBasicParserTestSuite extends AnyFunSuite {

  test("expression parser tests") {
    val Parsed.Success(2, _) = fastparse.parse("1+1", expr(_))
    val Parsed.Success(15, _) = fastparse.parse("(1+1*2)+3*4", expr(_))
    val Parsed.Success(21, _) = fastparse.parse("((1+1*2)+(3*4*5))/3", expr(_))
    val Parsed.Failure(expected, failIndex, extra) = fastparse.parse("1+1*", expr(_))
    val longAggMsg = extra.trace().longAggregateMsg
    assert(
      failIndex == 4,
      longAggMsg ==
        """Expected expr:1:1 / addSub:1:1 / divMul:1:3 / factor:1:5 / (integer | parens):1:5, found """""
    )
  }
}
