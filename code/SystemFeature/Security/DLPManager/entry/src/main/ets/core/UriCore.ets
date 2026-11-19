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

import { encodeUtf8, decodeUtf8, DecodeOutcome } from './TextCodecCore';

const HEX_UPPER: string = '0123456789ABCDEF';

export class UriParts {
  public scheme: string;
  public authority: string;
  public path: string;
  public query: string;
  public fragment: string;
  public hasAuthority: boolean;

  constructor(scheme: string, authority: string, path: string, query: string, fragment: string,
    hasAuthority: boolean = false) {
    this.scheme = scheme;
    this.authority = authority;
    this.path = path;
    this.query = query;
    this.fragment = fragment;
    this.hasAuthority = hasAuthority;
  }
}

export class UriParseResult {
  public readonly valid: boolean;
  public readonly parts: UriParts;
  public readonly reason: string;

  constructor(valid: boolean, parts: UriParts, reason: string) {
    this.valid = valid;
    this.parts = parts;
    this.reason = reason;
  }
}

export class UriDecodeResult {
  public readonly text: string;
  public readonly valid: boolean;

  constructor(text: string, valid: boolean) {
    this.text = text;
    this.valid = valid;
  }
}

export class QueryParam {
  public readonly key: string;
  public readonly value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

export class QueryParseResult {
  public readonly params: QueryParam[];
  public readonly valid: boolean;

  constructor(params: QueryParam[], valid: boolean) {
    this.params = params;
    this.valid = valid;
  }
}

function isAsciiAlnum(code: number): boolean {
  if (code >= 0x30 && code <= 0x39) {
    return true;
  }
  if (code >= 0x41 && code <= 0x5A) {
    return true;
  }
  return code >= 0x61 && code <= 0x7A;
}

function isUnreserved(code: number): boolean {
  if (isAsciiAlnum(code)) {
    return true;
  }
  return code === 0x2D || code === 0x5F || code === 0x2E || code === 0x7E;
}

function isSchemeStart(code: number): boolean {
  if (code >= 0x41 && code <= 0x5A) {
    return true;
  }
  return code >= 0x61 && code <= 0x7A;
}

function isSchemeBody(code: number): boolean {
  if (isAsciiAlnum(code)) {
    return true;
  }
  return code === 0x2B || code === 0x2D || code === 0x2E;
}

function hexValue(code: number): number {
  if (code >= 0x30 && code <= 0x39) {
    return code - 0x30;
  }
  if (code >= 0x41 && code <= 0x46) {
    return code - 0x41 + 10;
  }
  if (code >= 0x61 && code <= 0x66) {
    return code - 0x61 + 10;
  }
  return -1;
}

export function parseUri(uri: string): UriParseResult {
  if (uri.length === 0) {
    return new UriParseResult(false, new UriParts('', '', '', '', ''), 'empty');
  }
  let colon: number = -1;
  for (let index = 0; index < uri.length; index++) {
    const code: number = uri.charCodeAt(index);
    if (code === 0x3A) {
      colon = index;
      break;
    }
    if (index === 0) {
      if (!isSchemeStart(code)) {
        return new UriParseResult(false, new UriParts('', '', '', '', ''), 'bad-scheme');
      }
    } else if (!isSchemeBody(code)) {
      if (code === 0x2F || code === 0x3F || code === 0x23) {
        return new UriParseResult(false, new UriParts('', '', '', '', ''), 'missing-scheme');
      }
      return new UriParseResult(false, new UriParts('', '', '', '', ''), 'bad-scheme');
    }
  }
  if (colon <= 0) {
    return new UriParseResult(false, new UriParts('', '', '', '', ''), 'missing-scheme');
  }
  const scheme: string = uri.substring(0, colon);
  let rest: string = uri.substring(colon + 1);
  let fragment: string = '';
  const hashIndex: number = rest.indexOf('#');
  if (hashIndex >= 0) {
    fragment = rest.substring(hashIndex + 1);
    rest = rest.substring(0, hashIndex);
  }
  let query: string = '';
  const queryIndex: number = rest.indexOf('?');
  if (queryIndex >= 0) {
    query = rest.substring(queryIndex + 1);
    rest = rest.substring(0, queryIndex);
  }
  let authority: string = '';
  let path: string = rest;
  const hasAuthority: boolean = rest.startsWith('//');
  if (hasAuthority) {
    const composed: string = rest.substring(2);
    const slashIndex: number = composed.indexOf('/');
    if (slashIndex < 0) {
      authority = composed;
      path = '';
    } else {
      authority = composed.substring(0, slashIndex);
      path = composed.substring(slashIndex);
    }
  }
  return new UriParseResult(true, new UriParts(scheme, authority, path, query, fragment, hasAuthority), '');
}

export function buildUri(parts: UriParts): string {
  let result: string = parts.scheme + ':';
  if (parts.hasAuthority || parts.authority.length > 0) {
    result += '//' + parts.authority;
    if (parts.path.length > 0 && !parts.path.startsWith('/')) {
      result += '/';
    }
  }
  result += parts.path;
  if (parts.query.length > 0) {
    result += '?' + parts.query;
  }
  if (parts.fragment.length > 0) {
    result += '#' + parts.fragment;
  }
  return result;
}

export function encodeComponent(text: string, keepSlash: boolean): string {
  const bytes: Uint8Array = encodeUtf8(text);
  const chunks: string[] = [];
  for (let index = 0; index < bytes.length; index++) {
    const value: number = bytes[index];
    if (isUnreserved(value) || (keepSlash && value === 0x2F)) {
      chunks.push(String.fromCharCode(value));
    } else {
      const high: string = HEX_UPPER.charAt((value >> 4) & 0x0F);
      const low: string = HEX_UPPER.charAt(value & 0x0F);
      chunks.push('%' + high + low);
    }
  }
  return chunks.join('');
}

export function decodeComponent(text: string, plusAsSpace: boolean): UriDecodeResult {
  const bytes: number[] = [];
  let valid: boolean = true;
  let index: number = 0;
  while (index < text.length) {
    const code: number = text.charCodeAt(index);
    if (code === 0x25) {
      if (index + 2 < text.length) {
        const high: number = hexValue(text.charCodeAt(index + 1));
        const low: number = hexValue(text.charCodeAt(index + 2));
        if (high >= 0 && low >= 0) {
          bytes.push(high * 16 + low);
          index += 3;
          continue;
        }
      }
      valid = false;
      bytes.push(0x25);
      index += 1;
      continue;
    }
    if (plusAsSpace && code === 0x2B) {
      bytes.push(0x20);
      index += 1;
      continue;
    }
    if (code < 0x80) {
      bytes.push(code);
      index += 1;
      continue;
    }
    let width: number = 1;
    if (code >= 0xD800 && code <= 0xDBFF && index + 1 < text.length) {
      const next: number = text.charCodeAt(index + 1);
      if (next >= 0xDC00 && next <= 0xDFFF) {
        width = 2;
      }
    }
    const single: Uint8Array = encodeUtf8(text.substring(index, index + width));
    for (let offset = 0; offset < single.length; offset++) {
      bytes.push(single[offset]);
    }
    index += width;
  }
  const array: Uint8Array = new Uint8Array(bytes.length);
  for (let offset = 0; offset < bytes.length; offset++) {
    array[offset] = bytes[offset];
  }
  const decoded: DecodeOutcome = decodeUtf8(array);
  return new UriDecodeResult(decoded.text, valid && decoded.valid);
}

export function parseQuery(query: string): QueryParseResult {
  const params: QueryParam[] = [];
  let valid: boolean = true;
  if (query.length === 0) {
    return new QueryParseResult(params, valid);
  }
  const fields: string[] = query.split('&');
  for (let index = 0; index < fields.length; index++) {
    const field: string = fields[index];
    if (field.length === 0) {
      continue;
    }
    const equalsIndex: number = field.indexOf('=');
    if (equalsIndex < 0) {
      const decodedKey: UriDecodeResult = decodeComponent(field, true);
      valid = valid && decodedKey.valid;
      params.push(new QueryParam(decodedKey.text, ''));
    } else {
      const decodedKey: UriDecodeResult = decodeComponent(field.substring(0, equalsIndex), true);
      const decodedValue: UriDecodeResult = decodeComponent(field.substring(equalsIndex + 1), true);
      valid = valid && decodedKey.valid && decodedValue.valid;
      params.push(new QueryParam(decodedKey.text, decodedValue.text));
    }
  }
  return new QueryParseResult(params, valid);
}

export function buildQuery(params: QueryParam[]): string {
  const chunks: string[] = [];
  for (let index = 0; index < params.length; index++) {
    const param: QueryParam = params[index];
    chunks.push(encodeComponent(param.key, false) + '=' + encodeComponent(param.value, false));
  }
  return chunks.join('&');
}

export function findQueryParam(uri: string, key: string): QueryParam | null {
  const parsed: UriParseResult = parseUri(uri);
  if (!parsed.valid) {
    return null;
  }
  const query: QueryParseResult = parseQuery(parsed.parts.query);
  for (let index = 0; index < query.params.length; index++) {
    if (query.params[index].key === key) {
      return query.params[index];
    }
  }
  return null;
}

export function getQueryParam(uri: string, key: string): string {
  const found: QueryParam | null = findQueryParam(uri, key);
  if (found === null) {
    return '';
  }
  return found.value;
}

export function upsertQuery(uri: string, key: string, value: string): string {
  const parsed: UriParseResult = parseUri(uri);
  if (!parsed.valid) {
    return uri;
  }
  const existing: QueryParseResult = parseQuery(parsed.parts.query);
  const params: QueryParam[] = [];
  let replaced: boolean = false;
  for (let index = 0; index < existing.params.length; index++) {
    const param: QueryParam = existing.params[index];
    if (param.key === key) {
      params.push(new QueryParam(key, value));
      replaced = true;
    } else {
      params.push(param);
    }
  }
  if (!replaced) {
    params.push(new QueryParam(key, value));
  }
  parsed.parts.query = buildQuery(params);
  return buildUri(parsed.parts);
}

export function joinPath(segments: string[]): string {
  const parts: string[] = [];
  let absolute: boolean = false;
  for (let index = 0; index < segments.length; index++) {
    let segment: string = segments[index];
    if (segment.length === 0) {
      continue;
    }
    if (parts.length === 0 && segment.startsWith('/')) {
      absolute = true;
    }
    while (segment.startsWith('/')) {
      segment = segment.substring(1);
    }
    while (segment.endsWith('/')) {
      segment = segment.substring(0, segment.length - 1);
    }
    if (segment.length > 0) {
      parts.push(segment);
    }
  }
  const joined: string = parts.join('/');
  if (joined.length === 0) {
    return absolute ? '/' : '';
  }
  return absolute ? '/' + joined : joined;
}

export function normalizePath(path: string): string {
  if (path.length === 0) {
    return '';
  }
  const absolute: boolean = path.startsWith('/');
  const raw: string[] = path.split('/');
  const stack: string[] = [];
  for (let index = 0; index < raw.length; index++) {
    const segment: string = raw[index];
    if (segment.length === 0 || segment === '.') {
      continue;
    }
    if (segment === '..') {
      if (stack.length > 0 && stack[stack.length - 1] !== '..') {
        stack.pop();
      } else if (!absolute) {
        stack.push('..');
      }
      continue;
    }
    stack.push(segment);
  }
  const joined: string = stack.join('/');
  if (absolute) {
    return joined.length === 0 ? '/' : '/' + joined;
  }
  return joined;
}

export function segmentsOf(path: string): string[] {
  const raw: string[] = path.split('/');
  const parts: string[] = [];
  for (let index = 0; index < raw.length; index++) {
    if (raw[index].length > 0) {
      parts.push(raw[index]);
    }
  }
  return parts;
}

export function fileNameOf(path: string): string {
  const slashIndex: number = path.lastIndexOf('/');
  if (slashIndex < 0) {
    return path;
  }
  return path.substring(slashIndex + 1);
}

export function extensionOf(name: string): string {
  const dotIndex: number = name.lastIndexOf('.');
  if (dotIndex <= 0 || dotIndex === name.length - 1) {
    return '';
  }
  return name.substring(dotIndex + 1);
}

export function baseNameOf(name: string): string {
  const dotIndex: number = name.lastIndexOf('.');
  if (dotIndex <= 0) {
    return name;
  }
  return name.substring(0, dotIndex);
}

export function stripExtension(name: string): string {
  const dotIndex: number = name.lastIndexOf('.');
  if (dotIndex <= 0) {
    return name;
  }
  return name.substring(0, dotIndex);
}

export function replaceExtension(name: string, newExtension: string): string {
  const base: string = stripExtension(name);
  let suffix: string = newExtension;
  if (suffix.length === 0) {
    return base;
  }
  if (!suffix.startsWith('.')) {
    suffix = '.' + suffix;
  }
  return base + suffix;
}

export function isScheme(uri: string, scheme: string): boolean {
  const prefix: string = scheme.toLowerCase() + ':';
  return uri.toLowerCase().startsWith(prefix);
}

export function isFileLikeUri(uri: string): boolean {
  const parsed: UriParseResult = parseUri(uri);
  if (!parsed.valid) {
    return false;
  }
  const scheme: string = parsed.parts.scheme.toLowerCase();
  return scheme === 'file' || scheme === 'datashare' || scheme === 'content';
}
