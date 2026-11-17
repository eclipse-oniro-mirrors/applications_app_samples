/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

const REPLACEMENT: string = '\uFFFD';
const HEX_LOWER: string = '0123456789abcdef';

export class DecodeOutcome {
  public readonly text: string;
  public readonly valid: boolean;
  public readonly bytesConsumed: number;
  public readonly replacements: number;

  constructor(text: string, valid: boolean, bytesConsumed: number, replacements: number) {
    this.text = text;
    this.valid = valid;
    this.bytesConsumed = bytesConsumed;
    this.replacements = replacements;
  }
}

export class HexOutcome {
  public readonly bytes: Uint8Array;
  public readonly valid: boolean;

  constructor(bytes: Uint8Array, valid: boolean) {
    this.bytes = bytes;
    this.valid = valid;
  }
}

class CodePointRead {
  public readonly cp: number;
  public readonly width: number;

  constructor(cp: number, width: number) {
    this.cp = cp;
    this.width = width;
  }
}

function readCodePoint(text: string, index: number): CodePointRead {
  const first: number = text.charCodeAt(index);
  if (first >= 0xD800 && first <= 0xDBFF && index + 1 < text.length) {
    const second: number = text.charCodeAt(index + 1);
    if (second >= 0xDC00 && second <= 0xDFFF) {
      const cp: number = 0x10000 + ((first - 0xD800) << 10) + (second - 0xDC00);
      return new CodePointRead(cp, 2);
    }
  }
  if (first >= 0xD800 && first <= 0xDFFF) {
    return new CodePointRead(0xFFFD, 1);
  }
  return new CodePointRead(first, 1);
}

function encodedLength(cp: number): number {
  if (cp < 0x80) {
    return 1;
  }
  if (cp < 0x800) {
    return 2;
  }
  if (cp < 0x10000) {
    return 3;
  }
  return 4;
}

function isContinuation(value: number): boolean {
  return value >= 0x80 && value <= 0xBF;
}

function acceptsSecondByte(first: number, second: number): boolean {
  if (first === 0xE0) {
    return second >= 0xA0 && second <= 0xBF;
  }
  if (first === 0xED) {
    return second >= 0x80 && second <= 0x9F;
  }
  if (first === 0xF0) {
    return second >= 0x90 && second <= 0xBF;
  }
  if (first === 0xF4) {
    return second >= 0x80 && second <= 0x8F;
  }
  return isContinuation(second);
}

function decodeRange(bytes: Uint8Array, start: number, end: number, stopAtNul: boolean): DecodeOutcome {
  const chunks: Array<string> = [];
  let index: number = start;
  let consumed: number = start;
  let replacements: number = 0;
  while (index < end) {
    const first: number = bytes[index];
    if (stopAtNul && first === 0) {
      break;
    }
    if (first < 0x80) {
      chunks.push(String.fromCharCode(first));
      index += 1;
      consumed = index;
      continue;
    }
    let width: number = 0;
    let codePoint: number = -1;
    if (first >= 0xC2 && first <= 0xDF) {
      width = 2;
      codePoint = first & 0x1F;
    } else if (first >= 0xE0 && first <= 0xEF) {
      width = 3;
      codePoint = first & 0x0F;
    } else if (first >= 0xF0 && first <= 0xF4) {
      width = 4;
      codePoint = first & 0x07;
    } else {
      chunks.push(REPLACEMENT);
      replacements += 1;
      index += 1;
      consumed = index;
      continue;
    }
    if (index + width > end) {
      chunks.push(REPLACEMENT);
      replacements += 1;
      index += 1;
      consumed = index;
      continue;
    }
    let broken: boolean = false;
    for (let offset = 1; offset < width; offset++) {
      const next: number = bytes[index + offset];
      if (offset === 1) {
        if (!acceptsSecondByte(first, next)) {
          broken = true;
          break;
        }
      } else if (!isContinuation(next)) {
        broken = true;
        break;
      }
      codePoint = (codePoint << 6) | (next & 0x3F);
    }
    if (broken) {
      chunks.push(REPLACEMENT);
      replacements += 1;
      index += 1;
      consumed = index;
      continue;
    }
    if (width === 4) {
      const adjusted: number = codePoint - 0x10000;
      const high: number = 0xD800 + (adjusted >> 10);
      const low: number = 0xDC00 + (adjusted & 0x3FF);
      chunks.push(String.fromCharCode(high, low));
    } else {
      chunks.push(String.fromCharCode(codePoint));
    }
    index += width;
    consumed = index;
  }
  return new DecodeOutcome(chunks.join(''), replacements === 0, consumed, replacements);
}

export function utf8BomLength(bytes: Uint8Array): number {
  if (bytes.length < 3) {
    return 0;
  }
  if (bytes[0] === 0xEF && bytes[1] === 0xBB && bytes[2] === 0xBF) {
    return 3;
  }
  return 0;
}

export function hasUtf8Bom(bytes: Uint8Array): boolean {
  return utf8BomLength(bytes) === 3;
}

export function decodeUtf8(bytes: Uint8Array): DecodeOutcome {
  return decodeRange(bytes, 0, bytes.length, false);
}

export function decodeUtf8Prefix(bytes: Uint8Array, length: number, skipBom: boolean,
  stopAtNul: boolean): DecodeOutcome {
  let end: number = length;
  if (end < 0) {
    end = 0;
  }
  if (end > bytes.length) {
    end = bytes.length;
  }
  let start: number = 0;
  if (skipBom) {
    start = utf8BomLength(bytes);
    if (start > end) {
      start = 0;
    }
  }
  return decodeRange(bytes, start, end, stopAtNul);
}

export function encodeUtf8(text: string): Uint8Array {
  let total: number = 0;
  let index: number = 0;
  while (index < text.length) {
    const read: CodePointRead = readCodePoint(text, index);
    total += encodedLength(read.cp);
    index += read.width;
  }
  const output: Uint8Array = new Uint8Array(total);
  let offset: number = 0;
  index = 0;
  while (index < text.length) {
    const read: CodePointRead = readCodePoint(text, index);
    const cp: number = read.cp;
    if (cp < 0x80) {
      output[offset] = cp;
      offset += 1;
    } else if (cp < 0x800) {
      output[offset] = 0xC0 | (cp >> 6);
      output[offset + 1] = 0x80 | (cp & 0x3F);
      offset += 2;
    } else if (cp < 0x10000) {
      output[offset] = 0xE0 | (cp >> 12);
      output[offset + 1] = 0x80 | ((cp >> 6) & 0x3F);
      output[offset + 2] = 0x80 | (cp & 0x3F);
      offset += 3;
    } else {
      output[offset] = 0xF0 | (cp >> 18);
      output[offset + 1] = 0x80 | ((cp >> 12) & 0x3F);
      output[offset + 2] = 0x80 | ((cp >> 6) & 0x3F);
      output[offset + 3] = 0x80 | (cp & 0x3F);
      offset += 4;
    }
    index += read.width;
  }
  return output;
}

export function utf8ByteLength(text: string): number {
  let total: number = 0;
  let index: number = 0;
  while (index < text.length) {
    const read: CodePointRead = readCodePoint(text, index);
    total += encodedLength(read.cp);
    index += read.width;
  }
  return total;
}

export function truncateToByteLength(text: string, maxBytes: number): string {
  if (maxBytes <= 0) {
    return '';
  }
  let total: number = 0;
  let index: number = 0;
  while (index < text.length) {
    const read: CodePointRead = readCodePoint(text, index);
    const size: number = encodedLength(read.cp);
    if (total + size > maxBytes) {
      break;
    }
    total += size;
    index += read.width;
  }
  return text.substring(0, index);
}

export function countCodePoints(text: string): number {
  let count: number = 0;
  let index: number = 0;
  while (index < text.length) {
    const read: CodePointRead = readCodePoint(text, index);
    count += 1;
    index += read.width;
  }
  return count;
}

export function isAsciiOnly(text: string): boolean {
  for (let index = 0; index < text.length; index++) {
    if (text.charCodeAt(index) >= 0x80) {
      return false;
    }
  }
  return true;
}

export function normalizeEol(text: string, useCrlf: boolean): string {
  const chunks: Array<string> = [];
  for (let index = 0; index < text.length; index++) {
    const code: number = text.charCodeAt(index);
    if (code === 0x0D) {
      if (index + 1 < text.length && text.charCodeAt(index + 1) === 0x0A) {
        index += 1;
      }
      chunks.push(useCrlf ? '\r\n' : '\n');
    } else if (code === 0x0A) {
      chunks.push(useCrlf ? '\r\n' : '\n');
    } else {
      chunks.push(String.fromCharCode(code));
    }
  }
  return chunks.join('');
}

export function splitLines(text: string): Array<string> {
  const lines: Array<string> = [];
  if (text.length === 0) {
    return lines;
  }
  let current: Array<string> = [];
  for (let index = 0; index < text.length; index++) {
    const code: number = text.charCodeAt(index);
    if (code === 0x0D || code === 0x0A) {
      if (code === 0x0D && index + 1 < text.length && text.charCodeAt(index + 1) === 0x0A) {
        index += 1;
      }
      lines.push(current.join(''));
      current = [];
    } else {
      current.push(String.fromCharCode(code));
    }
  }
  if (current.length > 0) {
    lines.push(current.join(''));
  }
  return lines;
}

export function toHex(bytes: Uint8Array, upperCase: boolean): string {
  const chunks: Array<string> = [];
  for (let index = 0; index < bytes.length; index++) {
    const value: number = bytes[index];
    const high: string = HEX_LOWER.charAt((value >> 4) & 0x0F);
    const low: string = HEX_LOWER.charAt(value & 0x0F);
    const pair: string = high + low;
    chunks.push(upperCase ? pair.toUpperCase() : pair);
  }
  return chunks.join('');
}

export function fromHex(text: string): HexOutcome {
  const trimmed: string = text.trim();
  let body: string = trimmed;
  if (body.length >= 2 && (body.charAt(0) === '0') &&
    (body.charAt(1) === 'x' || body.charAt(1) === 'X')) {
    body = body.substring(2);
  }
  if (body.length === 0 || body.length % 2 !== 0) {
    return new HexOutcome(new Uint8Array(0), false);
  }
  const output: Uint8Array = new Uint8Array(body.length / 2);
  for (let index = 0; index < body.length; index += 2) {
    const high: number = HEX_LOWER.indexOf(body.charAt(index).toLowerCase());
    const low: number = HEX_LOWER.indexOf(body.charAt(index + 1).toLowerCase());
    if (high < 0 || low < 0) {
      return new HexOutcome(new Uint8Array(0), false);
    }
    output[index / 2] = high * 16 + low;
  }
  return new HexOutcome(output, true);
}
