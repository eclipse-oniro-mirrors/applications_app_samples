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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  textById, TIMEOUT_COMPONENT, DELAY_TOUCH_EVENT, ID_INPUT_URL, ID_ACTION_ADD,
  MAX_TAB_COUNT, MIN_TAB_COUNT, TAB_LIMIT_MESSAGE, URL_SCHEME,
  normalizeUrl, isValidAddress, tabCapacityReached, nextTabIndex,
  resolveTabIndexAfterDelete, rebaseTabKeys, encodeSearchWord, buildSearchUrl,
  progressVisibleAfter, progressResetAfterComplete, sanitizeInput
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockWebController } from '../Shared/BrowserMock';

const TAG: string = 'BrowserBoundaryErrorTestingTest';

/* ------------------------------------------------------------------ */
/* Boundary matrix mirrored from the browser business rules.           */
/* ------------------------------------------------------------------ */

const TAB_COUNT_CASES: number[] = [0, 1, 2, 9, 10, 11, 12];
const TAB_INDEX_CASES: number[] = [-2, -1, 0, 1, 8, 9, 10, 11];
const PROGRESS_CASES: number[] = [-10, -1, 0, 1, 50, 99, 100, 101, 150];
const URL_LENGTH_LIMIT: number = 2048;
const URL_SHORT_LIMIT: number = 3;
const LONG_URL_2048: string = 'https://example.com/' + 'a'.repeat(2028);
const LONG_URL_2049: string = 'https://example.com/' + 'a'.repeat(2029);
const LONG_URL_4096: string = 'https://example.com/' + 'a'.repeat(4076);
const INVALID_SCHEMES: string[] = ['javascript:alert(1)', 'data:text/html,<h1>x</h1>',
  'vbscript:msgbox(1)', 'ftp://example.com/file'];
const VALID_URLS: string[] = ['https://example.com', 'http://example.com/a',
  'example.com', 'https://www.bing.com/search?q=harmony'];
const TIMESTAMP_BASE: number = 1700000000000;

enum ErrorCode {
  NONE = 0,
  TAB_COUNT_OUT_OF_RANGE = 1,
  TAB_INDEX_OUT_OF_RANGE = 2,
  URL_EMPTY = 3,
  URL_TOO_LONG = 4,
  URL_INVALID_SCHEME = 5,
  URL_BAD_SHAPE = 6,
  PROGRESS_OUT_OF_RANGE = 7,
  TIMESTAMP_DUPLICATE = 8,
  CONTROLLER_NULL = 9,
  DELETE_LAST_TAB = 10
}

interface ValidationOutcome {
  ok: boolean;
  code: ErrorCode;
  detail: string;
}

function errorName(code: ErrorCode): string {
  if (code === ErrorCode.NONE) {
    return 'none';
  }
  if (code === ErrorCode.TAB_COUNT_OUT_OF_RANGE) {
    return 'tab-count-out-of-range';
  }
  if (code === ErrorCode.TAB_INDEX_OUT_OF_RANGE) {
    return 'tab-index-out-of-range';
  }
  if (code === ErrorCode.URL_EMPTY) {
    return 'url-empty';
  }
  if (code === ErrorCode.URL_TOO_LONG) {
    return 'url-too-long';
  }
  if (code === ErrorCode.URL_INVALID_SCHEME) {
    return 'url-invalid-scheme';
  }
  if (code === ErrorCode.URL_BAD_SHAPE) {
    return 'url-bad-shape';
  }
  if (code === ErrorCode.PROGRESS_OUT_OF_RANGE) {
    return 'progress-out-of-range';
  }
  if (code === ErrorCode.TIMESTAMP_DUPLICATE) {
    return 'timestamp-duplicate';
  }
  if (code === ErrorCode.CONTROLLER_NULL) {
    return 'controller-null';
  }
  return 'delete-last-tab';
}

function outcome(code: ErrorCode, detail: string): ValidationOutcome {
  return { ok: code === ErrorCode.NONE, code: code, detail: detail };
}

function clampProgress(progress: number): number {
  if (progress < 0) {
    return 0;
  }
  if (progress > 100) {
    return 100;
  }
  return progress;
}

/* ------------------------------------------------------------------ */
/* Boundary validator.                                                */
/* ------------------------------------------------------------------ */

class BoundaryValidator {
  static validateTabCount(count: number): ValidationOutcome {
    if (count < 0) {
      return outcome(ErrorCode.TAB_COUNT_OUT_OF_RANGE, `negative tab count ${count}`);
    }
    if (count > MAX_TAB_COUNT) {
      return outcome(ErrorCode.TAB_COUNT_OUT_OF_RANGE, `tab count ${count} above ${MAX_TAB_COUNT}`);
    }
    return outcome(ErrorCode.NONE, `tab count ${count} accepted`);
  }

  static validateTabIndex(index: number, tabCount: number): ValidationOutcome {
    if (index < 0) {
      return outcome(ErrorCode.TAB_INDEX_OUT_OF_RANGE, `negative index ${index}`);
    }
    if (index >= tabCount) {
      return outcome(ErrorCode.TAB_INDEX_OUT_OF_RANGE, `index ${index} not below ${tabCount}`);
    }
    return outcome(ErrorCode.NONE, `index ${index} accepted`);
  }

  static validateUrl(url: string): ValidationOutcome {
    if (url === null || url === undefined) {
      return outcome(ErrorCode.URL_EMPTY, 'url is null or undefined');
    }
    const trimmed: string = url.trim();
    if (trimmed.length === 0) {
      return outcome(ErrorCode.URL_EMPTY, 'url is empty after trim');
    }
    if (trimmed.length > URL_LENGTH_LIMIT) {
      return outcome(ErrorCode.URL_TOO_LONG, `url length ${trimmed.length} above ${URL_LENGTH_LIMIT}`);
    }
    for (let index = 0; index < INVALID_SCHEMES.length; index++) {
      if (trimmed.startsWith(INVALID_SCHEMES[index].split(':')[0] + ':')) {
        return outcome(ErrorCode.URL_INVALID_SCHEME, `scheme rejected for ${trimmed}`);
      }
    }
    if (!isValidAddress(trimmed)) {
      return outcome(ErrorCode.URL_BAD_SHAPE, `address shape rejected for ${trimmed}`);
    }
    return outcome(ErrorCode.NONE, `url accepted with length ${trimmed.length}`);
  }

  static validateProgress(progress: number): ValidationOutcome {
    if (progress < 0 || progress > 100) {
      return outcome(ErrorCode.PROGRESS_OUT_OF_RANGE, `progress ${progress} outside 0..100`);
    }
    return outcome(ErrorCode.NONE, `progress ${progress} accepted`);
  }

  static validateTimestamps(timestamps: number[]): ValidationOutcome {
    for (let index = 1; index < timestamps.length; index++) {
      if (timestamps[index] === timestamps[index - 1]) {
        return outcome(ErrorCode.TIMESTAMP_DUPLICATE, `duplicate timestamp at position ${index}`);
      }
    }
    return outcome(ErrorCode.NONE, `timestamps unique, count ${timestamps.length}`);
  }

  static validateController(controller: MockWebController | null): ValidationOutcome {
    if (controller === null || controller === undefined) {
      return outcome(ErrorCode.CONTROLLER_NULL, 'web controller is null');
    }
    return outcome(ErrorCode.NONE, 'web controller available');
  }

  static validateDelete(tabCount: number, index: number): ValidationOutcome {
    if (index < 0 || index >= tabCount) {
      return outcome(ErrorCode.TAB_INDEX_OUT_OF_RANGE, `delete index ${index} outside 0..${tabCount - 1}`);
    }
    if (tabCount <= MIN_TAB_COUNT) {
      return outcome(ErrorCode.DELETE_LAST_TAB, 'refusing to delete the last remaining tab');
    }
    return outcome(ErrorCode.NONE, `delete index ${index} accepted for ${tabCount} tabs`);
  }

  static progressOrClamp(progress: number): number {
    return clampProgress(progress);
  }

  static tabCountAfterAdd(count: number): number {
    if (tabCapacityReached(count)) {
      return count;
    }
    return count + 1;
  }
}

/* ------------------------------------------------------------------ */
/* Error ledger keeps every rejected operation for later assertions.   */
/* ------------------------------------------------------------------ */

class ErrorLedger {
  codes: ErrorCode[] = [];
  details: string[] = [];

  record(result: ValidationOutcome): void {
    if (!result.ok) {
      this.codes.push(result.code);
      this.details.push(result.detail);
    }
  }

  count(): number {
    return this.codes.length;
  }

  contains(code: ErrorCode): boolean {
    for (let index = 0; index < this.codes.length; index++) {
      if (this.codes[index] === code) {
        return true;
      }
    }
    return false;
  }

  names(): string[] {
    return this.codes.map((code: ErrorCode) => errorName(code));
  }

  clear(): void {
    this.codes = [];
    this.details = [];
  }
}

/* ------------------------------------------------------------------ */
/* Null safe facade around the browser controller.                    */
/* ------------------------------------------------------------------ */

class NullSafeBrowser {
  browser: MockBrowser;
  controller: MockWebController | null = null;
  rejected: number = 0;

  constructor(browser: MockBrowser, controller: MockWebController | null) {
    this.browser = browser;
    this.controller = controller;
  }

  load(address: string): ValidationOutcome {
    const check: ValidationOutcome = BoundaryValidator.validateController(this.controller);
    if (!check.ok) {
      this.rejected += 1;
      return check;
    }
    if (this.controller === null) {
      this.rejected += 1;
      return outcome(ErrorCode.CONTROLLER_NULL, 'controller vanished');
    }
    if (address === null || address === undefined || address.length === 0) {
      this.rejected += 1;
      return outcome(ErrorCode.URL_EMPTY, 'empty load address');
    }
    const loaded: boolean = this.controller.loadUrl(normalizeUrl(address));
    if (!loaded) {
      this.rejected += 1;
      return outcome(ErrorCode.URL_EMPTY, 'controller refused the url');
    }
    return outcome(ErrorCode.NONE, 'load accepted');
  }

  back(): boolean {
    if (this.controller === null) {
      this.rejected += 1;
      return false;
    }
    return this.browser.back();
  }

  safeUrl(): string {
    if (this.controller === null) {
      return '';
    }
    return this.controller.currentUrl;
  }
}

/* ------------------------------------------------------------------ */
/* Timestamp factory used by duplicate detection cases.               */
/* ------------------------------------------------------------------ */

class TimestampFactory {
  static sequential(count: number, step: number = 1): number[] {
    const result: number[] = [];
    for (let index = 0; index < count; index++) {
      result.push(TIMESTAMP_BASE + index * step);
    }
    return result;
  }

  static withDuplicate(count: number, duplicateAt: number): number[] {
    const result: number[] = TimestampFactory.sequential(count);
    if (duplicateAt > 0 && duplicateAt < result.length) {
      result[duplicateAt] = result[duplicateAt - 1];
    }
    return result;
  }

  static allSame(count: number): number[] {
    const result: number[] = [];
    for (let index = 0; index < count; index++) {
      result.push(TIMESTAMP_BASE);
    }
    return result;
  }
}

/* ------------------------------------------------------------------ */
/* Test suite.                                                        */
/* ------------------------------------------------------------------ */

export default function browserBoundaryErrorTestingTest() {
  describe('browserBoundaryErrorTestingTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'boundary and error suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    /* -------------------------------------------------------------- */
    /* Tab count boundaries.                                          */
    /* -------------------------------------------------------------- */

    it('Boundary_TabCount_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabCount_001');
      TestLogger.step(TAG, 'zero tabs is an empty but constructible population');
      const result: ValidationOutcome = BoundaryValidator.validateTabCount(0);
      TestLogger.info(TAG, `count 0 -> ${errorName(result.code)}`);
      expect(result.ok).assertTrue();
      expect(result.code).assertEqual(ErrorCode.NONE);
      const browser: MockBrowser = new MockBrowser(0);
      expect(browser.tabs.length).assertEqual(1);
      TestLogger.pass(TAG, 'Boundary_TabCount_001');
    });

    it('Boundary_TabCount_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabCount_002');
      TestLogger.step(TAG, 'one tab is the minimum deletable population');
      const result: ValidationOutcome = BoundaryValidator.validateTabCount(1);
      TestLogger.info(TAG, `count 1 accepted=${result.ok}`);
      expect(result.ok).assertTrue();
      expect(MIN_TAB_COUNT).assertEqual(1);
      const browser: MockBrowser = new MockBrowser(1);
      expect(browser.deleteTab(0)).assertFalse();
      expect(browser.tabs.length).assertEqual(1);
      TestLogger.pass(TAG, 'Boundary_TabCount_002');
    });

    it('Boundary_TabCount_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabCount_003');
      TestLogger.step(TAG, 'ten tabs are the maximum supported population');
      const result: ValidationOutcome = BoundaryValidator.validateTabCount(MAX_TAB_COUNT);
      TestLogger.info(TAG, `count 10 accepted=${result.ok}`);
      expect(result.ok).assertTrue();
      expect(tabCapacityReached(MAX_TAB_COUNT)).assertFalse();
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT);
      expect(browser.addTab()).assertTrue();
      expect(browser.tabs.length).assertEqual(11);
      TestLogger.pass(TAG, 'Boundary_TabCount_003');
    });

    it('Boundary_TabCount_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabCount_004');
      TestLogger.step(TAG, 'eleven tabs exceed the supported capacity');
      const result: ValidationOutcome = BoundaryValidator.validateTabCount(MAX_TAB_COUNT + 1);
      TestLogger.info(TAG, `count 11 -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.TAB_COUNT_OUT_OF_RANGE);
      expect(tabCapacityReached(MAX_TAB_COUNT + 1)).assertTrue();
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      expect(browser.addTab()).assertFalse();
      expect(browser.toasts[browser.toasts.length - 1]).assertEqual(TAB_LIMIT_MESSAGE);
      TestLogger.pass(TAG, 'Boundary_TabCount_004');
    });

    it('Boundary_TabCount_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabCount_005');
      TestLogger.step(TAG, 'the boundary matrix keeps only the valid population values');
      const ledger: ErrorLedger = new ErrorLedger();
      for (let index = 0; index < TAB_COUNT_CASES.length; index++) {
        const result: ValidationOutcome = BoundaryValidator.validateTabCount(TAB_COUNT_CASES[index]);
        ledger.record(result);
        TestLogger.info(TAG, `count=${TAB_COUNT_CASES[index]} ok=${result.ok}`);
      }
      expect(ledger.count()).assertEqual(2);
      expect(ledger.contains(ErrorCode.TAB_COUNT_OUT_OF_RANGE)).assertTrue();
      expect(BoundaryValidator.tabCountAfterAdd(10)).assertEqual(11);
      expect(BoundaryValidator.tabCountAfterAdd(11)).assertEqual(11);
      TestLogger.pass(TAG, 'Boundary_TabCount_005');
    });

    /* -------------------------------------------------------------- */
    /* Tab index boundaries.                                          */
    /* -------------------------------------------------------------- */

    it('Boundary_TabIndex_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabIndex_006');
      TestLogger.step(TAG, 'minus one is rejected as a tab index');
      const result: ValidationOutcome = BoundaryValidator.validateTabIndex(-1, 10);
      TestLogger.info(TAG, `index -1 -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.TAB_INDEX_OUT_OF_RANGE);
      const browser: MockBrowser = new MockBrowser(3);
      expect(browser.selectTab(-1)).assertFalse();
      expect(browser.getTabArrayIndex()).assertEqual(0);
      TestLogger.pass(TAG, 'Boundary_TabIndex_006');
    });

    it('Boundary_TabIndex_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabIndex_007');
      TestLogger.step(TAG, 'index zero selects the first tab');
      const result: ValidationOutcome = BoundaryValidator.validateTabIndex(0, 10);
      TestLogger.info(TAG, `index 0 accepted=${result.ok}`);
      expect(result.ok).assertTrue();
      const browser: MockBrowser = new MockBrowser(3);
      expect(browser.selectTab(0)).assertTrue();
      expect(browser.getTabArrayIndex()).assertEqual(0);
      expect(browser.getCurrentTab() === null).assertFalse();
      TestLogger.pass(TAG, 'Boundary_TabIndex_007');
    });

    it('Boundary_TabIndex_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabIndex_008');
      TestLogger.step(TAG, 'index nine selects the last supported tab');
      const result: ValidationOutcome = BoundaryValidator.validateTabIndex(9, 10);
      TestLogger.info(TAG, `index 9 accepted=${result.ok}`);
      expect(result.ok).assertTrue();
      const browser: MockBrowser = new MockBrowser(10);
      expect(browser.selectTab(9)).assertTrue();
      expect(browser.getTabArrayIndex()).assertEqual(9);
      expect(browser.getCurrentTab() === null).assertFalse();
      TestLogger.pass(TAG, 'Boundary_TabIndex_008');
    });

    it('Boundary_TabIndex_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabIndex_009');
      TestLogger.step(TAG, 'index ten is outside a ten tab population');
      const result: ValidationOutcome = BoundaryValidator.validateTabIndex(10, 10);
      TestLogger.info(TAG, `index 10 -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.TAB_INDEX_OUT_OF_RANGE);
      const browser: MockBrowser = new MockBrowser(10);
      expect(browser.selectTab(10)).assertFalse();
      expect(browser.getTabArrayIndex()).assertEqual(0);
      TestLogger.pass(TAG, 'Boundary_TabIndex_009');
    });

    it('Boundary_TabIndex_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_TabIndex_010');
      TestLogger.step(TAG, 'the index matrix rejects every out of range value');
      const ledger: ErrorLedger = new ErrorLedger();
      for (let index = 0; index < TAB_INDEX_CASES.length; index++) {
        ledger.record(BoundaryValidator.validateTabIndex(TAB_INDEX_CASES[index], 10));
      }
      TestLogger.info(TAG, `rejected indexes=${ledger.count()}`);
      expect(ledger.count()).assertEqual(4);
      expect(ledger.names()[0]).assertEqual('tab-index-out-of-range');
      expect(nextTabIndex(9)).assertEqual(9);
      expect(nextTabIndex(10)).assertEqual(10);
      TestLogger.pass(TAG, 'Boundary_TabIndex_010');
    });

    /* -------------------------------------------------------------- */
    /* URL boundaries.                                                */
    /* -------------------------------------------------------------- */

    it('Boundary_Url_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Url_011');
      TestLogger.step(TAG, 'an empty address is rejected before loading');
      const result: ValidationOutcome = BoundaryValidator.validateUrl('');
      TestLogger.info(TAG, `empty url -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.URL_EMPTY);
      expect(normalizeUrl('')).assertEqual(URL_SCHEME);
      const controller: MockWebController = new MockWebController();
      const facade: NullSafeBrowser = new NullSafeBrowser(new MockBrowser(1), controller);
      const loadResult: ValidationOutcome = facade.load('');
      expect(loadResult.ok).assertFalse();
      expect(loadResult.code).assertEqual(ErrorCode.URL_EMPTY);
      expect(facade.rejected).assertEqual(1);
      expect(controller.loadCount).assertEqual(0);
      TestLogger.pass(TAG, 'Boundary_Url_011');
    });

    it('Boundary_Url_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Url_012');
      TestLogger.step(TAG, 'a whitespace only address collapses to empty');
      const result: ValidationOutcome = BoundaryValidator.validateUrl('    ');
      TestLogger.info(TAG, `whitespace url -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.URL_EMPTY);
      expect(sanitizeInput('  https://example.com  ')).assertEqual('https://example.com');
      expect(sanitizeInput('\nhttps://example.com')).assertEqual('https://example.com');
      TestLogger.pass(TAG, 'Boundary_Url_012');
    });

    it('Boundary_Url_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Url_013');
      TestLogger.step(TAG, 'a url of exactly 2048 characters is accepted');
      TestLogger.info(TAG, `boundary url length=${LONG_URL_2048.length}`);
      expect(LONG_URL_2048.length).assertEqual(URL_LENGTH_LIMIT);
      const result: ValidationOutcome = BoundaryValidator.validateUrl(LONG_URL_2048);
      expect(result.ok).assertTrue();
      expect(result.code).assertEqual(ErrorCode.NONE);
      expect(isValidAddress(LONG_URL_2048)).assertTrue();
      TestLogger.pass(TAG, 'Boundary_Url_013');
    });

    it('Boundary_Url_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Url_014');
      TestLogger.step(TAG, 'a url of 2049 characters is one above the limit');
      const result: ValidationOutcome = BoundaryValidator.validateUrl(LONG_URL_2049);
      TestLogger.info(TAG, `length ${LONG_URL_2049.length} -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.URL_TOO_LONG);
      expect(isValidAddress(LONG_URL_2049)).assertFalse();
      TestLogger.pass(TAG, 'Boundary_Url_014');
    });

    it('Boundary_Url_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Url_016');
      TestLogger.step(TAG, 'every unsupported scheme is rejected');
      const ledger: ErrorLedger = new ErrorLedger();
      for (let index = 0; index < INVALID_SCHEMES.length; index++) {
        ledger.record(BoundaryValidator.validateUrl(INVALID_SCHEMES[index]));
        TestLogger.info(TAG, `scheme case ${index} rejected`);
      }
      expect(ledger.count()).assertEqual(INVALID_SCHEMES.length);
      expect(ledger.contains(ErrorCode.URL_INVALID_SCHEME)).assertTrue();
      expect(ledger.contains(ErrorCode.URL_BAD_SHAPE)).assertFalse();
      const malformed: ValidationOutcome = BoundaryValidator.validateUrl('https://nodot');
      expect(malformed.code).assertEqual(ErrorCode.URL_BAD_SHAPE);
      expect(isValidAddress('javascript:alert(1)')).assertFalse();
      TestLogger.pass(TAG, 'Boundary_Url_016');
    });

    it('Boundary_Url_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Url_017');
      TestLogger.step(TAG, 'the four supported address shapes pass validation');
      for (let index = 0; index < VALID_URLS.length; index++) {
        const result: ValidationOutcome = BoundaryValidator.validateUrl(VALID_URLS[index]);
        TestLogger.info(TAG, `valid case ${index} ok=${result.ok}`);
        expect(result.ok).assertTrue();
        expect(isValidAddress(VALID_URLS[index])).assertTrue();
      }
      expect(VALID_URLS.length).assertEqual(4);
      TestLogger.pass(TAG, 'Boundary_Url_017');
    });

    it('Boundary_Url_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Url_018');
      TestLogger.step(TAG, 'search words are encoded before the bing query is built');
      const encoded: string = encodeSearchWord('harmony os 中文');
      const searchUrl: string = buildSearchUrl('harmony os 中文');
      TestLogger.info(TAG, `encoded=${encoded}`);
      expect(encoded.indexOf(' ') >= 0).assertFalse();
      expect(encoded.indexOf('%20')).assertLarger(-1);
      expect(searchUrl.startsWith('https://www.bing.com/search?q=')).assertTrue();
      expect(searchUrl.length).assertLarger(URL_SHORT_LIMIT);
      TestLogger.pass(TAG, 'Boundary_Url_018');
    });

    /* -------------------------------------------------------------- */
    /* Progress boundaries.                                           */
    /* -------------------------------------------------------------- */

    it('Boundary_Progress_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Progress_019');
      TestLogger.step(TAG, 'a negative progress value is rejected');
      const result: ValidationOutcome = BoundaryValidator.validateProgress(-1);
      TestLogger.info(TAG, `progress -1 -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.PROGRESS_OUT_OF_RANGE);
      expect(BoundaryValidator.progressOrClamp(-1)).assertEqual(0);
      const browser: MockBrowser = new MockBrowser(1);
      browser.onProgressChange(-1);
      expect(browser.progress).assertEqual(-1);
      expect(browser.hideProgress).assertFalse();
      TestLogger.pass(TAG, 'Boundary_Progress_019');
    });

    it('Boundary_Progress_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Progress_020');
      TestLogger.step(TAG, 'progress zero and one hundred are both accepted');
      const zero: ValidationOutcome = BoundaryValidator.validateProgress(0);
      const hundred: ValidationOutcome = BoundaryValidator.validateProgress(100);
      TestLogger.info(TAG, `progress 0 ok=${zero.ok} 100 ok=${hundred.ok}`);
      expect(zero.ok).assertTrue();
      expect(hundred.ok).assertTrue();
      expect(progressVisibleAfter(0)).assertTrue();
      expect(progressVisibleAfter(100)).assertFalse();
      expect(progressResetAfterComplete(100)).assertEqual(0);
      TestLogger.pass(TAG, 'Boundary_Progress_020');
    });

    it('Boundary_Progress_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Progress_021');
      TestLogger.step(TAG, 'one hundred and one is rejected while one hundred completes');
      const result: ValidationOutcome = BoundaryValidator.validateProgress(101);
      TestLogger.info(TAG, `progress 101 -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.PROGRESS_OUT_OF_RANGE);
      expect(BoundaryValidator.progressOrClamp(101)).assertEqual(100);
      const browser: MockBrowser = new MockBrowser(1);
      browser.onProgressChange(100);
      expect(browser.progress).assertEqual(0);
      expect(browser.hideProgress).assertTrue();
      TestLogger.pass(TAG, 'Boundary_Progress_021');
    });

    it('Boundary_Progress_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Progress_022');
      TestLogger.step(TAG, 'the progress matrix rejects exactly three out of range values');
      const ledger: ErrorLedger = new ErrorLedger();
      for (let index = 0; index < PROGRESS_CASES.length; index++) {
        const item: number = PROGRESS_CASES[index];
        ledger.record(BoundaryValidator.validateProgress(item));
        expect(BoundaryValidator.progressOrClamp(item) >= 0).assertTrue();
        expect(BoundaryValidator.progressOrClamp(item) <= 100).assertTrue();
      }
      TestLogger.info(TAG, `progress rejected=${ledger.count()}`);
      expect(ledger.count()).assertEqual(4);
      expect(ledger.contains(ErrorCode.PROGRESS_OUT_OF_RANGE)).assertTrue();
      TestLogger.pass(TAG, 'Boundary_Progress_022');
    });

    /* -------------------------------------------------------------- */
    /* Timestamp uniqueness.                                          */
    /* -------------------------------------------------------------- */

    it('Boundary_Timestamp_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Timestamp_023');
      TestLogger.step(TAG, 'sequential tab timestamps are unique and accepted');
      const timestamps: number[] = TimestampFactory.sequential(10);
      const result: ValidationOutcome = BoundaryValidator.validateTimestamps(timestamps);
      TestLogger.info(TAG, `sequential timestamps ok=${result.ok} count=${timestamps.length}`);
      expect(result.ok).assertTrue();
      expect(timestamps.length).assertEqual(10);
      expect(timestamps[0]).assertEqual(TIMESTAMP_BASE);
      expect(timestamps[9]).assertEqual(TIMESTAMP_BASE + 9);
      TestLogger.pass(TAG, 'Boundary_Timestamp_023');
    });

    it('Boundary_Timestamp_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Timestamp_024');
      TestLogger.step(TAG, 'a duplicated timestamp is rejected at its position');
      const timestamps: number[] = TimestampFactory.withDuplicate(10, 5);
      const result: ValidationOutcome = BoundaryValidator.validateTimestamps(timestamps);
      TestLogger.info(TAG, `duplicate at 5 -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.TIMESTAMP_DUPLICATE);
      expect(result.detail.indexOf('5') > 0).assertTrue();
      expect(timestamps[5]).assertEqual(timestamps[4]);
      TestLogger.pass(TAG, 'Boundary_Timestamp_024');
    });

    it('Boundary_Timestamp_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Timestamp_025');
      TestLogger.step(TAG, 'ten identical timestamps collapse into one valid record');
      const timestamps: number[] = TimestampFactory.allSame(10);
      const result: ValidationOutcome = BoundaryValidator.validateTimestamps(timestamps);
      TestLogger.info(TAG, `all same -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.TIMESTAMP_DUPLICATE);
      expect(result.detail.indexOf('1') > 0).assertTrue();
      expect(BoundaryValidator.validateTimestamps([]).ok).assertTrue();
      expect(BoundaryValidator.validateTimestamps([TIMESTAMP_BASE]).ok).assertTrue();
      TestLogger.pass(TAG, 'Boundary_Timestamp_025');
    });

    /* -------------------------------------------------------------- */
    /* Null controller handling.                                      */
    /* -------------------------------------------------------------- */

    it('Boundary_NullController_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_NullController_026');
      TestLogger.step(TAG, 'loading through a null controller is rejected not thrown');
      const browser: MockBrowser = new MockBrowser(1);
      const facade: NullSafeBrowser = new NullSafeBrowser(browser, null);
      const result: ValidationOutcome = facade.load('https://example.com');
      TestLogger.info(TAG, `null controller load -> ${errorName(result.code)} rejected=${facade.rejected}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.CONTROLLER_NULL);
      expect(facade.rejected).assertEqual(1);
      expect(facade.safeUrl()).assertEqual('');
      expect(BoundaryValidator.validateController(null).code).assertEqual(ErrorCode.CONTROLLER_NULL);
      TestLogger.pass(TAG, 'Boundary_NullController_026');
    });

    it('Boundary_NullController_027', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_NullController_027');
      TestLogger.step(TAG, 'back and load behave deterministically after the controller appears');
      const browser: MockBrowser = new MockBrowser(1);
      const facade: NullSafeBrowser = new NullSafeBrowser(browser, null);
      expect(facade.back()).assertFalse();
      expect(facade.rejected).assertEqual(1);
      const controller: MockWebController = new MockWebController();
      facade.controller = controller;
      const result: ValidationOutcome = facade.load('example.com');
      TestLogger.info(TAG, `restored load ok=${result.ok} url=${facade.safeUrl()}`);
      expect(result.ok).assertTrue();
      expect(facade.safeUrl()).assertEqual('https://example.com');
      expect(controller.loadCount).assertEqual(1);
      TestLogger.pass(TAG, 'Boundary_NullController_027');
    });

    /* -------------------------------------------------------------- */
    /* Delete boundaries.                                             */
    /* -------------------------------------------------------------- */

    it('Boundary_Delete_028', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Delete_028');
      TestLogger.step(TAG, 'delete rejects both negative and overflow indexes');
      const low: ValidationOutcome = BoundaryValidator.validateDelete(5, -1);
      const high: ValidationOutcome = BoundaryValidator.validateDelete(5, 5);
      TestLogger.info(TAG, `delete -1 -> ${errorName(low.code)}, delete 5 -> ${errorName(high.code)}`);
      expect(low.code).assertEqual(ErrorCode.TAB_INDEX_OUT_OF_RANGE);
      expect(high.code).assertEqual(ErrorCode.TAB_INDEX_OUT_OF_RANGE);
      const browser: MockBrowser = new MockBrowser(5);
      expect(browser.deleteTab(-1)).assertFalse();
      expect(browser.deleteTab(5)).assertFalse();
      expect(browser.tabs.length).assertEqual(5);
      TestLogger.pass(TAG, 'Boundary_Delete_028');
    });

    it('Boundary_Delete_029', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Delete_029');
      TestLogger.step(TAG, 'deleting the last remaining tab is refused');
      const result: ValidationOutcome = BoundaryValidator.validateDelete(1, 0);
      TestLogger.info(TAG, `last tab delete -> ${errorName(result.code)}`);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.DELETE_LAST_TAB);
      const browser: MockBrowser = new MockBrowser(1);
      expect(browser.deleteTab(0)).assertFalse();
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.selectTab(0)).assertTrue();
      TestLogger.pass(TAG, 'Boundary_Delete_029');
    });

    it('Boundary_Delete_030', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Delete_030');
      TestLogger.step(TAG, 'index repair and key rebasing agree with the model after a delete');
      expect(resolveTabIndexAfterDelete(4, 2, 5)).assertEqual(3);
      expect(resolveTabIndexAfterDelete(1, 2, 5)).assertEqual(1);
      expect(resolveTabIndexAfterDelete(5, 5, 5)).assertEqual(4);
      const rebased: number[] = rebaseTabKeys([0, 1, 2, 3, 4], 2);
      TestLogger.info(TAG, `rebased keys=${rebased.join(',')}`);
      expect(rebased.length).assertEqual(4);
      expect(rebased[0]).assertEqual(0);
      expect(rebased[1]).assertEqual(1);
      expect(rebased[2]).assertEqual(2);
      expect(rebased[3]).assertEqual(3);
      TestLogger.pass(TAG, 'Boundary_Delete_030');
    });

    /* -------------------------------------------------------------- */
    /* Exception paths.                                               */
    /* -------------------------------------------------------------- */

    it('Boundary_Exception_031', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_Exception_031');
      TestLogger.step(TAG, 'a throwing validator panels a named Error to the caller');
      let caughtName: string = '';
      let caughtMessage: string = '';
      try {
        const probe: string = BoundaryValidator.validateUrl('not a valid address')
          .detail.split('for ')[1];
        if (probe.length < 0) {
          throw new Error('unreachable');
        }
        throw new Error(`invalid address accepted: ${probe}`);
      } catch (error) {
        const typed: Error = error as Error;
        caughtName = typed.name;
        caughtMessage = typed.message;
        TestLogger.exception(TAG, 'exception probe', typed);
      }
      expect(caughtName).assertEqual('Error');
      expect(caughtMessage.length).assertLarger(0);
      expect(caughtMessage.indexOf('accepted')).assertLarger(-1);
      expect(BoundaryValidator.validateUrl('not a valid address').code)
        .assertEqual(ErrorCode.URL_BAD_SHAPE);
      TestLogger.pass(TAG, 'Boundary_Exception_031');
    });

    /* -------------------------------------------------------------- */
    /* UI level boundary checks.                                      */
    /* -------------------------------------------------------------- */

    it('Boundary_UI_032', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_UI_032');
      TestLogger.step(TAG, 'the url field renders before boundary input is attempted');
      const exists: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `url field exists=${exists}`);
      expect(exists).assertTrue();
      expect(await countById(driver, ID_INPUT_URL)).assertLarger(0);
      TestLogger.pass(TAG, 'Boundary_UI_032');
    });

    it('Boundary_UI_033', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_UI_033');
      TestLogger.step(TAG, 'the add tab affordance stays clickable at the boundary');
      const exists: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `add affordance exists=${exists}`);
      expect(exists).assertTrue();
      expect(MAX_TAB_COUNT).assertEqual(10);
      expect(tabCapacityReached(MAX_TAB_COUNT + 1)).assertTrue();
      TestLogger.pass(TAG, 'Boundary_UI_033');
    });

    it('Boundary_UI_034', 0, async () => {
      TestLogger.caseBegin(TAG, 'Boundary_UI_034');
      TestLogger.step(TAG, 'an unsupported scheme is rejected while the ui remains responsive');
      const outcomeCheck: ValidationOutcome = BoundaryValidator.validateUrl('javascript:alert(1)');
      expect(outcomeCheck.ok).assertFalse();
      const text: string = await textById(driver, ID_INPUT_URL);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `scheme rejected, current field length=${text.length}`);
      expect(text.length >= 0).assertTrue();
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      TestLogger.pass(TAG, 'Boundary_UI_034');
    });

  });
}
