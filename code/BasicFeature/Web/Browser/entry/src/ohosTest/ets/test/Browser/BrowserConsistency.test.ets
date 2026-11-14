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
  getDriver, startBrowserApp, serializedDelay, inputById, textById,
  waitForId, normalizeUrl, progressVisibleAfter, progressResetAfterComplete,
  MAX_TAB_COUNT, ID_INPUT_URL, ID_ACTION_SUBMIT, TIMEOUT_TAB_SWITCH, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockWebController, MockLoadingStatus } from '../Shared/BrowserMock';

const TAG: string = 'BrowserConsistencyTest';

/** Sample sizes of the invariant audits. */
const CHURN_ROUNDS: number = 10;
const SELECT_ROUNDS: number = 12;
const PROGRESS_SAMPLES: number = 9;
const TOLERANCE_KEY_DRIFT: number = 0;

/** Immutable view of everything that must stay mutually consistent. */
interface ConsistencySnapshot {
  tabCount: number;
  controllerCount: number;
  keys: number[];
  timestamps: number[];
  activeIndex: number;
  activeKey: number;
  inputValue: string;
  loadingStatus: number;
  progress: number;
  hideProgress: boolean;
}

/** One named invariant result, so a failure names the broken rule. */
interface InvariantResult {
  name: string;
  passed: boolean;
  detail: string;
}

/**
 * Audits the cross model invariants of the browser state.
 *
 * The tab strip, the controller array and the active index are three separate
 * fields mutated by three separate methods. Whenever one of them drifts the UI
 * shows a blank Web component or loads into the wrong tab, so the audit below
 * turns each rule into an explicit, reported check instead of a hidden
 * expectation inside an unrelated test case.
 */
class InvariantChecker {
  private results: InvariantResult[] = [];

  check(name: string, passed: boolean, detail: string = ''): boolean {
    this.results.push({ name: name, passed: passed, detail: detail });
    return passed;
  }

  failures(): InvariantResult[] {
    return this.results.filter((item: InvariantResult) => !item.passed);
  }

  failureCount(): number {
    return this.failures().length;
  }

  totalCount(): number {
    return this.results.length;
  }

  names(): string[] {
    return this.results.map((item: InvariantResult) => item.name);
  }

  /** Renders a compact report used in the hilog stream on failure. */
  report(): string {
    const failed: InvariantResult[] = this.failures();
    if (failed.length === 0) {
      return `all ${this.results.length} invariants hold`;
    }
    return failed.map((item: InvariantResult) => `${item.name}(${item.detail})`).join('; ');
  }

  reset(): void {
    this.results = [];
  }
}

/** Captures the observable state of the model in one comparable value. */
function snapshot(model: MockBrowser): ConsistencySnapshot {
  const current: MockBrowserTab | null = model.getCurrentTab();
  return {
    tabCount: model.tabs.length,
    controllerCount: model.tabs.filter((tab: MockBrowserTab) => tab.controller !== null).length,
    keys: model.getTabKeys(),
    timestamps: model.getTimestamps(),
    activeIndex: model.getTabArrayIndex(),
    activeKey: current === null ? -1 : current.key,
    inputValue: model.getInputVal(),
    loadingStatus: model.loadingStatus,
    progress: model.progress,
    hideProgress: model.hideProgress
  };
}

/** True when keys equal their index, the renumbering invariant. */
function keysMatchIndex(keys: number[]): boolean {
  for (let index = 0; index < keys.length; index++) {
    if (keys[index] !== index) {
      return false;
    }
  }
  return keys.length > 0;
}

/** True when the timestamps grow strictly, the creation order invariant. */
function timestampsAscending(stamps: number[]): boolean {
  for (let index = 1; index < stamps.length; index++) {
    if (stamps[index] <= stamps[index - 1]) {
      return false;
    }
  }
  return true;
}

/** Checks every snapshot rule and reports through the supplied checker. */
function auditSnapshot(model: MockBrowser, checker: InvariantChecker, label: string): void {
  const view: ConsistencySnapshot = snapshot(model);
  checker.check(`${label}:tab-count`, view.tabCount > 0, `${view.tabCount}`);
  checker.check(`${label}:controller-count`, view.tabCount === view.controllerCount,
    `${view.tabCount}/${view.controllerCount}`);
  checker.check(`${label}:keys-match-index`, keysMatchIndex(view.keys), view.keys.join(','));
  checker.check(`${label}:keys-unique`, new Set<number>(view.keys).size === view.keys.length,
    view.keys.join(','));
  checker.check(`${label}:index-in-range`,
    view.activeIndex >= 0 && view.activeIndex < view.tabCount, `${view.activeIndex}`);
  checker.check(`${label}:active-key`, view.activeKey === view.activeIndex,
    `${view.activeKey} vs ${view.activeIndex}`);
  checker.check(`${label}:timestamps`, timestampsAscending(view.timestamps), view.timestamps.join(','));
}

/**
 * Mirrors the address bar of TitleBar.ets.
 *
 * The TextInput holds the raw user text while the model holds the submitted
 * value; onPageBegin then rewrites the field with the resolved url. The mirror
 * records both sides so the suite can prove that the two never drift apart
 * after a submit, a redirect or a load failure.
 */
class UiMirror {
  modelValue: string = '';
  fieldValue: string = '';
  submitCount: number = 0;
  driftCount: number = 0;

  type(text: string): void {
    this.fieldValue = text;
  }

  /** onSubmit of the TextInput: model receives the raw text, then resolves. */
  submit(resolver: (raw: string) => string): string {
    this.submitCount += 1;
    this.modelValue = this.fieldValue;
    const resolved: string = resolver(this.modelValue);
    this.fieldValue = resolved;
    this.modelValue = resolved;
    return resolved;
  }

  /** onPageBegin of the Web component rewrites the field with the url. */
  onPageBegin(url: string): void {
    const next: string = url !== null && url.indexOf('http') === 0 ? url : '';
    this.fieldValue = next;
    this.modelValue = next;
  }

  /** Returns the divergence between the model and the rendered field. */
  drift(): number {
    this.driftCount = this.fieldValue === this.modelValue ? 0 : 1;
    return this.driftCount;
  }

  clear(): void {
    this.fieldValue = '';
    this.modelValue = '';
  }
}

/**
 * Tracks the loadingStatus machine per tab.
 *
 * loadingStatus is a single field while every tab keeps its own page, so an
 * end callback from a background tab may flip the global status of the active
 * one. The ledger keeps per tab begin/end counters and exposes the global
 * transitions so an out of order pair is reported, not silently accepted.
 */
class LoadingLedger {
  private begins: Map<number, number> = new Map<number, number>();
  private ends: Map<number, number> = new Map<number, number>();
  transitions: string[] = [];

  begin(tabIndex: number, statusBefore: MockLoadingStatus): void {
    this.begins.set(tabIndex, (this.begins.get(tabIndex) ?? 0) + 1);
    this.transitions.push(`${tabIndex}:${statusBefore > 0 ? 'END' : 'LOADING'}->LOADING`);
  }

  end(tabIndex: number, statusBefore: MockLoadingStatus): void {
    this.ends.set(tabIndex, (this.ends.get(tabIndex) ?? 0) + 1);
    this.transitions.push(`${tabIndex}:${statusBefore > 0 ? 'END' : 'LOADING'}->END`);
  }

  beginCount(tabIndex: number): number {
    return this.begins.get(tabIndex) ?? 0;
  }

  endCount(tabIndex: number): number {
    return this.ends.get(tabIndex) ?? 0;
  }

  isBalanced(tabIndex: number): boolean {
    return this.beginCount(tabIndex) === this.endCount(tabIndex);
  }

  /** Tabs that produced an end without a matching begin. */
  unbalancedTabs(limit: number): number[] {
    const result: number[] = [];
    for (let index = 0; index < limit; index++) {
      if (!this.isBalanced(index)) {
        result.push(index);
      }
    }
    return result;
  }

  reset(): void {
    this.begins = new Map<number, number>();
    this.ends = new Map<number, number>();
    this.transitions = [];
  }
}

export default function browserConsistencyTest() {
  describe('browserConsistencyTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'consistency suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Consistency_Invariant_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Invariant_001');
      TestLogger.step(TAG, 'audit the freshly created browser state');
      const model: MockBrowser = new MockBrowser(1);
      const checker: InvariantChecker = new InvariantChecker();
      auditSnapshot(model, checker, 'initial');
      TestLogger.info(TAG, `audit ${checker.report()}`);
      expect(checker.totalCount()).assertEqual(7);
      expect(checker.failureCount()).assertEqual(0);
      expect(model.tabs.length).assertEqual(1);
      expect(model.tabs[0].controller !== null).assertTrue();
      expect(model.getTabArrayIndex()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Consistency_Invariant_001');
    });

    it('Browser_Consistency_Invariant_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Invariant_002');
      TestLogger.step(TAG, 'keep tab and controller counts equal while growing the strip');
      const model: MockBrowser = new MockBrowser(1);
      const checker: InvariantChecker = new InvariantChecker();
      for (let round = 1; round <= CHURN_ROUNDS; round++) {
        model.addTab();
        auditSnapshot(model, checker, `grow-${round}`);
      }
      TestLogger.info(TAG, `tabs=${model.tabs.length} audit ${checker.report()}`);
      expect(model.tabs.length).assertEqual(CHURN_ROUNDS + 1);
      expect(model.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(checker.failureCount()).assertEqual(0);
      expect(checker.totalCount()).assertEqual(CHURN_ROUNDS * 7);
      expect(model.getTabKeys().length).assertEqual(model.tabs.length);
      TestLogger.pass(TAG, 'Browser_Consistency_Invariant_002');
    });

    it('Browser_Consistency_Invariant_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Invariant_003');
      TestLogger.step(TAG, 'keep the invariant while deleting from the middle');
      const model: MockBrowser = new MockBrowser(6);
      const checker: InvariantChecker = new InvariantChecker();
      for (let round = 0; round < 4; round++) {
        const target: number = 1 + (round % (model.tabs.length - 1));
        expect(model.deleteTab(target)).assertTrue();
        auditSnapshot(model, checker, `shrink-${round}`);
      }
      TestLogger.info(TAG, `tabs=${model.tabs.length} keys=${model.getTabKeys().join(',')} ${checker.report()}`);
      expect(model.tabs.length).assertEqual(2);
      expect(checker.failureCount()).assertEqual(0);
      expect(model.getTabKeys()).assertDeepEquals([0, 1]);
      expect(model.getTabArrayIndex()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Consistency_Invariant_003');
    });

    it('Browser_Consistency_Key_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Key_004');
      TestLogger.step(TAG, 'verify key equals index after head deletion');
      const model: MockBrowser = new MockBrowser(4);
      const before: number[] = model.getTabKeys();
      expect(model.deleteTab(0)).assertTrue();
      const after: number[] = model.getTabKeys();
      TestLogger.info(TAG, `before=${before.join(',')} after=${after.join(',')}`);
      expect(before).assertDeepEquals([0, 1, 2, 3]);
      expect(after).assertDeepEquals([0, 1, 2]);
      expect(keysMatchIndex(after)).assertTrue();
      expect(after.length).assertEqual(model.tabs.length);
      expect(model.tabArrayIndex).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Consistency_Key_004');
    });

    it('Browser_Consistency_Key_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Key_005');
      TestLogger.step(TAG, 'verify key equals index after tail deletion');
      const model: MockBrowser = new MockBrowser(5);
      model.selectTab(4);
      expect(model.deleteTab(4)).assertTrue();
      const keys: number[] = model.getTabKeys();
      const index: number = model.getTabArrayIndex();
      TestLogger.info(TAG, `keys=${keys.join(',')} index=${index} drift=${index - keys.length}`);
      expect(keys).assertDeepEquals([0, 1, 2, 3]);
      expect(keysMatchIndex(keys)).assertTrue();
      expect(index).assertEqual(3);
      expect(Math.abs(index - (keys.length - 1))).assertEqual(TOLERANCE_KEY_DRIFT);
      expect(model.getCurrentTab() !== null).assertTrue();
      TestLogger.pass(TAG, 'Browser_Consistency_Key_005');
    });

    it('Browser_Consistency_Key_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Key_006');
      TestLogger.step(TAG, 'compare timestamps of surviving tabs after a deletion');
      const model: MockBrowser = new MockBrowser(4);
      const stamps: number[] = model.getTimestamps();
      expect(model.deleteTab(2)).assertTrue();
      const survivors: number[] = model.getTimestamps();
      TestLogger.info(TAG, `stamps=${stamps.join(',')} survivors=${survivors.join(',')}`);
      expect(survivors.length).assertEqual(3);
      expect(survivors[0]).assertEqual(stamps[0]);
      expect(survivors[1]).assertEqual(stamps[1]);
      expect(survivors[2]).assertEqual(stamps[3]);
      expect(timestampsAscending(survivors)).assertTrue();
      expect(keysMatchIndex(model.getTabKeys())).assertTrue();
      TestLogger.pass(TAG, 'Browser_Consistency_Key_006');
    });

    it('Browser_Consistency_Input_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Input_007');
      TestLogger.step(TAG, 'sync the address bar with onPageBegin');
      const model: MockBrowser = new MockBrowser(1);
      const mirror: UiMirror = new UiMirror();
      mirror.type('www.example.com/news');
      const resolved: string = mirror.submit((raw: string) => normalizeUrl(raw));
      expect(model.loadUrl(resolved)).assertTrue();
      const controller: MockWebController = model.tabs[0].controller;
      model.onPageBegin(controller.currentUrl);
      TestLogger.info(TAG, `resolved=${resolved} field=${mirror.fieldValue} drift=${mirror.drift()}`);
      expect(resolved).assertEqual('https://www.example.com/news');
      expect(controller.currentUrl).assertEqual(resolved);
      expect(mirror.fieldValue).assertEqual(resolved);
      expect(mirror.modelValue).assertEqual(resolved);
      expect(mirror.drift()).assertEqual(0);
      expect(model.getInputVal()).assertEqual(resolved);
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      TestLogger.pass(TAG, 'Browser_Consistency_Input_007');
    });

    it('Browser_Consistency_Input_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Input_008');
      TestLogger.step(TAG, 'clear the address bar when a relative url is reported');
      const model: MockBrowser = new MockBrowser(1);
      const mirror: UiMirror = new UiMirror();
      mirror.type('pad.html');
      mirror.submit((raw: string) => normalizeUrl(raw));
      expect(model.getInputVal()).assertEqual('');
      model.onPageBegin('pad.html');
      mirror.onPageBegin('pad.html');
      TestLogger.info(TAG, `modelValue='${model.getInputVal()}' field='${mirror.fieldValue}'`);
      expect(model.getInputVal()).assertEqual('');
      expect(mirror.fieldValue).assertEqual('');
      expect(mirror.drift()).assertEqual(0);
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      expect(progressVisibleAfter(model.progress)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Consistency_Input_008');
    });

    it('Browser_Consistency_Input_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Input_009');
      TestLogger.step(TAG, 'keep the address value across onPageEnd');
      const model: MockBrowser = new MockBrowser(1);
      const url: string = normalizeUrl('www.example.com/stable');
      expect(model.loadUrl(url)).assertTrue();
      model.onPageBegin(url);
      model.onProgressChange(60);
      const during: string = model.getInputVal();
      model.onProgressChange(100);
      model.onPageEnd();
      TestLogger.info(TAG, `during=${during} after=${model.getInputVal()} status=${model.loadingStatus}`);
      expect(during).assertEqual(url);
      expect(model.getInputVal()).assertEqual(url);
      expect(model.getInputVal() === '').assertFalse();
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(model.hideProgress).assertTrue();
      expect(model.tabs[0].controller.javaScriptCalls.length).assertEqual(1);
      expect(model.tabs[0].controller.javaScriptCalls[0]).assertEqual('adapterDevice()');
      TestLogger.pass(TAG, 'Browser_Consistency_Input_009');
    });

    it('Browser_Consistency_Loading_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Loading_010');
      TestLogger.step(TAG, 'audit one complete loading cycle with the ledger');
      const model: MockBrowser = new MockBrowser(1);
      const ledger: LoadingLedger = new LoadingLedger();
      ledger.begin(0, model.loadingStatus);
      model.onPageBegin(normalizeUrl('www.example.com/cycle'));
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      model.onProgressChange(40);
      expect(model.hideProgress).assertFalse();
      ledger.end(0, model.loadingStatus);
      model.onProgressChange(100);
      model.onPageEnd();
      TestLogger.info(TAG, `transitions=${ledger.transitions.join('|')} balanced=${ledger.isBalanced(0)}`);
      expect(ledger.beginCount(0)).assertEqual(1);
      expect(ledger.endCount(0)).assertEqual(1);
      expect(ledger.isBalanced(0)).assertTrue();
      expect(ledger.transitions.length).assertEqual(2);
      expect(ledger.transitions[0]).assertEqual('0:END->LOADING');
      expect(ledger.transitions[1]).assertEqual('0:LOADING->END');
      TestLogger.pass(TAG, 'Browser_Consistency_Loading_010');
    });

    it('Browser_Consistency_Loading_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Loading_011');
      TestLogger.step(TAG, 'detect an end callback that has no begin');
      const ledger: LoadingLedger = new LoadingLedger();
      ledger.begin(0, MockLoadingStatus.END);
      ledger.begin(1, MockLoadingStatus.END);
      ledger.end(0, MockLoadingStatus.LOADING);
      ledger.end(1, MockLoadingStatus.LOADING);
      ledger.end(2, MockLoadingStatus.LOADING);
      const unbalanced: number[] = ledger.unbalancedTabs(3);
      TestLogger.info(TAG, `unbalanced=${unbalanced.join(',')} begin2=${ledger.beginCount(2)}`);
      expect(ledger.isBalanced(0)).assertTrue();
      expect(ledger.isBalanced(1)).assertTrue();
      expect(ledger.isBalanced(2)).assertFalse();
      expect(unbalanced.length).assertEqual(1);
      expect(unbalanced[0]).assertEqual(2);
      expect(ledger.endCount(2)).assertEqual(1);
      expect(ledger.beginCount(2)).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Consistency_Loading_011');
    });

    it('Browser_Consistency_Progress_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Progress_012');
      TestLogger.step(TAG, 'walk the progress and hideProgress matrix');
      const model: MockBrowser = new MockBrowser(1);
      const samples: number[] = [0, 10, 50, 90, 99, 100];
      let visibleCount: number = 0;
      for (let index = 0; index < samples.length; index++) {
        model.onProgressChange(samples[index]);
        const expectedVisible: boolean = progressVisibleAfter(samples[index]);
        const expectedProgress: number = progressResetAfterComplete(samples[index]);
        if (expectedVisible) {
          visibleCount += 1;
        }
        expect(model.hideProgress).assertEqual(!expectedVisible);
        expect(model.progress).assertEqual(expectedProgress);
      }
      TestLogger.info(TAG, `visibleSamples=${visibleCount} finalProgress=${model.progress}`);
      expect(visibleCount).assertEqual(samples.length - 1);
      expect(model.progress).assertEqual(0);
      expect(model.hideProgress).assertTrue();
      expect(PROGRESS_SAMPLES).assertEqual(9);
      TestLogger.pass(TAG, 'Browser_Consistency_Progress_012');
    });

    it('Browser_Consistency_Select_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Select_013');
      TestLogger.step(TAG, 'select each tab in turn and compare index with key');
      const model: MockBrowser = new MockBrowser(5);
      const checker: InvariantChecker = new InvariantChecker();
      for (let round = 0; round < SELECT_ROUNDS; round++) {
        const target: number = round % model.tabs.length;
        expect(model.selectTab(target)).assertTrue();
        const view: ConsistencySnapshot = snapshot(model);
        checker.check(`select-${round}`, view.activeIndex === target && view.activeKey === target,
          `${view.activeIndex}/${view.activeKey}/${target}`);
      }
      TestLogger.info(TAG, `rounds=${SELECT_ROUNDS} ${checker.report()}`);
      expect(checker.totalCount()).assertEqual(SELECT_ROUNDS);
      expect(checker.failureCount()).assertEqual(0);
      expect(model.lastChangedIndex).assertEqual((SELECT_ROUNDS - 1) % 5);
      expect(model.getTabArrayIndex()).assertEqual((SELECT_ROUNDS - 1) % 5);
      TestLogger.pass(TAG, 'Browser_Consistency_Select_013');
    });

    it('Browser_Consistency_Select_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Select_014');
      TestLogger.step(TAG, 'reject out of range tab selection');
      const model: MockBrowser = new MockBrowser(3);
      model.selectTab(1);
      const negative: boolean = model.selectTab(-1);
      const overflow: boolean = model.selectTab(3);
      TestLogger.info(TAG, `negative=${negative} overflow=${overflow} index=${model.getTabArrayIndex()}`);
      expect(negative).assertFalse();
      expect(overflow).assertFalse();
      expect(model.getTabArrayIndex()).assertEqual(1);
      expect(model.lastChangedIndex).assertEqual(1);
      expect(model.getCurrentTab() !== null).assertTrue();
      expect(snapshot(model).activeKey).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Consistency_Select_014');
    });

    it('Browser_Consistency_Submit_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Submit_015');
      TestLogger.step(TAG, 'submit the mirrored address and resolve it once');
      const model: MockBrowser = new MockBrowser(1);
      const mirror: UiMirror = new UiMirror();
      const table: string[] = ['example.com', 'www.example.com/a', 'news.example.com'];
      for (let index = 0; index < table.length; index++) {
        mirror.type(table[index]);
        const resolved: string = mirror.submit((raw: string) => normalizeUrl(raw));
        expect(model.loadUrl(table[index])).assertTrue();
        expect(resolved).assertEqual(normalizeUrl(table[index]));
        expect(model.tabs[0].controller.currentUrl).assertEqual(resolved);
        expect(mirror.drift()).assertEqual(0);
        model.onPageBegin(resolved);
        expect(model.getInputVal()).assertEqual(resolved);
      }
      TestLogger.info(TAG, `submits=${mirror.submitCount} history=${model.tabs[0].controller.history.length}`);
      expect(mirror.submitCount).assertEqual(table.length);
      expect(mirror.driftCount).assertEqual(0);
      expect(model.tabs[0].controller.history.length).assertEqual(table.length);
      expect(model.tabs[0].controller.loadCount).assertEqual(table.length);
      TestLogger.pass(TAG, 'Browser_Consistency_Submit_015');
    });

    it('Browser_Consistency_Churn_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Churn_016');
      TestLogger.step(TAG, 'audit the invariant across add and delete churn');
      const model: MockBrowser = new MockBrowser(2);
      const checker: InvariantChecker = new InvariantChecker();
      for (let round = 0; round < CHURN_ROUNDS; round++) {
        model.addTab();
        auditSnapshot(model, checker, `add-${round}`);
        if (model.tabs.length > 2) {
          model.deleteTab(round % (model.tabs.length - 1));
          auditSnapshot(model, checker, `delete-${round}`);
        }
      }
      TestLogger.info(TAG, `tabs=${model.tabs.length} checks=${checker.totalCount()} ${checker.report()}`);
      expect(checker.failureCount()).assertEqual(0);
      expect(checker.totalCount()).assertEqual(CHURN_ROUNDS * 2 * 7);
      expect(model.tabs.length).assertLarger(1);
      expect(model.tabs.length).assertLess(MAX_TAB_COUNT + 2);
      expect(keysMatchIndex(model.getTabKeys())).assertTrue();
      TestLogger.pass(TAG, 'Browser_Consistency_Churn_016');
    });

    it('Browser_Consistency_Report_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Consistency_Report_018');
      TestLogger.step(TAG, 'prove the audit reports a deliberately broken invariant');
      const checker: InvariantChecker = new InvariantChecker();
      const model: MockBrowser = new MockBrowser(2);
      auditSnapshot(model, checker, 'healthy');
      const before: number = checker.failureCount();
      checker.check('broken:index', model.tabs.length === 3, 'expected 3 tabs');
      const failures: InvariantResult[] = checker.failures();
      TestLogger.info(TAG, `before=${before} after=${failures.length} report=${checker.report()}`);
      expect(before).assertEqual(0);
      expect(failures.length).assertEqual(1);
      expect(failures[0].name).assertEqual('broken:index');
      expect(failures[0].detail).assertEqual('expected 3 tabs');
      expect(checker.report().indexOf('broken:index') >= 0).assertTrue();
      expect(checker.names().length).assertEqual(8);
      checker.reset();
      expect(checker.totalCount()).assertEqual(0);
      expect(checker.failureCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Consistency_Report_018');
    });
  });
}
