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
 * vCard string factory shared by the FACT and FIXT hypium test suites.
 *
 * Every builder returns a fully assembled vCard text where each logical
 * line is terminated with the CRLF pair '\r\n', matching the line
 * conventions of the vCard 2.1/3.0/4.0 specifications. The factory is
 * deterministic: the same arguments always produce byte-identical text,
 * which lets the suites assert exact structures, line counts, token
 * occurrence counts and fold boundaries without any randomness.
 *
 * All methods are static and side-effect free. Escaping and folding are
 * implemented inline here on purpose so the suites do not depend on any
 * other utility class. The canonical single 3.0 card has exactly seven
 * logical lines (BEGIN, VERSION, N, FN, TEL, EMAIL, END), a 2.1/4.0
 * card has six, and the empty-fields card has eight because it carries
 * the extra ORG line. Each card therefore contributes exactly one more
 * empty entry than its logical line count when the text is split on
 * '\r\n', which the FACT and FIXT suites assert explicitly.
 *
 * Worked examples used by the suites:
 * - singleContactV21('Alice', '13800138000') contains the lines
 *   'BEGIN:VCARD', 'VERSION:2.1', 'N:Alice;;;', 'FN:Alice',
 *   'TEL:13800138000' and 'END:VCARD'.
 * - multiContactStream(3, '3.0') contains Person0001, Person0002 and
 *   Person0003 with the telephones 13800000001..13800000003 and the
 *   mailboxes person0001@example.com..person0003@example.com.
 * - escapedContactV30('Eve', 'R&D;Mobile,Dev') renders the organization
 *   line 'ORG:R&D\;Mobile\,Dev' on the wire.
 * - foldedNoteV30('Rose', patternOf(100), 20) splits the note into a
 *   20-character first chunk, a 74-character second chunk and a
 *   6-character third chunk, each continuation prefixed by '\r\n '.
 *
 * Line-count inventory asserted by the FACT and FIXT suites:
 * - singleContactV21 and singleContactV40: 6 logical lines, 6 CRLF
 *   terminators, 7 entries after splitting on '\r\n'.
 * - singleContactV30 and one contact of multiContactStream: 7 logical
 *   lines, 7 CRLF terminators, 8 entries after splitting.
 * - emptyFieldsContactV30: 8 logical lines, 8 CRLF terminators, 9
 *   entries after splitting.
 * - multiContactStream(n): 7n logical lines, 7n CRLF terminators, 7n+1
 *   entries after splitting, n-1 'END:VCARD\r\nBEGIN:VCARD'
 *   adjacencies, and one trailing empty split entry.
 * - malformedVcard: 5 lines for kind 1 (67 chars, no END), 5 lines for
 *   kind 2 (71 chars, no VERSION), 0 chars for kind 3, and the exact
 *   35-character three-line kind 4 text without a trailing terminator.
 */
export class VCardFactoryUtils {
  /**
   * Builds a minimal VERSION 2.1 contact card with the given display
   * name and telephone number. The structure is exactly:
   * BEGIN:VCARD, VERSION:2.1, N:<name>;;;, FN:<name>, TEL:<tel> and
   * END:VCARD, each line terminated by '\r\n'. The card has six logical
   * lines and splits into seven entries.
   */
  static singleContactV21(name: string, tel: string): string {
    let card: string = VCardFactoryUtils.beginCard('2.1');
    card = card + VCardFactoryUtils.identityLines(name);
    card = VCardFactoryUtils.appendLine(card, 'TEL:' + tel);
    card = card + VCardFactoryUtils.endCard();
    return card;
  }

  /**
   * Builds a minimal VERSION 3.0 contact card that additionally carries
   * an EMAIL line. The structure is exactly: BEGIN:VCARD, VERSION:3.0,
   * N:<name>;;;, FN:<name>, TEL:<tel>, EMAIL:<email> and END:VCARD,
   * each line terminated by '\r\n'. The card has seven logical lines
   * and splits into eight entries.
   */
  static singleContactV30(name: string, tel: string, email: string): string {
    let card: string = VCardFactoryUtils.beginCard('3.0');
    card = card + VCardFactoryUtils.identityLines(name);
    card = VCardFactoryUtils.appendLine(card, 'TEL:' + tel);
    card = VCardFactoryUtils.appendLine(card, 'EMAIL:' + email);
    card = card + VCardFactoryUtils.endCard();
    return card;
  }

  /**
   * Builds a minimal VERSION 4.0 contact card without an EMAIL line.
   * The structure is exactly: BEGIN:VCARD, VERSION:4.0, N:<name>;;;,
   * FN:<name>, TEL:<tel> and END:VCARD, each line terminated by '\r\n'.
   * Like the 2.1 card it has six logical lines and splits into seven
   * entries, which lets the suites contrast version handling while
   * keeping line counts aligned.
   */
  static singleContactV40(name: string, tel: string): string {
    let card: string = VCardFactoryUtils.beginCard('4.0');
    card = card + VCardFactoryUtils.identityLines(name);
    card = VCardFactoryUtils.appendLine(card, 'TEL:' + tel);
    card = card + VCardFactoryUtils.endCard();
    return card;
  }

  /**
   * Concatenates count VERSION 3.0 style contact cards into one stream,
   * writing the given version text directly into each VERSION line so
   * mixed-version streams can be simulated. Contact i (one-based) uses
   * the display name Person000i, the telephone number 1380000000i and
   * the mailbox person000i@example.com so every card in the stream is
   * uniquely addressable. A count of zero or below yields the empty
   * string. Each card contributes seven '\r\n' terminators, so a
   * stream of n contacts contains 7n CRLF pairs and splits into 7n + 1
   * entries with exactly n - 1 card adjacencies.
   */
  static multiContactStream(count: number, version: string): string {
    if (count <= 0) {
      return '';
    }
    let stream: string = '';
    let i: number = 1;
    while (i <= count) {
      const index: string = VCardFactoryUtils.padIndex(i, 4);
      const name: string = 'Person' + index;
      const tel: string = '1380000' + index;
      const email: string = 'person' + index + '@example.com';
      let card: string = VCardFactoryUtils.beginCard(version);
      card = card + VCardFactoryUtils.identityLines(name);
      card = VCardFactoryUtils.appendLine(card, 'TEL:' + tel);
      card = VCardFactoryUtils.appendLine(card, 'EMAIL:' + email);
      card = card + VCardFactoryUtils.endCard();
      stream = stream + card;
      i = i + 1;
    }
    return stream;
  }

  /**
   * Builds a VERSION 3.0 contact card carrying an inline base64 JPEG
   * photo. The photo line is exactly 'PHOTO;ENCODING=b;TYPE=JPEG:' plus
   * the given base64 payload with no further transformation, placed
   * after the TEL line and before END:VCARD. An empty payload renders
   * as a line ending directly after the colon.
   */
  static photoContactV30(name: string, tel: string, base64Photo: string): string {
    let card: string = VCardFactoryUtils.beginCard('3.0');
    card = card + VCardFactoryUtils.identityLines(name);
    card = VCardFactoryUtils.appendLine(card, 'TEL:' + tel);
    card = VCardFactoryUtils.appendLine(card, 'PHOTO;ENCODING=b;TYPE=JPEG:' + base64Photo);
    card = card + VCardFactoryUtils.endCard();
    return card;
  }

  /**
   * Builds a VERSION 3.0 contact card whose ORG value escapes backslash
   * first and then semicolon and comma characters with a single
   * backslash each, following the vCard text-escaping rule. For example
   * the organization 'R&D;Mobile,Dev' renders as 'ORG:R&D\;Mobile\,Dev'
   * on the wire. The structure is BEGIN:VCARD, VERSION:3.0, N:<name>;;;,
   * FN:<name>, ORG:<escaped> and END:VCARD, six logical lines that
   * split into seven entries.
   */
  static escapedContactV30(name: string, org: string): string {
    let card: string = VCardFactoryUtils.beginCard('3.0');
    card = card + VCardFactoryUtils.identityLines(name);
    card = VCardFactoryUtils.appendLine(card, 'ORG:' + VCardFactoryUtils.escapeText(org));
    card = card + VCardFactoryUtils.endCard();
    return card;
  }

  /**
   * Builds a VERSION 3.0 contact card whose NOTE value is folded over
   * several physical lines: the first physical line carries at most
   * firstWidth characters of the note and every continuation line
   * carries at most 74 characters, each continuation being introduced by
   * the '\r\n ' folding marker (CRLF followed by one space). A note
   * shorter than or equal to firstWidth stays on a single physical line
   * and produces no folding marker at all.
   */
  static foldedNoteV30(name: string, note: string, firstWidth: number): string {
    let card: string = VCardFactoryUtils.beginCard('3.0');
    card = card + VCardFactoryUtils.identityLines(name);
    card = VCardFactoryUtils.appendLine(card, 'NOTE:' +
      VCardFactoryUtils.foldNoteText(note, firstWidth));
    card = card + VCardFactoryUtils.endCard();
    return card;
  }

  /**
   * Builds deliberately malformed vCard fixtures used to exercise the
   * parser's invalid-input paths. kind selects the defect:
   * 1 omits the END:VCARD line, 2 omits the VERSION line, 3 returns the
   * empty string, 4 returns a structurally complete card that only
   * carries the unsupported version value 9.9, and any other kind also
   * returns the empty string. The fixtures have fixed lengths of 67, 71,
   * 0 and 35 characters respectively, which the FIXT suite asserts as a
   * monotonic ordering.
   */
  static malformedVcard(kind: number): string {
    if (kind === 1) {
      let card: string = VCardFactoryUtils.beginCard('3.0');
      card = card + VCardFactoryUtils.identityLines('Broken');
      card = VCardFactoryUtils.appendLine(card, 'TEL:13800138000');
      return card;
    }
    if (kind === 2) {
      let card: string = VCardFactoryUtils.appendLine('', 'BEGIN:VCARD');
      card = card + VCardFactoryUtils.identityLines('NoVersion');
      card = VCardFactoryUtils.appendLine(card, 'TEL:13800138000');
      card = card + VCardFactoryUtils.endCard();
      return card;
    }
    if (kind === 4) {
      return 'BEGIN:VCARD\r\nVERSION:9.9\r\nEND:VCARD';
    }
    return '';
  }

  /**
   * Builds a VERSION 3.0 contact card whose TEL, EMAIL and ORG values
   * are all empty, i.e. the lines are exactly 'TEL:', 'EMAIL:' and
   * 'ORG:' with nothing after the colon. This fixture simulates contact
   * data where optional fields are present but carry no content. The
   * card has eight logical lines and a fixed length of 75 characters
   * for the three-character name 'Sam' used by the suites.
   */
  static emptyFieldsContactV30(name: string): string {
    let card: string = VCardFactoryUtils.beginCard('3.0');
    card = card + VCardFactoryUtils.identityLines(name);
    card = VCardFactoryUtils.appendLine(card, 'TEL:');
    card = VCardFactoryUtils.appendLine(card, 'EMAIL:');
    card = VCardFactoryUtils.appendLine(card, 'ORG:');
    card = card + VCardFactoryUtils.endCard();
    return card;
  }

  /**
   * Appends one logical line plus the CRLF terminator to the growing
   * card text. Keeping the terminator in exactly one place guarantees
   * that every builder in this class emits uniform '\r\n' line endings
   * and that no line ever ends with a bare '\n' or a trailing space.
   * Calling appendLine('', 'TEL:1') produces the two-character-pair
   * suffixed value line 'TEL:1\r\n', and calling it with an empty line
   * text is how the empty-field card renders its bare 'TEL:' lines.
   */
  private static appendLine(target: string, line: string): string {
    return target + line + '\r\n';
  }

  /**
   * Opens a card with the BEGIN marker and the requested VERSION line,
   * e.g. beginCard('3.0') produces 'BEGIN:VCARD\r\nVERSION:3.0\r\n'.
   * Malformed fixtures that intentionally omit the version line build
   * their header manually instead of calling this helper.
   */
  private static beginCard(version: string): string {
    return VCardFactoryUtils.appendLine(VCardFactoryUtils.appendLine('', 'BEGIN:VCARD'),
      'VERSION:' + version);
  }

  /**
   * Emits the two identity lines of a contact: the structured name line
   * 'N:<name>;;;' with empty extra name components and the friendly
   * formatted name line 'FN:<name>'. Used by every complete builder.
   */
  private static identityLines(name: string): string {
    return VCardFactoryUtils.appendLine(VCardFactoryUtils.appendLine('', 'N:' + name + ';;;'),
      'FN:' + name);
  }

  /**
   * Closes a card with the END marker line. Malformed fixtures that
   * intentionally omit the terminator build their bodies manually
   * instead of calling this helper, so kind 1 stays exactly 67
   * characters and never contains 'END:VCARD', while kind 2 keeps its
   * terminator but no version. The repaired-fixture cases in the FIXT
   * suite append or splice the missing lines and assert the resulting
   * lengths of 78 and 84 characters.
   */
  private static endCard(): string {
    return VCardFactoryUtils.appendLine('', 'END:VCARD');
  }

  /**
   * Applies the vCard structured-text escaping rule: a literal backslash
   * is doubled first, then every semicolon and comma is prefixed with a
   * single backslash. For example 'R&D;Mobile,Dev' becomes
   * 'R&D\;Mobile\,Dev' and 'A\B;C' becomes 'A\\B\;C'. Used by
   * escapedContactV30 only.
   */
  private static escapeText(text: string): string {
    let escaped: string = text;
    escaped = escaped.split('\\').join('\\\\');
    escaped = escaped.split(';').join('\\;');
    escaped = escaped.split(',').join('\\,');
    return escaped;
  }

  /**
   * Folds a note value into physical line content: at most firstWidth
   * characters on the first chunk and at most 74 characters on every
   * continuation chunk, with each continuation introduced by the '\r\n '
   * marker. A non-positive firstWidth is clamped to 1 so the method
   * always makes progress. An empty note yields the empty string, which
   * renders as a bare 'NOTE:' line.
   *
   * The fold boundaries are chosen so the FACT suite can rebuild the
   * expected NOTE content with plain substring calls on a deterministic
   * pattern: for a 21-character note and firstWidth 20 the result is
   * chunk(0,20) plus marker plus chunk(20,21); for a 100-character note
   * the chunks are (0,20), (20,94) and (94,100) with two markers. The
   * marker itself never appears inside the source note because the
   * pattern builder only emits lowercase letters and digits.
   */
  private static foldNoteText(note: string, firstWidth: number): string {
    let width: number = firstWidth;
    if (width < 1) {
      width = 1;
    }
    let folded: string = '';
    let pos: number = 0;
    while (pos < note.length) {
      let end: number = pos + width;
      if (end > note.length) {
        end = note.length;
      }
      folded = folded + note.substring(pos, end);
      pos = end;
      width = 74;
      if (pos < note.length) {
        folded = folded + '\r\n ';
      }
    }
    return folded;
  }

  /**
   * Left-pads a positive integer with zeros to the requested width, e.g.
   * padIndex(7, 4) is '0007' and padIndex(10, 4) is '0010'. Used to
   * build the unique per-contact names and numbers inside
   * multiContactStream. With the fixed width of 4 the stream addresses
   * contacts up to Person9999 deterministically, the telephone numbers
   * stay 11 digits ('1380000' plus the four-digit suffix) and the
   * mailboxes stay lowercase ('person' plus the suffix plus the fixed
   * '@example.com' domain), all of which the suites count exactly once
   * per contact.
   */
  private static padIndex(index: number, width: number): string {
    let text: string = '' + index;
    while (text.length < width) {
      text = '0' + text;
    }
    return text;
  }
}
