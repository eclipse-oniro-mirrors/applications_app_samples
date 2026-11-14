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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, inputById, pressKey, componentByIdExists,
  textById, normalizeUrl, isValidAddress, encodeSearchWord, buildSearchUrl, sanitizeInput,
  SEARCH_ENGINE, URL_SCHEME, ID_INPUT_URL, KEY_ENTER, TIMEOUT_COMPONENT, DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME
} from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'BrowserInputInteractionTest';

const MAX_ADDRESS_LENGTH: number = 2048;
const LONG_INPUT_LENGTH: number = 2000;
const HUGE_INPUT_LENGTH: number = 4096;
const URL_SCHEME_LENGTH: number = 8;

const PAD_NAV_IDS: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME];

const PLAIN_HOST: string = 'developer.sample.com';
const HTTPS_HOST: string = 'https://developer.sample.com';
const HTTP_HOST: string = 'http://developer.sample.com';
const CHINESE_WORD: string = '鸿蒙浏览器';
const SPACED_WORD: string = 'harmony os browser';
const RESERVED_WORD: string = 'a&b=c#d';
const UNICODE_HOST: string = '例子.测试';

/** Repeats a single character without relying on String.prototype.repeat. */
function repeatChar(character: string, count: number): string {
  let result: string = '';
  for (let index = 0; index < count; index++) {
    result += character;
  }
  return result;
}

/** Builds a syntactically valid address with an exact character length. */
function addressOfLength(totalLength: number): string {
  const tail: string = '.com';
  const bodyLength: number = totalLength - URL_SCHEME_LENGTH - tail.length;
  if (bodyLength <= 0) {
    return URL_SCHEME;
  }
  return URL_SCHEME + repeatChar('a', bodyLength) + tail;
}

/**
 * Mirror of the address handling of TabletTitle / PhoneLayout.
 *
 * The two layouts differ in one detail: the keyboard submit path always
 * prefixes https:// on its own, while the submit button delegates to
 * Browser.loadUrl which performs the prefix inside the model.
 */
class TitleBarInput {
  addr: string = '';
  submitted: string[] = [];
  searches: string[] = [];
  browser: MockBrowser = new MockBrowser(1);

  onChange(value: string): void {
    this.addr = value;
  }

  onKeyboardSubmit(): boolean {
    if (this.addr.length === 0) {
      return false;
    }
    this.submitted.push(URL_SCHEME + this.addr);
    this.browser.loadUrl(URL_SCHEME + this.addr);
    this.addr = '';
    return true;
  }

  onActionSubmit(): boolean {
    const target: string = this.addr;
    this.browser.loadUrl(target);
    this.submitted.push(this.browser.tabs[0].controller.getPendingUrl());
    this.addr = '';
    return true;
  }

  onSearch(word: string): string {
    const url: string = buildSearchUrl(word);
    this.searches.push(url);
    this.browser.loadUrl(url);
    return url;
  }

  pendingUrl(): string {
    return this.browser.tabs[0].controller.getPendingUrl();
  }
}

/** Raw prefix contract of model/Browser.ets: loadUrl always prepends https://. */
function modelLoadUrl(addr: string): string {
  return URL_SCHEME + addr;
}

/** One row of the address acceptance table. */
interface AddressCase {
  raw: string;
  valid: boolean;
  normalized: string;
  note: string;
}

const ADDRESS_CASES: AddressCase[] = [
  { raw: 'example.com', valid: true, normalized: 'https://example.com', note: 'plain host' },
  { raw: 'https://example.com', valid: true, normalized: 'https://example.com', note: 'https host' },
  { raw: 'http://example.com', valid: true, normalized: 'http://example.com', note: 'http host' },
  { raw: 'file://index.html', valid: true, normalized: 'file://index.html', note: 'local file' },
  { raw: 'about:blank', valid: false, normalized: 'about:blank', note: 'about page' },
  { raw: 'example.com:8080', valid: true, normalized: 'https://example.com:8080', note: 'explicit port' },
  { raw: '192.168.1.1', valid: true, normalized: 'https://192.168.1.1', note: 'ipv4 host' },
  { raw: 'localhost:8080', valid: false, normalized: 'https://localhost:8080', note: 'no dot host' },
  { raw: 'example.', valid: false, normalized: 'https://example.', note: 'trailing dot' },
  { raw: 'developer sample com', valid: false, normalized: 'https://developer sample com', note: 'inner space' },
  { raw: '', valid: false, normalized: 'https://', note: 'empty input' },
  { raw: '例子.测试', valid: true, normalized: 'https://例子.测试', note: 'unicode host' },
  { raw: 'HTTPS://example.com', valid: true, normalized: 'https://HTTPS://example.com', note: 'upper scheme' },
  { raw: 'example.com/path?a=1', valid: true, normalized: 'https://example.com/path?a=1', note: 'query path' }
];

export default function browserInputInteractionTest() {
  describe('browserInputInteractionTest', () => {
    let driver: Driver = getDriver();
    let session: TitleBarInput = new TitleBarInput();

    beforeAll(async () => {
      TestLogger.info(TAG, 'input interaction suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Input_001', 0, async () => {
      TestLogger.step(TAG, 'store the typed value without loading a page');
      session = new TitleBarInput();
      session.onChange(PLAIN_HOST);
      expect(session.addr).assertEqual(PLAIN_HOST);
      expect(session.submitted.length).assertEqual(0);
      expect(session.browser.tabs[0].controller.loadCount).assertEqual(0);
    });

    it('Browser_Input_002', 0, async () => {
      TestLogger.step(TAG, 'keep the raw typed value including surrounding spaces');
      session = new TitleBarInput();
      session.onChange('  ' + PLAIN_HOST + '  ');
      expect(session.addr).assertEqual('  ' + PLAIN_HOST + '  ');
      expect(session.addr.length).assertEqual(PLAIN_HOST.length + 4);
      expect(session.onKeyboardSubmit()).assertTrue();
      expect(session.submitted[0]).assertEqual(URL_SCHEME + '  ' + PLAIN_HOST + '  ');
    });

    it('Browser_Input_003', 0, async () => {
      TestLogger.step(TAG, 'prefix a plain host with https on keyboard submit');
      session = new TitleBarInput();
      session.onChange(PLAIN_HOST);
      expect(session.onKeyboardSubmit()).assertTrue();
      expect(session.submitted[0]).assertEqual(URL_SCHEME + PLAIN_HOST);
      expect(session.pendingUrl()).assertEqual(HTTPS_HOST);
    });

    it('Browser_Input_004', 0, async () => {
      TestLogger.step(TAG, 'clear the address after a successful keyboard submit');
      session = new TitleBarInput();
      session.onChange(PLAIN_HOST);
      const accepted: boolean = session.onKeyboardSubmit();
      expect(accepted).assertTrue();
      expect(session.addr).assertEqual('');
      expect(session.submitted.length).assertEqual(1);
      expect(session.browser.tabs[0].controller.loadCount).assertEqual(1);
    });

    it('Browser_Input_005', 0, async () => {
      TestLogger.step(TAG, 'ignore the keyboard submit of an empty address');
      session = new TitleBarInput();
      expect(session.onKeyboardSubmit()).assertFalse();
      expect(session.submitted.length).assertEqual(0);
      expect(session.browser.tabs[0].controller.loadCount).assertEqual(0);
      expect(session.addr).assertEqual('');
    });

    it('Browser_Input_006', 0, async () => {
      TestLogger.step(TAG, 'treat a whitespace only address as non empty input');
      session = new TitleBarInput();
      session.onChange('   ');
      expect(session.addr.length).assertEqual(3);
      expect(session.onKeyboardSubmit()).assertTrue();
      expect(session.submitted[0]).assertEqual(URL_SCHEME + '   ');
      expect(session.browser.tabs[0].controller.loadCount).assertEqual(1);
    });

    it('Browser_Input_007', 0, async () => {
      TestLogger.step(TAG, 'submit through the action button which delegates to the model');
      session = new TitleBarInput();
      session.onChange(PLAIN_HOST);
      expect(session.onActionSubmit()).assertTrue();
      expect(session.submitted[0]).assertEqual(HTTPS_HOST);
      expect(session.addr).assertEqual('');
    });

    it('Browser_Input_008', 0, async () => {
      TestLogger.step(TAG, 'avoid double prefixing when the action button gets https');
      session = new TitleBarInput();
      session.onChange(HTTPS_HOST);
      session.onActionSubmit();
      expect(session.submitted[0]).assertEqual(HTTPS_HOST);
      expect(session.submitted[0].indexOf('https://https://')).assertEqual(-1);
      expect(session.pendingUrl()).assertEqual(HTTPS_HOST);
    });

    it('Browser_Input_009', 0, async () => {
      TestLogger.step(TAG, 'document the raw prefix contract of Browser.loadUrl');
      expect(modelLoadUrl(PLAIN_HOST)).assertEqual(HTTPS_HOST);
      expect(modelLoadUrl(HTTPS_HOST)).assertEqual('https://' + HTTPS_HOST);
      expect(modelLoadUrl(HTTP_HOST)).assertEqual('https://' + HTTP_HOST);
      expect(modelLoadUrl(HTTPS_HOST).indexOf('https://https://')).assertEqual(0);
    });

    it('Browser_Input_010', 0, async () => {
      TestLogger.step(TAG, 'build a bing search url for a chinese word');
      const url: string = buildSearchUrl(CHINESE_WORD);
      expect(url.startsWith(SEARCH_ENGINE)).assertTrue();
      expect(url).assertContain('%E9%B8%BF');
      expect(url.indexOf(CHINESE_WORD)).assertEqual(-1);
      expect(encodeSearchWord(CHINESE_WORD)).assertEqual(url.substring(SEARCH_ENGINE.length));
    });

    it('Browser_Input_011', 0, async () => {
      TestLogger.step(TAG, 'encode spaces of a multi word query');
      const encoded: string = encodeSearchWord(SPACED_WORD);
      expect(encoded).assertEqual('harmony%20os%20browser');
      expect(buildSearchUrl(SPACED_WORD)).assertEqual(SEARCH_ENGINE + encoded);
      expect(encoded.indexOf(' ')).assertEqual(-1);
    });

    it('Browser_Input_012', 0, async () => {
      TestLogger.step(TAG, 'keep reserved characters untouched by encodeURI');
      const encoded: string = encodeSearchWord(RESERVED_WORD);
      expect(encoded).assertEqual(RESERVED_WORD);
      expect(encoded).assertContain('&');
      expect(encoded).assertContain('=');
      expect(encoded).assertContain('#');
      expect(buildSearchUrl(RESERVED_WORD)).assertEqual(SEARCH_ENGINE + RESERVED_WORD);
    });

    it('Browser_Input_013', 0, async () => {
      TestLogger.step(TAG, 'build a search url from an empty word');
      session = new TitleBarInput();
      const url: string = session.onSearch('');
      expect(url).assertEqual(SEARCH_ENGINE);
      expect(url).assertEqual(buildSearchUrl(''));
      expect(session.searches.length).assertEqual(1);
      expect(session.pendingUrl()).assertEqual(SEARCH_ENGINE);
    });

    it('Browser_Input_014', 0, async () => {
      TestLogger.step(TAG, 'record every search url in submission order');
      session = new TitleBarInput();
      session.onSearch('first');
      session.onSearch('second');
      session.onSearch(CHINESE_WORD);
      expect(session.searches.length).assertEqual(3);
      expect(session.searches[0]).assertEqual(SEARCH_ENGINE + 'first');
      expect(session.searches[1]).assertEqual(SEARCH_ENGINE + 'second');
      expect(session.searches[2]).assertContain('%E9%B8%BF');
      expect(session.browser.tabs[0].controller.loadCount).assertEqual(3);
    });

    it('Browser_Input_015', 0, async () => {
      TestLogger.step(TAG, 'accept a two thousand character address');
      session = new TitleBarInput();
      const longAddress: string = addressOfLength(LONG_INPUT_LENGTH);
      expect(longAddress.length).assertEqual(LONG_INPUT_LENGTH);
      session.onChange(longAddress);
      expect(session.addr.length).assertEqual(LONG_INPUT_LENGTH);
      expect(isValidAddress(longAddress)).assertTrue();
      expect(session.onKeyboardSubmit()).assertTrue();
      expect(session.submitted[0].length).assertEqual(LONG_INPUT_LENGTH + URL_SCHEME_LENGTH);
    });

    it('Browser_Input_016', 0, async () => {
      TestLogger.step(TAG, 'accept the exact address length boundary');
      const boundary: string = addressOfLength(MAX_ADDRESS_LENGTH);
      expect(boundary.length).assertEqual(MAX_ADDRESS_LENGTH);
      expect(isValidAddress(boundary)).assertTrue();
      expect(boundary.startsWith(URL_SCHEME)).assertTrue();
      expect(boundary.endsWith('.com')).assertTrue();
    });

    it('Browser_Input_017', 0, async () => {
      TestLogger.step(TAG, 'reject an address one character past the boundary');
      const oversized: string = addressOfLength(MAX_ADDRESS_LENGTH + 1);
      expect(oversized.length).assertEqual(MAX_ADDRESS_LENGTH + 1);
      expect(isValidAddress(oversized)).assertFalse();
      expect(isValidAddress(addressOfLength(HUGE_INPUT_LENGTH))).assertFalse();
    });

    it('Browser_Input_018', 0, async () => {
      TestLogger.step(TAG, 'reject addresses that contain an inner space');
      expect(isValidAddress('developer sample com')).assertFalse();
      // Whitespace around an address is stripped by the sanitizer before the
      // validator runs, so a raw padded address is not accepted as is.
      expect(isValidAddress(' ' + PLAIN_HOST)).assertFalse();
      expect(isValidAddress(PLAIN_HOST + ' ')).assertFalse();
      expect(isValidAddress('   ')).assertFalse();
    });

    it('Browser_Input_019', 0, async () => {
      TestLogger.step(TAG, 'reject addresses without a host dot');
      expect(isValidAddress('localhost')).assertFalse();
      expect(isValidAddress('.com')).assertFalse();
      expect(isValidAddress('developer.')).assertFalse();
      expect(isValidAddress(PLAIN_HOST)).assertTrue();
      expect(isValidAddress('a.b')).assertTrue();
    });

    it('Browser_Input_020', 0, async () => {
      TestLogger.step(TAG, 'normalize the four supported address shapes');
      expect(normalizeUrl(PLAIN_HOST)).assertEqual(HTTPS_HOST);
      expect(normalizeUrl(HTTPS_HOST)).assertEqual(HTTPS_HOST);
      expect(normalizeUrl(HTTP_HOST)).assertEqual(HTTP_HOST);
      expect(normalizeUrl('file://index.html')).assertEqual('file://index.html');
      expect(normalizeUrl('about:blank')).assertEqual('about:blank');
      expect(normalizeUrl('')).assertEqual(URL_SCHEME);
    });

    it('Browser_Input_021', 0, async () => {
      TestLogger.step(TAG, 'keep an internationalized host unchanged while loading');
      session = new TitleBarInput();
      session.onChange(UNICODE_HOST);
      session.onKeyboardSubmit();
      expect(session.pendingUrl()).assertEqual(URL_SCHEME + UNICODE_HOST);
      expect(session.pendingUrl()).assertContain('例子');
      expect(isValidAddress(UNICODE_HOST)).assertTrue();
    });

    it('Browser_Input_022', 0, async () => {
      TestLogger.step(TAG, 'sanitize whitespace and newlines of typed text');
      expect(sanitizeInput('  ' + PLAIN_HOST + '  ')).assertEqual(PLAIN_HOST);
      expect(sanitizeInput('\n' + PLAIN_HOST)).assertEqual(PLAIN_HOST);
      expect(sanitizeInput(PLAIN_HOST + '\n')).assertEqual(PLAIN_HOST);
      expect(sanitizeInput('   ')).assertEqual('');
    });

    it('Browser_Input_023', 0, async () => {
      TestLogger.step(TAG, 'sanitize empty and undefined like values');
      expect(sanitizeInput('')).assertEqual('');
      const blank: string = sanitizeInput('  \n  ');
      expect(blank).assertEqual('');
      expect(sanitizeInput('a b')).assertEqual('a b');
      expect(sanitizeInput('a\nb')).assertEqual('ab');
    });

    it('Browser_Input_024', 0, async () => {
      TestLogger.step(TAG, 'type a host into the address bar and submit with enter');
      const typed: boolean = await inputById(driver, ID_INPUT_URL, PLAIN_HOST);
      expect(typed).assertTrue();
      await pressKey(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      const present: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(present).assertTrue();
    });

    it('Browser_Input_025', 0, async () => {
      TestLogger.step(TAG, 'press enter on an empty address bar');
      const cleared: boolean = await inputById(driver, ID_INPUT_URL, '');
      expect(cleared).assertTrue();
      await pressKey(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      const value: string = await textById(driver, ID_INPUT_URL);
      expect(typeof value).assertEqual('string');
      const present: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(present).assertTrue();
    });

    it('Browser_Input_026', 0, async () => {
      TestLogger.step(TAG, 'type a long address into the address bar');
      const longText: string = repeatChar('a', 120) + '.com';
      const typed: boolean = await inputById(driver, ID_INPUT_URL, longText);
      expect(typed).assertTrue();
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      const present: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(present).assertTrue();
      expect(longText.length).assertEqual(124);
    });

    it('Browser_Input_028', 0, async () => {
      TestLogger.step(TAG, 'preserve the order of consecutive keyboard submissions');
      session = new TitleBarInput();
      session.onChange('one.example.com');
      session.onKeyboardSubmit();
      session.onChange('two.example.com');
      session.onKeyboardSubmit();
      session.onChange('three.example.com');
      session.onKeyboardSubmit();
      expect(session.submitted.length).assertEqual(3);
      expect(session.submitted[0]).assertEqual('https://one.example.com');
      expect(session.submitted[1]).assertEqual('https://two.example.com');
      expect(session.submitted[2]).assertEqual('https://three.example.com');
      expect(session.addr).assertEqual('');
    });

    it('Browser_Input_029', 0, async () => {
      TestLogger.step(TAG, 'submit an address with a query string unchanged');
      session = new TitleBarInput();
      const withQuery: string = 'example.com/path?a=1&b=2';
      session.onChange(withQuery);
      session.onKeyboardSubmit();
      expect(session.pendingUrl()).assertEqual(URL_SCHEME + withQuery);
      expect(session.pendingUrl()).assertContain('?a=1&b=2');
    });

    it('Browser_Input_030', 0, async () => {
      TestLogger.step(TAG, 'switch tabs and keep separate pending addresses');
      session = new TitleBarInput();
      session.onChange('first.example.com');
      session.onKeyboardSubmit();
      session.browser.addTab();
      session.onChange('second.example.com');
      session.onKeyboardSubmit();
      expect(session.browser.tabs.length).assertEqual(2);
      expect(session.browser.tabs[0].controller.getPendingUrl()).assertEqual('https://first.example.com');
      expect(session.browser.tabs[1].controller.getPendingUrl()).assertEqual('https://second.example.com');
    });

    it('Browser_Input_031', 0, async () => {
      TestLogger.step(TAG, 'normalize a data driven table of typed addresses');
      for (let index = 0; index < ADDRESS_CASES.length; index++) {
        const item: AddressCase = ADDRESS_CASES[index];
        TestLogger.info(TAG, 'normalize case ' + item.note);
        expect(normalizeUrl(item.raw)).assertEqual(item.normalized);
      }
    });

    it('Browser_Input_032', 0, async () => {
      TestLogger.step(TAG, 'validate a data driven table of typed addresses');
      for (let index = 0; index < ADDRESS_CASES.length; index++) {
        const item: AddressCase = ADDRESS_CASES[index];
        expect(isValidAddress(item.raw)).assertEqual(item.valid);
      }
    });

    it('Browser_Input_033', 0, async () => {
      TestLogger.step(TAG, 'prefix unsupported schemes instead of passing them through');
      expect(normalizeUrl('ftp://files.example.com')).assertEqual('https://ftp://files.example.com');
      expect(normalizeUrl('mailto:test@example.com')).assertEqual('https://mailto:test@example.com');
      expect(normalizeUrl('javascript:alert(1)')).assertEqual('https://javascript:alert(1)');
      expect(normalizeUrl('resource://rawfile/pad.html')).assertEqual('https://resource://rawfile/pad.html');
    });

    it('Browser_Input_034', 0, async () => {
      TestLogger.step(TAG, 'treat scheme matching as case sensitive');
      expect(normalizeUrl('HTTPS://example.com')).assertEqual('https://HTTPS://example.com');
      expect(normalizeUrl('Http://example.com')).assertEqual('https://Http://example.com');
      expect(normalizeUrl('HTTPS://example.com').indexOf('https://https://')).assertEqual(-1);
      expect('HTTPS://example.com'.startsWith('https://')).assertFalse();
    });

    it('Browser_Input_035', 0, async () => {
      TestLogger.step(TAG, 'accept hosts with ports and explicit paths');
      expect(isValidAddress('example.com:8080')).assertTrue();
      expect(isValidAddress('example.com:8080/path/index.html')).assertTrue();
      expect(isValidAddress('192.168.1.1')).assertTrue();
      expect(isValidAddress('127.0.0.1:8080')).assertTrue();
      expect(normalizeUrl('localhost:8080')).assertEqual('https://localhost:8080');
    });

    it('Browser_Input_036', 0, async () => {
      TestLogger.step(TAG, 'reject addresses with a trailing dot or empty host');
      expect(isValidAddress('example.')).assertFalse();
      expect(isValidAddress('.example')).assertFalse();
      expect(isValidAddress('.')).assertFalse();
      expect(isValidAddress('')).assertFalse();
      expect(isValidAddress('   ')).assertFalse();
    });

    it('Browser_Input_037', 0, async () => {
      TestLogger.step(TAG, 'encode a query word twice and observe percent escaping');
      const once: string = encodeSearchWord('%20');
      expect(once).assertEqual('%2520');
      expect(once).assertContain('%25');
      const twice: string = encodeSearchWord(once);
      expect(twice).assertEqual('%252520');
      expect(twice.length).assertLarger(once.length);
    });

    it('Browser_Input_038', 0, async () => {
      TestLogger.step(TAG, 'keep slashes and colons of a search word untouched');
      const word: string = 'https://example.com/a/b';
      const encoded: string = encodeSearchWord(word);
      expect(encoded).assertEqual(word);
      expect(encoded).assertContain('://');
      expect(buildSearchUrl(word)).assertEqual(SEARCH_ENGINE + word);
    });

    it('Browser_Input_039', 0, async () => {
      TestLogger.step(TAG, 'encode a long multi word query without dropping characters');
      const word: string = repeatChar('鸿', 30) + ' ' + repeatChar('a', 30);
      const encoded: string = encodeSearchWord(word);
      expect(encoded.indexOf(' ')).assertEqual(-1);
      expect(encoded).assertContain('%20');
      expect(encoded.length).assertLarger(word.length);
      expect(buildSearchUrl(word).startsWith(SEARCH_ENGINE)).assertTrue();
    });

    it('Browser_Input_040', 0, async () => {
      TestLogger.step(TAG, 'submit an empty address through the action button');
      session = new TitleBarInput();
      expect(session.addr).assertEqual('');
      expect(session.onActionSubmit()).assertTrue();
      expect(session.pendingUrl()).assertEqual(URL_SCHEME);
      expect(session.submitted[0]).assertEqual(URL_SCHEME);
      expect(session.addr).assertEqual('');
    });

    it('Browser_Input_043', 0, async () => {
      TestLogger.step(TAG, 'submit six different hosts and clear each address');
      session = new TitleBarInput();
      const hosts: string[] = [
        'a.example.com', 'b.example.com', 'c.example.com',
        'd.example.com', 'e.example.com', 'f.example.com'
      ];
      for (let index = 0; index < hosts.length; index++) {
        session.onChange(hosts[index]);
        expect(session.onKeyboardSubmit()).assertTrue();
        expect(session.addr).assertEqual('');
        expect(session.submitted[index]).assertEqual(URL_SCHEME + hosts[index]);
      }
      expect(session.submitted.length).assertEqual(hosts.length);
    });

    it('Browser_Input_044', 0, async () => {
      TestLogger.step(TAG, 'normalize every table row twice and compare the results');
      for (let index = 0; index < ADDRESS_CASES.length; index++) {
        const raw: string = ADDRESS_CASES[index].raw;
        const once: string = normalizeUrl(raw);
        const twice: string = normalizeUrl(once);
        expect(twice).assertEqual(once);
      }
    });

    it('Browser_Input_047', 0, async () => {
      TestLogger.step(TAG, 'encode a table of short words and compare lengths');
      const words: string[] = ['a', 'ab', 'a b', '中文', 'a+b', 'a b c'];
      for (let index = 0; index < words.length; index++) {
        const encoded: string = encodeSearchWord(words[index]);
        expect(encoded.length).assertLarger(0);
        expect(encoded.indexOf(' ')).assertEqual(-1);
        expect(buildSearchUrl(words[index])).assertEqual(SEARCH_ENGINE + encoded);
      }
      expect(encodeSearchWord('a b c')).assertEqual('a%20b%20c');
    });

    it('Browser_Input_048', 0, async () => {
      TestLogger.step(TAG, 'apply the raw model prefix to every table row');
      for (let index = 0; index < ADDRESS_CASES.length; index++) {
        const raw: string = ADDRESS_CASES[index].raw;
        expect(modelLoadUrl(raw)).assertEqual(URL_SCHEME + raw);
        expect(modelLoadUrl(raw).startsWith(URL_SCHEME)).assertTrue();
      }
      expect(modelLoadUrl('')).assertEqual(URL_SCHEME);
    });

    it('Browser_Input_049', 0, async () => {
      TestLogger.step(TAG, 'preserve path query and fragment of typed urls');
      expect(normalizeUrl('example.com/a/b')).assertEqual('https://example.com/a/b');
      expect(normalizeUrl('example.com/a?b=1&c=2')).assertEqual('https://example.com/a?b=1&c=2');
      expect(normalizeUrl('example.com/a#section')).assertEqual('https://example.com/a#section');
      expect(normalizeUrl('example.com:8443/a')).assertEqual('https://example.com:8443/a');
    });

    it('Browser_Input_050', 0, async () => {
      TestLogger.step(TAG, 'encode control characters inside a search word');
      expect(encodeSearchWord('a\nb')).assertEqual('a%0Ab');
      expect(encodeSearchWord('a\tb')).assertEqual('a%09b');
      expect(encodeSearchWord('中文 词')).assertContain('%20');
      expect(buildSearchUrl('a\nb')).assertEqual(SEARCH_ENGINE + 'a%0Ab');
    });

  });
}
