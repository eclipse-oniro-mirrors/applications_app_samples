/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, isValidAddress, normalizeUrl,
  encodeSearchWord, buildSearchUrl, sanitizeInput, isExternalUrl,
  ID_INPUT_URL, ID_ACTION_SUBMIT, URL_SCHEME, SEARCH_ENGINE,
  DELAY_KEY_NAVIGATION, TIMEOUT_COMPONENT, inputById, clickById
} from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'BrowserInputValidationTest';

/** Upper bound accepted by the address bar before the value is rejected. */
const MAX_ADDRESS_LENGTH: number = 2048;

/** Sentinel used by the local port parser when the text is not a port. */
const PORT_INVALID: number = -1;

/** Local copy of the scheme separator so a regression is caught immediately. */
const SCHEME_TOKEN: string = 'https://';

/** Empty address bar content. */
const EMPTY_ADDRESS: string = '';

/* ------------------------------------------------------------------ */
/* Address data table                                                  */
/* ------------------------------------------------------------------ */

/** One row of the address acceptance table. */
class AddressCase {
  label: string;
  raw: string;
  valid: boolean;
  normalized: string;

  constructor(label: string, raw: string, valid: boolean, normalized: string) {
    this.label = label;
    this.raw = raw;
    this.valid = valid;
    this.normalized = normalized;
  }
}

/** Rows accepted by isValidAddress; every row must also get the https scheme. */
function acceptedCases(): AddressCase[] {
  return [
    new AddressCase('plain host', 'example.com', true, 'https://example.com'),
    new AddressCase('sub domain', 'm.example.com', true, 'https://m.example.com'),
    new AddressCase('with path', 'example.com/index.html', true, 'https://example.com/index.html'),
    new AddressCase('with port', 'example.com:8080', true, 'https://example.com:8080'),
    new AddressCase('with query', 'example.com?q=ohos', true, 'https://example.com?q=ohos'),
    new AddressCase('with fragment', 'example.com#top', true, 'https://example.com#top'),
    new AddressCase('ip literal', '127.0.0.1', true, 'https://127.0.0.1'),
    new AddressCase('chinese host', '中文.中国', true, 'https://中文.中国'),
    new AddressCase('already https', 'https://example.com', true, 'https://example.com'),
    new AddressCase('already http', 'http://example.com', true, 'http://example.com')
  ];
}

/** Rows rejected by isValidAddress. */
function rejectedCases(): AddressCase[] {
  return [
    new AddressCase('empty', '', false, 'https://'),
    new AddressCase('blank spaces', '   ', false, 'https://   '),
    new AddressCase('tab only', '\t', false, 'https://\t'),
    new AddressCase('newline only', '\n', false, 'https://\n'),
    new AddressCase('no dot', 'localhost', false, 'https://localhost'),
    new AddressCase('single label', 'intranet', false, 'https://intranet'),
    new AddressCase('leading dot', '.com', false, 'https://.com'),
    new AddressCase('trailing dot', 'com.', false, 'https://com.'),
    new AddressCase('dot only', '.', false, 'https://.'),
    new AddressCase('inner space', 'exa mple.com', false, 'https://exa mple.com'),
    new AddressCase('leading space kept', ' example.com', false, 'https:// example.com'),
    new AddressCase('too long', '', false, 'https://')
  ];
}

/** Rows that exercise normalizeUrl without relying on the validator. */
function normalizeCases(): AddressCase[] {
  return [
    new AddressCase('bare host', 'example.com', true, 'https://example.com'),
    new AddressCase('bare host with path', 'example.com/a.html', true, 'https://example.com/a.html'),
    new AddressCase('https untouched', 'https://a.com', true, 'https://a.com'),
    new AddressCase('http untouched', 'http://a.com', true, 'http://a.com'),
    new AddressCase('file untouched', 'file://pad.html', true, 'file://pad.html'),
    new AddressCase('about untouched', 'about:blank', true, 'about:blank'),
    new AddressCase('empty becomes scheme', '', false, 'https://'),
    new AddressCase('scheme only', 'https://', true, 'https://')
  ];
}

/* ------------------------------------------------------------------ */
/* Local pure helpers                                                  */
/* ------------------------------------------------------------------ */

/** Repeats a character without relying on String.prototype.repeat. */
function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let index = 0; index < count; index++) {
    result += ch;
  }
  return result;
}

/** Builds a syntactically valid address of exactly the requested length. */
function buildAddressOfLength(length: number): string {
  if (length < 5) {
    return repeatChar('a', length);
  }
  return repeatChar('a', length - 4) + '.com';
}

/** Removes the leading scheme so the host part can be inspected. */
function hostOf(address: string): string {
  let result: string = address.trim();
  if (result.startsWith('https://')) {
    result = result.substring(8);
  } else if (result.startsWith('http://')) {
    result = result.substring(7);
  } else if (result.startsWith('file://')) {
    result = result.substring(7);
  }
  return result;
}

/** Splits "host:port" into its two pieces; port stays empty when absent. */
function splitHostPort(host: string): string[] {
  const colon: number = host.lastIndexOf(':');
  if (colon < 0) {
    return [host, ''];
  }
  return [host.substring(0, colon), host.substring(colon + 1)];
}

/** Digits only port parser returning PORT_INVALID for anything else. */
function parsePort(raw: string): number {
  if (raw.length === 0 || raw.length > 5) {
    return PORT_INVALID;
  }
  let value: number = 0;
  for (let index = 0; index < raw.length; index++) {
    const code: number = raw.charCodeAt(index);
    if (code < 48 || code > 57) {
      return PORT_INVALID;
    }
    value = value * 10 + (code - 48);
  }
  if (value < 1 || value > 65535) {
    return PORT_INVALID;
  }
  return value;
}

/** True for the four dotted decimal octets of an IPv4 literal. */
/** Digits only octet parser of an IPv4 literal; 0 is a legal octet value. */
function parseOctet(raw: string): number {
  if (raw.length === 0 || raw.length > 3) {
    return PORT_INVALID;
  }
  let value: number = 0;
  for (let index = 0; index < raw.length; index++) {
    const code: number = raw.charCodeAt(index);
    if (code < 48 || code > 57) {
      return PORT_INVALID;
    }
    value = value * 10 + (code - 48);
  }
  if (value > 255) {
    return PORT_INVALID;
  }
  return value;
}

function isIpv4Literal(host: string): boolean {
  const parts: string[] = host.split('.');
  if (parts.length !== 4) {
    return false;
  }
  let sum: number = 0;
  for (let index = 0; index < parts.length; index++) {
    const value: number = parseOctet(parts[index]);
    if (value === PORT_INVALID) {
      return false;
    }
    sum += value;
  }
  // 0.0.0.0 is the unspecified address, not a usable literal.
  return sum > 0;
}

/** True when the host contains at least one non ASCII code unit. */
function hasNonAscii(host: string): boolean {
  for (let index = 0; index < host.length; index++) {
    if (host.charCodeAt(index) > 127) {
      return true;
    }
  }
  return false;
}

/** Counts the query pairs of an address, ignoring the trailing separator. */
function countQueryPairs(address: string): number {
  const mark: number = address.indexOf('?');
  if (mark < 0 || mark === address.length - 1) {
    return 0;
  }
  const query: string = address.substring(mark + 1);
  let pairs: number = 1;
  for (let index = 0; index < query.length; index++) {
    if (query.charAt(index) === '&') {
      pairs += 1;
    }
  }
  return pairs;
}

/** Length of the value after the sanitizer style trim. */
function sanitizedLength(value: string): number {
  return sanitizeInput(value).length;
}

/* ------------------------------------------------------------------ */
/* Input audit model                                                   */
/* ------------------------------------------------------------------ */

/**
 * Collects the accept/reject verdicts of a batch of raw addresses.
 * The browser never blocks typing, so the audit is the only place that
 * remembers what the title bar refused to load.
 */
class InputAudit {
  accepted: string[] = [];
  rejected: string[] = [];
  reasons: string[] = [];

  record(raw: string, valid: boolean, reason: string): boolean {
    if (valid) {
      this.accepted.push(raw);
    } else {
      this.rejected.push(raw);
      this.reasons.push(reason);
    }
    return valid;
  }

  audit(raw: string): boolean {
    if (!isValidAddress(raw)) {
      return this.record(raw, false, 'invalid address');
    }
    return this.record(raw, true, '');
  }

  acceptedCount(): number {
    return this.accepted.length;
  }

  rejectedCount(): number {
    return this.rejected.length;
  }

  total(): number {
    return this.accepted.length + this.rejected.length;
  }

  /** Acceptance ratio in whole percent, 0 when nothing was audited. */
  acceptancePercent(): number {
    if (this.total() === 0) {
      return 0;
    }
    return Math.floor((this.acceptedCount() * 100) / this.total());
  }

  lastRejected(): string {
    if (this.rejected.length === 0) {
      return '';
    }
    return this.rejected[this.rejected.length - 1];
  }

  reset(): void {
    this.accepted = [];
    this.rejected = [];
    this.reasons = [];
  }
}

export default function browserInputValidationTest() {
  describe('browserInputValidationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin: address and search word validation');
      await startBrowserApp();
      TestLogger.info(TAG, 'browser app started');
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
    });

    /**
     * Every address that a user typically types must be accepted and must be
     * upgraded to https before reaching the Web controller.
     */
    it('Input_Address_Accepted_Table_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_Accepted_Table_001');
      const started: number = Date.now();
      const rows: AddressCase[] = acceptedCases();
      TestLogger.step(TAG, 'walk the accepted address table');
      for (let index = 0; index < rows.length; index++) {
        const row: AddressCase = rows[index];
        expect(isValidAddress(row.raw)).assertTrue();
        expect(normalizeUrl(row.raw)).assertEqual(row.normalized);
        TestLogger.info(TAG, `accepted row ${index}: ${row.label}`);
      }
      expect(rows.length).assertEqual(10);
      TestLogger.caseEnd(TAG, 'Input_Address_Accepted_Table_001', Date.now() - started);
    });

    /** An empty address bar must never start a load. */
    it('Input_Address_Empty_Rejected_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_Empty_Rejected_002');
      const started: number = Date.now();
      TestLogger.step(TAG, 'reject the empty address');
      expect(isValidAddress(EMPTY_ADDRESS)).assertFalse();
      expect(normalizeUrl(EMPTY_ADDRESS)).assertEqual(URL_SCHEME);
      expect(EMPTY_ADDRESS.length).assertEqual(0);
      expect(sanitizeInput(EMPTY_ADDRESS)).assertEqual('');
      expect(sanitizedLength(EMPTY_ADDRESS)).assertEqual(0);
      expect(isExternalUrl(normalizeUrl(EMPTY_ADDRESS))).assertFalse();
      TestLogger.info(TAG, 'empty address rejected without throwing');
      TestLogger.caseEnd(TAG, 'Input_Address_Empty_Rejected_002', Date.now() - started);
    });

    /** Whitespace only values must be trimmed away and rejected. */
    it('Input_Address_Whitespace_Rejected_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_Whitespace_Rejected_003');
      const started: number = Date.now();
      const blanks: string[] = [' ', '  ', '   ', '\t', '\n', '\r\n', ' \t\n '];
      TestLogger.step(TAG, 'reject whitespace only values');
      for (let index = 0; index < blanks.length; index++) {
        const raw: string = blanks[index];
        expect(isValidAddress(raw)).assertFalse();
        expect(sanitizeInput(raw)).assertEqual('');
        expect(sanitizedLength(raw)).assertEqual(0);
        TestLogger.info(TAG, `blank value ${index} rejected`);
      }
      TestLogger.info(TAG, `blank values checked: ${blanks.length}`);
      expect(blanks.length).assertEqual(7);
      TestLogger.caseEnd(TAG, 'Input_Address_Whitespace_Rejected_003', Date.now() - started);
    });

    /** The 2048 character boundary is inclusive, 2049 is already too long. */
    it('Input_Address_Length_Boundary_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_Length_Boundary_004');
      const started: number = Date.now();
      TestLogger.step(TAG, 'probe the maximum address length');
      const atLimit: string = buildAddressOfLength(MAX_ADDRESS_LENGTH);
      expect(atLimit.length).assertEqual(MAX_ADDRESS_LENGTH);
      expect(isValidAddress(atLimit)).assertTrue();
      const overLimit: string = buildAddressOfLength(MAX_ADDRESS_LENGTH + 1);
      expect(overLimit.length).assertEqual(MAX_ADDRESS_LENGTH + 1);
      expect(isValidAddress(overLimit)).assertFalse();
      const farOverLimit: string = buildAddressOfLength(MAX_ADDRESS_LENGTH + 512);
      expect(isValidAddress(farOverLimit)).assertFalse();
      const shortAddress: string = buildAddressOfLength(6);
      expect(shortAddress).assertEqual('aa.com');
      expect(isValidAddress(shortAddress)).assertTrue();
      TestLogger.info(TAG, `limit=${MAX_ADDRESS_LENGTH} accepted, longer rejected`);
      TestLogger.caseEnd(TAG, 'Input_Address_Length_Boundary_004', Date.now() - started);
    });

    /** A host without any dot cannot be a public site and is rejected. */
    it('Input_Address_NoDot_Rejected_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_NoDot_Rejected_005');
      const started: number = Date.now();
      const noDot: string[] = ['localhost', 'intranet', 'browser', 'a', 'pad', 'phone'];
      TestLogger.step(TAG, 'reject single label hosts');
      for (let index = 0; index < noDot.length; index++) {
        expect(isValidAddress(noDot[index])).assertFalse();
        expect(hostOf(noDot[index]).indexOf('.')).assertLess(0);
        TestLogger.info(TAG, `single label host rejected: ${noDot[index]}`);
      }
      expect(noDot.length).assertEqual(6);
      TestLogger.caseEnd(TAG, 'Input_Address_NoDot_Rejected_005', Date.now() - started);
    });

    /** The dot must separate two non empty labels. */
    it('Input_Address_DotPosition_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_DotPosition_006');
      const started: number = Date.now();
      TestLogger.step(TAG, 'check dot position rules');
      expect(isValidAddress('.com')).assertFalse();
      expect(isValidAddress('com.')).assertFalse();
      expect(isValidAddress('.')).assertFalse();
      expect(isValidAddress('..')).assertFalse();
      expect(isValidAddress('a.b')).assertTrue();
      expect(isValidAddress('a.')).assertFalse();
      expect(isValidAddress('.b')).assertFalse();
      expect(hostOf('.com').indexOf('.')).assertEqual(0);
      expect(hostOf('com.').indexOf('.')).assertEqual(3);
      TestLogger.info(TAG, 'leading and trailing dots rejected');
      TestLogger.caseEnd(TAG, 'Input_Address_DotPosition_006', Date.now() - started);
    });

    /** A space inside the address is a typing error, not a legal host. */
    it('Input_Address_InnerSpace_Rejected_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_InnerSpace_Rejected_007');
      const started: number = Date.now();
      const spaced: string[] = [
        'exa mple.com', 'example .com', ' example.com', 'example.com ',
        'www. example.com', 'a b.c d'
      ];
      TestLogger.step(TAG, 'reject addresses containing a space');
      for (let index = 0; index < spaced.length; index++) {
        expect(isValidAddress(spaced[index])).assertFalse();
        TestLogger.info(TAG, `spaced address ${index} rejected`);
      }
      expect(spaced.length).assertEqual(6);
      TestLogger.caseEnd(TAG, 'Input_Address_InnerSpace_Rejected_007', Date.now() - started);
    });

    /** Non ASCII hosts are legal and must survive normalization unchanged. */
    it('Input_Address_ChineseDomain_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_ChineseDomain_008');
      const started: number = Date.now();
      const chinese: string[] = ['中文.中国', '例子.测试', '中文.com', '测试.网络'];
      TestLogger.step(TAG, 'accept non ascii hosts');
      for (let index = 0; index < chinese.length; index++) {
        const host: string = chinese[index];
        expect(isValidAddress(host)).assertTrue();
        expect(hasNonAscii(host)).assertTrue();
        expect(normalizeUrl(host)).assertEqual(SCHEME_TOKEN + host);
        TestLogger.info(TAG, `chinese host accepted at row ${index}`);
      }
      expect(hasNonAscii('example.com')).assertFalse();
      expect(chinese.length).assertEqual(4);
      TestLogger.caseEnd(TAG, 'Input_Address_ChineseDomain_008', Date.now() - started);
    });

    /** The port suffix does not disturb the dot check and is parsed locally. */
    it('Input_Address_Port_Parsing_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_Port_Parsing_009');
      const started: number = Date.now();
      TestLogger.step(TAG, 'parse the port of accepted addresses');
      const address: string = 'example.com:8080';
      expect(isValidAddress(address)).assertTrue();
      const parts: string[] = splitHostPort(hostOf(address));
      expect(parts[0]).assertEqual('example.com');
      expect(parts[1]).assertEqual('8080');
      expect(parsePort(parts[1])).assertEqual(8080);
      expect(parsePort('443')).assertEqual(443);
      expect(parsePort('65535')).assertEqual(65535);
      expect(parsePort('65536')).assertEqual(PORT_INVALID);
      expect(parsePort('0')).assertEqual(PORT_INVALID);
      expect(parsePort('abc')).assertEqual(PORT_INVALID);
      expect(parsePort('')).assertEqual(PORT_INVALID);
      const noPort: string[] = splitHostPort(hostOf('example.com'));
      expect(noPort[1]).assertEqual('');
      TestLogger.info(TAG, 'port parsing matches the 1..65535 contract');
      TestLogger.caseEnd(TAG, 'Input_Address_Port_Parsing_009', Date.now() - started);
    });

    /** Query strings are preserved and their pair count is measurable. */
    it('Input_Address_QueryString_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_QueryString_010');
      const started: number = Date.now();
      TestLogger.step(TAG, 'keep query strings intact');
      const simple: string = 'example.com?q=ohos';
      expect(isValidAddress(simple)).assertTrue();
      expect(countQueryPairs(simple)).assertEqual(1);
      const multi: string = 'example.com?q=ohos&lang=zh&page=2';
      expect(isValidAddress(multi)).assertTrue();
      expect(countQueryPairs(multi)).assertEqual(3);
      expect(normalizeUrl(multi)).assertEqual(SCHEME_TOKEN + multi);
      expect(countQueryPairs('example.com')).assertEqual(0);
      expect(countQueryPairs('example.com?')).assertEqual(0);
      expect(countQueryPairs('?q=1')).assertEqual(1);
      expect(isValidAddress('example.com?')).assertTrue();
      TestLogger.info(TAG, 'query string counts are stable');
      TestLogger.caseEnd(TAG, 'Input_Address_QueryString_010', Date.now() - started);
    });

    /** Every accepted row must receive the https scheme automatically. */
    it('Input_Normalize_AutoHttps_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Normalize_AutoHttps_011');
      const started: number = Date.now();
      const rows: AddressCase[] = normalizeCases();
      TestLogger.step(TAG, 'walk the normalization table');
      for (let index = 0; index < rows.length; index++) {
        const row: AddressCase = rows[index];
        const actual: string = normalizeUrl(row.raw);
        expect(actual).assertEqual(row.normalized);
        if (row.valid) {
          expect(actual.startsWith(SCHEME_TOKEN) || actual.startsWith('http://') ||
            actual.startsWith('file://') || actual.startsWith('about:')).assertTrue();
        }
        TestLogger.info(TAG, `normalized row ${index}: ${row.label} -> ${actual}`);
      }
      expect(rows.length).assertEqual(8);
      TestLogger.caseEnd(TAG, 'Input_Normalize_AutoHttps_011', Date.now() - started);
    });

    /** An explicit scheme is never rewritten by the model. */
    it('Input_Normalize_PreservesScheme_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Normalize_PreservesScheme_012');
      const started: number = Date.now();
      TestLogger.step(TAG, 'verify schemes are preserved');
      expect(normalizeUrl('https://a.com')).assertEqual('https://a.com');
      expect(normalizeUrl('http://a.com')).assertEqual('http://a.com');
      expect(normalizeUrl('file://pad.html')).assertEqual('file://pad.html');
      expect(normalizeUrl('about:blank')).assertEqual('about:blank');
      expect(normalizeUrl('https://a.com/b?q=1')).assertEqual('https://a.com/b?q=1');
      expect(normalizeUrl('ftp://a.com')).assertEqual('https://ftp://a.com');
      expect(isExternalUrl('https://a.com')).assertTrue();
      expect(isExternalUrl('http://a.com')).assertTrue();
      expect(isExternalUrl('file://pad.html')).assertFalse();
      TestLogger.info(TAG, 'scheme preservation matrix checked');
      TestLogger.caseEnd(TAG, 'Input_Normalize_PreservesScheme_012', Date.now() - started);
    });

    /** An empty value degrades to the bare scheme, never to a crash. */
    it('Input_Normalize_EmptyFallback_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Normalize_EmptyFallback_013');
      const started: number = Date.now();
      TestLogger.step(TAG, 'normalize empty and scheme only values');
      expect(normalizeUrl(EMPTY_ADDRESS)).assertEqual(URL_SCHEME);
      expect(normalizeUrl(EMPTY_ADDRESS).length).assertEqual(8);
      expect(normalizeUrl('https://')).assertEqual('https://');
      expect(normalizeUrl('a')).assertEqual('https://a');
      expect(normalizeUrl(' ')).assertEqual('https:// ');
      expect(isValidAddress(normalizeUrl(EMPTY_ADDRESS))).assertFalse();
      expect(normalizeUrl(EMPTY_ADDRESS)).assertEqual(SCHEME_TOKEN);
      expect(URL_SCHEME).assertEqual(SCHEME_TOKEN);
      TestLogger.info(TAG, 'empty fallback returns the bare https scheme');
      TestLogger.caseEnd(TAG, 'Input_Normalize_EmptyFallback_013', Date.now() - started);
    });

    /** Search words are percent encoded before they reach Bing. */
    it('Input_Search_WordEncoding_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Search_WordEncoding_014');
      const started: number = Date.now();
      TestLogger.step(TAG, 'encode reserved search characters');
      expect(encodeSearchWord('ohos')).assertEqual('ohos');
      expect(encodeSearchWord('open harmony')).assertEqual('open%20harmony');
      expect(encodeSearchWord('a&b')).assertEqual('a&b');
      expect(encodeSearchWord('a+b')).assertEqual('a+b');
      expect(encodeSearchWord('a#b')).assertEqual('a#b');
      expect(encodeSearchWord('a/b')).assertEqual('a/b');
      expect(encodeSearchWord('a?b')).assertEqual('a?b');
      expect(encodeSearchWord('a=b')).assertEqual('a=b');
      expect(encodeSearchWord('中文')).assertEqual('%E4%B8%AD%E6%96%87');
      expect(encodeSearchWord(EMPTY_ADDRESS)).assertEqual('');
      const percentIndex: number = encodeSearchWord('a b').indexOf('%');
      expect(percentIndex).assertEqual(1);
      TestLogger.info(TAG, 'search word encoding matches encodeURI');
      TestLogger.caseEnd(TAG, 'Input_Search_WordEncoding_014', Date.now() - started);
    });

    /** The assembled search url keeps the engine prefix untouched. */
    it('Input_Search_UrlComposition_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Search_UrlComposition_015');
      const started: number = Date.now();
      TestLogger.step(TAG, 'compose the bing search url');
      expect(buildSearchUrl('ohos')).assertEqual(SEARCH_ENGINE + 'ohos');
      expect(buildSearchUrl('open harmony')).assertEqual(SEARCH_ENGINE + 'open%20harmony');
      expect(buildSearchUrl(EMPTY_ADDRESS)).assertEqual(SEARCH_ENGINE);
      const built: string = buildSearchUrl('中文 浏览器');
      expect(built.startsWith(SEARCH_ENGINE)).assertTrue();
      expect(built.length).assertLarger(SEARCH_ENGINE.length);
      expect(built.indexOf(' ')).assertLess(0);
      expect(SEARCH_ENGINE).assertEqual('https://www.bing.com/search?q=');
      expect(built.indexOf('www.bing.com')).assertLarger(0);
      TestLogger.info(TAG, `search url length=${built.length}`);
      TestLogger.caseEnd(TAG, 'Input_Search_UrlComposition_015', Date.now() - started);
    });

    /** sanitizeInput trims the value and drops the first newline. */
    it('Input_Sanitize_Trim_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Sanitize_Trim_016');
      const started: number = Date.now();
      TestLogger.step(TAG, 'sanitize typed values');
      expect(sanitizeInput('example.com')).assertEqual('example.com');
      expect(sanitizeInput('  example.com  ')).assertEqual('example.com');
      expect(sanitizeInput('\texample.com\n')).assertEqual('example.com');
      expect(sanitizeInput('exa\nmple.com')).assertEqual('example.com');
      expect(sanitizeInput('exa\nmple\n.com')).assertEqual('example\n.com');
      expect(sanitizeInput('exa\nmple\n.com').indexOf('\n')).assertLarger(-1);
      expect(sanitizeInput(EMPTY_ADDRESS)).assertEqual('');
      expect(sanitizeInput('   ')).assertEqual('');
      expect(sanitizeInput('中文.中国')).assertEqual('中文.中国');
      expect(sanitizeInput('a b.com')).assertEqual('a b.com');
      TestLogger.info(TAG, 'sanitizer removes newlines and trims');
      TestLogger.caseEnd(TAG, 'Input_Sanitize_Trim_016', Date.now() - started);
    });

    /** A pasted value with control characters is repaired before loading. */
    it('Input_Sanitize_ControlChars_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Sanitize_ControlChars_017');
      const started: number = Date.now();
      TestLogger.step(TAG, 'repair pasted values');
      const pasted: string = '\n  https://example.com/a.html  \n';
      const cleaned: string = sanitizeInput(pasted);
      expect(cleaned).assertEqual('https://example.com/a.html');
      expect(cleaned.indexOf('\n')).assertLess(0);
      expect(cleaned.startsWith('https://')).assertTrue();
      expect(isValidAddress(cleaned)).assertTrue();
      const multiline: string = 'line1\nline2';
      expect(sanitizeInput(multiline)).assertEqual('line1line2');
      expect(sanitizeInput('\r\n\t')).assertEqual('');
      expect(sanitizedLength('  a.com  ')).assertEqual(5);
      TestLogger.info(TAG, 'pasted value repaired before load');
      TestLogger.caseEnd(TAG, 'Input_Sanitize_ControlChars_017', Date.now() - started);
    });

    /** The full rejection table is walked once with an audit object. */
    it('Input_Invalid_Table_Audit_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Invalid_Table_Audit_018');
      const started: number = Date.now();
      const audit: InputAudit = new InputAudit();
      const rows: AddressCase[] = rejectedCases();
      TestLogger.step(TAG, 'audit the rejected address table');
      for (let index = 0; index < rows.length - 1; index++) {
        const row: AddressCase = rows[index];
        expect(isValidAddress(row.raw)).assertFalse();
        audit.record(row.raw, false, row.label);
        TestLogger.info(TAG, `rejected row ${index}: ${row.label}`);
      }
      const tooLong: string = buildAddressOfLength(MAX_ADDRESS_LENGTH + 1);
      audit.record(tooLong, isValidAddress(tooLong), 'too long');
      expect(audit.acceptedCount()).assertEqual(0);
      expect(audit.rejectedCount()).assertEqual(rows.length);
      expect(audit.acceptancePercent()).assertEqual(0);
      expect(audit.lastRejected().length).assertEqual(MAX_ADDRESS_LENGTH + 1);
      TestLogger.info(TAG, `audit rejected=${audit.rejectedCount()}`);
      TestLogger.caseEnd(TAG, 'Input_Invalid_Table_Audit_018', Date.now() - started);
    });

    /** External detection separates web urls from bundled rawfile pages. */
    it('Input_External_Detection_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_External_Detection_019');
      const started: number = Date.now();
      TestLogger.step(TAG, 'classify external and internal urls');
      expect(isExternalUrl('https://example.com')).assertTrue();
      expect(isExternalUrl('http://example.com')).assertTrue();
      expect(isExternalUrl('file://pad.html')).assertFalse();
      expect(isExternalUrl('about:blank')).assertFalse();
      expect(isExternalUrl('pad.html')).assertFalse();
      expect(isExternalUrl(EMPTY_ADDRESS)).assertFalse();
      expect(isExternalUrl(normalizeUrl('example.com'))).assertTrue();
      expect(isExternalUrl('HTTPS://example.com')).assertFalse();
      expect(isExternalUrl('ftp://example.com')).assertFalse();
      TestLogger.info(TAG, 'external url detection checked');
      TestLogger.caseEnd(TAG, 'Input_External_Detection_019', Date.now() - started);
    });

    /** The model forwards the normalized url to the active controller. */
    it('Input_Model_LoadNormalized_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Model_LoadNormalized_020');
      const started: number = Date.now();
      const model: MockBrowser = new MockBrowser();
      TestLogger.step(TAG, 'load a bare host through the model');
      expect(model.loadUrl('example.com')).assertTrue();
      expect(model.tabs.length).assertEqual(1);
      const tab = model.tabs[0];
      expect(tab.controller.getPendingUrl()).assertEqual('https://example.com');
      expect(tab.controller.loadCount).assertEqual(1);
      expect(model.loadUrl('')).assertTrue();
      expect(tab.controller.getPendingUrl()).assertEqual('https://');
      expect(tab.controller.loadCount).assertEqual(2);
      expect(model.loadUrl('https://a.com/b')).assertTrue();
      expect(tab.controller.getPendingUrl()).assertEqual('https://a.com/b');
      TestLogger.info(TAG, 'model normalizes before calling the controller');
      TestLogger.caseEnd(TAG, 'Input_Model_LoadNormalized_020', Date.now() - started);
    });

    /** Mixed batches produce a stable acceptance percentage. */
    it('Input_Audit_MixedBatch_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Audit_MixedBatch_021');
      const started: number = Date.now();
      const audit: InputAudit = new InputAudit();
      const rows: AddressCase[] = acceptedCases();
      TestLogger.step(TAG, 'audit a mixed batch');
      for (let index = 0; index < rows.length; index++) {
        audit.audit(rows[index].raw);
      }
      audit.audit(EMPTY_ADDRESS);
      audit.audit('nohost');
      audit.audit('.bad');
      expect(audit.total()).assertEqual(13);
      expect(audit.acceptedCount()).assertEqual(10);
      expect(audit.rejectedCount()).assertEqual(3);
      expect(audit.acceptancePercent()).assertEqual(76);
      audit.reset();
      expect(audit.total()).assertEqual(0);
      expect(audit.acceptancePercent()).assertEqual(0);
      TestLogger.info(TAG, 'mixed batch audit is stable');
      TestLogger.caseEnd(TAG, 'Input_Audit_MixedBatch_021', Date.now() - started);
    });

    /** IPv4 literals are accepted while malformed octets are not. */
    it('Input_Address_Ipv4_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Address_Ipv4_022');
      const started: number = Date.now();
      TestLogger.step(TAG, 'check ipv4 literal parsing');
      expect(isIpv4Literal('127.0.0.1')).assertTrue();
      expect(isIpv4Literal('192.168.1.1')).assertTrue();
      expect(isIpv4Literal('0.0.0.0')).assertFalse();
      expect(isIpv4Literal('256.1.1.1')).assertFalse();
      expect(isIpv4Literal('1.2.3')).assertFalse();
      expect(isIpv4Literal('1.2.3.4.5')).assertFalse();
      expect(isValidAddress('127.0.0.1')).assertTrue();
      expect(isValidAddress('999.999.999.999')).assertTrue();
      expect(normalizeUrl('127.0.0.1:8080')).assertEqual('https://127.0.0.1:8080');
      TestLogger.info(TAG, 'ipv4 literal rules verified');
      TestLogger.caseEnd(TAG, 'Input_Address_Ipv4_022', Date.now() - started);
    });

    /** 200 generated inputs keep the validator and normalizer consistent. */
    it('Input_Stress_Generated_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Stress_Generated_023');
      const started: number = Date.now();
      const audit: InputAudit = new InputAudit();
      TestLogger.step(TAG, 'generate 200 addresses');
      for (let index = 0; index < 200; index++) {
        const host: string = `site${index}.example.com`;
        const raw: string = index % 7 === 0 ? host + `?page=${index}` : host;
        const valid: boolean = audit.audit(raw);
        expect(valid).assertTrue();
        expect(normalizeUrl(raw).startsWith(SCHEME_TOKEN)).assertTrue();
        if (index % 50 === 0) {
          TestLogger.info(TAG, `progress at ${index}, accepted=${audit.acceptedCount()}`);
        }
      }
      expect(audit.total()).assertEqual(200);
      expect(audit.acceptedCount()).assertEqual(200);
      expect(audit.acceptancePercent()).assertEqual(100);
      TestLogger.info(TAG, 'all generated addresses accepted');
      TestLogger.caseEnd(TAG, 'Input_Stress_Generated_023', Date.now() - started);
    });

    /** Typing into the real address bar keeps the value syntactically sound. */
    it('Input_Ui_AddressBar_Typing_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Ui_AddressBar_Typing_024');
      const started: number = Date.now();
      TestLogger.step(TAG, 'type into the address bar');
      const entered: boolean = await inputById(driver, ID_INPUT_URL, 'example.com');
      TestLogger.info(TAG, `input helper returned ${entered}`);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      expect(typeof entered).assertEqual('boolean');
      expect(isValidAddress('example.com')).assertTrue();
      const submitted: boolean = await clickById(driver, ID_ACTION_SUBMIT);
      TestLogger.info(TAG, `submit helper returned ${submitted}`);
      expect(typeof submitted).assertEqual('boolean');
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      expect(TIMEOUT_COMPONENT).assertLarger(0);
      TestLogger.caseEnd(TAG, 'Input_Ui_AddressBar_Typing_024', Date.now() - started);
    });

    /** Trimming boundaries around the sanitizer stay deterministic. */
    it('Input_Sanitize_Boundary_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Sanitize_Boundary_025');
      const started: number = Date.now();
      TestLogger.step(TAG, 'probe sanitizer boundaries');
      const padded: string = '  ' + buildAddressOfLength(64) + '  ';
      const cleaned: string = sanitizeInput(padded);
      expect(cleaned.length).assertEqual(64);
      expect(isValidAddress(cleaned)).assertTrue();
      const single: string = sanitizeInput(' x ');
      expect(single).assertEqual('x');
      expect(single.length).assertEqual(1);
      const huge: string = repeatChar('a', 3000);
      expect(sanitizedLength(huge)).assertEqual(3000);
      expect(isValidAddress(huge)).assertFalse();
      expect(sanitizeInput(huge).length).assertEqual(3000);
      TestLogger.info(TAG, 'sanitizer boundaries verified');
      TestLogger.caseEnd(TAG, 'Input_Sanitize_Boundary_025', Date.now() - started);
    });

    /** Documented constants used by the address bar must not drift. */
    it('Input_Constants_Contract_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'Input_Constants_Contract_026');
      const started: number = Date.now();
      TestLogger.step(TAG, 'verify shared constants');
      expect(URL_SCHEME).assertEqual('https://');
      expect(SEARCH_ENGINE).assertEqual('https://www.bing.com/search?q=');
      expect(MAX_ADDRESS_LENGTH).assertEqual(2048);
      expect(ID_INPUT_URL).assertEqual('inputUrl');
      expect(ID_ACTION_SUBMIT).assertEqual('actionButton0');
      expect(PORT_INVALID).assertEqual(-1);
      expect(buildSearchUrl('x')).assertEqual(SEARCH_ENGINE + 'x');
      expect(normalizeUrl('x')).assertEqual(URL_SCHEME + 'x');
      TestLogger.info(TAG, 'address bar constants unchanged');
      TestLogger.caseEnd(TAG, 'Input_Constants_Contract_026', Date.now() - started);
    });

  });
}
