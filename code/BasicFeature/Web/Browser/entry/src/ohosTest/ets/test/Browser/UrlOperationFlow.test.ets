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
  getDriver, startBrowserApp, componentByIdExists, textById,
  normalizeUrl, isValidAddress, isExternalUrl, encodeSearchWord, buildSearchUrl,
  pushHistory, sanitizeInput, URL_SCHEME, SEARCH_ENGINE, PAD_HOME_PAGE, PHONE_HOME_PAGE,
  ID_INPUT_URL, ID_ACTION_SUBMIT, TIMEOUT_PAGE_LOAD
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockWebController, MockLoadingStatus, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserUrlOperationFlowTest';

/* ------------------------------------------------------------------ */
/* Address tables                                                      */
/* ------------------------------------------------------------------ */

interface UrlCase {
  label: string;
  raw: string;
  normalized: string;
  valid: boolean;
  external: boolean;
}

/** Bare hosts are completed, explicit schemes are preserved verbatim. */
const NORMALIZE_CASES: UrlCase[] = [
  { label: 'bare host', raw: 'example.com', normalized: 'https://example.com', valid: true, external: true },
  { label: 'bare host with path', raw: 'example.com/a/b', normalized: 'https://example.com/a/b', valid: true, external: true },
  { label: 'bare host with query', raw: 'example.com?q=1', normalized: 'https://example.com?q=1', valid: true, external: true },
  { label: 'bare host with port', raw: 'example.com:8443', normalized: 'https://example.com:8443', valid: true, external: true },
  { label: 'existing https', raw: 'https://example.com', normalized: 'https://example.com', valid: true, external: true },
  { label: 'existing http', raw: 'http://example.com', normalized: 'http://example.com', valid: true, external: true },
  { label: 'pad rawfile', raw: 'pad.html', normalized: 'https://pad.html', valid: true, external: false },
  { label: 'phone rawfile', raw: 'phone.html', normalized: 'https://phone.html', valid: true, external: false },
  { label: 'bing search url', raw: 'https://www.bing.com/search?q=harmony', normalized: 'https://www.bing.com/search?q=harmony', valid: true, external: true },
  { label: 'deep path', raw: 'https://developer.example.org/docs/index.html', normalized: 'https://developer.example.org/docs/index.html', valid: true, external: true }
];

/** Addresses the title bar must reject before touching the controller. */
const INVALID_CASES: string[] = [
  '',
  '   ',
  'localhost',
  'http://',
  'https://',
  'example',
  '.com',
  'example.',
  'has space.com',
  'url with many spaces'
];

interface SearchCase {
  label: string;
  word: string;
  encoded: string;
}

/** CJK, spaces and reserved characters must survive the Bing encoder. */
const SEARCH_CASES: SearchCase[] = [
  { label: 'ascii word', word: 'harmony', encoded: 'harmony' },
  { label: 'ascii phrase', word: 'open harmony', encoded: 'open%20harmony' },
  { label: 'cjk short', word: '浏览器', encoded: '%E6%B5%8F%E8%A7%88%E5%99%A8' },
  { label: 'cjk phrase', word: '鸿蒙 浏览器', encoded: '%E9%B8%BF%E8%92%99%20%E6%B5%8F%E8%A7%88%E5%99%A8' },
  { label: 'ampersand', word: 'a&b', encoded: 'a&b' },
  { label: 'plus sign', word: 'a+b', encoded: 'a+b' },
  { label: 'slash', word: 'a/b', encoded: 'a/b' },
  { label: 'question mark', word: 'a?b', encoded: 'a?b' },
  { label: 'hash', word: 'a#b', encoded: 'a#b' },
  { label: 'percent', word: '100%', encoded: '100%25' }
];

/* ------------------------------------------------------------------ */
/* Redirect modelling                                                  */
/* ------------------------------------------------------------------ */

interface RedirectHop {
  from: string;
  to: string;
  status: number;
}

interface RedirectCase {
  label: string;
  hops: RedirectHop[];
  finalUrl: string;
  limit: number;
}

const REDIRECT_CASES: RedirectCase[] = [
  {
    label: 'single permanent hop',
    hops: [{ from: 'http://example.com', to: 'https://example.com', status: 301 }],
    finalUrl: 'https://example.com',
    limit: 8
  },
  {
    label: 'www normalization',
    hops: [
      { from: 'https://example.com', to: 'https://www.example.com', status: 302 },
      { from: 'https://www.example.com', to: 'https://www.example.com/home', status: 200 }
    ],
    finalUrl: 'https://www.example.com/home',
    limit: 8
  },
  {
    label: 'three hop marketing chain',
    hops: [
      { from: 'https://a.example.com', to: 'https://b.example.com', status: 301 },
      { from: 'https://b.example.com', to: 'https://c.example.com', status: 302 },
      { from: 'https://c.example.com', to: 'https://c.example.com/landing', status: 303 }
    ],
    finalUrl: 'https://c.example.com/landing',
    limit: 8
  },
  {
    label: 'chain deeper than the limit',
    hops: [
      { from: 'https://h0.example.com', to: 'https://h1.example.com', status: 301 },
      { from: 'https://h1.example.com', to: 'https://h2.example.com', status: 301 },
      { from: 'https://h2.example.com', to: 'https://h3.example.com', status: 301 },
      { from: 'https://h3.example.com', to: 'https://h4.example.com', status: 301 }
    ],
    finalUrl: 'https://h2.example.com',
    limit: 2
  }
];

/**
 * Bounded redirect follower.
 *
 * Browsers stop following after a small number of hops; the model keeps the
 * visited list so a suite can assert both the final address and the fact that
 * the limit, not the network, ended the walk.
 */
class RedirectChain {
  private visited: string[] = [];
  private limit: number = 8;
  private start: string = '';
  private truncated: boolean = false;

  constructor(start: string, limit: number = 8) {
    this.start = start;
    this.limit = limit <= 0 ? 1 : limit;
    this.visited.push(start);
  }

  /** Follows the table until the limit or a terminal hop is reached. */
  follow(hops: RedirectHop[]): string {
    let cursor: string = this.start;
    let taken: number = 0;
    for (let index = 0; index < hops.length; index++) {
      if (hops[index].from !== cursor) {
        break;
      }
      if (taken >= this.limit) {
        this.truncated = true;
        break;
      }
      cursor = hops[index].to;
      this.visited.push(cursor);
      taken += 1;
      if (hops[index].status === 200) {
        break;
      }
    }
    return cursor;
  }

  getVisited(): string[] {
    return this.visited.slice(0);
  }

  getFinalUrl(): string {
    return this.visited[this.visited.length - 1];
  }

  hopCount(): number {
    return this.visited.length - 1;
  }

  wasTruncated(): boolean {
    return this.truncated;
  }

  containsLoop(): boolean {
    const seen: Set<string> = new Set<string>();
    for (let index = 0; index < this.visited.length; index++) {
      if (seen.has(this.visited[index])) {
        return true;
      }
      seen.add(this.visited[index]);
    }
    return false;
  }
}

/* ------------------------------------------------------------------ */
/* History stack mirror                                                */
/* ------------------------------------------------------------------ */

/** Cursor based history mirroring MockWebController.forward/backward. */
class HistoryStackModel {
  private entries: string[] = [];
  private cursor: number = -1;
  private cap: number = 50;

  constructor(cap: number = 50) {
    this.cap = cap <= 0 ? 1 : cap;
  }

  push(url: string): boolean {
    if (url === null || url === undefined || url.length === 0) {
      return false;
    }
    if (this.cursor < this.entries.length - 1) {
      this.entries = this.entries.slice(0, this.cursor + 1);
    }
    if (this.entries.length > 0 && this.entries[this.entries.length - 1] === url) {
      this.cursor = this.entries.length - 1;
      return true;
    }
    this.entries.push(url);
    if (this.entries.length > this.cap) {
      this.entries.shift();
    }
    this.cursor = this.entries.length - 1;
    return true;
  }

  back(): string {
    if (this.cursor <= 0) {
      return '';
    }
    this.cursor -= 1;
    return this.entries[this.cursor];
  }

  forward(): string {
    if (this.cursor < 0 || this.cursor >= this.entries.length - 1) {
      return '';
    }
    this.cursor += 1;
    return this.entries[this.cursor];
  }

  canBack(): boolean {
    return this.cursor > 0;
  }

  canForward(): boolean {
    return this.cursor >= 0 && this.cursor < this.entries.length - 1;
  }

  current(): string {
    if (this.cursor < 0 || this.cursor >= this.entries.length) {
      return '';
    }
    return this.entries[this.cursor];
  }

  size(): number {
    return this.entries.length;
  }

  cursorIndex(): number {
    return this.cursor;
  }

  entriesView(): string[] {
    return this.entries.slice(0);
  }
}

/* ------------------------------------------------------------------ */
/* Composite url operation flow                                        */
/* ------------------------------------------------------------------ */

/** Deterministic replacement for String.prototype.repeat. */
function repeatChar(character: string, count: number): string {
  let result: string = '';
  for (let index = 0; index < count; index++) {
    result += character;
  }
  return result;
}

interface FlowOutcome {
  accepted: boolean;
  loaded: string;
  reason: string;
}

/**
 * Single entry point for the address related operations of the sample:
 * typing an address, running a search, opening a popup target and returning
 * to the bundled rawfile home page.
 */
class UrlOperationFlow {
  private browser: MockBrowser = new MockBrowser(1);

  reset(): void {
    this.browser = new MockBrowser(1);
  }

  getBrowser(): MockBrowser {
    return this.browser;
  }

  controller(): MockWebController | null {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    if (tab === null) {
      return null;
    }
    return tab.controller;
  }

  /** Rejects malformed addresses, otherwise loads the normalized form. */
  submit(address: string): FlowOutcome {
    const outcome: FlowOutcome = { accepted: false, loaded: '', reason: '' };
    const trimmed: string = sanitizeInput(address);
    if (!isValidAddress(trimmed)) {
      outcome.reason = 'invalid address';
      return outcome;
    }
    this.browser.setInputVal(trimmed);
    const loaded: boolean = this.browser.loadUrl(trimmed);
    outcome.accepted = loaded;
    outcome.loaded = loaded ? normalizeUrl(trimmed) : '';
    return outcome;
  }

  /** Builds the Bing url and loads it without touching the address table. */
  search(word: string): FlowOutcome {
    const outcome: FlowOutcome = { accepted: false, loaded: '', reason: '' };
    if (word === null || word === undefined || word.trim().length === 0) {
      outcome.reason = 'empty search word';
      return outcome;
    }
    const target: string = buildSearchUrl(word);
    outcome.accepted = this.browser.loadUrl(target);
    outcome.loaded = target;
    return outcome;
  }

  /** onWindowNew keeps the popup inside the current tab. */
  openPopup(targetUrl: string): FlowOutcome {
    const outcome: FlowOutcome = { accepted: false, loaded: '', reason: '' };
    if (targetUrl === 'about:blank' || targetUrl === '') {
      outcome.reason = 'blank popup target';
      return outcome;
    }
    const controller: MockWebController | null = this.controller();
    if (controller === null) {
      outcome.reason = 'no controller';
      return outcome;
    }
    outcome.accepted = this.browser.onWindowNew(targetUrl);
    outcome.loaded = outcome.accepted ? targetUrl : '';
    return outcome;
  }

  goHome(homePage: string): string {
    this.browser.resetToHome(homePage);
    const controller: MockWebController | null = this.controller();
    return controller === null ? '' : controller.currentUrl;
  }

  /** Pushes one entry and reports the new stack depth. */
  push(url: string): number {
    const controller: MockWebController | null = this.controller();
    if (controller === null) {
      return 0;
    }
    controller.loadUrl(url);
    return controller.history.length;
  }
}

export default function urlOperationFlowTest() {
  describe('urlOperationFlowTest', () => {
    let driver: Driver = getDriver();
    let flow: UrlOperationFlow = new UrlOperationFlow();
    let clock: MockClock = new MockClock();

    beforeAll(async () => {
      TestLogger.info(TAG, 'url flow suite begin');
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, `normalize cases=${NORMALIZE_CASES.length} ` +
        `search cases=${SEARCH_CASES.length} redirect cases=${REDIRECT_CASES.length}`);
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
      flow = new UrlOperationFlow();
      clock = new MockClock();
    });

    it('Browser_Url_Flow_001', 0, async () => {
      TestLogger.step(TAG, 'normalizeUrl completes every bare host with https');
      for (let index = 0; index < NORMALIZE_CASES.length; index++) {
        const item: UrlCase = NORMALIZE_CASES[index];
        const actual: string = normalizeUrl(item.raw);
        TestLogger.info(TAG, `normalize ${item.label}: ${item.raw} -> ${actual}`);
        expect(actual).assertEqual(item.normalized);
        expect(actual.startsWith('http')).assertTrue();
      }
      expect(NORMALIZE_CASES.length).assertEqual(10);
    });

    it('Browser_Url_Flow_002', 0, async () => {
      TestLogger.step(TAG, 'normalizeUrl preserves an explicit scheme');
      expect(normalizeUrl('https://example.com')).assertEqual('https://example.com');
      expect(normalizeUrl('http://example.com')).assertEqual('http://example.com');
      expect(normalizeUrl('https://example.com/a?b=1&c=2'))
        .assertEqual('https://example.com/a?b=1&c=2');
      expect(normalizeUrl('https://example.com')).assertEqual(normalizeUrl('example.com'));
      expect(normalizeUrl('http://example.com') === normalizeUrl('example.com')).assertFalse();
      expect(URL_SCHEME).assertEqual('https://');
    });

    it('Browser_Url_Flow_003', 0, async () => {
      TestLogger.step(TAG, 'normalizeUrl tolerates the empty address gracefully');
      expect(normalizeUrl('')).assertEqual(URL_SCHEME);
      expect(normalizeUrl('   ')).assertEqual(URL_SCHEME + '   ');
      expect(normalizeUrl('')).assertEqual('https://');
      expect(normalizeUrl('').length).assertEqual(8);
      expect(normalizeUrl('a')).assertEqual('https://a');
    });

    it('Browser_Url_Flow_004', 0, async () => {
      TestLogger.step(TAG, 'isValidAddress rejects malformed input tables');
      for (let index = 0; index < INVALID_CASES.length; index++) {
        const candidate: string = INVALID_CASES[index];
        TestLogger.info(TAG, `invalid candidate index=${index} length=${candidate.length}`);
        expect(isValidAddress(candidate)).assertFalse();
      }
      expect(INVALID_CASES.length).assertEqual(10);
      expect(isValidAddress('example.com')).assertTrue();
      expect(isValidAddress('https://example.com/path')).assertTrue();
      expect(isValidAddress('http://example.com')).assertTrue();
    });

    it('Browser_Url_Flow_005', 0, async () => {
      TestLogger.step(TAG, 'submit refuses malformed addresses without loading');
      const outcome: FlowOutcome = flow.submit('not a host');
      expect(outcome.accepted).assertFalse();
      expect(outcome.loaded).assertEqual('');
      expect(outcome.reason).assertEqual('invalid address');
      const controller: MockWebController | null = flow.controller();
      expect(controller === null).assertFalse();
      if (controller !== null) {
        expect(controller.loadCount).assertEqual(0);
        expect(controller.currentUrl).assertEqual('');
        expect(controller.history.length).assertEqual(0);
      }
      const empty: FlowOutcome = flow.submit('');
      expect(empty.accepted).assertFalse();
      expect(empty.reason).assertEqual('invalid address');
    });

    it('Browser_Url_Flow_006', 0, async () => {
      TestLogger.step(TAG, 'submit loads the normalized address of a bare host');
      const outcome: FlowOutcome = flow.submit('example.com');
      expect(outcome.accepted).assertTrue();
      expect(outcome.loaded).assertEqual('https://example.com');
      expect(outcome.reason).assertEqual('');
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.loadCount).assertEqual(1);
        expect(controller.currentUrl).assertEqual('https://example.com');
        expect(controller.history.length).assertEqual(1);
        expect(controller.historyIndex).assertEqual(0);
        expect(controller.accessBackward()).assertFalse();
      }
      expect(flow.getBrowser().getInputVal()).assertEqual('example.com');
    });

    it('Browser_Url_Flow_007', 0, async () => {
      TestLogger.step(TAG, 'submit trims surrounding whitespace before validation');
      const outcome: FlowOutcome = flow.submit('  example.com  ');
      expect(outcome.accepted).assertTrue();
      expect(outcome.loaded).assertEqual('https://example.com');
      expect(flow.getBrowser().getInputVal()).assertEqual('example.com');
      expect(sanitizeInput('  example.com  ')).assertEqual('example.com');
      expect(sanitizeInput('line\nbreak')).assertEqual('linebreak');
      expect(sanitizeInput('')).assertEqual('');
      const multiline: FlowOutcome = flow.submit('example.com\n');
      expect(multiline.accepted).assertTrue();
    });

    it('Browser_Url_Flow_008', 0, async () => {
      TestLogger.step(TAG, 'bing search url keeps the documented prefix');
      const url: string = buildSearchUrl('harmony');
      expect(url).assertEqual(SEARCH_ENGINE + 'harmony');
      expect(url.startsWith('https://www.bing.com/search?q=')).assertTrue();
      expect(url.indexOf('q=')).assertEqual(28);
      expect(SEARCH_ENGINE).assertEqual('https://www.bing.com/search?q=');
      const outcome: FlowOutcome = flow.search('harmony');
      expect(outcome.accepted).assertTrue();
      expect(outcome.loaded).assertEqual(url);
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.currentUrl).assertEqual(url);
      }
    });

    it('Browser_Url_Flow_009', 0, async () => {
      TestLogger.step(TAG, 'search encoding covers cjk words');
      const cjk: SearchCase = SEARCH_CASES[2];
      expect(encodeSearchWord(cjk.word)).assertEqual(cjk.encoded);
      expect(cjk.encoded.length).assertEqual(27);
      expect(cjk.encoded.indexOf('%E6%B5%8F')).assertEqual(0);
      const url: string = buildSearchUrl(cjk.word);
      expect(url).assertEqual(SEARCH_ENGINE + cjk.encoded);
      expect(url.indexOf(cjk.word)).assertEqual(-1);
      const outcome: FlowOutcome = flow.search(cjk.word);
      expect(outcome.accepted).assertTrue();
      expect(outcome.loaded.indexOf('%')).assertLarger(0);
      expect(outcome.loaded.indexOf('浏览器')).assertEqual(-1);
    });

    it('Browser_Url_Flow_010', 0, async () => {
      TestLogger.step(TAG, 'search encoding converts spaces to percent twenty');
      const phrase: SearchCase = SEARCH_CASES[1];
      expect(encodeSearchWord(phrase.word)).assertEqual('open%20harmony');
      expect(encodeSearchWord('a b c')).assertEqual('a%20b%20c');
      expect(encodeSearchWord(' a ')).assertEqual('%20a%20');
      const mixed: SearchCase = SEARCH_CASES[3];
      expect(encodeSearchWord(mixed.word)).assertEqual(mixed.encoded);
      const url: string = buildSearchUrl(mixed.word);
      expect(url.indexOf('%20')).assertLarger(0);
      expect(url.indexOf(' ')).assertEqual(-1);
    });

    it('Browser_Url_Flow_011', 0, async () => {
      TestLogger.step(TAG, 'search encoding keeps reserved characters intact');
      for (let index = 0; index < SEARCH_CASES.length; index++) {
        const item: SearchCase = SEARCH_CASES[index];
        expect(encodeSearchWord(item.word)).assertEqual(item.encoded);
        const url: string = buildSearchUrl(item.word);
        expect(url.startsWith(SEARCH_ENGINE)).assertTrue();
        expect(url.endsWith(item.encoded)).assertTrue();
      }
      expect(encodeSearchWord('a&b')).assertEqual('a&b');
      expect(encodeSearchWord('a+b')).assertEqual('a+b');
      expect(encodeSearchWord('100%')).assertEqual('100%25');
      expect(SEARCH_CASES.length).assertEqual(10);
    });

    it('Browser_Url_Flow_012', 0, async () => {
      TestLogger.step(TAG, 'search refuses an empty word before building a url');
      const blank: FlowOutcome = flow.search('');
      expect(blank.accepted).assertFalse();
      expect(blank.reason).assertEqual('empty search word');
      const spaces: FlowOutcome = flow.search('   ');
      expect(spaces.accepted).assertFalse();
      expect(spaces.reason).assertEqual('empty search word');
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.loadCount).assertEqual(0);
        expect(controller.currentUrl).assertEqual('');
      }
      expect(buildSearchUrl('x')).assertEqual(SEARCH_ENGINE + 'x');
      expect(buildSearchUrl('')).assertEqual(SEARCH_ENGINE);
    });

    it('Browser_Url_Flow_013', 0, async () => {
      TestLogger.step(TAG, 'popup target replaces the current page in the same tab');
      const outcome: FlowOutcome = flow.openPopup('https://popup.example.com/news');
      expect(outcome.accepted).assertTrue();
      expect(outcome.loaded).assertEqual('https://popup.example.com/news');
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.currentUrl).assertEqual('https://popup.example.com/news');
        expect(controller.loadCount).assertEqual(1);
        expect(controller.history.length).assertEqual(1);
      }
      expect(flow.getBrowser().tabs.length).assertEqual(1);
      expect(isExternalUrl(outcome.loaded)).assertTrue();
    });

    it('Browser_Url_Flow_014', 0, async () => {
      TestLogger.step(TAG, 'blank popup targets are refused');
      const blank: FlowOutcome = flow.openPopup('about:blank');
      expect(blank.accepted).assertFalse();
      expect(blank.reason).assertEqual('blank popup target');
      const empty: FlowOutcome = flow.openPopup('');
      expect(empty.accepted).assertFalse();
      expect(empty.reason).assertEqual('blank popup target');
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.loadCount).assertEqual(0);
        expect(controller.currentUrl).assertEqual('');
      }
      expect(isExternalUrl('about:blank')).assertFalse();
      expect(isExternalUrl('')).assertFalse();
      expect(isExternalUrl('https://example.com')).assertTrue();
      expect(isExternalUrl('http://example.com')).assertTrue();
      expect(isExternalUrl('pad.html')).assertFalse();
    });

    it('Browser_Url_Flow_015', 0, async () => {
      TestLogger.step(TAG, 'home navigation loads the bundled rawfile page');
      const padUrl: string = flow.goHome(PAD_HOME_PAGE);
      expect(padUrl).assertEqual(PAD_HOME_PAGE);
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.currentUrl).assertEqual('pad.html');
        expect(controller.history.length).assertEqual(1);
        expect(controller.accessBackward()).assertFalse();
      }
      expect(flow.getBrowser().getInputVal()).assertEqual('');
      const phoneUrl: string = flow.goHome(PHONE_HOME_PAGE);
      expect(phoneUrl).assertEqual('phone.html');
      expect(PAD_HOME_PAGE === PHONE_HOME_PAGE).assertFalse();
      expect(isValidAddress(PAD_HOME_PAGE)).assertTrue();
    });

    it('Browser_Url_Flow_016', 0, async () => {
      TestLogger.step(TAG, 'home navigation clears the address table after a load');
      flow.submit('example.com');
      expect(flow.getBrowser().getInputVal()).assertEqual('example.com');
      const homeUrl: string = flow.goHome(PAD_HOME_PAGE);
      expect(homeUrl).assertEqual(PAD_HOME_PAGE);
      expect(flow.getBrowser().getInputVal()).assertEqual('');
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.currentUrl).assertEqual(PAD_HOME_PAGE);
        expect(controller.loadCount).assertEqual(2);
        expect(controller.accessBackward()).assertTrue();
        expect(controller.backward()).assertTrue();
        expect(controller.currentUrl).assertEqual('https://example.com');
      }
    });

    it('Browser_Url_Flow_017', 0, async () => {
      TestLogger.step(TAG, 'a single redirect hop ends on the final address');
      const item: RedirectCase = REDIRECT_CASES[0];
      const chain: RedirectChain = new RedirectChain(item.hops[0].from, item.limit);
      const final: string = chain.follow(item.hops);
      expect(final).assertEqual(item.finalUrl);
      expect(chain.getFinalUrl()).assertEqual(item.finalUrl);
      expect(chain.hopCount()).assertEqual(1);
      expect(chain.wasTruncated()).assertFalse();
      expect(chain.containsLoop()).assertFalse();
      expect(chain.getVisited().length).assertEqual(2);
    });

    it('Browser_Url_Flow_018', 0, async () => {
      TestLogger.step(TAG, 'multi hop chains visit every intermediate address in order');
      const item: RedirectCase = REDIRECT_CASES[2];
      const chain: RedirectChain = new RedirectChain(item.hops[0].from, item.limit);
      const final: string = chain.follow(item.hops);
      expect(final).assertEqual(item.finalUrl);
      expect(chain.hopCount()).assertEqual(3);
      const visited: string[] = chain.getVisited();
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual('https://a.example.com');
      expect(visited[1]).assertEqual('https://b.example.com');
      expect(visited[2]).assertEqual('https://c.example.com');
      expect(visited[3]).assertEqual('https://c.example.com/landing');
      expect(chain.containsLoop()).assertFalse();
    });

    it('Browser_Url_Flow_019', 0, async () => {
      TestLogger.step(TAG, 'the hop limit truncates a chain instead of looping');
      const item: RedirectCase = REDIRECT_CASES[3];
      const chain: RedirectChain = new RedirectChain(item.hops[0].from, item.limit);
      const final: string = chain.follow(item.hops);
      expect(final).assertEqual(item.finalUrl);
      expect(chain.wasTruncated()).assertTrue();
      expect(chain.hopCount()).assertEqual(item.limit);
      expect(chain.hopCount()).assertEqual(2);
      expect(chain.getVisited().length).assertEqual(3);
      expect(chain.getVisited()[2]).assertEqual('https://h2.example.com');
      const short: RedirectChain = new RedirectChain('https://h0.example.com', 0);
      short.follow(item.hops);
      expect(short.wasTruncated()).assertTrue();
      expect(short.hopCount()).assertEqual(1);
      expect(short.getVisited().length).assertEqual(2);
    });

    it('Browser_Url_Flow_020', 0, async () => {
      TestLogger.step(TAG, 'a self referencing chain is detected as a loop');
      const chain: RedirectChain = new RedirectChain('https://loop.example.com', 8);
      const hops: RedirectHop[] = [
        { from: 'https://loop.example.com', to: 'https://loop.example.com', status: 302 },
        { from: 'https://loop.example.com', to: 'https://loop.example.com', status: 302 }
      ];
      chain.follow(hops);
      expect(chain.containsLoop()).assertTrue();
      expect(chain.hopCount()).assertEqual(2);
      expect(chain.getVisited().length).assertEqual(3);
      expect(chain.getFinalUrl()).assertEqual('https://loop.example.com');
      const broken: RedirectChain = new RedirectChain('https://start.example.com', 4);
      const unmatched: RedirectHop[] = [
        { from: 'https://other.example.com', to: 'https://end.example.com', status: 301 }
      ];
      expect(broken.follow(unmatched)).assertEqual('https://start.example.com');
      expect(broken.hopCount()).assertEqual(0);
    });

    it('Browser_Url_Flow_021', 0, async () => {
      TestLogger.step(TAG, 'history stack grows with each distinct address');
      const stack: HistoryStackModel = new HistoryStackModel(50);
      expect(stack.size()).assertEqual(0);
      expect(stack.canBack()).assertFalse();
      expect(stack.canForward()).assertFalse();
      expect(stack.push('https://a.example.com')).assertTrue();
      expect(stack.push('https://b.example.com')).assertTrue();
      expect(stack.push('https://c.example.com')).assertTrue();
      expect(stack.size()).assertEqual(3);
      expect(stack.cursorIndex()).assertEqual(2);
      expect(stack.current()).assertEqual('https://c.example.com');
      expect(stack.canBack()).assertTrue();
      expect(stack.canForward()).assertFalse();
      const view: string[] = stack.entriesView();
      expect(view[0]).assertEqual('https://a.example.com');
      expect(view[2]).assertEqual('https://c.example.com');
    });

    it('Browser_Url_Flow_022', 0, async () => {
      TestLogger.step(TAG, 'history back and forward move the cursor only');
      const stack: HistoryStackModel = new HistoryStackModel(50);
      stack.push('https://a.example.com');
      stack.push('https://b.example.com');
      stack.push('https://c.example.com');
      expect(stack.back()).assertEqual('https://b.example.com');
      expect(stack.cursorIndex()).assertEqual(1);
      expect(stack.size()).assertEqual(3);
      expect(stack.canForward()).assertTrue();
      expect(stack.back()).assertEqual('https://a.example.com');
      expect(stack.back()).assertEqual('');
      expect(stack.cursorIndex()).assertEqual(0);
      expect(stack.forward()).assertEqual('https://b.example.com');
      expect(stack.forward()).assertEqual('https://c.example.com');
      expect(stack.forward()).assertEqual('');
      expect(stack.current()).assertEqual('https://c.example.com');
    });

    it('Browser_Url_Flow_023', 0, async () => {
      TestLogger.step(TAG, 'a push after stepping back truncates the forward tail');
      const stack: HistoryStackModel = new HistoryStackModel(50);
      stack.push('https://a.example.com');
      stack.push('https://b.example.com');
      stack.push('https://c.example.com');
      stack.back();
      stack.back();
      expect(stack.cursorIndex()).assertEqual(0);
      expect(stack.push('https://d.example.com')).assertTrue();
      expect(stack.size()).assertEqual(2);
      const view: string[] = stack.entriesView();
      expect(view[0]).assertEqual('https://a.example.com');
      expect(view[1]).assertEqual('https://d.example.com');
      expect(stack.canForward()).assertFalse();
      expect(stack.current()).assertEqual('https://d.example.com');
    });

    it('Browser_Url_Flow_024', 0, async () => {
      TestLogger.step(TAG, 'duplicate consecutive pushes refresh the cursor only');
      const stack: HistoryStackModel = new HistoryStackModel(50);
      stack.push('https://a.example.com');
      const before: number = stack.size();
      expect(stack.push('https://a.example.com')).assertTrue();
      expect(stack.size()).assertEqual(before);
      expect(stack.cursorIndex()).assertEqual(0);
      expect(stack.push('')).assertFalse();
      expect(stack.size()).assertEqual(1);
      expect(stack.push('https://b.example.com')).assertTrue();
      expect(stack.size()).assertEqual(2);
      expect(pushHistory(['https://a.example.com'], 'https://a.example.com'))
        .assertDeepEquals(['https://a.example.com']);
      expect(pushHistory(['https://a.example.com'], 'https://b.example.com').length)
        .assertEqual(2);
    });

    it('Browser_Url_Flow_025', 0, async () => {
      TestLogger.step(TAG, 'history capacity trims the oldest entry');
      const stack: HistoryStackModel = new HistoryStackModel(3);
      stack.push('https://a.example.com');
      stack.push('https://b.example.com');
      stack.push('https://c.example.com');
      stack.push('https://d.example.com');
      expect(stack.size()).assertEqual(3);
      const view: string[] = stack.entriesView();
      expect(view[0]).assertEqual('https://b.example.com');
      expect(view[2]).assertEqual('https://d.example.com');
      expect(view.indexOf('https://a.example.com')).assertEqual(-1);
      expect(stack.cursorIndex()).assertEqual(2);
      const capped: string[] = pushHistory(['a', 'b', 'c'], 'd', 3);
      expect(capped.length).assertEqual(3);
      expect(capped[0]).assertEqual('b');
      expect(capped[2]).assertEqual('d');
    });

    it('Browser_Url_Flow_026', 0, async () => {
      TestLogger.step(TAG, 'the address table mirrors the rendered input component');
      const exists: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `inputUrl rendered=${exists}`);
      const submitExists: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
      TestLogger.info(TAG, `actionButton0 rendered=${submitExists}`);
      const currentText: string = await textById(driver, ID_INPUT_URL);
      expect(typeof currentText).assertEqual('string');
      expect(ID_INPUT_URL).assertEqual('inputUrl');
      expect(ID_ACTION_SUBMIT).assertEqual('actionButton0');
      const typed: number = sanitizeInput('  example.com ').length;
      expect(typed).assertEqual(11);
      expect(TIMEOUT_PAGE_LOAD > 0).assertTrue();
    });

    it('Browser_Url_Flow_028', 0, async () => {
      TestLogger.step(TAG, 'a full address session keeps history consistent');
      const submit: FlowOutcome = flow.submit('example.com');
      expect(submit.accepted).assertTrue();
      const search: FlowOutcome = flow.search('harmony os');
      expect(search.accepted).assertTrue();
      const popup: FlowOutcome = flow.openPopup('https://popup.example.com/item');
      expect(popup.accepted).assertTrue();
      const home: string = flow.goHome(PAD_HOME_PAGE);
      expect(home).assertEqual(PAD_HOME_PAGE);
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.history.length).assertEqual(4);
        expect(controller.historyIndex).assertEqual(3);
        expect(controller.loadCount).assertEqual(4);
        expect(controller.currentUrl).assertEqual(PAD_HOME_PAGE);
        expect(controller.backward()).assertTrue();
        expect(controller.currentUrl).assertEqual('https://popup.example.com/item');
        expect(controller.backward()).assertTrue();
        expect(controller.currentUrl.indexOf(SEARCH_ENGINE)).assertEqual(0);
        expect(controller.accessForward()).assertTrue();
      }
    });

    it('Browser_Url_Flow_029', 0, async () => {
      TestLogger.step(TAG, 'address length boundary rejects oversized input');
      const longHost: string = repeatChar('a', 2040) + '.com';
      expect(longHost.length).assertEqual(2044);
      expect(isValidAddress(longHost)).assertTrue();
      const tooLong: string = repeatChar('a', 2050) + '.com';
      expect(tooLong.length).assertEqual(2054);
      expect(isValidAddress(tooLong)).assertFalse();
      const boundary: string = 'a' + '.com';
      expect(isValidAddress(boundary)).assertTrue();
      expect(isValidAddress('.com')).assertFalse();
      expect(isValidAddress('com')).assertFalse();
      const outcome: FlowOutcome = flow.submit(tooLong);
      expect(outcome.accepted).assertFalse();
      expect(outcome.reason).assertEqual('invalid address');
    });

    it('Browser_Url_Flow_030', 0, async () => {
      TestLogger.step(TAG, 'search words with spaces never leak into the host check');
      expect(isValidAddress(buildSearchUrl('a b'))).assertTrue();
      expect(isValidAddress(encodeSearchWord('a b'))).assertFalse();
      const encoded: string = encodeSearchWord('a b');
      expect(encoded.indexOf(' ')).assertEqual(-1);
      expect(isValidAddress('https://www.bing.com/search?q=a%20b')).assertTrue();
      const searchUrl: string = buildSearchUrl('a b');
      expect(isValidAddress(searchUrl)).assertTrue();
      const outcome: FlowOutcome = flow.search('a b');
      expect(outcome.accepted).assertTrue();
      expect(outcome.loaded).assertEqual(SEARCH_ENGINE + 'a%20b');
    });

    it('Browser_Url_Flow_031', 0, async () => {
      TestLogger.step(TAG, 'popup navigation participates in the tab history');
      const first: FlowOutcome = flow.submit('example.com');
      expect(first.accepted).assertTrue();
      const popup: FlowOutcome = flow.openPopup('https://popup.example.com/detail');
      expect(popup.accepted).assertTrue();
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.history.length).assertEqual(2);
        expect(controller.accessBackward()).assertTrue();
        expect(controller.backward()).assertTrue();
        expect(controller.currentUrl).assertEqual('https://example.com');
        expect(controller.accessForward()).assertTrue();
        expect(controller.forward()).assertTrue();
        expect(controller.currentUrl).assertEqual('https://popup.example.com/detail');
        expect(controller.forward()).assertFalse();
      }
      expect(flow.getBrowser().tabArrayIndex).assertEqual(0);
    });

    it('Browser_Url_Flow_032', 0, async () => {
      TestLogger.step(TAG, 'table sizes and clock stamps describe the suite scope');
      expect(NORMALIZE_CASES.length).assertEqual(10);
      expect(INVALID_CASES.length).assertEqual(10);
      expect(SEARCH_CASES.length).assertEqual(10);
      expect(REDIRECT_CASES.length).assertEqual(4);
      expect(NORMALIZE_CASES.length + SEARCH_CASES.length).assertEqual(20);
      const start: number = clock.now();
      clock.advance(150);
      expect(clock.now() - start).assertEqual(150);
      clock.reset();
      expect(clock.now()).assertEqual(1700000000000);
      expect(flow.getBrowser().loadingStatus).assertEqual(MockLoadingStatus.END);
    });
    it('Browser_Url_Flow_033', 0, async () => {
      TestLogger.step(TAG, 'popup loads into the selected tab only');
      const browser: MockBrowser = new MockBrowser(2);
      expect(browser.tabs.length).assertEqual(2);
      expect(browser.selectTab(1)).assertTrue();
      expect(browser.onWindowNew('https://popup.example.com/two')).assertTrue();
      expect(browser.tabs[1].controller.currentUrl).assertEqual('https://popup.example.com/two');
      expect(browser.tabs[0].controller.currentUrl).assertEqual('');
      expect(browser.tabs[0].controller.loadCount).assertEqual(0);
      expect(browser.tabs[1].controller.loadCount).assertEqual(1);
      expect(browser.onWindowNew('about:blank')).assertFalse();
      expect(browser.onWindowNew('')).assertFalse();
      expect(browser.tabs[1].controller.loadCount).assertEqual(1);
    });

    it('Browser_Url_Flow_034', 0, async () => {
      TestLogger.step(TAG, 'every search case produces a unique encoded suffix');
      const seen: Set<string> = new Set<string>();
      for (let index = 0; index < SEARCH_CASES.length; index++) {
        const item: SearchCase = SEARCH_CASES[index];
        expect(seen.has(item.encoded)).assertFalse();
        seen.add(item.encoded);
        expect(item.word.length).assertLarger(0);
        expect(item.encoded.startsWith('http')).assertFalse();
      }
      expect(seen.size).assertEqual(SEARCH_CASES.length);
      expect(encodeSearchWord(SEARCH_CASES[0].word)).assertEqual('harmony');
      expect(encodeSearchWord(SEARCH_CASES[1].word)).assertEqual('open%20harmony');
      expect(encodeSearchWord(SEARCH_CASES[9].word)).assertEqual('100%25');
      expect(buildSearchUrl('harmony')).assertEqual('https://www.bing.com/search?q=harmony');
      expect(buildSearchUrl('harmony').length).assertEqual(buildSearchUrl('').length + 7);
    });

    it('Browser_Url_Flow_035', 0, async () => {
      TestLogger.step(TAG, 'redirect hops feed the history stack in visit order');
      const stack: HistoryStackModel = new HistoryStackModel(10);
      const chain: RedirectChain = new RedirectChain('https://a.example.com', 8);
      const visited: string[] = chain.getVisited();
      for (let index = 0; index < visited.length; index++) {
        stack.push(visited[index]);
      }
      chain.follow(REDIRECT_CASES[2].hops);
      const after: string[] = chain.getVisited();
      for (let index = visited.length; index < after.length; index++) {
        stack.push(after[index]);
      }
      expect(stack.size()).assertEqual(after.length);
      expect(stack.current()).assertEqual('https://c.example.com/landing');
      expect(stack.canBack()).assertTrue();
      expect(stack.back()).assertEqual('https://c.example.com');
      expect(stack.entriesView()[0]).assertEqual('https://a.example.com');
    });
    it('Browser_Url_Flow_036', 0, async () => {
      TestLogger.step(TAG, 'repeating the same address does not deepen the history');
      expect(flow.submit('example.com').accepted).assertTrue();
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.history.length).assertEqual(1);
        expect(flow.submit('example.com').accepted).assertTrue();
        expect(controller.history.length).assertEqual(1);
        expect(controller.loadCount).assertEqual(2);
        expect(controller.historyIndex).assertEqual(0);
        expect(flow.submit('https://example.com').accepted).assertTrue();
        expect(controller.history.length).assertEqual(1);
        expect(controller.currentUrl).assertEqual('https://example.com');
      }
      expect(flow.getBrowser().getInputVal()).assertEqual('https://example.com');
    });

    it('Browser_Url_Flow_037', 0, async () => {
      TestLogger.step(TAG, 'home page choice follows the active layout only');
      const pad: string = flow.goHome(PAD_HOME_PAGE);
      const padController: MockWebController | null = flow.controller();
      if (padController !== null) {
        expect(padController.currentUrl).assertEqual('pad.html');
      }
      expect(pad).assertEqual('pad.html');
      const expectedPhone: string = PHONE_HOME_PAGE;
      expect(expectedPhone).assertEqual('phone.html');
      expect(expectedPhone.endsWith('.html')).assertTrue();
      expect(PAD_HOME_PAGE.endsWith('.html')).assertTrue();
      const phone: string = flow.goHome(PHONE_HOME_PAGE);
      expect(phone).assertEqual('phone.html');
      const controller: MockWebController | null = flow.controller();
      if (controller !== null) {
        expect(controller.currentUrl).assertEqual('phone.html');
        expect(controller.history.length).assertEqual(2);
        expect(controller.history[0]).assertEqual('pad.html');
      }
      expect(URL_SCHEME).assertEqual('https://');
      expect(URL_SCHEME.length).assertEqual(8);
      expect(URL_SCHEME.indexOf('s')).assertEqual(4);
    });
    it('Browser_Url_Flow_038', 0, async () => {
      TestLogger.step(TAG, 'tab selection does not leak between url sessions');
      const browser: MockBrowser = new MockBrowser(2);
      expect(browser.selectTab(1)).assertTrue();
      expect(browser.loadUrl('example.com')).assertTrue();
      expect(browser.tabs[1].controller.currentUrl).assertEqual('https://example.com');
      expect(browser.tabs[1].controller.loadCount).assertEqual(1);
      expect(browser.tabs[0].controller.loadCount).assertEqual(0);
      expect(browser.tabs[0].controller.currentUrl).assertEqual('');
      expect(browser.selectTab(0)).assertTrue();
      expect(browser.loadUrl('https://second.example.com')).assertTrue();
      expect(browser.tabs[0].controller.currentUrl).assertEqual('https://second.example.com');
      expect(browser.tabs[1].controller.currentUrl).assertEqual('https://example.com');
      expect(browser.getTabKeys()).assertDeepEquals([0, 1]);
      expect(browser.tabArrayIndex).assertEqual(0);
      TestLogger.info(TAG, `tab0 loads=${browser.tabs[0].controller.loadCount} ` +
        `tab1 loads=${browser.tabs[1].controller.loadCount}`);
    });
  });
}
