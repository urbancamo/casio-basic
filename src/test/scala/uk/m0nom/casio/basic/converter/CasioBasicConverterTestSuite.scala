package uk.m0nom.casio.basic.converter

import org.scalatest.funsuite.AnyFunSuite

class CasioBasicConverterTestSuite extends AnyFunSuite {

  test("casio basic ascii file to unicode") {
    Converter.convertUnicodeFileToCasioBasicFile("unicode/casio-basic-sample.txt")
  }

}
