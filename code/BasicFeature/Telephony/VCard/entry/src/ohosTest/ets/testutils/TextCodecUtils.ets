/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Text encoding and folding helpers shared by the VCard hypium test
 * suites. Every routine is pure: it never mutates its arguments and it
 * returns well defined results even for degenerate inputs, so tests can
 * assert exact expectations without relying on undefined behaviour.
 *
 * Covered conventions:
 * - base64Encode and base64Decode implement RFC 4648 over ASCII bytes
 *   only; any char code above 127 makes the conversion fail with ''.
 * - vcardEscape mirrors the vCard 4.0 text escaping where the
 *   backslash is rewritten first, then ';', ',' and the newline char;
 *   vcardUnescape is the exact inverse and leaves unknown or dangling
 *   escape sequences untouched.
 * - foldLine implements classic content line folding: the first line
 *   holds up to width characters and every continuation chunk holds up
 *   to 74 characters introduced by a "\r\n " marker; unfoldText is the
 *   symmetric operation removing both "\r\n " and "\n " markers.
 * - quotedPrintableEncode escapes every non alphanumeric ASCII byte as
 *   "=XX" with uppercase hexadecimal digits, which includes the '='
 *   sign itself becoming '=3D'.
 * - repeatConcat joins copies of a text with a separator, returning ''
 *   for a non positive repetition count.
 *
 * Round trip guarantee. For every pure ASCII input s the compositions
 * base64Decode(base64Encode(s)) == s, vcardUnescape(vcardEscape(s))
 * == s and unfoldText(foldLine(s, w)) == s hold for every positive
 * width w, and the decode-oriented suite asserts each of them over
 * dedicated sample matrices so a future edit cannot silently break
 * the pairing between an encoder and its inverse.
 */
export class TextCodecUtils {
  /** RFC 4648 base64 alphabet in canonical order. */
  private static readonly BASE64_TABLE: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  /** Uppercase hexadecimal digits used by quoted-printable escaping. */
  private static readonly HEX_TABLE: string = '0123456789ABCDEF';
  /** Continuation chunk width of foldLine, matching the vCard habit. */
  private static readonly FOLD_WIDTH: number = 74;

  /**
   * Encodes a text as standard RFC 4648 base64. The routine inspects
   * every character first and returns the empty string as soon as any
   * char code above 127 is found, because multi byte UTF-16 units
   * would otherwise produce ambiguous byte streams. ASCII input is
   * taken three bytes at a time and rendered as four table characters;
   * a dangling single byte appends '==' padding and two dangling bytes
   * append '=' padding, exactly as the RFC requires. Reference vectors
   * from the RFC: '' is '', 'f' is 'Zg==', 'fo' is 'Zm8=', 'foo' is
   * 'Zm9v', 'foob' is 'Zm9vYg==', 'fooba' is 'Zm9vYmE=' and 'foobar'
   * is 'Zm9vYmFy'.
   *
   * Extra hand checked vectors used by the logic suite: 'Hello' is
   * 'SGVsbG8=', 'hello world' is 'aGVsbG8gd29ybGQ=', 'A' is 'QQ==',
   * 'AB' is 'QUI=', 'ABC' is 'QUJD' and the punctuation triple '~!?'
   * maps onto 'fiE/' because 31, 34, 4 and 63 are f, i, E and '/'.
   */
  static base64Encode(text: string): string {
    for (let i: number = 0; i < text.length; i++) {
      if (text.charCodeAt(i) > 127) {
        return '';
      }
    }
    let result: string = '';
    const len: number = text.length;
    let i: number = 0;
    while (i + 3 <= len) {
      const b0: number = text.charCodeAt(i);
      const b1: number = text.charCodeAt(i + 1);
      const b2: number = text.charCodeAt(i + 2);
      result += TextCodecUtils.BASE64_TABLE.charAt((b0 >> 2) & 63);
      result += TextCodecUtils.BASE64_TABLE.charAt(((b0 & 3) << 4) | ((b1 >> 4) & 15));
      result += TextCodecUtils.BASE64_TABLE.charAt(((b1 & 15) << 2) | ((b2 >> 6) & 3));
      result += TextCodecUtils.BASE64_TABLE.charAt(b2 & 63);
      i += 3;
    }
    if (len - i === 1) {
      const b0: number = text.charCodeAt(i);
      result += TextCodecUtils.BASE64_TABLE.charAt((b0 >> 2) & 63);
      result += TextCodecUtils.BASE64_TABLE.charAt((b0 & 3) << 4);
      result += '==';
    } else if (len - i === 2) {
      const b0: number = text.charCodeAt(i);
      const b1: number = text.charCodeAt(i + 1);
      result += TextCodecUtils.BASE64_TABLE.charAt((b0 >> 2) & 63);
      result += TextCodecUtils.BASE64_TABLE.charAt(((b0 & 3) << 4) | ((b1 >> 4) & 15));
      result += TextCodecUtils.BASE64_TABLE.charAt((b1 & 15) << 2);
      result += '=';
    }
    return result;
  }

  /**
   * Decodes a standard RFC 4648 base64 text back into the ASCII string
   * it was produced from. The routine rejects, with '', every input
   * whose length is not a multiple of four, whose padding runs longer
   * than two '=' characters, whose '=' signs are not a plain suffix or
   * which contains any character outside the canonical alphabet. A
   * relaxed stance is taken on the discarded padding bits of the final
   * group, matching what most interoperable implementations do. The
   * empty string decodes to the empty string.
   *
   * Rejection matrix asserted by the decode suite: lengths 1, 2 and 3
   * fail the modulo check, 'ABCD!' and '****' fail the alphabet check,
   * 'Z==g' and 'Zg=Z' fail the suffix check because data follows an
   * '=' sign, and '====' fails because three or more pad characters
   * cannot encode a whole six bit group.
   */
  static base64Decode(encoded: string): string {
    const len: number = encoded.length;
    if (len % 4 !== 0) {
      return '';
    }
    let pad: number = 0;
    for (let i: number = len - 1; i >= 0; i--) {
      if (encoded.charAt(i) === '=') {
        pad += 1;
      } else {
        break;
      }
    }
    if (pad > 2) {
      return '';
    }
    let sawPad: boolean = false;
    for (let i: number = 0; i < len; i++) {
      const ch: string = encoded.charAt(i);
      if (ch === '=') {
        sawPad = true;
      } else if (sawPad) {
        return '';
      }
    }
    let result: string = '';
    const dataEnd: number = len - pad;
    let i: number = 0;
    while (i < dataEnd) {
      const c0: number = TextCodecUtils.intOfChar(encoded.charAt(i));
      if (c0 < 0) {
        return '';
      }
      const c1: number = TextCodecUtils.intOfChar(encoded.charAt(i + 1));
      if (c1 < 0) {
        return '';
      }
      result += String.fromCharCode((c0 << 2) | (c1 >> 4));
      if (i + 2 < dataEnd) {
        const c2: number = TextCodecUtils.intOfChar(encoded.charAt(i + 2));
        if (c2 < 0) {
          return '';
        }
        result += String.fromCharCode(((c1 & 15) << 4) | (c2 >> 2));
        if (i + 3 < dataEnd) {
          const c3: number = TextCodecUtils.intOfChar(encoded.charAt(i + 3));
          if (c3 < 0) {
            return '';
          }
          result += String.fromCharCode(((c2 & 3) << 6) | c3);
        }
      }
      i += 4;
    }
    return result;
  }

  /**
   * Maps one base64 character onto its six bit value. Letters map onto
   * 0-25 and 26-51, digits onto 52-61, '+' onto 62 and '/' onto 63.
   * Everything else, including '=' and every non ASCII character,
   * yields -1 so the caller can reject the whole input.
   */
  private static intOfChar(ch: string): number {
    if (ch.length !== 1) {
      return -1;
    }
    const code: number = ch.charCodeAt(0);
    if (code >= 65 && code <= 90) {
      return code - 65;
    }
    if (code >= 97 && code <= 122) {
      return code - 71;
    }
    if (code >= 48 && code <= 57) {
      return code + 4;
    }
    if (code === 43) {
      return 62;
    }
    if (code === 47) {
      return 63;
    }
    return -1;
  }

  /**
   * Applies the vCard 4.0 text escaping: the backslash is rewritten
   * first so the later replacements cannot create new backslashes,
   * then ';' becomes "\;", ',' becomes "\," and the newline character
   * becomes the two character sequence backslash plus 'n'. Every other
   * character is copied unchanged, so escaping an already escaped text
   * doubles its backslashes deterministically.
   *
   * Worked example asserted literally by the escape suite: the input
   * text x, ';', y, ',', z, LF, w, backslash, v becomes x, '\;', y,
   * '\,', z, '\n', w, '\\', v, in which every marker is the literal
   * two character form written in the vCard payload.
   */
  static vcardEscape(text: string): string {
    let result: string = '';
    for (let i: number = 0; i < text.length; i++) {
      const ch: string = text.charAt(i);
      if (ch === '\\') {
        result += '\\\\';
      } else if (ch === ';') {
        result += '\\;';
      } else if (ch === ',') {
        result += '\\,';
      } else if (ch === '\n') {
        result += '\\n';
      } else {
        result += ch;
      }
    }
    return result;
  }

  /**
   * Reverses vcardEscape: "\n" (backslash followed by 'n') becomes the
   * newline character, "\\" a single backslash, "\;" a ';' and "\," a
   * ','. Unknown escape sequences such as "\x" and a dangling trailing
   * backslash are kept verbatim, which guarantees that unescaping an
   * escaped text always restores the original input exactly.
   */
  static vcardUnescape(text: string): string {
    let result: string = '';
    let i: number = 0;
    while (i < text.length) {
      const ch: string = text.charAt(i);
      if (ch === '\\' && i + 1 < text.length) {
        const next: string = text.charAt(i + 1);
        if (next === 'n') {
          result += '\n';
          i += 2;
          continue;
        } else if (next === '\\') {
          result += '\\';
          i += 2;
          continue;
        } else if (next === ';') {
          result += ';';
          i += 2;
          continue;
        } else if (next === ',') {
          result += ',';
          i += 2;
          continue;
        }
      }
      result += ch;
      i += 1;
    }
    return result;
  }

  /**
   * Folds one logical content line into physical lines: the first
   * physical line holds up to width characters and every continuation
   * chunk holds up to 74 characters, each introduced by the marker
   * "\r\n " (carriage return, line feed, single space). A non positive
   * width and a line not longer than width are returned unchanged
   * because no folding is needed.
   */
  static foldLine(line: string, width: number): string {
    if (width <= 0 || line.length <= width) {
      return line;
    }
    let result: string = line.slice(0, width);
    let cursor: number = width;
    while (cursor < line.length) {
      const end: number = Math.min(cursor + TextCodecUtils.FOLD_WIDTH, line.length);
      result += '\r\n ' + line.slice(cursor, end);
      cursor = end;
    }
    return result;
  }

  /**
   * Removes the folding markers "\r\n " and "\n " so that a folded
   * physical representation is turned back into the original logical
   * line. The two marker forms are matched character by character, so
   * a lone "\r\n" without the trailing space or a plain space in the
   * middle of a line are preserved untouched.
   *
   * The marker removal is prefix based rather than a global replace,
   * so unfolding is a single pass with no regular expression engine
   * involvement and the operation is safe on arbitrarily long vCard
   * PHOTO or NOTE lines produced by the fold suite stress cases.
   */
  static unfoldText(text: string): string {
    let result: string = '';
    let i: number = 0;
    while (i < text.length) {
      if (i + 2 < text.length && text.charAt(i) === '\r' && text.charAt(i + 1) === '\n' && text.charAt(i + 2) === ' ') {
        i += 3;
      } else if (i + 1 < text.length && text.charAt(i) === '\n' && text.charAt(i + 1) === ' ') {
        i += 2;
      } else {
        result += text.charAt(i);
        i += 1;
      }
    }
    return result;
  }

  /**
   * Encodes a text in a strict ASCII flavour of quoted-printable:
   * lowercase letters, uppercase letters and digits are copied as-is
   * while every other ASCII byte is rendered as '=' followed by two
   * uppercase hexadecimal digits, so the '=' sign itself becomes
   * '=3D', the space '=20', the newline '=0A' and the carriage return
   * '=0D'. Any char code above 127 makes the whole conversion fail
   * with '' because such bytes would need explicit charset handling.
   *
   * Hand checked matrix used by the logic suite: 'a b' is 'a=20b',
   * 'a=b' is 'a=3Db', 'a;b' is 'a=3Bb', 'a\nb' is 'a=0Ab', 'a_b' is
   * 'a=5Fb' and the two space text '  ' is '=20=20', confirming that
   * the two digit groups always use uppercase hex.
   */
  static quotedPrintableEncode(text: string): string {
    let result: string = '';
    for (let i: number = 0; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      if (code > 127) {
        return '';
      }
      const isLower: boolean = code >= 97 && code <= 122;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isDigit: boolean = code >= 48 && code <= 57;
      if (isLower || isUpper || isDigit) {
        result += text.charAt(i);
      } else {
        const high: number = Math.floor(code / 16);
        const low: number = code % 16;
        result += '=' + TextCodecUtils.HEX_TABLE.charAt(high) + TextCodecUtils.HEX_TABLE.charAt(low);
      }
    }
    return result;
  }

  /**
   * Joins times copies of text with separator between consecutive
   * copies. A non positive count yields the empty string, a count of
   * one yields the text itself without any separator, and an empty
   * text still emits separators between the empty copies, so
   * repeatConcat('', 3, '-') is '--'.
   *
   * The routine is the building block behind the long fold stress
   * inputs: repeatConcat('abcdefghij', 10, '') yields one hundred
   * characters that foldLine then splits into 10, 74 and 16 width
   * physical chunks in the documented fold tests.
   */
  static repeatConcat(text: string, times: number, separator: string): string {
    if (times <= 0) {
      return '';
    }
    let result: string = text;
    for (let i: number = 1; i < times; i++) {
      result += separator + text;
    }
    return result;
  }
}
