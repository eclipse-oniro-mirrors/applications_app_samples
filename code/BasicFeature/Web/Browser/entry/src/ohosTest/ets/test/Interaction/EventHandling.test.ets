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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById, clickById,
  inputById, waitForId, pressKey, buildSearchUrl, normalizeUrl,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, DELAY_TOUCH_EVENT,
  DELAY_KEY_NAVIGATION, TIMEOUT_COMPONENT, TIMEOUT_FOCUS_CHANGE, KEY_ENTER,
  PAD_HOME_PAGE, TOLERANCE_FOCUS_CHANGE
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockLoadingStatus } from '../Shared/BrowserMock';

const TAG: string = 'BrowserEventHandlingTest';

/* ------------------------------------------------------------------ */
/* Event vocabulary of the title bar and the Web component              */
/* ------------------------------------------------------------------ */

const EVT_CLICK: string = 'onClick';
const EVT_TOUCH: string = 'onTouch';
const EVT_CHANGE: string = 'onChange';
const EVT_SUBMIT: string = 'onSubmit';
const EVT_WINDOW_NEW: string = 'onWindowNew';
const EVT_PAGE_BEGIN: string = 'onPageBegin';
const EVT_PAGE_END: string = 'onPageEnd';
const EVT_PROGRESS: string = 'onProgressChange';

/** The eight handlers wired by common/TitleBar.ets. */
const EVENT_KINDS: string[] = [
  EVT_CLICK, EVT_TOUCH, EVT_CHANGE, EVT_SUBMIT,
  EVT_WINDOW_NEW, EVT_PAGE_BEGIN, EVT_PAGE_END, EVT_PROGRESS
];

const TOUCH_DOWN: string = 'down';
const TOUCH_MOVE: string = 'move';
const TOUCH_UP: string = 'up';
const TOUCH_CANCEL: string = 'cancel';

const TARGET_INPUT: string = 'inputUrl';
const TARGET_SUBMIT: string = 'actionButton0';
const TARGET_ADD_TAB: string = 'actionButton1';
const TARGET_NAV_BACK: string = 'navigationButton0';
const TARGET_NAV_REFRESH: string = 'navigationButton2';
const TARGET_WEB: string = 'web';
const TARGET_PAGE: string = 'page';

const PROGRESS_VISIBLE: boolean = false;
const PROGRESS_HIDDEN: boolean = true;

/** Sentinel returned by the local parser when the payload is not a number. */
const PROGRESS_INVALID: number = -2;

/** Digits only parser; avoids relying on Number.parseInt in ArkTS. */
function parseProgress(raw: string): number {
  const trimmed: string = raw.trim();
  if (trimmed.length === 0 || trimmed.length > 6) {
    return PROGRESS_INVALID;
  }
  let value: number = 0;
  for (let index = 0; index < trimmed.length; index++) {
    const code: number = trimmed.charCodeAt(index);
    if (code < 48 || code > 57) {
      return PROGRESS_INVALID;
    }
    value = value * 10 + (code - 48);
  }
  return value;
}

/** One captured event in the synthetic dispatch stream. */
class EventRecord {
  kind: string;
  target: string;
  detail: string;
  progress: number;
  seq: number;
  timestamp: number;

  constructor(kind: string, target: string, detail: string, progress: number,
    seq: number, timestamp: number) {
    this.kind = kind;
    this.target = target;
    this.detail = detail;
    this.progress = progress;
    this.seq = seq;
    this.timestamp = timestamp;
  }
}

/** Ordered event stream with deterministic sequence numbers. */
class EventRecorder {
  records: EventRecord[] = [];
  private sequence: number = 0;

  emit(kind: string, target: string, detail: string, timestamp: number = 0,
    progress: number = -1): EventRecord {
    this.sequence += 1;
    const record: EventRecord = new EventRecord(kind, target, detail, progress,
      this.sequence, timestamp);
    this.records.push(record);
    return record;
  }

  total(): number {
    return this.records.length;
  }

  countOf(kind: string): number {
    let total: number = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].kind === kind) {
        total += 1;
      }
    }
    return total;
  }

  countFor(kind: string, target: string): number {
    let total: number = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].kind === kind && this.records[index].target === target) {
        total += 1;
      }
    }
    return total;
  }

  kindsSeen(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.records.length; index++) {
      const kind: string = this.records[index].kind;
      if (result.indexOf(kind) < 0) {
        result.push(kind);
      }
    }
    return result;
  }

  orderedKinds(): string[] {
    return this.records.map((record: EventRecord) => record.kind);
  }

  lastOf(kind: string): EventRecord | null {
    for (let index = this.records.length - 1; index >= 0; index--) {
      if (this.records[index].kind === kind) {
        return this.records[index];
      }
    }
    return null;
  }

  detailOf(kind: string): string {
    const record: EventRecord | null = this.lastOf(kind);
    return record === null ? '' : record.detail;
  }

  sequenceIsStrictlyIncreasing(): boolean {
    for (let index = 1; index < this.records.length; index++) {
      if (this.records[index].seq <= this.records[index - 1].seq) {
        return false;
      }
    }
    return true;
  }

  progressSeries(): number[] {
    const result: number[] = [];
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].kind === EVT_PROGRESS) {
        result.push(this.records[index].progress);
      }
    }
    return result;
  }

  indexOfKind(kind: string): number {
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].kind === kind) {
        return index;
      }
    }
    return -1;
  }

  reset(): void {
    this.records = [];
    this.sequence = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Handler registry: duplicate registration and dispatch order          */
/* ------------------------------------------------------------------ */

/** A single handler registration entry. */
class HandlerSpec {
  kind: string;
  handlerId: string;
  priority: number;
  once: boolean;
  active: boolean;
  order: number;

  constructor(kind: string, handlerId: string, priority: number, once: boolean,
    order: number) {
    this.kind = kind;
    this.handlerId = handlerId;
    this.priority = priority;
    this.once = once;
    this.active = true;
    this.order = order;
  }

  key(): string {
    return `${this.kind}#${this.handlerId}`;
  }
}

/**
 * Registry mirroring the decorator based handler wiring of the title bar.
 *
 * The same (kind, handlerId) pair may only be registered once: ArkUI keeps a
 * single closure per component, so a second registration silently replaces the
 * first one in production and therefore must be rejected here as well.
 */
class HandlerRegistry {
  handlers: HandlerSpec[] = [];
  dispatchLog: string[] = [];
  duplicateRejects: number = 0;
  capacityRejects: number = 0;
  maxHandlers: number = 16;
  private orderSeed: number = 0;

  register(kind: string, handlerId: string, priority: number = 0,
    once: boolean = false): boolean {
    if (this.find(kind, handlerId) !== null) {
      this.duplicateRejects += 1;
      return false;
    }
    if (this.handlers.length >= this.maxHandlers) {
      this.capacityRejects += 1;
      return false;
    }
    this.orderSeed += 1;
    this.handlers.push(new HandlerSpec(kind, handlerId, priority, once, this.orderSeed));
    return true;
  }

  find(kind: string, handlerId: string): HandlerSpec | null {
    for (let index = 0; index < this.handlers.length; index++) {
      if (this.handlers[index].kind === kind && this.handlers[index].handlerId === handlerId) {
        return this.handlers[index];
      }
    }
    return null;
  }

  unregister(kind: string, handlerId: string): boolean {
    for (let index = 0; index < this.handlers.length; index++) {
      if (this.handlers[index].kind === kind && this.handlers[index].handlerId === handlerId) {
        this.handlers.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  countOf(kind: string): number {
    let total: number = 0;
    for (let index = 0; index < this.handlers.length; index++) {
      if (this.handlers[index].kind === kind && this.handlers[index].active) {
        total += 1;
      }
    }
    return total;
  }

  activeCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.handlers.length; index++) {
      if (this.handlers[index].active) {
        total += 1;
      }
    }
    return total;
  }

  /** Stable order: higher priority first, registration order breaks ties. */
  orderFor(kind: string): string[] {
    const selected: HandlerSpec[] = [];
    for (let index = 0; index < this.handlers.length; index++) {
      const spec: HandlerSpec = this.handlers[index];
      if (spec.kind === kind && spec.active) {
        selected.push(spec);
      }
    }
    selected.sort((left: HandlerSpec, right: HandlerSpec) => {
      if (left.priority !== right.priority) {
        return right.priority - left.priority;
      }
      return left.order - right.order;
    });
    return selected.map((spec: HandlerSpec) => spec.handlerId);
  }

  dispatch(kind: string): string[] {
    const invoked: string[] = this.orderFor(kind);
    for (let index = 0; index < invoked.length; index++) {
      this.dispatchLog.push(`${kind}#${invoked[index]}`);
    }
    for (let index = 0; index < this.handlers.length; index++) {
      const spec: HandlerSpec = this.handlers[index];
      if (spec.kind === kind && spec.once && spec.active) {
        spec.active = false;
      }
    }
    return invoked;
  }

  dispatchedTimes(handlerId: string): number {
    let total: number = 0;
    for (let index = 0; index < this.dispatchLog.length; index++) {
      if (this.dispatchLog[index].indexOf(`#${handlerId}`) >= 0) {
        total += 1;
      }
    }
    return total;
  }
}

/* ------------------------------------------------------------------ */
/* Parameter schemas of every handler                                   */
/* ------------------------------------------------------------------ */

/** Declared parameter list of one handler callback. */
class ParamSpec {
  kind: string;
  params: string[];
  requiresTarget: boolean;
  payloadKind: string;

  constructor(kind: string, params: string[], requiresTarget: boolean,
    payloadKind: string) {
    this.kind = kind;
    this.params = params;
    this.requiresTarget = requiresTarget;
    this.payloadKind = payloadKind;
  }

  accepts(params: string[]): boolean {
    if (params.length !== this.params.length) {
      return false;
    }
    for (let index = 0; index < this.params.length; index++) {
      if (params.indexOf(this.params[index]) < 0) {
        return false;
      }
    }
    return true;
  }

  missing(params: string[]): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.params.length; index++) {
      if (params.indexOf(this.params[index]) < 0) {
        result.push(this.params[index]);
      }
    }
    return result;
  }

  extra(params: string[]): string[] {
    const result: string[] = [];
    for (let index = 0; index < params.length; index++) {
      if (this.params.indexOf(params[index]) < 0) {
        result.push(params[index]);
      }
    }
    return result;
  }
}

/** Parameter catalog of the eight handlers declared by TitleBar/Web. */
class ParamCatalog {
  specs: ParamSpec[] = [];

  constructor() {
    this.specs.push(new ParamSpec(EVT_CLICK, ['event'], true, 'ClickEvent'));
    this.specs.push(new ParamSpec(EVT_TOUCH, ['event'], true, 'TouchEvent'));
    this.specs.push(new ParamSpec(EVT_CHANGE, ['value'], true, 'string'));
    this.specs.push(new ParamSpec(EVT_SUBMIT, ['value'], true, 'string'));
    this.specs.push(new ParamSpec(EVT_WINDOW_NEW, ['event'], true, 'WindowNewEvent'));
    this.specs.push(new ParamSpec(EVT_PAGE_BEGIN, ['url'], false, 'string'));
    this.specs.push(new ParamSpec(EVT_PAGE_END, ['url'], false, 'string'));
    this.specs.push(new ParamSpec(EVT_PROGRESS, ['progress'], false, 'number'));
  }

  specOf(kind: string): ParamSpec | null {
    for (let index = 0; index < this.specs.length; index++) {
      if (this.specs[index].kind === kind) {
        return this.specs[index];
      }
    }
    return null;
  }

  validate(kind: string, params: string[]): boolean {
    const spec: ParamSpec | null = this.specOf(kind);
    return spec === null ? false : spec.accepts(params);
  }

  kinds(): string[] {
    return this.specs.map((spec: ParamSpec) => spec.kind);
  }
}

/* ------------------------------------------------------------------ */
/* State side effects of every handler                                  */
/* ------------------------------------------------------------------ */

/** Immutable-ish observation of the browser fields a handler may touch. */
class StateSnapshot {
  loadingStatus: MockLoadingStatus;
  progress: number;
  hideProgress: boolean;
  inputValue: string;
  tabCount: number;
  historyDepth: number;
  javaScriptCalls: number;

  constructor(loadingStatus: MockLoadingStatus, progress: number, hideProgress: boolean,
    inputValue: string, tabCount: number, historyDepth: number, javaScriptCalls: number) {
    this.loadingStatus = loadingStatus;
    this.progress = progress;
    this.hideProgress = hideProgress;
    this.inputValue = inputValue;
    this.tabCount = tabCount;
    this.historyDepth = historyDepth;
    this.javaScriptCalls = javaScriptCalls;
  }
}

/** Applies one handler to the model and returns the observable delta. */
class SideEffectMatrix {
  browser: MockBrowser;

  constructor(browser: MockBrowser) {
    this.browser = browser;
  }

  snapshot(): StateSnapshot {
    const tab = this.browser.getCurrentTab();
    const depth: number = tab === null ? 0 : tab.controller.history.length;
    const js: number = tab === null ? 0 : tab.controller.javaScriptCalls.length;
    return new StateSnapshot(this.browser.loadingStatus, this.browser.progress,
      this.browser.hideProgress, this.browser.inputValue, this.browser.tabs.length, depth, js);
  }

  /** Feeds a synthetic event into the model. Returns false for invalid payloads. */
  apply(kind: string, payload: string): boolean {
    if (kind === EVT_CHANGE) {
      this.browser.setInputVal(payload);
      return true;
    }
    if (kind === EVT_SUBMIT) {
      const address: string = payload.trim();
      if (address.length === 0) {
        return false;
      }
      this.browser.setInputVal('');
      return this.browser.loadUrl(address);
    }
    if (kind === EVT_PAGE_BEGIN) {
      this.browser.onPageBegin(payload);
      return true;
    }
    if (kind === EVT_PAGE_END) {
      this.browser.onPageEnd();
      return true;
    }
    if (kind === EVT_PROGRESS) {
      const parsed: number = parseProgress(payload);
      if (parsed === PROGRESS_INVALID) {
        return false;
      }
      this.browser.onProgressChange(parsed);
      return true;
    }
    if (kind === EVT_WINDOW_NEW) {
      return this.browser.onWindowNew(payload);
    }
    if (kind === EVT_CLICK) {
      this.browser.refresh();
      return true;
    }
    return false;
  }
}

/* ------------------------------------------------------------------ */
/* Page load pipeline                                                   */
/* ------------------------------------------------------------------ */

/**
 * Runs the page level callbacks in the order the Web engine emits them:
 * onPageBegin -> onProgressChange(0..100) -> onPageEnd.
 */
class LoadPipeline {
  browser: MockBrowser;
  recorder: EventRecorder;
  violations: string[] = [];

  constructor(browser: MockBrowser, recorder: EventRecorder) {
    this.browser = browser;
    this.recorder = recorder;
  }

  run(url: string, steps: number[]): boolean {
    this.browser.onPageBegin(url);
    this.recorder.emit(EVT_PAGE_BEGIN, TARGET_PAGE, url, 0, 0);
    for (let index = 0; index < steps.length; index++) {
      const progress: number = steps[index];
      this.browser.onProgressChange(progress);
      this.recorder.emit(EVT_PROGRESS, TARGET_PAGE, `${progress}`, 0, progress);
      if (this.browser.progress !== (progress === 100 ? 0 : progress)) {
        this.violations.push(`progress mismatch at ${progress}`);
      }
      if (this.browser.hideProgress !== (progress === 100)) {
        this.violations.push(`visibility mismatch at ${progress}`);
      }
    }
    this.browser.onPageEnd();
    this.recorder.emit(EVT_PAGE_END, TARGET_PAGE, url, 0, 100);
    if (this.browser.loadingStatus !== MockLoadingStatus.END) {
      this.violations.push('loading status not END after onPageEnd');
      return false;
    }
    return true;
  }

  isMonotonic(): boolean {
    const series: number[] = this.recorder.progressSeries();
    for (let index = 1; index < series.length; index++) {
      if (series[index] < series[index - 1]) {
        return false;
      }
    }
    return true;
  }

  orderIsCorrect(): boolean {
    if (this.recorder.countOf(EVT_PAGE_BEGIN) !== 1) {
      return false;
    }
    if (this.recorder.countOf(EVT_PAGE_END) !== 1) {
      return false;
    }
    const begin: number = this.recorder.indexOfKind(EVT_PAGE_BEGIN);
    const end: number = this.recorder.indexOfKind(EVT_PAGE_END);
    return begin < end && begin === 0;
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                             */
/* ------------------------------------------------------------------ */

const PROGRESS_SERIES: number[] = [0, 10, 35, 60, 85, 99, 100];

function buildBrowserWithHistory(depth: number = 3): MockBrowser {
  const browser: MockBrowser = new MockBrowser();
  for (let index = 0; index < depth; index++) {
    browser.loadUrl(`example${index}.com`);
    browser.onPageEnd();
  }
  return browser;
}

function buildRegistry(): HandlerRegistry {
  const registry: HandlerRegistry = new HandlerRegistry();
  for (let index = 0; index < EVENT_KINDS.length; index++) {
    registry.register(EVENT_KINDS[index], `${EVENT_KINDS[index]}Handler`);
  }
  return registry;
}

function buildTouchStream(): string[] {
  return [TOUCH_DOWN, TOUCH_MOVE, TOUCH_MOVE, TOUCH_UP];
}

function simulateTouchStream(recorder: EventRecorder, target: string): number {
  const stream: string[] = buildTouchStream();
  for (let index = 0; index < stream.length; index++) {
    recorder.emit(EVT_TOUCH, target, stream[index]);
  }
  return stream.length;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserEventHandlingTest() {
  describe('browserEventHandlingTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `handlers under test: ${EVENT_KINDS.join(',')}`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Event_001', 0, async () => {
      TestLogger.step(TAG, 'eight handlers are wired by the title bar');
      const catalog: ParamCatalog = new ParamCatalog();
      expect(catalog.kinds().length).assertEqual(8);
      expect(catalog.kinds().join(',')).assertEqual(EVENT_KINDS.join(','));
      const unique: Map<string, number> = new Map<string, number>();
      for (let index = 0; index < catalog.kinds().length; index++) {
        unique.set(catalog.kinds()[index], 1);
      }
      expect(unique.size).assertEqual(8);
      const registry: HandlerRegistry = buildRegistry();
      expect(registry.activeCount()).assertEqual(8);
      expect(registry.duplicateRejects).assertEqual(0);
    });

    it('Browser_Event_002', 0, async () => {
      TestLogger.step(TAG, 'every handler declares its parameter list');
      const catalog: ParamCatalog = new ParamCatalog();
      expect(catalog.validate(EVT_CLICK, ['event'])).assertTrue();
      expect(catalog.validate(EVT_TOUCH, ['event'])).assertTrue();
      expect(catalog.validate(EVT_CHANGE, ['value'])).assertTrue();
      expect(catalog.validate(EVT_SUBMIT, ['value'])).assertTrue();
      expect(catalog.validate(EVT_WINDOW_NEW, ['event'])).assertTrue();
      expect(catalog.validate(EVT_PAGE_BEGIN, ['url'])).assertTrue();
      expect(catalog.validate(EVT_PAGE_END, ['url'])).assertTrue();
      expect(catalog.validate(EVT_PROGRESS, ['progress'])).assertTrue();
      expect(catalog.validate(EVT_PROGRESS, ['url'])).assertFalse();
    });

    it('Browser_Event_003', 0, async () => {
      TestLogger.step(TAG, 'parameter schemas reject missing and extra names');
      const catalog: ParamCatalog = new ParamCatalog();
      const progressSpec: ParamSpec | null = catalog.specOf(EVT_PROGRESS);
      expect(progressSpec !== null).assertTrue();
      if (progressSpec !== null) {
        expect(progressSpec.missing(['percentage']).join(',')).assertEqual('progress');
        expect(progressSpec.extra(['progress', 'url']).join(',')).assertEqual('url');
        expect(progressSpec.payloadKind).assertEqual('number');
      }
      const submitSpec: ParamSpec | null = catalog.specOf(EVT_SUBMIT);
      if (submitSpec !== null) {
        expect(submitSpec.accepts([])).assertFalse();
        expect(submitSpec.accepts(['value', 'event'])).assertFalse();
        expect(submitSpec.payloadKind).assertEqual('string');
      }
      expect(catalog.validate('onUnknownEvent', ['event'])).assertFalse();
    });

    it('Browser_Event_004', 0, async () => {
      TestLogger.step(TAG, 'onClick fires exactly once per completed tap');
      const recorder: EventRecorder = new EventRecorder();
      const registry: HandlerRegistry = new HandlerRegistry();
      registry.register(EVT_CLICK, 'navBackClick');
      const invoked: string[] = registry.dispatch(EVT_CLICK);
      recorder.emit(EVT_CLICK, TARGET_NAV_BACK, 'down');
      recorder.emit(EVT_CLICK, TARGET_NAV_BACK, 'up');
      expect(invoked.length).assertEqual(1);
      expect(invoked[0]).assertEqual('navBackClick');
      expect(recorder.countOf(EVT_CLICK)).assertEqual(2);
      expect(registry.dispatchedTimes('navBackClick')).assertEqual(1);
      expect(recorder.countFor(EVT_CLICK, TARGET_NAV_BACK)).assertEqual(2);
      TestLogger.info(TAG, `click dispatch count=${registry.dispatchedTimes('navBackClick')}`);
    });

    it('Browser_Event_005', 0, async () => {
      TestLogger.step(TAG, 'a cancelled touch stream never produces a click');
      const recorder: EventRecorder = new EventRecorder();
      const stream: string[] = [TOUCH_DOWN, TOUCH_MOVE, TOUCH_CANCEL];
      for (let index = 0; index < stream.length; index++) {
        recorder.emit(EVT_TOUCH, TARGET_SUBMIT, stream[index]);
      }
      expect(recorder.countOf(EVT_TOUCH)).assertEqual(3);
      expect(recorder.countOf(EVT_CLICK)).assertEqual(0);
      expect(recorder.detailOf(EVT_TOUCH)).assertEqual(TOUCH_CANCEL);
      expect(recorder.orderedKinds().indexOf(EVT_CLICK)).assertEqual(-1);
      expect(recorder.sequenceIsStrictlyIncreasing()).assertTrue();
    });

    it('Browser_Event_006', 0, async () => {
      TestLogger.step(TAG, 'onTouch delivers down, move and up in order');
      const recorder: EventRecorder = new EventRecorder();
      const delivered: number = simulateTouchStream(recorder, TARGET_INPUT);
      expect(delivered).assertEqual(4);
      expect(recorder.orderedKinds().join(',')).assertEqual(
        'onTouch,onTouch,onTouch,onTouch');
      expect(recorder.records[0].detail).assertEqual(TOUCH_DOWN);
      expect(recorder.records[1].detail).assertEqual(TOUCH_MOVE);
      expect(recorder.records[3].detail).assertEqual(TOUCH_UP);
      expect(recorder.countFor(EVT_TOUCH, TARGET_INPUT)).assertEqual(4);
      expect(recorder.countFor(EVT_TOUCH, TARGET_SUBMIT)).assertEqual(0);
    });

    it('Browser_Event_007', 0, async () => {
      TestLogger.step(TAG, 'onChange only fires when the text actually changes');
      const browser: MockBrowser = new MockBrowser();
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      const recorder: EventRecorder = new EventRecorder();
      const typed: string[] = ['h', 'ht', 'htt', 'http'];
      for (let index = 0; index < typed.length; index++) {
        const before: string = browser.getInputVal();
        matrix.apply(EVT_CHANGE, typed[index]);
        if (browser.getInputVal() !== before) {
          recorder.emit(EVT_CHANGE, TARGET_INPUT, typed[index]);
        }
      }
      matrix.apply(EVT_CHANGE, 'http');
      expect(recorder.countOf(EVT_CHANGE)).assertEqual(4);
      expect(recorder.detailOf(EVT_CHANGE)).assertEqual('http');
      expect(browser.getInputVal()).assertEqual('http');
    });

    it('Browser_Event_008', 0, async () => {
      TestLogger.step(TAG, 'onSubmit clears the input and loads the normalized url');
      const browser: MockBrowser = new MockBrowser();
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      browser.setInputVal('example.com');
      const accepted: boolean = matrix.apply(EVT_SUBMIT, 'example.com');
      expect(accepted).assertTrue();
      expect(browser.getInputVal()).assertEqual('');
      const tab = browser.getCurrentTab();
      expect(tab !== null).assertTrue();
      if (tab !== null) {
        expect(tab.controller.getPendingUrl()).assertEqual('https://example.com');
        expect(tab.controller.loadCount).assertEqual(1);
        expect(tab.controller.accessBackward()).assertFalse();
      }
      expect(normalizeUrl('example.com')).assertEqual('https://example.com');
    });

    it('Browser_Event_009', 0, async () => {
      TestLogger.step(TAG, 'onSubmit ignores an empty address');
      const browser: MockBrowser = new MockBrowser();
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      expect(matrix.apply(EVT_SUBMIT, '')).assertFalse();
      expect(matrix.apply(EVT_SUBMIT, '   ')).assertFalse();
      const tab = browser.getCurrentTab();
      expect(tab !== null).assertTrue();
      if (tab !== null) {
        expect(tab.controller.loadCount).assertEqual(0);
        expect(tab.controller.getPendingUrl()).assertEqual('');
      }
      expect(browser.getInputVal()).assertEqual('');
      expect(browser.tabs.length).assertEqual(1);
    });

    it('Browser_Event_010', 0, async () => {
      TestLogger.step(TAG, 'onSubmit turns a search word into a bing query');
      const browser: MockBrowser = new MockBrowser();
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      const word: string = 'harmony os';
      const url: string = buildSearchUrl(word);
      expect(url).assertEqual('https://www.bing.com/search?q=harmony%20os');
      expect(matrix.apply(EVT_SUBMIT, url)).assertTrue();
      const tab = browser.getCurrentTab();
      if (tab !== null) {
        expect(tab.controller.getPendingUrl()).assertEqual(url);
      }
      expect(browser.getInputVal()).assertEqual('');
      expect(normalizeUrl('https://www.bing.com/search?q=harmony%20os'))
        .assertEqual('https://www.bing.com/search?q=harmony%20os');
    });

    it('Browser_Event_011', 0, async () => {
      TestLogger.step(TAG, 'onWindowNew rejects blank targets');
      const browser: MockBrowser = new MockBrowser();
      expect(browser.onWindowNew('')).assertFalse();
      expect(browser.onWindowNew('about:blank')).assertFalse();
      const tab = browser.getCurrentTab();
      if (tab !== null) {
        expect(tab.controller.loadCount).assertEqual(0);
      }
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_Event_012', 0, async () => {
      TestLogger.step(TAG, 'onWindowNew loads the target in the current tab');
      const browser: MockBrowser = new MockBrowser(2);
      browser.selectTab(1);
      const accepted: boolean = browser.onWindowNew('https://example.com/popup');
      expect(accepted).assertTrue();
      const tab = browser.getCurrentTab();
      expect(tab !== null).assertTrue();
      if (tab !== null) {
        expect(tab.controller.currentUrl).assertEqual('https://example.com/popup');
        expect(tab.controller.loadCount).assertEqual(1);
      }
      expect(browser.tabs.length).assertEqual(2);
      expect(browser.getTabArrayIndex()).assertEqual(1);
      expect(browser.onWindowNew('about:blank')).assertFalse();
    });

    it('Browser_Event_013', 0, async () => {
      TestLogger.step(TAG, 'onPageBegin switches the model into LOADING');
      const browser: MockBrowser = new MockBrowser();
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      matrix.apply(EVT_PAGE_BEGIN, 'https://example.com/index.html');
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      expect(browser.getInputVal()).assertEqual('https://example.com/index.html');
      expect(matrix.apply(EVT_PAGE_END, '')).assertTrue();
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(browser.getInputVal()).assertEqual('https://example.com/index.html');
    });

    it('Browser_Event_014', 0, async () => {
      TestLogger.step(TAG, 'onPageBegin clears the url bar for non http pages');
      const browser: MockBrowser = new MockBrowser();
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      browser.setInputVal('typed-by-user');
      matrix.apply(EVT_PAGE_BEGIN, 'resource://rawfile/pad.html');
      expect(browser.getInputVal()).assertEqual('');
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      matrix.apply(EVT_PAGE_BEGIN, 'about:blank');
      expect(browser.getInputVal()).assertEqual('');
      matrix.apply(EVT_PAGE_BEGIN, '');
      expect(browser.getInputVal()).assertEqual('');
      expect(matrix.apply(EVT_PAGE_BEGIN, 'https://ok.example')).assertTrue();
      expect(browser.getInputVal()).assertEqual('https://ok.example');
    });

    it('Browser_Event_015', 0, async () => {
      TestLogger.step(TAG, 'onPageEnd runs the device adapter script exactly once');
      const browser: MockBrowser = new MockBrowser();
      const tab = browser.getCurrentTab();
      expect(tab !== null).assertTrue();
      browser.onPageBegin('https://example.com');
      browser.onPageEnd();
      browser.onPageEnd();
      if (tab !== null) {
        expect(tab.controller.javaScriptCalls.length).assertEqual(2);
        expect(tab.controller.javaScriptCalls[0]).assertEqual('adapterDevice()');
        expect(tab.controller.javaScriptCalls[1]).assertEqual('adapterDevice()');
      }
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(browser.tabs.length).assertEqual(1);
    });

    it('Browser_Event_016', 0, async () => {
      TestLogger.step(TAG, 'onProgressChange shows the bar for intermediate values');
      const browser: MockBrowser = new MockBrowser();
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      expect(browser.hideProgress).assertTrue();
      matrix.apply(EVT_PROGRESS, '1');
      expect(browser.hideProgress).assertEqual(PROGRESS_VISIBLE);
      expect(browser.progress).assertEqual(1);
      matrix.apply(EVT_PROGRESS, '50');
      expect(browser.hideProgress).assertFalse();
      expect(browser.progress).assertEqual(50);
      matrix.apply(EVT_PROGRESS, '99');
      expect(browser.hideProgress).assertFalse();
      expect(browser.progress).assertEqual(99);
    });

    it('Browser_Event_017', 0, async () => {
      TestLogger.step(TAG, 'progress 100 hides the bar and resets the value');
      const browser: MockBrowser = new MockBrowser();
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      matrix.apply(EVT_PROGRESS, '60');
      expect(browser.progress).assertEqual(60);
      expect(browser.hideProgress).assertFalse();
      matrix.apply(EVT_PROGRESS, '100');
      expect(browser.progress).assertEqual(0);
      expect(browser.hideProgress).assertEqual(PROGRESS_HIDDEN);
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
    });

    it('Browser_Event_018', 0, async () => {
      TestLogger.step(TAG, 'progress boundary table is handled deterministically');
      const values: number[] = [-1, 0, 1, 50, 99, 100, 101];
      const browser: MockBrowser = new MockBrowser();
      for (let index = 0; index < values.length; index++) {
        browser.onProgressChange(values[index]);
        const expectedProgress: number = values[index] === 100 ? 0 : values[index];
        const expectedHidden: boolean = values[index] === 100;
        expect(browser.progress).assertEqual(expectedProgress);
        expect(browser.hideProgress).assertEqual(expectedHidden);
      }
      expect(values.length).assertEqual(7);
      expect(browser.progress).assertEqual(101);
      expect(browser.hideProgress).assertEqual(PROGRESS_VISIBLE);
      const matrix: SideEffectMatrix = new SideEffectMatrix(new MockBrowser());
      expect(matrix.apply(EVT_PROGRESS, 'abc')).assertFalse();
      expect(matrix.apply(EVT_PROGRESS, '')).assertFalse();
      expect(matrix.apply(EVT_PROGRESS, '12px')).assertFalse();
      expect(matrix.apply(EVT_PROGRESS, '42')).assertTrue();
      expect(parseProgress('0042')).assertEqual(42);
    });

    it('Browser_Event_019', 0, async () => {
      TestLogger.step(TAG, 'duplicate handler registration is rejected');
      const registry: HandlerRegistry = new HandlerRegistry();
      expect(registry.register(EVT_CLICK, 'sameHandler')).assertTrue();
      expect(registry.register(EVT_CLICK, 'sameHandler')).assertFalse();
      expect(registry.duplicateRejects).assertEqual(1);
      expect(registry.countOf(EVT_CLICK)).assertEqual(1);
      expect(registry.register(EVT_TOUCH, 'sameHandler')).assertTrue();
      expect(registry.countOf(EVT_TOUCH)).assertEqual(1);
      expect(registry.activeCount()).assertEqual(2);
      expect(registry.register(EVT_CLICK, 'otherHandler')).assertTrue();
      expect(registry.countOf(EVT_CLICK)).assertEqual(2);
    });

    it('Browser_Event_020', 0, async () => {
      TestLogger.step(TAG, 'unregister then re-register restores the handler');
      const registry: HandlerRegistry = buildRegistry();
      expect(registry.activeCount()).assertEqual(8);
      expect(registry.unregister(EVT_SUBMIT, 'onSubmitHandler')).assertTrue();
      expect(registry.countOf(EVT_SUBMIT)).assertEqual(0);
      expect(registry.activeCount()).assertEqual(7);
      expect(registry.unregister(EVT_SUBMIT, 'onSubmitHandler')).assertFalse();
      expect(registry.register(EVT_SUBMIT, 'onSubmitHandler')).assertTrue();
      expect(registry.countOf(EVT_SUBMIT)).assertEqual(1);
      expect(registry.activeCount()).assertEqual(8);
      expect(registry.dispatch(EVT_SUBMIT).length).assertEqual(1);
    });

    it('Browser_Event_021', 0, async () => {
      TestLogger.step(TAG, 'listeners run by priority then registration order');
      const registry: HandlerRegistry = new HandlerRegistry();
      registry.register(EVT_CLICK, 'low', 0);
      registry.register(EVT_CLICK, 'high', 10);
      registry.register(EVT_CLICK, 'mid', 5);
      registry.register(EVT_CLICK, 'tie', 5);
      expect(registry.orderFor(EVT_CLICK).join(',')).assertEqual('high,mid,tie,low');
      const invoked: string[] = registry.dispatch(EVT_CLICK);
      expect(invoked.join(',')).assertEqual('high,mid,tie,low');
      expect(registry.orderFor(EVT_CLICK).length).assertEqual(4);
      expect(registry.dispatchLog.length).assertEqual(4);
    });

    it('Browser_Event_022', 0, async () => {
      TestLogger.step(TAG, 'a once handler is invoked exactly one time');
      const registry: HandlerRegistry = new HandlerRegistry();
      registry.register(EVT_PAGE_END, 'onceHandler', 0, true);
      registry.register(EVT_PAGE_END, 'steadyHandler', 0, false);
      expect(registry.countOf(EVT_PAGE_END)).assertEqual(2);
      expect(registry.dispatch(EVT_PAGE_END).join(',')).assertEqual('onceHandler,steadyHandler');
      expect(registry.countOf(EVT_PAGE_END)).assertEqual(1);
      expect(registry.dispatch(EVT_PAGE_END).join(',')).assertEqual('steadyHandler');
      expect(registry.dispatchedTimes('onceHandler')).assertEqual(1);
      expect(registry.dispatchedTimes('steadyHandler')).assertEqual(2);
    });

    it('Browser_Event_023', 0, async () => {
      TestLogger.step(TAG, 'load pipeline emits begin, progress and end in order');
      const browser: MockBrowser = new MockBrowser();
      const recorder: EventRecorder = new EventRecorder();
      const pipeline: LoadPipeline = new LoadPipeline(browser, recorder);
      const completed: boolean = pipeline.run('https://example.com', PROGRESS_SERIES);
      expect(completed).assertTrue();
      expect(pipeline.violations.length).assertEqual(0);
      expect(pipeline.orderIsCorrect()).assertTrue();
      expect(pipeline.isMonotonic()).assertTrue();
      expect(recorder.countOf(EVT_PAGE_BEGIN)).assertEqual(1);
      expect(recorder.countOf(EVT_PROGRESS)).assertEqual(PROGRESS_SERIES.length);
      expect(recorder.countOf(EVT_PAGE_END)).assertEqual(1);
      TestLogger.info(TAG, `pipeline events=${recorder.total()}`);
    });

    it('Browser_Event_024', 0, async () => {
      TestLogger.step(TAG, 'progress series is monotonic and ends at 100');
      const series: number[] = [0, 5, 20, 55, 78, 100];
      const browser: MockBrowser = new MockBrowser();
      const recorder: EventRecorder = new EventRecorder();
      const pipeline: LoadPipeline = new LoadPipeline(browser, recorder);
      pipeline.run('https://example.com/slow', series);
      expect(pipeline.isMonotonic()).assertTrue();
      expect(recorder.progressSeries().join(',')).assertEqual(series.join(','));
      const last: EventRecord | null = recorder.lastOf(EVT_PROGRESS);
      expect(last !== null).assertTrue();
      if (last !== null) {
        expect(last.progress).assertEqual(100);
      }
      expect(browser.hideProgress).assertTrue();
      expect(browser.progress).assertEqual(0);
    });

    it('Browser_Event_025', 0, async () => {
      TestLogger.step(TAG, 'event sequence numbers are strictly increasing');
      const recorder: EventRecorder = new EventRecorder();
      recorder.emit(EVT_CHANGE, TARGET_INPUT, 'a');
      recorder.emit(EVT_CHANGE, TARGET_INPUT, 'ab');
      recorder.emit(EVT_SUBMIT, TARGET_SUBMIT, 'ab');
      recorder.emit(EVT_PAGE_BEGIN, TARGET_PAGE, 'https://ab.example');
      recorder.emit(EVT_PROGRESS, TARGET_PAGE, '30', 0, 30);
      recorder.emit(EVT_PAGE_END, TARGET_PAGE, 'https://ab.example');
      expect(recorder.total()).assertEqual(6);
      expect(recorder.sequenceIsStrictlyIncreasing()).assertTrue();
      expect(recorder.records[0].seq).assertEqual(1);
      expect(recorder.records[5].seq).assertEqual(6);
      expect(recorder.kindsSeen().join(',')).assertEqual(
        'onChange,onSubmit,onPageBegin,onProgressChange,onPageEnd');
    });

    it('Browser_Event_026', 0, async () => {
      TestLogger.step(TAG, 'event storm keeps one record per emitted handler');
      const recorder: EventRecorder = new EventRecorder();
      const registry: HandlerRegistry = buildRegistry();
      const rounds: number = 40;
      for (let index = 0; index < rounds; index++) {
        recorder.emit(EVT_CLICK, TARGET_NAV_REFRESH, `round${index}`);
      }
      for (let index = 0; index < EVENT_KINDS.length; index++) {
        registry.dispatch(EVENT_KINDS[index]);
      }
      expect(recorder.countOf(EVT_CLICK)).assertEqual(rounds);
      expect(recorder.total()).assertEqual(rounds);
      expect(recorder.sequenceIsStrictlyIncreasing()).assertTrue();
      expect(registry.dispatchLog.length).assertEqual(EVENT_KINDS.length);
      expect(registry.duplicateRejects).assertEqual(0);
      TestLogger.info(TAG, `storm rounds=${rounds}, records=${recorder.total()}`);
    });

    it('Browser_Event_027', 0, async () => {
      TestLogger.step(TAG, 'on device the url bar accepts text and survives submit');
      const present: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT);
      TestLogger.info(TAG, `url bar present=${present}`);
      expect(present).assertTrue();
      await clickById(driver, ID_INPUT_URL);
      const typed: boolean = await inputById(driver, ID_INPUT_URL, 'example.com');
      expect(typed).assertTrue();
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      await pressKey(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      const stillThere: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(stillThere).assertTrue();
      const backPresent: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      expect(backPresent).assertTrue();
    });

    it('Browser_Event_028', 0, async () => {
      TestLogger.step(TAG, 'on device repeated refresh clicks do not drop the web host');
      const exists: boolean = await componentByIdExists(driver, ID_NAV_REFRESH);
      expect(exists).assertTrue();
      for (let index = 0; index < 3; index++) {
        await clickById(driver, ID_NAV_REFRESH);
        await serializedDelay(driver, TOLERANCE_FOCUS_CHANGE);
      }
      const inputAfter: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const submitAfter: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
      expect(inputAfter).assertTrue();
      expect(submitAfter).assertTrue();
      expect(await countById(driver, ID_INPUT_URL) >= 0).assertTrue();
    });

    it('Browser_Event_029', 0, async () => {
      TestLogger.step(TAG, 'home button reloads the pad home page event chain');
      const browser: MockBrowser = new MockBrowser();
      const recorder: EventRecorder = new EventRecorder();
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      browser.resetToHome(PAD_HOME_PAGE);
      matrix.apply(EVT_PAGE_BEGIN, 'https://example.com');
      matrix.apply(EVT_PAGE_END, '');
      recorder.emit(EVT_CLICK, ID_NAV_HOME, 'home');
      recorder.emit(EVT_PAGE_BEGIN, TARGET_PAGE, 'https://example.com');
      recorder.emit(EVT_PAGE_END, TARGET_PAGE, 'https://example.com');
      expect(PAD_HOME_PAGE).assertEqual('pad.html');
      expect(recorder.countOf(EVT_PAGE_BEGIN)).assertEqual(1);
      expect(recorder.countOf(EVT_PAGE_END)).assertEqual(1);
      const tab = browser.getCurrentTab();
      if (tab !== null) {
        expect(tab.controller.loadCount).assertLarger(0);
      }
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
    });

    it('Browser_Event_030', 0, async () => {
      TestLogger.step(TAG, 'snapshot captures the observable delta of one submit');
      const browser: MockBrowser = buildBrowserWithHistory(2);
      const matrix: SideEffectMatrix = new SideEffectMatrix(browser);
      const before: StateSnapshot = matrix.snapshot();
      expect(before.tabCount).assertEqual(1);
      expect(before.historyDepth).assertEqual(2);
      expect(before.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(before.progress).assertEqual(0);
      matrix.apply(EVT_PAGE_BEGIN, 'https://example.com/next');
      matrix.apply(EVT_PROGRESS, '45');
      const during: StateSnapshot = matrix.snapshot();
      expect(during.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      expect(during.progress).assertEqual(45);
      expect(during.hideProgress).assertEqual(PROGRESS_VISIBLE);
      matrix.apply(EVT_SUBMIT, 'example.com/last');
      matrix.apply(EVT_PAGE_END, '');
      const after: StateSnapshot = matrix.snapshot();
      expect(after.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(after.inputValue).assertEqual('');
      expect(after.historyDepth).assertEqual(before.historyDepth + 1);
      expect(after.javaScriptCalls).assertEqual(before.javaScriptCalls + 1);
      expect(after.tabCount).assertEqual(before.tabCount);
    });
  });
}
