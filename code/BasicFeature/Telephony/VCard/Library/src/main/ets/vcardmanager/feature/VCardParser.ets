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

import { util } from '@kit.ArkTS';
import { ContactSummary } from '../model/ContactTypes';
import { VCardCard, VCardPreview } from '../model/VCardTypes';
import { VCardConstants } from '../common/VCardConstants';
import { Formatter } from '../common/Formatter';

const PREVIEW_CONTENT_LIMIT: number = 8 * 1024;
const DEFAULT_VERSION: string = '2.1';
const EQUALS_BYTE: number = 0x3D;
const HEX_BASE: number = 16;
const ADDRESS_INDEXES: number[] = [2, 3, 4, 5, 6];

class VCardField {
  name: string = '';
  params: string = '';
  value: string = '';
}

/**
 * Minimal vCard reader used for preview and statistics only. The system
 * `vcard.importVCard` API remains the single writer of the contact database.
 */
export class VCardParser {
  static parse(content: string, fileName: string): VCardPreview {
    const preview: VCardPreview = new VCardPreview();
    preview.fileName = fileName;
    preview.sizeBytes = content.length;
    // ponytail: preview keeps only the first 8KB of the source text to bound UI memory;
    // the full file is handled by the system import API. Raise the cap if preview needs whole file.
    preview.content = content.length > PREVIEW_CONTENT_LIMIT ?
      content.substring(0, PREVIEW_CONTENT_LIMIT) : content;
    if (content.trim().length === 0) {
      preview.errorMessage = 'EMPTY_CONTENT';
      return preview;
    }
    const cards: VCardCard[] = VCardParser.parseCards(content);
    if (cards.length === 0) {
      preview.errorMessage = 'NO_CARD';
      return preview;
    }
    preview.cardCount = cards.length;
    preview.versionText = VCardParser.firstVersion(cards);
    let phoneCount: number = 0;
    let emailCount: number = 0;
    let organizationCount: number = 0;
    let addressCount: number = 0;
    const limited: VCardCard[] = [];
    for (let i = 0; i < cards.length; i++) {
      const card: VCardCard = cards[i];
      phoneCount += card.phones.length;
      emailCount += card.emails.length;
      addressCount += card.addresses.length;
      if (card.organization.length > 0) {
        organizationCount += 1;
      }
      if (i < VCardConstants.PREVIEW_CARD_LIMIT) {
        limited.push(card);
      }
    }
    preview.phoneCount = phoneCount;
    preview.emailCount = emailCount;
    preview.organizationCount = organizationCount;
    preview.addressCount = addressCount;
    preview.cards = limited;
    return preview;
  }

  static toContacts(preview: VCardPreview): ContactSummary[] {
    const result: ContactSummary[] = [];
    for (let i = 0; i < preview.cards.length; i++) {
      const card: VCardCard = preview.cards[i];
      const summary: ContactSummary = new ContactSummary();
      summary.id = i;
      summary.key = 'preview_' + i;
      summary.fullName = card.fullName;
      summary.initial = Formatter.initial(card.fullName);
      summary.phones = card.phones.slice();
      summary.emails = card.emails.slice();
      summary.organization = card.organization;
      summary.jobTitle = card.jobTitle;
      summary.addresses = card.addresses.slice();
      summary.websites = card.websites.slice();
      summary.note = card.note;
      result.push(summary);
    }
    return result;
  }

  private static parseCards(content: string): VCardCard[] {
    const lines: string[] = VCardParser.unfold(content);
    const cards: VCardCard[] = [];
    let current: VCardCard | null = null;
    let family: string = '';
    let given: string = '';
    for (let i = 0; i < lines.length; i++) {
      const line: string = lines[i].trim();
      if (line.length === 0) {
        continue;
      }
      const field: VCardField = VCardParser.splitLine(line);
      if (field.name === 'BEGIN' && field.value.trim().toUpperCase() === 'VCARD') {
        current = new VCardCard();
        family = '';
        given = '';
        continue;
      }
      if (field.name === 'END' && field.value.trim().toUpperCase() === 'VCARD') {
        if (current !== null) {
          if (current.fullName.length === 0) {
            current.fullName = VCardParser.joinName(family, given);
          }
          cards.push(current);
        }
        current = null;
        continue;
      }
      if (current === null) {
        continue;
      }
      if (VCardParser.isBinaryField(field.params)) {
        continue;
      }
      let raw: string = field.value;
      if (field.params.indexOf('QUOTED-PRINTABLE') >= 0) {
        raw = VCardParser.decodeQuotedPrintable(raw);
      }
      if (field.name === 'N') {
        const segments: string[] = VCardParser.splitComponents(raw);
        family = segments.length > 0 ? VCardParser.unescape(segments[0]).trim() : '';
        given = segments.length > 1 ? VCardParser.unescape(segments[1]).trim() : '';
        continue;
      }
      VCardParser.applyField(current, field.name, raw);
    }
    return cards;
  }

  private static applyField(card: VCardCard, name: string, raw: string): void {
    if (name === 'ADR') {
      const segments: string[] = VCardParser.splitComponents(raw);
      const picked: string[] = [];
      for (let i = 0; i < ADDRESS_INDEXES.length; i++) {
        const index: number = ADDRESS_INDEXES[i];
        if (index < segments.length) {
          const part: string = VCardParser.unescape(segments[index]).trim();
          if (part.length > 0) {
            picked.push(part);
          }
        }
      }
      if (picked.length > 0) {
        card.addresses.push(picked.join(' '));
      }
      return;
    }
    if (name === 'ORG') {
      const first: string = VCardParser.unescape(VCardParser.splitComponents(raw)[0]).trim();
      if (first.length > 0) {
        card.organization = first;
      }
      return;
    }
    const value: string = VCardParser.unescape(raw).trim();
    if (value.length === 0) {
      return;
    }
    if (name === 'VERSION') {
      card.version = value;
    } else if (name === 'FN') {
      card.fullName = value;
    } else if (name === 'TEL') {
      card.phones.push(value);
    } else if (name === 'EMAIL') {
      card.emails.push(value);
    } else if (name === 'TITLE') {
      card.jobTitle = value;
    } else if (name === 'NOTE') {
      card.note = value;
    } else if (name === 'URL') {
      card.websites.push(value);
    }
  }

  private static firstVersion(cards: VCardCard[]): string {
    for (let i = 0; i < cards.length; i++) {
      if (cards[i].version.length > 0) {
        return cards[i].version;
      }
    }
    return DEFAULT_VERSION;
  }

  private static joinName(family: string, given: string): string {
    const parts: string[] = [];
    if (family.length > 0) {
      parts.push(family);
    }
    if (given.length > 0) {
      parts.push(given);
    }
    return parts.join(' ');
  }

  private static isBinaryField(params: string): boolean {
    return params.indexOf('BASE64') >= 0 || params.indexOf('ENCODING=B') >= 0;
  }

  /**
   * Joins folded lines (continuation lines start with space or tab) and drops
   * the quoted-printable soft break marker that survives folding.
   */
  private static unfold(content: string): string[] {
    const normalized: string = content.replace(/\r\n/g, '\n').replace(/\r/g, '\n');
    const physical: string[] = normalized.split('\n');
    const lines: string[] = [];
    for (let i = 0; i < physical.length; i++) {
      const line: string = physical[i];
      const continuation: boolean = line.length > 0 && (line.charAt(0) === ' ' || line.charAt(0) === '\t');
      if (continuation && lines.length > 0) {
        const last: number = lines.length - 1;
        const head: string = lines[last].endsWith('=') ?
          lines[last].substring(0, lines[last].length - 1) : lines[last];
        lines[last] = head + line.substring(1);
      } else {
        lines.push(line);
      }
    }
    return lines;
  }

  private static splitLine(line: string): VCardField {
    const field: VCardField = new VCardField();
    let colon: number = -1;
    let quoted: boolean = false;
    for (let i = 0; i < line.length; i++) {
      const ch: string = line.charAt(i);
      if (ch === '"') {
        quoted = !quoted;
        continue;
      }
      if (ch === ':' && !quoted) {
        colon = i;
        break;
      }
    }
    const left: string = colon >= 0 ? line.substring(0, colon) : line;
    field.value = colon >= 0 ? line.substring(colon + 1) : '';
    field.params = left.toUpperCase();
    const segments: string[] = left.split(';');
    let rawName: string = segments.length > 0 ? segments[0] : '';
    const dot: number = rawName.lastIndexOf('.');
    if (dot >= 0) {
      rawName = rawName.substring(dot + 1);
    }
    field.name = rawName.trim().toUpperCase();
    return field;
  }

  /**
   * Splits a structured value (N/ADR/ORG) on unescaped semicolons, keeping the
   * escape sequences for the later unescape pass.
   */
  private static splitComponents(value: string): string[] {
    const parts: string[] = [];
    let current: string = '';
    for (let i = 0; i < value.length; i++) {
      const ch: string = value.charAt(i);
      if (ch === '\\' && i + 1 < value.length) {
        current += ch + value.charAt(i + 1);
        i += 1;
        continue;
      }
      if (ch === ';') {
        parts.push(current);
        current = '';
        continue;
      }
      current += ch;
    }
    parts.push(current);
    return parts;
  }

  private static unescape(value: string): string {
    if (value.indexOf('\\') < 0) {
      return value;
    }
    let result: string = '';
    let i: number = 0;
    while (i < value.length) {
      const ch: string = value.charAt(i);
      if (ch === '\\' && i + 1 < value.length) {
        const next: string = value.charAt(i + 1);
        if (next === 'n' || next === 'N') {
          result += '\n';
        } else if (next === ',' || next === ';' || next === ':' || next === '\\') {
          result += next;
        } else {
          result += ch + next;
        }
        i += 2;
      } else {
        result += ch;
        i += 1;
      }
    }
    return result;
  }

  private static decodeQuotedPrintable(value: string): string {
    if (value.length === 0) {
      return '';
    }
    // ponytail: everything is decoded as UTF-8; GBK payloads only decode best-effort.
    // Upgrade path: read the CHARSET parameter and pick a GBK decoder.
    const source: Uint8Array = new util.TextEncoder().encodeInto(value);
    const bytes: number[] = [];
    let i: number = 0;
    while (i < source.length) {
      const current: number = source[i];
      if (current === EQUALS_BYTE) {
        const next: number = i + 1 < source.length ? source[i + 1] : -1;
        if (next === 0x0A || next === 0x0D) {
          i += 2;
          continue;
        }
        if (i + 2 < source.length) {
          const high: number = VCardParser.hexValue(source[i + 1]);
          const low: number = VCardParser.hexValue(source[i + 2]);
          if (high >= 0 && low >= 0) {
            bytes.push(high * HEX_BASE + low);
            i += 3;
            continue;
          }
        }
      }
      bytes.push(current);
      i += 1;
    }
    const decoded: Uint8Array = new Uint8Array(bytes.length);
    for (let j = 0; j < bytes.length; j++) {
      decoded[j] = bytes[j];
    }
    return new util.TextDecoder('utf-8').decodeToString(decoded);
  }

  private static hexValue(code: number): number {
    if (code >= 48 && code <= 57) {
      return code - 48;
    }
    if (code >= 65 && code <= 70) {
      return code - 55;
    }
    if (code >= 97 && code <= 102) {
      return code - 87;
    }
    return -1;
  }
}
