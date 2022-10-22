package uk.m0nom.casio.basic.parser

object CasioBasicParser {

  import fastparse.NoWhitespace._
  import fastparse._

  def integer[_: P]: P[Int] = P(CharIn("0-9").rep(1).!.map(_.toInt))

//  def double[_: P]: P[Double] = P(CharIn("0-9").rep(min = 1) ~ "." ~ CharIn("0-9").rep(min = 1).!.map(_.toDouble))

  def parens[_: P]: P[Int] = P("(" ~/ addSub ~ ")")

  def factor[_: P]: P[Int] = P(integer | parens)

  def divMul[_: P]: P[Int] = P(factor ~ (CharIn("*/").! ~/ factor).rep).map(eval)

  def addSub[_: P](): P[Int] = P(divMul ~ (CharIn("+\\-").! ~/ divMul).rep).map(eval)

  def expr[_: P]: P[Int] = P(addSub ~ End)

  def eval(tree: (Int, Seq[(String, Int)])): Int = {
    val (base, ops) = tree
    ops.foldLeft(base) {
      case (left, (op, right)) => op match {
        case "+" => left + right
        case "-" => left - right
        case "*" => left * right
        case "/" => left / right
        case "MOD" => Math.floorMod(left, right)
        case "^" => Math.pow(left, right).intValue()
      }
    }
  }
}
