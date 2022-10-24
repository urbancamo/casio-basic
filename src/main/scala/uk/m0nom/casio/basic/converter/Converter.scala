package uk.m0nom.casio.basic.converter

import java.io.{BufferedOutputStream, BufferedWriter, FileOutputStream, FileWriter}
import java.nio.charset.Charset
import java.util.stream.Collectors
import scala.io.Source
import scala.jdk.javaapi.CollectionConverters.asScala

case class CasioCharacter(val index: Int, val unicode: String, val description: String);
case class CasioCharacterCp(val index: Int, val unicode: String, val codepoint: Int, val description: String);


// https://www.ocrconvert.com/japanese-ocr
// https://stackoverflow.com/questions/19899554/unicode-range-for-japanese

object Converter {
  private val casioCharset: List[CasioCharacter] = List(
    CasioCharacter(0, "␀", ""),
    CasioCharacter(1, "␁", ""),
    CasioCharacter(2, "␂", "Line top"),
    CasioCharacter(3, "␃", ""),
    CasioCharacter(4, "␄", "Shift Release"),
    CasioCharacter(5, "␅", "Line Cancel"),
    CasioCharacter(6, "␆", "Line End"),
    CasioCharacter(7, "␇", "BEL"),
    CasioCharacter(8, "␈", "BS"),
    CasioCharacter(9, "\t", "CAPS L->U"),
    CasioCharacter(10, "\n", "LF"),
    CasioCharacter(11, "␋", "HOME"),
    CasioCharacter(12, "␌", "CLS"),
    CasioCharacter(13, "\r", "CR"),
    CasioCharacter(14, "␎", "SHIFT SET"),
    CasioCharacter(15, "␏", "CAPS U->L"),
    CasioCharacter(16, "␐", ""),
    CasioCharacter(17, "␑", "DEL"),
    CasioCharacter(18, "␒", "INS"),
    CasioCharacter(19, "␓", ""),
    CasioCharacter(20, "␔", ""),
    CasioCharacter(21, "␕", ""),
    CasioCharacter(22, "␖", ""),
    CasioCharacter(23, "␗", ""),
    CasioCharacter(24, "␘", ""),
    CasioCharacter(25, "␙", ""),
    CasioCharacter(26, "␚", ""),
    CasioCharacter(27, "␛", ""),
    CasioCharacter(28, "⇨", "RIGHT ARROW"),
    CasioCharacter(29, "⇦", "LEFT ARROW"),
    CasioCharacter(30, "⇧", "UP ARROW"),
    CasioCharacter(31, "⇩", "DOWN ARROW"),
    CasioCharacter(32, " ", ""),
    CasioCharacter(33, "!", ""),
    CasioCharacter(34, "\"", ""),
    CasioCharacter(35, "#", ""),
    CasioCharacter(36, "$", ""),
    CasioCharacter(37, "%", ""),
    CasioCharacter(38, "&", ""),
    CasioCharacter(39, "'", ""),
    CasioCharacter(40, "(", ""),
    CasioCharacter(41, ")", ""),
    CasioCharacter(42, "*", ""),
    CasioCharacter(43, "+", ""),
    CasioCharacter(44, ",", ""),
    CasioCharacter(45, "-", ""),
    CasioCharacter(46, ".", ""),
    CasioCharacter(47, "/", ""),
    CasioCharacter(48, "0", ""),
    CasioCharacter(49, "1", ""),
    CasioCharacter(50, "2", ""),
    CasioCharacter(51, "3", ""),
    CasioCharacter(52, "4", ""),
    CasioCharacter(53, "5", ""),
    CasioCharacter(54, "6", ""),
    CasioCharacter(55, "7", ""),
    CasioCharacter(56, "8", ""),
    CasioCharacter(57, "9", ""),
    CasioCharacter(58, ":", ""),
    CasioCharacter(59, ";", ""),
    CasioCharacter(60, "<", ""),
    CasioCharacter(61, "=", ""),
    CasioCharacter(62, ">", ""),
    CasioCharacter(63, "?", ""),
    CasioCharacter(64, "@", ""),
    CasioCharacter(65, "A", ""),
    CasioCharacter(66, "B", ""),
    CasioCharacter(67, "C", ""),
    CasioCharacter(68, "D", ""),
    CasioCharacter(69, "E", ""),
    CasioCharacter(70, "F", ""),
    CasioCharacter(71, "G", ""),
    CasioCharacter(72, "H", ""),
    CasioCharacter(73, "I", ""),
    CasioCharacter(74, "J", ""),
    CasioCharacter(75, "K", ""),
    CasioCharacter(76, "L", ""),
    CasioCharacter(77, "M", ""),
    CasioCharacter(78, "N", ""),
    CasioCharacter(79, "O", ""),
    CasioCharacter(80, "P", ""),
    CasioCharacter(81, "Q", ""),
    CasioCharacter(82, "R", ""),
    CasioCharacter(83, "S", ""),
    CasioCharacter(84, "T", ""),
    CasioCharacter(85, "U", ""),
    CasioCharacter(86, "V", ""),
    CasioCharacter(87, "W", ""),
    CasioCharacter(88, "X", ""),
    CasioCharacter(89, "Y", ""),
    CasioCharacter(90, "Z", ""),
    CasioCharacter(91, "[", ""),
    CasioCharacter(92, "¥", ""),
    CasioCharacter(93, "]", ""),
    CasioCharacter(94, "^", ""),
    CasioCharacter(95, "_", ""),
    CasioCharacter(96, "`", ""),
    CasioCharacter(97, "a", ""),
    CasioCharacter(98, "b", ""),
    CasioCharacter(99, "c", ""),
    CasioCharacter(100, "d", ""),
    CasioCharacter(101, "e", ""),
    CasioCharacter(102, "f", ""),
    CasioCharacter(103, "g", ""),
    CasioCharacter(104, "h", ""),
    CasioCharacter(105, "i", ""),
    CasioCharacter(106, "j", ""),
    CasioCharacter(107, "k", ""),
    CasioCharacter(108, "l", ""),
    CasioCharacter(109, "m", ""),
    CasioCharacter(110, "n", ""),
    CasioCharacter(111, "o", ""),
    CasioCharacter(112, "p", ""),
    CasioCharacter(113, "q", ""),
    CasioCharacter(114, "r", ""),
    CasioCharacter(115, "s", ""),
    CasioCharacter(116, "t", ""),
    CasioCharacter(117, "u", ""),
    CasioCharacter(118, "v", ""),
    CasioCharacter(119, "w", ""),
    CasioCharacter(120, "x", ""),
    CasioCharacter(121, "y", ""),
    CasioCharacter(122, "z", ""),
    CasioCharacter(123, "{", ""),
    CasioCharacter(124, "|", ""),
    CasioCharacter(125, "}", ""),
    CasioCharacter(126, "~", ""),
    CasioCharacter(127, "␡", "DEL"),
    CasioCharacter(128, "Å", ""),
    CasioCharacter(129, "∫", ""),
    CasioCharacter(130, "√", ""),
    CasioCharacter(131, "'", ""),
    CasioCharacter(132, "∑", ""),
    CasioCharacter(133, "Ω", ""),
    CasioCharacter(134, "▒", ""),
    CasioCharacter(135, "█", ""),
    CasioCharacter(136, "𝛼", ""),
    CasioCharacter(137, "𝛽", ""),
    CasioCharacter(138, "𝛾", ""),
    CasioCharacter(139, "𝜀", ""),
    CasioCharacter(140, "𝜃", ""),
    CasioCharacter(141, "𝜇", ""),
    CasioCharacter(142, "𝜎", ""),
    CasioCharacter(143, "𝜙", ""),
    CasioCharacter(144, "⁰", ""),
    CasioCharacter(145, "¹", ""),
    CasioCharacter(146, "²", ""),
    CasioCharacter(147, "³", ""),
    CasioCharacter(148, "⁴", ""),
    CasioCharacter(149, "⁵", ""),
    CasioCharacter(150, "⁶", ""),
    CasioCharacter(151, "⁷", ""),
    CasioCharacter(152, "⁸", ""),
    CasioCharacter(153, "⁹", ""),
    CasioCharacter(154, "⁺", ""),
    CasioCharacter(155, "⁻", ""),
    CasioCharacter(156, "ⁿ", ""),
    CasioCharacter(157, "﹪", ""),
    CasioCharacter(158, "¬", ""),
    CasioCharacter(159, "÷", ""),
    CasioCharacter(160, " ", "SPC"),
    CasioCharacter(161, "。", ""),
    CasioCharacter(162, "「", ""),
    CasioCharacter(163, "」", ""),
    CasioCharacter(164, "、", ""),
    CasioCharacter(165, "・", ""),
    CasioCharacter(166, "ｦ", ""),
    CasioCharacter(167, "ｧ", ""),
    CasioCharacter(168, "ｨ", ""),
    CasioCharacter(169, "ｩ", ""),
    CasioCharacter(170, "ｪ", ""),
    CasioCharacter(171, "ｫ", ""),
    CasioCharacter(172, "ｬ", ""),
    CasioCharacter(173, "ｭ", ""),
    CasioCharacter(174, "ｮ", ""),
    CasioCharacter(175, "ｯ", ""),
    CasioCharacter(176, "ー", ""),
    CasioCharacter(177, "ｱ", ""),
    CasioCharacter(178, "ｲ", ""),
    CasioCharacter(179, "ｳ", ""),
    CasioCharacter(180, "ｴ", ""),
    CasioCharacter(181, "ｵ", ""),
    CasioCharacter(182, "ｶ", ""),
    CasioCharacter(183, "ｷ", ""),
    CasioCharacter(184, "ｸ", ""),
    CasioCharacter(185, "ｹ", ""),
    CasioCharacter(186, "ｺ", ""),
    CasioCharacter(187, "ｻ", ""),
    CasioCharacter(188, "ｼ", ""),
    CasioCharacter(189, "ｽ", ""),
    CasioCharacter(190, "ｾ", ""),
    CasioCharacter(191, "ｿ", ""),
    CasioCharacter(192, "ﾀ", ""),
    CasioCharacter(193, "ﾁ", ""),
    CasioCharacter(194, "ﾂ", ""),
    CasioCharacter(195, "ﾃ", ""),
    CasioCharacter(196, "ﾄ", ""),
    CasioCharacter(197, "ﾅ", ""),
    CasioCharacter(198, "ﾆ", ""),
    CasioCharacter(199, "ﾇ", ""),
    CasioCharacter(200, "ﾈ", ""),
    CasioCharacter(201, "ﾉ", ""),
    CasioCharacter(202, "ﾊ", ""),
    CasioCharacter(203, "ﾋ", ""),
    CasioCharacter(204, "ﾌ", ""),
    CasioCharacter(205, "ﾍ", ""),
    CasioCharacter(206, "ﾎ", ""),
    CasioCharacter(207, "ﾏ", ""),
    CasioCharacter(208, "ﾐ", ""),
    CasioCharacter(209, "ﾑ", ""),
    CasioCharacter(210, "ﾒ", ""),
    CasioCharacter(211, "ﾓ", ""),
    CasioCharacter(212, "ﾔ", ""),
    CasioCharacter(213, "ﾕ", ""),
    CasioCharacter(214, "ﾖ", ""),
    CasioCharacter(215, "ﾗ", ""),
    CasioCharacter(216, "ﾘ", ""),
    CasioCharacter(217, "ﾙ", ""),
    CasioCharacter(218, "ﾚ", ""),
    CasioCharacter(219, "ﾛ", ""),
    CasioCharacter(220, "ﾜ", ""),
    CasioCharacter(221, "ﾝ", ""),
    CasioCharacter(222, "゛", ""),
    CasioCharacter(223, "゜", ""),
    CasioCharacter(224, "≥", ""),
    CasioCharacter(225, "≤", ""),
    CasioCharacter(226, "≠", ""),
    CasioCharacter(227, "↑", ""),
    CasioCharacter(228, "←", ""),
    CasioCharacter(229, "↓", ""),
    CasioCharacter(230, "→", ""),
    CasioCharacter(231, "π", ""),
    CasioCharacter(232, "♠", ""),
    CasioCharacter(233, "♥", ""),
    CasioCharacter(234, "♣", ""),
    CasioCharacter(235, "♦", ""),
    CasioCharacter(236, "◻", ""),
    CasioCharacter(237, "▢", ""),
    CasioCharacter(238, "△", ""),
    CasioCharacter(239, "\\", ""),
    CasioCharacter(240, "×", ""),
    CasioCharacter(241, "円", ""),
    CasioCharacter(242, "⽜", ""),
    CasioCharacter(243, "⽉", ""),
    CasioCharacter(244, "日", ""),
    CasioCharacter(245, "千", ""),
    CasioCharacter(246, "万", ""),
    CasioCharacter(247, "£", ""),
    CasioCharacter(248, "¢", ""),
    CasioCharacter(249, "±", ""),
    CasioCharacter(250, "∓", ""),
    CasioCharacter(251, "₀", ""),
    CasioCharacter(252, "┐", ""),
    CasioCharacter(253, "┘", ""),
    CasioCharacter(254, "├", ""),
    CasioCharacter(255, "┤", ""))

//  private val casioCharset = asScala(casioCharsetCp.mkString.codePoints.boxed.collect(Collectors.toList[Integer])) //asScala(casioCharsetCp).map(i => Int.unbox(i))
  private val casioToUnicode = {
    var newMap: Map[Int, CasioCharacterCp] = Map.empty
    for (c <- casioCharset)
      newMap += (c.index -> CasioCharacterCp(c.index, c.unicode, Character.codePointOf(c.unicode), c.description))
    newMap
  }

  private val unicodeToCasio = {
    var newMap: Map[String, CasioCharacterCp] = Map.empty
    for (c <- casioCharset)
      newMap += (c.unicode -> CasioCharacterCp(c.index, c.unicode, Character.codePointOf(c.unicode), c.description))
    newMap
  }

  private val charIndex = Range(0, 255)

 // private val unicodeToCasio = casioCharsetCp.zip(charIndex).toMap

  def toUnicode(casioAscii: Int): String = {
    casioToUnicode(casioAscii).unicode
  }

  def toCasio(unicode: String): Int = {
    unicodeToCasio(unicode).index
  }

  def convertCasioBasicFileToUnicodeFile(filename: String): Unit = {
    // Convert a CASIO Basic encoded file to Unicode
    val content = Source.fromFile(filename).mkString
    val output = content.map(c => Converter.casioToUnicode(c.toInt)).mkString
    val writer = new BufferedWriter(new FileWriter(filename.replace(".bas", ".txt"), Charset.forName("UTF-8")))
    writer.write(output)
    writer.close
  }

  def convertUnicodeFileToCasioBasicFile(filename: String): Unit = {
    // Convert a Unicode file to Casio Basic encoding
    val content = Source.fromFile(filename).mkString
    // Split the input file into a list of strings representing each codepoint
    val splitInput = asScala(content
      .codePoints() // Produce a `IntStream` of code point numbers.
      .mapToObj(i => Character.toString(i)) // Produce a `String` containing one or two java chars for each code point in the stream.
      .collect(Collectors.toList[String]));
    val output = splitInput.map(s => toCasio(s).toByte).toArray
    val bos = new BufferedOutputStream(new FileOutputStream(filename.replace(".txt", ".bas")))
    bos.write(output)
    bos.close
  }

  def main(args: Array[String]) = {
    println(s"args size is ${args.length}")
    if (args.size != 1) {
      println("Usage: Converter file.[bas|txt]")
      println("       use .bas to convert from Casio Basic to Unicode")
      println("       use .txt to convert from Unicode to Casio Basic")
      System.exit(-1)
    }

    val filename = args(0)

    if (filename.endsWith(".bas")) {
      convertCasioBasicFileToUnicodeFile(filename)
    } else if (filename.endsWith(".txt")) {
      convertUnicodeFileToCasioBasicFile(filename)
    } else {
      println("Converter argument must end with either .bas (Casio Basic) or .txt (Unicode)")
    }

    println(filename)
  }
}
