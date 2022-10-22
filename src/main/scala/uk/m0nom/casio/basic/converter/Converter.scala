package uk.m0nom.casio.basic.converter

import java.io.{BufferedOutputStream, BufferedWriter, FileOutputStream, FileWriter}
import java.nio.charset.Charset
import java.util.stream.Collectors
import scala.io.Source
import scala.jdk.javaapi.CollectionConverters.asScala

object Converter {
  private val casioCharsetCp = List(
    /* 000 */ "�",
    /* 001 */ "�",
    /* 002 */ "�", /* Line top */
    /* 003 */ "�",
    /* 004 */ "�", /* Shift Release */
    /* 005 */ "�", /* Line Cancel */
    /* 006 */ "�", /* Line End */
    /* 007 */ "�", /* BEL */
    /* 008 */ "�", /* BS */
    /* 009 */ "\t", /* CAPS L->U */
    /* 010 */ "\n", /* LF */
    /* 011 */ "�", /* HOME */
    /* 012 */ "�", /* CLS */
    /* 013 */ "�", /* CR */
    /* 014 */ "�", /* SHIFT SET */
    /* 015 */ "�", /* CAPS U->L */
    /* 016 */ "�",
    /* 017 */ "�", /* DEL */
    /* 018 */ "�", /* INS */
    /* 019 */ "�",
    /* 020 */ "�",
    /* 021 */ "�",
    /* 022 */ "�",
    /* 023 */ "�",
    /* 024 */ "�",
    /* 025 */ "�",
    /* 026 */ "�",
    /* 027 */ "�",
    /* 028 */ "�", /* RIGHT ARROW */
    /* 029 */ "�", /* LEFT ARROW */
    /* 030 */ "�", /* UP ARROW */
    /* 031 */ "�", /* DOWN ARROW */
    /* 032 */ " ",
    /* 033 */ "!",
    /* 034 */ "\"",
    /* 035 */ "#",
    /* 036 */ "$",
    /* 037 */ "%",
    /* 038 */ "&",
    /* 039 */ "'",
    /* 040 */ "(",
    /* 041 */ ")",
    /* 042 */ "*",
    /* 043 */ "+",
    /* 044 */ ",",
    /* 045 */ "-",
    /* 046 */ ".",
    /* 047 */ "/",
    /* 048 */ "0",
    /* 049 */ "1",
    /* 050 */ "2",
    /* 051 */ "3",
    /* 052 */ "4",
    /* 053 */ "5",
    /* 054 */ "6",
    /* 055 */ "7",
    /* 056 */ "8",
    /* 057 */ "9",
    /* 058 */ ":",
    /* 059 */ ";",
    /* 060 */ "<",
    /* 061 */ "=",
    /* 062 */ ">",
    /* 063 */ "?",
    /* 064 */ "@",
    /* 065 */ "A",
    /* 066 */ "B",
    /* 067 */ "C",
    /* 068 */ "D",
    /* 069 */ "E",
    /* 070 */ "F",
    /* 071 */ "G",
    /* 072 */ "H",
    /* 073 */ "I",
    /* 074 */ "J",
    /* 075 */ "K",
    /* 076 */ "L",
    /* 077 */ "M",
    /* 078 */ "N",
    /* 079 */ "O",
    /* 080 */ "P",
    /* 081 */ "Q",
    /* 082 */ "R",
    /* 083 */ "S",
    /* 084 */ "T",
    /* 085 */ "U",
    /* 086 */ "V",
    /* 087 */ "W",
    /* 088 */ "X",
    /* 089 */ "Y",
    /* 090 */ "Z",
    /* 091 */ "[",
    /* 092 */ "¥",
    /* 093 */ "]",
    /* 094 */ "^",
    /* 095 */ "_",
    /* 096 */ "`",
    /* 097 */ "a",
    /* 098 */ "b",
    /* 099 */ "c",
    /* 100 */ "d",
    /* 101 */ "e",
    /* 102 */ "f",
    /* 103 */ "g",
    /* 104 */ "h",
    /* 105 */ "i",
    /* 106 */ "j",
    /* 107 */ "k",
    /* 108 */ "l",
    /* 109 */ "m",
    /* 110 */ "n",
    /* 111 */ "o",
    /* 112 */ "p",
    /* 113 */ "q",
    /* 114 */ "r",
    /* 115 */ "s",
    /* 116 */ "t",
    /* 117 */ "u",
    /* 118 */ "v",
    /* 119 */ "w",
    /* 120 */ "x",
    /* 121 */ "y",
    /* 122 */ "z",
    /* 123 */ "{",
    /* 124 */ "|",
    /* 125 */ "}",
    /* 126 */ "~",
    /* 127 */ "�", /* DEL */
    /* 128 */ "Å",
    /* 129 */ "∫",
    /* 130 */ "√",
    /* 131 */ "'",
    /* 132 */ "∑",
    /* 133 */ "Ω",
    /* 134 */ "▒",
    /* 135 */ "█",
    /* 136 */ "𝛼",
    /* 137 */ "𝛽",
    /* 138 */ "𝛾",
    /* 139 */ "𝜀",
    /* 140 */ "𝜃",
    /* 141 */ "𝜇",
    /* 142 */ "𝜎",
    /* 143 */ "𝜙",
    /* 144 */ "⁰",
    /* 145 */ "¹",
    /* 146 */ "²",
    /* 147 */ "³",
    /* 148 */ "⁴",
    /* 149 */ "⁵",
    /* 150 */ "⁶",
    /* 151 */ "⁷",
    /* 152 */ "⁸",
    /* 153 */ "⁹",
    /* 154 */ "⁺",
    /* 155 */ "⁻",
    /* 156 */ "ⁿ",
    /* 157 */ "﹪",
    /* 158 */ "¬",
    /* 159 */ "÷",
    /* 160 */ " ", /* SPC */
    /* 161 */ "̻",
    /* 162 */ "⌜",
    /* 163 */ "⌟",
    /* 164 */ "､",
    /* 165 */ "･",
    /* 166 */ "ｦ",
    /* 167 */ "ｧ",
    /* 168 */ "ｨ",
    /* 169 */ "ｩ",
    /* 170 */ "ｪ",
    /* 171 */ "ｫ",
    /* 172 */ "ｬ",
    /* 173 */ "ｭ",
    /* 174 */ "ｮ",
    /* 175 */ "ｯ",
    /* 176 */ "ｰ",
    /* 177 */ "ｱ",
    /* 178 */ "ｲ",
    /* 179 */ "ｳ",
    /* 180 */ "ｴ",
    /* 181 */ "ｵ",
    /* 182 */ "ｶ",
    /* 183 */ "ｷ",
    /* 184 */ "ｸ",
    /* 185 */ "ｹ",
    /* 186 */ "ｺ",
    /* 187 */ "ｻ",
    /* 188 */ "ｼ",
    /* 189 */ "ｽ",
    /* 190 */ "ｾ",
    /* 191 */ "ｿ",
    /* 192 */ "ﾀ",
    /* 193 */ "ﾁ",
    /* 194 */ "ﾂ",
    /* 195 */ "ﾃ",
    /* 196 */ "ﾄ",
    /* 197 */ "ﾅ",
    /* 198 */ "ﾆ",
    /* 199 */ "ﾇ",
    /* 200 */ "ﾈ",
    /* 201 */ "ﾉ",
    /* 202 */ "ﾊ",
    /* 203 */ "ﾋ",
    /* 204 */ "ﾌ",
    /* 205 */ "ﾍ",
    /* 206 */ "ﾎ",
    /* 207 */ "ﾏ",
    /* 208 */ "ﾐ",
    /* 209 */ "ﾑ",
    /* 210 */ "ﾒ",
    /* 211 */ "ﾓ",
    /* 212 */ "ﾔ",
    /* 213 */ "ﾕ",
    /* 214 */ "ﾖ",
    /* 215 */ "ﾗ",
    /* 216 */ "ﾘ",
    /* 217 */ "ﾙ",
    /* 218 */ "ﾚ",
    /* 219 */ "ﾛ",
    /* 220 */ "ﾜ",
    /* 221 */ "ﾝ",
    /* 222 */"ﾞ",
    /* 223 */ "ﾟ",
    /* 224 */ "≥",
    /* 225 */ "≤",
    /* 226 */ "≠",
    /* 227 */ "↑",
    /* 228 */ "←",
    /* 229 */ "↓",
    /* 230 */ "→",
    /* 231 */ "π",
    /* 232 */ "♠",
    /* 233 */ "♥",
    /* 234 */ "♣",
    /* 235 */ "♦",
    /* 236 */ "◻",
    /* 237 */ "▢",
    /* 238 */ "△",
    /* 239 */ "\\",
    /* 240 */ "×",
    /* 241 */ "�",
    /* 242 */ "�",
    /* 243 */ "�",
    /* 244 */ "�",
    /* 245 */ "�",
    /* 246 */ "�",
    /* 247 */ "£",
    /* 248 */ "¢",
    /* 249 */ "±",
    /* 250 */ "∓",
    /* 251 */ "₀",
    /* 252 */ "�",
    /* 253 */ "�",
    /* 254 */ "�",
    /* 255 */ "�")

  private val casioCharset = asScala(casioCharsetCp.mkString.codePoints.boxed.collect(Collectors.toList[Integer])) //asScala(casioCharsetCp).map(i => Int.unbox(i))

  private val charIndex = Range(0, 255)

  private val casioToUnicode = charIndex.zip(casioCharset).toMap
  private val unicodeToCasio = casioCharsetCp.zip(charIndex).toMap

  def toUnicode(casioAscii: Int): String = {
    Character.toString(casioToUnicode(casioAscii))
  }

  def toCasio(unicode: String): Int = {
    unicodeToCasio(unicode)
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
    val output = splitInput.map(s => Converter.unicodeToCasio(s)).map(i => i.toByte).toArray
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
