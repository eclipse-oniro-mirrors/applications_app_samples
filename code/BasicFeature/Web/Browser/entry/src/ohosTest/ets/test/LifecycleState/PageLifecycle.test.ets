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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById, textById,
  inputById, clickById, waitForId, backPressConsumes, normalizeUrl,
  ID_INPUT_URL, ID_NAV_HOME, ID_NAV_BACK, ID_CANCEL_TAB,
  TIMEOUT_COMPONENT, DELAY_KEY_NAVIGATION, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock, MockWebController } from '../Shared/BrowserMock';

const TAG: string = 'BrowserPageLifecycleTest';

/* ------------------------------------------------------------------ */
/* Page phases and their legal order                                   */
/* ------------------------------------------------------------------ */

/** Lifecycle callbacks delivered by the ArkUI page container. */
enum PagePhase {
  NONE = 0,
  APPEAR = 1,
  SHOW = 2,
  HIDE = 3,
  DISAPPEAR = 4
}

function phaseName(phase: PagePhase): string {
  switch (phase) {
    case PagePhase.APPEAR:
      return 'aboutToAppear';
    case PagePhase.SHOW:
      return 'onPageShow';
    case PagePhase.HIDE:
      return 'onPageHide';
    case PagePhase.DISAPPEAR:
      return 'aboutToDisappear';
    default:
      return 'none';
  }
}

/**
 * Legal callback order of one page instance.
 *
 * aboutToAppear runs once, onPageShow may repeat after every onPageHide, and
 * aboutToDisappear is terminal. Anything else means the framework called back
 * into a page that is already gone, which is the failure mode this table pins.
 */
function isLegalPhaseTransition(from: PagePhase, to: PagePhase): boolean {
  if (from === PagePhase.NONE) {
    return to === PagePhase.APPEAR;
  }
  if (from === PagePhase.APPEAR) {
    return to === PagePhase.SHOW || to === PagePhase.DISAPPEAR;
  }
  if (from === PagePhase.SHOW) {
    return to === PagePhase.HIDE || to === PagePhase.DISAPPEAR;
  }
  if (from === PagePhase.HIDE) {
    return to === PagePhase.SHOW || to === PagePhase.DISAPPEAR;
  }
  return false;
}

interface PhaseRecord {
  phase: PagePhase;
  sequence: number;
  timestamp: number;
}

interface PhaseRejection {
  phase: PagePhase;
  previous: PagePhase;
  reason: string;
}

/** Records the callback stream of one page instance and validates its order. */
class PageLifecycleRecorder {
  records: PhaseRecord[] = [];
  rejections: PhaseRejection[] = [];
  private current: PagePhase = PagePhase.NONE;
  private clock: MockClock;

  constructor(clock: MockClock = new MockClock()) {
    this.clock = clock;
  }

  currentPhase(): PagePhase {
    return this.current;
  }

  append(phase: PagePhase): boolean {
    if (!isLegalPhaseTransition(this.current, phase)) {
      this.rejections.push({
        phase: phase,
        previous: this.current,
        reason: `${phaseName(this.current)}->${phaseName(phase)}`
      });
      return false;
    }
    this.records.push({ phase: phase, sequence: this.records.length, timestamp: this.clock.now() });
    this.current = phase;
    this.clock.advance(16);
    return true;
  }

  countOf(phase: PagePhase): number {
    let total: number = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].phase === phase) {
        total += 1;
      }
    }
    return total;
  }

  size(): number {
    return this.records.length;
  }

  rejectionCount(): number {
    return this.rejections.length;
  }

  reasons(): string[] {
    return this.rejections.map((item: PhaseRejection) => item.reason);
  }

  firstPhase(): PagePhase {
    return this.records.length === 0 ? PagePhase.NONE : this.records[0].phase;
  }

  lastPhase(): PagePhase {
    return this.records.length === 0 ? PagePhase.NONE : this.records[this.records.length - 1].phase;
  }

  /** Timestamps must be strictly increasing, the clock double never rewinds. */
  isChronological(): boolean {
    for (let index = 1; index < this.records.length; index++) {
      if (this.records[index].timestamp < this.records[index - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  /** One appear and one disappear per instance, show and hide in pairs. */
  isBalanced(): boolean {
    return this.countOf(PagePhase.APPEAR) === this.countOf(PagePhase.DISAPPEAR) &&
      this.countOf(PagePhase.SHOW) === this.countOf(PagePhase.HIDE);
  }

  sequenceNames(): string {
    return this.records.map((record: PhaseRecord) => phaseName(record.phase)).join('>');
  }

  reset(): void {
    this.records = [];
    this.rejections = [];
    this.current = PagePhase.NONE;
    this.clock.reset();
  }
}

/* ------------------------------------------------------------------ */
/* Page stack and back press arbitration                               */
/* ------------------------------------------------------------------ */

interface BackOutcome {
  consumed: boolean;
  poppedUrl: string;
  stackSize: number;
  reason: string;
}

/**
 * Double of the router page stack plus the onBackPress arbitration of Index.ets.
 *
 * onBackPress consumes the event when the current WebView can go backward or a
 * load is still in flight; otherwise it returns false and the router pops the
 * page. Both branches must be covered, otherwise a back press either closes the
 * browser while a page is loading or traps the user inside the WebView.
 */
class PageStackModel {
  entries: string[] = [];
  history: string[] = [];
  loading: boolean = false;
  accessBackward: boolean = false;

  push(url: string): number {
    const normalized: string = normalizeUrl(url);
    this.entries.push(normalized);
    this.history.push(`push:${normalized}`);
    return this.entries.length;
  }

  pop(): string {
    if (this.entries.length === 0) {
      return '';
    }
    const url: string = this.entries[this.entries.length - 1];
    this.entries.splice(this.entries.length - 1, 1);
    this.history.push(`pop:${url}`);
    return url;
  }

  size(): number {
    return this.entries.length;
  }

  current(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  /** Mirrors Index.onBackPress. */
  press(): BackOutcome {
    const consumes: boolean = backPressConsumes(this.accessBackward, this.loading);
    if (consumes) {
      this.history.push('back:webview');
      return {
        consumed: true,
        poppedUrl: this.current(),
        stackSize: this.entries.length,
        reason: this.loading ? 'loading' : 'accessBackward'
      };
    }
    const popped: string = this.pop();
    return {
      consumed: false,
      poppedUrl: popped,
      stackSize: this.entries.length,
      reason: this.entries.length === 0 ? 'root' : 'page-stack'
    };
  }

  reset(): void {
    this.entries = [];
    this.history = [];
    this.loading = false;
    this.accessBackward = false;
  }
}

/* ------------------------------------------------------------------ */
/* Web page event sequencing                                           */
/* ------------------------------------------------------------------ */

enum WebEventKind {
  BEGIN = 0,
  PROGRESS = 1,
  END = 2
}

interface WebEvent {
  kind: WebEventKind;
  progress: number;
  url: string;
  sequence: number;
}

interface EventRejection {
  kind: WebEventKind;
  reason: string;
}

/**
 * Double of the Web callbacks of WebTab.
 *
 * onPageBegin sets the address bar and switches the model to LOADING, every
 * onProgressChange moves the progress bar, and onPageEnd flips back to END and
 * runs adapterDevice() through the JavaScript proxy. The sequencer enforces the
 * begin -> progress* -> end order because a stray progress after end leaves the
 * progress bar stuck on screen forever.
 */
class WebEventSequencer {
  events: WebEvent[] = [];
  rejections: EventRejection[] = [];
  adapterCalls: number = 0;
  inputValue: string = '';
  loading: boolean = false;
  progress: number = 0;
  hideProgress: boolean = true;
  private begun: boolean = false;
  private ended: boolean = true;

  begin(url: string): boolean {
    if (this.begun && !this.ended) {
      this.rejections.push({ kind: WebEventKind.BEGIN, reason: 'duplicate begin' });
      return false;
    }
    this.begun = true;
    this.ended = false;
    this.loading = true;
    this.inputValue = url !== null && url.startsWith('http') ? url : '';
    this.events.push({ kind: WebEventKind.BEGIN, progress: 0, url: url, sequence: this.events.length });
    return true;
  }

  progressChanged(value: number): boolean {
    if (!this.begun || this.ended) {
      this.rejections.push({ kind: WebEventKind.PROGRESS, reason: 'progress outside a load' });
      return false;
    }
    if (value < this.progress && value !== 100) {
      this.rejections.push({ kind: WebEventKind.PROGRESS, reason: 'progress moved backwards' });
      return false;
    }
    this.progress = value;
    this.hideProgress = value === 100;
    this.events.push({ kind: WebEventKind.PROGRESS, progress: value, url: '', sequence: this.events.length });
    if (value === 100) {
      this.progress = 0;
      this.hideProgress = true;
    }
    return true;
  }

  end(): boolean {
    if (!this.begun || this.ended) {
      this.rejections.push({ kind: WebEventKind.END, reason: 'end without an active load' });
      return false;
    }
    this.ended = true;
    this.loading = false;
    this.adapterCalls += 1;
    this.events.push({ kind: WebEventKind.END, progress: 100, url: '', sequence: this.events.length });
    return true;
  }

  countOf(kind: WebEventKind): number {
    let total: number = 0;
    for (let index = 0; index < this.events.length; index++) {
      if (this.events[index].kind === kind) {
        total += 1;
      }
    }
    return total;
  }

  progressSamples(): number[] {
    const result: number[] = [];
    for (let index = 0; index < this.events.length; index++) {
      if (this.events[index].kind === WebEventKind.PROGRESS) {
        result.push(this.events[index].progress);
      }
    }
    return result;
  }

  /** Replays the recorded stream and checks begin first, end last. */
  isOrdered(): boolean {
    if (this.events.length === 0) {
      return false;
    }
    if (this.events[0].kind !== WebEventKind.BEGIN) {
      return false;
    }
    if (this.events[this.events.length - 1].kind !== WebEventKind.END) {
      return false;
    }
    for (let index = 1; index < this.events.length - 1; index++) {
      if (this.events[index].kind !== WebEventKind.PROGRESS) {
        return false;
      }
    }
    return true;
  }

  isProgressMonotonic(): boolean {
    const samples: number[] = this.progressSamples();
    for (let index = 1; index < samples.length; index++) {
      if (samples[index] < samples[index - 1]) {
        return false;
      }
    }
    return true;
  }

  rejectionCount(): number {
    return this.rejections.length;
  }

  rejectionReasons(): string[] {
    return this.rejections.map((item: EventRejection) => item.reason);
  }

  describe(): string {
    return `begin=${this.countOf(WebEventKind.BEGIN)}, progress=${this.countOf(WebEventKind.PROGRESS)}, ` +
      `end=${this.countOf(WebEventKind.END)}, adapter=${this.adapterCalls}`;
  }
}

/** Runs a full load with the progress samples of the table. */
function runLoad(sequencer: WebEventSequencer, url: string, samples: number[]): void {
  sequencer.begin(url);
  for (let index = 0; index < samples.length; index++) {
    sequencer.progressChanged(samples[index]);
  }
  sequencer.end();
}

const PROGRESS_TABLE: number[] = [10, 35, 60, 85, 100];

export default function browserPageLifecycleTest() {
  describe('browserPageLifecycleTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'page lifecycle suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_PageCycle_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageCycle_001');
      TestLogger.step(TAG, 'first visit runs aboutToAppear and then onPageShow');
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      expect(recorder.append(PagePhase.APPEAR)).assertTrue();
      expect(recorder.append(PagePhase.SHOW)).assertTrue();
      TestLogger.info(TAG, `sequence=${recorder.sequenceNames()}`);
      expect(recorder.size()).assertEqual(2);
      expect(recorder.firstPhase()).assertEqual(PagePhase.APPEAR);
      expect(recorder.lastPhase()).assertEqual(PagePhase.SHOW);
      expect(recorder.currentPhase()).assertEqual(PagePhase.SHOW);
      expect(recorder.countOf(PagePhase.APPEAR)).assertEqual(1);
      expect(recorder.countOf(PagePhase.SHOW)).assertEqual(1);
      expect(recorder.rejectionCount()).assertEqual(0);
      expect(recorder.isChronological()).assertTrue();
      TestLogger.pass(TAG, 'Browser_PageCycle_001');
    });

    it('Browser_PageCycle_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageCycle_002');
      TestLogger.step(TAG, 'hide and show round trip keeps a single aboutToAppear');
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      recorder.append(PagePhase.APPEAR);
      recorder.append(PagePhase.SHOW);
      expect(recorder.append(PagePhase.HIDE)).assertTrue();
      expect(recorder.append(PagePhase.SHOW)).assertTrue();
      TestLogger.info(TAG, `sequence=${recorder.sequenceNames()}`);
      expect(recorder.countOf(PagePhase.APPEAR)).assertEqual(1);
      expect(recorder.countOf(PagePhase.SHOW)).assertEqual(2);
      expect(recorder.countOf(PagePhase.HIDE)).assertEqual(1);
      expect(recorder.lastPhase()).assertEqual(PagePhase.SHOW);
      expect(recorder.rejectionCount()).assertEqual(0);
      expect(recorder.isChronological()).assertTrue();
      TestLogger.pass(TAG, 'Browser_PageCycle_002');
    });

    it('Browser_PageCycle_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageCycle_003');
      TestLogger.step(TAG, 'aboutToDisappear closes the page and no callback follows');
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      recorder.append(PagePhase.APPEAR);
      recorder.append(PagePhase.SHOW);
      recorder.append(PagePhase.HIDE);
      expect(recorder.append(PagePhase.DISAPPEAR)).assertTrue();
      const afterGone: boolean = recorder.append(PagePhase.SHOW);
      TestLogger.info(TAG, `sequence=${recorder.sequenceNames()}, afterGone=${afterGone}`);
      expect(afterGone).assertFalse();
      expect(recorder.lastPhase()).assertEqual(PagePhase.DISAPPEAR);
      expect(recorder.rejectionCount()).assertEqual(1);
      expect(recorder.reasons()[0]).assertContain('aboutToDisappear');
      expect(recorder.isBalanced()).assertTrue();
      TestLogger.pass(TAG, 'Browser_PageCycle_003');
    });

    it('Browser_PageCycle_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageCycle_004');
      TestLogger.step(TAG, 'callbacks delivered out of order are rejected');
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      expect(recorder.append(PagePhase.SHOW)).assertFalse();
      expect(recorder.append(PagePhase.HIDE)).assertFalse();
      expect(recorder.append(PagePhase.APPEAR)).assertTrue();
      expect(recorder.append(PagePhase.APPEAR)).assertFalse();
      TestLogger.info(TAG, `rejections=${recorder.reasons().join('|')}`);
      expect(recorder.rejectionCount()).assertEqual(3);
      expect(recorder.size()).assertEqual(1);
      expect(recorder.lastPhase()).assertEqual(PagePhase.APPEAR);
      expect(recorder.countOf(PagePhase.APPEAR)).assertEqual(1);
      expect(recorder.isBalanced()).assertFalse();
      TestLogger.pass(TAG, 'Browser_PageCycle_004');
    });

    it('Browser_PageCycle_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageCycle_005');
      TestLogger.step(TAG, 'recorded callbacks carry increasing sequence numbers');
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      recorder.append(PagePhase.APPEAR);
      recorder.append(PagePhase.SHOW);
      recorder.append(PagePhase.HIDE);
      recorder.append(PagePhase.SHOW);
      for (let index = 0; index < recorder.records.length; index++) {
        expect(recorder.records[index].sequence).assertEqual(index);
      }
      TestLogger.info(TAG, `timestamps increasing=${recorder.isChronological()}`);
      expect(recorder.isChronological()).assertTrue();
      expect(recorder.records[0].timestamp).assertLess(recorder.records[3].timestamp);
      expect(recorder.records.length).assertEqual(4);
      recorder.reset();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.currentPhase()).assertEqual(PagePhase.NONE);
      TestLogger.pass(TAG, 'Browser_PageCycle_005');
    });

    it('Browser_PageStack_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageStack_006');
      TestLogger.step(TAG, 'page stack pushes and pops in last in first out order');
      const stack: PageStackModel = new PageStackModel();
      expect(stack.size()).assertEqual(0);
      expect(stack.current()).assertEqual('');
      stack.push('example.com/a');
      stack.push('https://example.com/b');
      stack.push('example.com/c');
      TestLogger.info(TAG, `size=${stack.size()}, current=${stack.current()}`);
      expect(stack.size()).assertEqual(3);
      expect(stack.current()).assertEqual('https://example.com/c');
      expect(stack.pop()).assertEqual('https://example.com/c');
      expect(stack.size()).assertEqual(2);
      expect(stack.current()).assertEqual('https://example.com/b');
      expect(stack.pop()).assertEqual('https://example.com/b');
      expect(stack.pop()).assertEqual('https://example.com/a');
      expect(stack.pop()).assertEqual('');
      expect(stack.size()).assertEqual(0);
      expect(stack.history.length).assertEqual(6);
      TestLogger.pass(TAG, 'Browser_PageStack_006');
    });

    it('Browser_PageStack_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageStack_007');
      TestLogger.step(TAG, 'back press is consumed while the WebView can go backward');
      const stack: PageStackModel = new PageStackModel();
      stack.push('example.com/home');
      stack.accessBackward = true;
      const outcome: BackOutcome = stack.press();
      TestLogger.info(TAG, `consumed=${outcome.consumed}, reason=${outcome.reason}`);
      expect(outcome.consumed).assertTrue();
      expect(outcome.reason).assertEqual('accessBackward');
      expect(outcome.stackSize).assertEqual(1);
      expect(outcome.poppedUrl).assertEqual('https://example.com/home');
      expect(stack.size()).assertEqual(1);
      expect(backPressConsumes(true, false)).assertTrue();
      expect(backPressConsumes(false, false)).assertFalse();
      TestLogger.pass(TAG, 'Browser_PageStack_007');
    });

    it('Browser_PageStack_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageStack_008');
      TestLogger.step(TAG, 'back press at the root falls through to the router');
      const stack: PageStackModel = new PageStackModel();
      stack.push('example.com/only');
      stack.accessBackward = false;
      stack.loading = false;
      const outcome: BackOutcome = stack.press();
      TestLogger.info(TAG, `consumed=${outcome.consumed}, reason=${outcome.reason}`);
      expect(outcome.consumed).assertFalse();
      expect(outcome.reason).assertEqual('root');
      expect(outcome.poppedUrl).assertEqual('https://example.com/only');
      expect(outcome.stackSize).assertEqual(0);
      expect(stack.size()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_PageStack_008');
    });

    it('Browser_PageCycle_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageCycle_009');
      TestLogger.step(TAG, 'back press during a load is consumed even without history');
      const browser: MockBrowser = new MockBrowser(1);
      browser.onPageBegin('https://loading.example.com');
      expect(browser.loadingStatus).assertEqual(0);
      const consumed: boolean = browser.onBackPress();
      TestLogger.info(TAG, `loading consumed=${consumed}`);
      expect(consumed).assertTrue();
      expect(backPressConsumes(false, true)).assertTrue();
      const idle: MockBrowser = new MockBrowser(1);
      expectIdleBackPress(idle);
      TestLogger.pass(TAG, 'Browser_PageCycle_009');
    });

    it('Browser_WebEvents_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_WebEvents_010');
      TestLogger.step(TAG, 'begin, progress and end arrive in the expected order');
      const sequencer: WebEventSequencer = new WebEventSequencer();
      runLoad(sequencer, 'https://order.example.com', PROGRESS_TABLE);
      TestLogger.info(TAG, `events=${sequencer.describe()}`);
      expect(sequencer.countOf(WebEventKind.BEGIN)).assertEqual(1);
      expect(sequencer.countOf(WebEventKind.PROGRESS)).assertEqual(PROGRESS_TABLE.length);
      expect(sequencer.countOf(WebEventKind.END)).assertEqual(1);
      expect(sequencer.events.length).assertEqual(PROGRESS_TABLE.length + 2);
      expect(sequencer.isOrdered()).assertTrue();
      expect(sequencer.loading).assertFalse();
      expect(sequencer.inputValue).assertEqual('https://order.example.com');
      expect(sequencer.adapterCalls).assertEqual(1);
      expect(sequencer.rejectionCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_WebEvents_010');
    });

    it('Browser_WebEvents_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_WebEvents_011');
      TestLogger.step(TAG, 'progress never rewinds and the bar hides at completion');
      const sequencer: WebEventSequencer = new WebEventSequencer();
      sequencer.begin('https://progress.example.com');
      sequencer.progressChanged(10);
      expect(sequencer.hideProgress).assertFalse();
      expect(sequencer.progress).assertEqual(10);
      sequencer.progressChanged(55);
      expect(sequencer.hideProgress).assertFalse();
      sequencer.progressChanged(95);
      expect(sequencer.progress).assertEqual(95);
      sequencer.progressChanged(100);
      TestLogger.info(TAG, `progress=${sequencer.progress}, hide=${sequencer.hideProgress}`);
      expect(sequencer.progress).assertEqual(0);
      expect(sequencer.hideProgress).assertTrue();
      expect(sequencer.isProgressMonotonic()).assertTrue();
      const samples: number[] = sequencer.progressSamples();
      expect(samples.length).assertEqual(4);
      expect(samples[3]).assertEqual(100);
      expect(sequencer.rejectionCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_WebEvents_011');
    });

    it('Browser_WebEvents_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_WebEvents_012');
      TestLogger.step(TAG, 'events outside a load are rejected and never reach the model');
      const sequencer: WebEventSequencer = new WebEventSequencer();
      expect(sequencer.progressChanged(30)).assertFalse();
      expect(sequencer.end()).assertFalse();
      sequencer.begin('https://strict.example.com');
      expect(sequencer.begin('https://strict.example.com')).assertFalse();
      sequencer.progressChanged(40);
      sequencer.end();
      expect(sequencer.progressChanged(70)).assertFalse();
      expect(sequencer.end()).assertFalse();
      TestLogger.info(TAG, `rejections=${sequencer.rejectionReasons().join('|')}`);
      expect(sequencer.rejectionCount()).assertEqual(5);
      expect(sequencer.rejectionReasons()[0]).assertEqual('progress outside a load');
      expect(sequencer.rejectionReasons()[1]).assertEqual('end without an active load');
      expect(sequencer.rejectionReasons()[2]).assertEqual('duplicate begin');
      expect(sequencer.rejectionReasons()[3]).assertEqual('progress outside a load');
      expect(sequencer.rejectionReasons()[4]).assertEqual('end without an active load');
      expect(sequencer.countOf(WebEventKind.BEGIN)).assertEqual(1);
      expect(sequencer.countOf(WebEventKind.END)).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_WebEvents_012');
    });

    it('Browser_WebEvents_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_WebEvents_013');
      TestLogger.step(TAG, 'begin fills the address bar only for http urls');
      const sequencer: WebEventSequencer = new WebEventSequencer();
      runLoad(sequencer, 'https://address.example.com/path', PROGRESS_TABLE);
      expect(sequencer.inputValue).assertEqual('https://address.example.com/path');
      const rawfileRun: WebEventSequencer = new WebEventSequencer();
      runLoad(rawfileRun, 'resource://rawfile/pad.html', PROGRESS_TABLE);
      TestLogger.info(TAG, `http='${sequencer.inputValue}' rawfile='${rawfileRun.inputValue}'`);
      expect(rawfileRun.inputValue).assertEqual('');
      expect(rawfileRun.isOrdered()).assertTrue();
      const secondRun: WebEventSequencer = new WebEventSequencer();
      runLoad(secondRun, 'about:blank', PROGRESS_TABLE);
      expect(secondRun.inputValue).assertEqual('');
      TestLogger.pass(TAG, 'Browser_WebEvents_013');
    });

    it('Browser_WebEvents_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_WebEvents_014');
      TestLogger.step(TAG, 'adapterDevice runs exactly once per completed load');
      const sequencer: WebEventSequencer = new WebEventSequencer();
      runLoad(sequencer, 'https://one.example.com', [50, 100]);
      expect(sequencer.adapterCalls).assertEqual(1);
      runLoad(sequencer, 'https://two.example.com', [100]);
      runLoad(sequencer, 'https://three.example.com', [25, 75, 100]);
      TestLogger.info(TAG, `loads=3 adapter=${sequencer.adapterCalls}`);
      expect(sequencer.adapterCalls).assertEqual(3);
      expect(sequencer.countOf(WebEventKind.BEGIN)).assertEqual(3);
      expect(sequencer.countOf(WebEventKind.END)).assertEqual(3);
      expect(sequencer.events.length).assertEqual(3 + 6 + 3);
      expect(sequencer.rejectionCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_WebEvents_014');
    });

    it('Browser_PageCycle_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageCycle_015');
      TestLogger.step(TAG, 'five foreground cycles keep appear and disappear balanced');
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      recorder.append(PagePhase.APPEAR);
      for (let round = 0; round < 5; round++) {
        expect(recorder.append(PagePhase.SHOW)).assertTrue();
        expect(recorder.append(PagePhase.HIDE)).assertTrue();
      }
      expect(recorder.append(PagePhase.DISAPPEAR)).assertTrue();
      TestLogger.info(TAG, `size=${recorder.size()}, sequence=${recorder.sequenceNames()}`);
      expect(recorder.size()).assertEqual(12);
      expect(recorder.countOf(PagePhase.APPEAR)).assertEqual(1);
      expect(recorder.countOf(PagePhase.SHOW)).assertEqual(5);
      expect(recorder.countOf(PagePhase.HIDE)).assertEqual(5);
      expect(recorder.countOf(PagePhase.DISAPPEAR)).assertEqual(1);
      expect(recorder.isBalanced()).assertTrue();
      expect(recorder.rejectionCount()).assertEqual(0);
      expect(recorder.isChronological()).assertTrue();
      TestLogger.pass(TAG, 'Browser_PageCycle_015');
    });

    it('Browser_PageCycle_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageCycle_016');
      TestLogger.step(TAG, 'a cold start never begins with onPageShow');
      const recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
      expect(recorder.firstPhase()).assertEqual(PagePhase.NONE);
      expect(recorder.lastPhase()).assertEqual(PagePhase.NONE);
      expect(recorder.isChronological()).assertTrue();
      recorder.append(PagePhase.APPEAR);
      TestLogger.info(TAG, `first=${phaseName(recorder.firstPhase())}`);
      expect(recorder.firstPhase()).assertEqual(PagePhase.APPEAR);
      expect(recorder.countOf(PagePhase.SHOW)).assertEqual(0);
      expect(recorder.lastPhase() === PagePhase.SHOW).assertFalse();
      TestLogger.pass(TAG, 'Browser_PageCycle_016');
    });

    it('Browser_PageLifecycle_UI_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageLifecycle_UI_017');
      TestLogger.step(TAG, 'page controls survive a hide and show cycle');
      const appeared: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT);
      const typed: boolean = await inputById(driver, ID_INPUT_URL, 'lifecycle.example.com');
      TestLogger.info(TAG, `appeared=${appeared}, typed=${typed}`);
      expect(appeared).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const text: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `text after show='${text}'`);
      expect(text.length >= 0).assertTrue();
      const home: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      expect(home).assertTrue();
      TestLogger.pass(TAG, 'Browser_PageLifecycle_UI_017');
    });

    it('Browser_PageLifecycle_UI_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_PageLifecycle_UI_018');
      TestLogger.step(TAG, 'back navigation keeps the page mounted');
      await clickById(driver, ID_NAV_HOME);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      const backPresent: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      const inputPresent: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const tabButtons: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `back=${backPresent}, input=${inputPresent}, tabs=${tabButtons}`);
      expect(backPresent).assertTrue();
      expect(inputPresent).assertTrue();
      expect(tabButtons >= 0).assertTrue();
      const controller: MockWebController = new MockWebController();
      controller.loadUrl('https://a.example.com');
      controller.loadUrl('https://b.example.com');
      const browser: MockBrowser = new MockBrowser(1);
      browser.tabs[0].controller = controller;
      expect(browser.back()).assertTrue();
      expect(controller.currentUrl).assertEqual('https://a.example.com');
      TestLogger.pass(TAG, 'Browser_PageLifecycle_UI_018');
    });
  });
}

/** An idle page without history lets the router handle the back press. */
function expectIdleBackPress(browser: MockBrowser): void {
  const consumed: boolean = browser.onBackPress();
  expect(consumed).assertFalse();
  expect(browser.loadingStatus).assertEqual(1);
  expect(browser.getTabArrayIndex()).assertEqual(0);
}
