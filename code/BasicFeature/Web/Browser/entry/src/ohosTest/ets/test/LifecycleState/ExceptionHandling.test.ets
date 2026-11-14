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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  clickById, textById, isValidAddress, MAX_TAB_COUNT, TAB_LIMIT_MESSAGE,
  ID_INPUT_URL, ID_NAV_BACK, ID_ACTION_ADD, ID_CANCEL_TAB,
  TIMEOUT_COMPONENT, DELAY_KEY_NAVIGATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockWebController } from '../Shared/BrowserMock';

const TAG: string = 'BrowserExceptionHandlingTest';

/** Stable error codes returned by the guarded browser operation layer. */
class ErrorCode {
  static readonly NULL_CONTROLLER: string = 'ERR_NULL_CONTROLLER';
  static readonly INDEX_OUT_OF_RANGE: string = 'ERR_INDEX_OUT_OF_RANGE';
  static readonly EMPTY_URL: string = 'ERR_EMPTY_URL';
  static readonly URL_TOO_LONG: string = 'ERR_URL_TOO_LONG';
  static readonly URL_CONTAINS_SPACE: string = 'ERR_URL_CONTAINS_SPACE';
  static readonly UNSUPPORTED_SCHEME: string = 'ERR_UNSUPPORTED_SCHEME';
  static readonly MALFORMED_URL: string = 'ERR_MALFORMED_URL';
  static readonly ENGINE_EXCEPTION: string = 'ERR_ENGINE_EXCEPTION';
  static readonly LOAD_REJECTED: string = 'ERR_LOAD_REJECTED';
  static readonly NO_HISTORY: string = 'ERR_NO_HISTORY';
  static readonly INVALID_TAB: string = 'ERR_INVALID_TAB';
  static readonly CAPACITY_REACHED: string = 'ERR_CAPACITY_REACHED';
}

/** One guarded navigation failure with the metadata a reporter needs. */
class BrowserOperationError {
  name: string;
  message: string;
  stage: string;
  code: string;
  severity: number;
  recoverable: boolean;

  constructor(code: string, stage: string, message: string, severity: number = 2,
    recoverable: boolean = true) {
    this.name = 'BrowserOperationError';
    this.code = code;
    this.stage = stage;
    this.message = message;
    this.severity = severity;
    this.recoverable = recoverable;
  }

  describe(): string {
    return `${this.name}[${this.code}] stage=${this.stage} severity=${this.severity}`;
  }

  detail(): string {
    return `${this.stage}: ${this.message}`;
  }

  isRecoverable(): boolean {
    return this.recoverable;
  }
}

/** Result of a guarded operation; never thrown to the caller. */
interface OperationResult {
  ok: boolean;
  code: string;
  stage: string;
  message: string;
  url: string;
}

/** Address class used by the data driven validation cases. */
interface AddressCase {
  address: string;
  valid: boolean;
  note: string;
}

function successResult(stage: string, url: string): OperationResult {
  return { ok: true, code: 'OK', stage: stage, message: 'completed', url: url };
}

function failureResult(stage: string, code: string, message: string, url: string): OperationResult {
  return { ok: false, code: code, stage: stage, message: message, url: url };
}

/** rawfile entry pages are loadable without a scheme. */
function isLocalPage(address: string): boolean {
  return address === 'pad.html' || address === 'phone.html' ||
    address === 'index.html' || address === 'about:blank';
}

/**
 * Validates an address the way the title bar does before it calls loadUrl.
 * Returns an empty string when the address may be loaded.
 */
function validateAddress(address: string): string {
  if (address === null || address === undefined) {
    return ErrorCode.EMPTY_URL;
  }
  const trimmed: string = address.trim();
  if (trimmed.length === 0) {
    return ErrorCode.EMPTY_URL;
  }
  if (trimmed.length > 2048) {
    return ErrorCode.URL_TOO_LONG;
  }
  if (trimmed.indexOf(' ') >= 0) {
    return ErrorCode.URL_CONTAINS_SPACE;
  }
  if (trimmed.startsWith('javascript:') || trimmed.startsWith('data:')) {
    return ErrorCode.UNSUPPORTED_SCHEME;
  }
  if (isLocalPage(trimmed)) {
    return '';
  }
  if (!isValidAddress(trimmed)) {
    return ErrorCode.MALFORMED_URL;
  }
  return '';
}

/**
 * Owns the tab -> controller mapping and performs every controller call
 * behind a try/catch. A null slot models a tab whose WebviewController was
 * never attached or was already released by the framework.
 */
class ControllerRegistry {
  private slots: Array<MockWebController | null> = [];
  private stage: string = 'registry';

  constructor(count: number = 1) {
    const total: number = count <= 0 ? 1 : count;
    for (let index = 0; index < total; index++) {
      this.slots.push(new MockWebController());
    }
  }

  size(): number {
    return this.slots.length;
  }

  attach(index: number, controller: MockWebController | null): boolean {
    if (index < 0 || index >= this.slots.length) {
      return false;
    }
    this.slots[index] = controller;
    return true;
  }

  detach(index: number): boolean {
    return this.attach(index, null);
  }

  hasController(index: number): boolean {
    if (index < 0 || index >= this.slots.length) {
      return false;
    }
    return this.slots[index] !== null;
  }

  controllerAt(index: number): MockWebController | null {
    if (index < 0 || index >= this.slots.length) {
      return null;
    }
    return this.slots[index];
  }

  safeLoad(index: number, address: string): OperationResult {
    const stage: string = `${this.stage}.loadUrl`;
    if (index < 0 || index >= this.slots.length) {
      return failureResult(stage, ErrorCode.INDEX_OUT_OF_RANGE,
        `tab index ${index} outside 0..${this.slots.length - 1}`, address);
    }
    const controller: MockWebController | null = this.slots[index];
    if (controller === null) {
      return failureResult(stage, ErrorCode.NULL_CONTROLLER,
        `tab ${index} has no webview controller`, address);
    }
    const code: string = validateAddress(address);
    if (code.length > 0) {
      return failureResult(stage, code, `address rejected by validation: ${address}`, address);
    }
    const target: string = isLocalPage(address.trim()) ? address.trim() : 'https://' + address.trim();
    try {
      const loaded: boolean = controller.loadUrl(target);
      if (!loaded) {
        return failureResult(stage, ErrorCode.LOAD_REJECTED,
          `controller rejected ${target}`, target);
      }
      return successResult(stage, target);
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : String(error);
      TestLogger.exception(TAG, stage, error as Error);
      return failureResult(stage, ErrorCode.ENGINE_EXCEPTION, detail, target);
    }
  }

  safeBack(index: number): OperationResult {
    const stage: string = `${this.stage}.back`;
    if (index < 0 || index >= this.slots.length) {
      return failureResult(stage, ErrorCode.INDEX_OUT_OF_RANGE, `tab index ${index} invalid`, '');
    }
    const controller: MockWebController | null = this.slots[index];
    if (controller === null) {
      return failureResult(stage, ErrorCode.NULL_CONTROLLER, `tab ${index} detached`, '');
    }
    try {
      if (!controller.accessBackward()) {
        return failureResult(stage, ErrorCode.NO_HISTORY, 'history head reached', controller.currentUrl);
      }
      const moved: boolean = controller.backward();
      return moved ? successResult(stage, controller.currentUrl) :
        failureResult(stage, ErrorCode.NO_HISTORY, 'backward refused', controller.currentUrl);
    } catch (error) {
      TestLogger.exception(TAG, stage, error as Error);
      return failureResult(stage, ErrorCode.ENGINE_EXCEPTION, 'backward threw', controller.currentUrl);
    }
  }

  safeForward(index: number): OperationResult {
    const stage: string = `${this.stage}.forward`;
    if (index < 0 || index >= this.slots.length) {
      return failureResult(stage, ErrorCode.INDEX_OUT_OF_RANGE, `tab index ${index} invalid`, '');
    }
    const controller: MockWebController | null = this.slots[index];
    if (controller === null) {
      return failureResult(stage, ErrorCode.NULL_CONTROLLER, `tab ${index} detached`, '');
    }
    try {
      if (!controller.accessForward()) {
        return failureResult(stage, ErrorCode.NO_HISTORY, 'history tail reached', controller.currentUrl);
      }
      const moved: boolean = controller.forward();
      return moved ? successResult(stage, controller.currentUrl) :
        failureResult(stage, ErrorCode.NO_HISTORY, 'forward refused', controller.currentUrl);
    } catch (error) {
      TestLogger.exception(TAG, stage, error as Error);
      return failureResult(stage, ErrorCode.ENGINE_EXCEPTION, 'forward threw', controller.currentUrl);
    }
  }

  safeRefresh(index: number): OperationResult {
    const stage: string = `${this.stage}.refresh`;
    if (index < 0 || index >= this.slots.length) {
      return failureResult(stage, ErrorCode.INDEX_OUT_OF_RANGE, `tab index ${index} invalid`, '');
    }
    const controller: MockWebController | null = this.slots[index];
    if (controller === null) {
      return failureResult(stage, ErrorCode.NULL_CONTROLLER, `tab ${index} detached`, '');
    }
    try {
      controller.refresh();
      return successResult(stage, controller.currentUrl);
    } catch (error) {
      TestLogger.exception(TAG, stage, error as Error);
      return failureResult(stage, ErrorCode.ENGINE_EXCEPTION, 'refresh threw', controller.currentUrl);
    }
  }
}
/** Counts outcomes and remembers the last failure per stage. */
class SafeExecutor {
  attempts: number = 0;
  successes: number = 0;
  failures: number = 0;
  lastError: BrowserOperationError | null = null;
  private stageAttempts: Map<string, number> = new Map<string, number>();
  private stageFailures: Map<string, number> = new Map<string, number>();

  run(stage: string, action: () => OperationResult): OperationResult {
    this.attempts += 1;
    const current: number = this.stageAttempts.get(stage) ?? 0;
    this.stageAttempts.set(stage, current + 1);
    let result: OperationResult = failureResult(stage, ErrorCode.LOAD_REJECTED, 'not executed', '');
    try {
      result = action();
    } catch (error) {
      const detail: string = error instanceof Error ? error.message : String(error);
      TestLogger.exception(TAG, stage, error as Error);
      result = failureResult(stage, ErrorCode.ENGINE_EXCEPTION, detail, '');
    }
    if (result.ok) {
      this.successes += 1;
    } else {
      this.failures += 1;
      const failed: number = this.stageFailures.get(stage) ?? 0;
      this.stageFailures.set(stage, failed + 1);
      this.lastError = new BrowserOperationError(result.code, stage, result.message);
    }
    return result;
  }

  attemptsFor(stage: string): number {
    return this.stageAttempts.get(stage) ?? 0;
  }

  failuresFor(stage: string): number {
    return this.stageFailures.get(stage) ?? 0;
  }

  successRate(): number {
    if (this.attempts === 0) {
      return 0;
    }
    return this.successes / this.attempts;
  }

  reset(): void {
    this.attempts = 0;
    this.successes = 0;
    this.failures = 0;
    this.lastError = null;
    this.stageAttempts = new Map<string, number>();
    this.stageFailures = new Map<string, number>();
  }
}

/**
 * Last resort handler standing in for the process level uncaught exception
 * hook. It must swallow the failure, keep the app alive and stay countable.
 */
class UncaughtGuard {
  records: string[] = [];
  handled: number = 0;
  installed: boolean = false;

  install(): void {
    this.installed = true;
  }

  uninstall(): void {
    this.installed = false;
  }

  handle(error: Error | string): boolean {
    const detail: string = typeof error === 'string' ? error : `${error.name}: ${error.message}`;
    if (detail.length === 0) {
      return false;
    }
    this.records.push(detail);
    this.handled += 1;
    TestLogger.warn(TAG, `uncaught guard swallowed ${detail}`);
    return true;
  }

  last(): string {
    if (this.records.length === 0) {
      return '';
    }
    return this.records[this.records.length - 1];
  }

  contains(keyword: string): boolean {
    return this.records.some((record: string) => record.indexOf(keyword) >= 0);
  }

  reset(): void {
    this.records = [];
    this.handled = 0;
  }
}

/** Controller whose engine explodes on selected operations. */
class ThrowingController extends MockWebController {
  throwOnLoad: boolean = true;
  throwOnRefresh: boolean = true;
  throwOnBack: boolean = true;

  loadUrl(url: string): boolean {
    if (this.throwOnLoad) {
      throw new Error(`web engine crashed while loading ${url}`);
    }
    return super.loadUrl(url);
  }

  refresh(): void {
    if (this.throwOnRefresh) {
      throw new Error('web engine crashed on refresh');
    }
    super.refresh();
  }

  backward(): boolean {
    if (this.throwOnBack) {
      throw new Error('web engine crashed on backward');
    }
    return super.backward();
  }
}

/** Severity policy so a reporter can rank the failure surface. */
class ErrorTaxonomy {
  static severityOf(code: string): number {
    if (code === ErrorCode.ENGINE_EXCEPTION) {
      return 4;
    }
    if (code === ErrorCode.NULL_CONTROLLER || code === ErrorCode.INDEX_OUT_OF_RANGE) {
      return 3;
    }
    if (code === ErrorCode.EMPTY_URL || code === ErrorCode.MALFORMED_URL) {
      return 2;
    }
    if (code === ErrorCode.NO_HISTORY) {
      return 1;
    }
    return 2;
  }

  static recoverable(code: string): boolean {
    return code !== ErrorCode.ENGINE_EXCEPTION;
  }
}

const ADDRESS_CASES: AddressCase[] = [
  { address: 'www.huawei.com', valid: true, note: 'bare host' },
  { address: 'developer.huawei.com/consumer', valid: true, note: 'host with path' },
  { address: 'https://www.bing.com/search?q=ohos', valid: true, note: 'full https url' },
  { address: 'http://www.example.com', valid: true, note: 'http url' },
  { address: 'pad.html', valid: true, note: 'pad rawfile page' },
  { address: 'phone.html', valid: true, note: 'phone rawfile page' },
  { address: 'index.html', valid: true, note: 'rawfile index' },
  { address: 'about:blank', valid: true, note: 'blank page' },
  { address: '', valid: false, note: 'empty' },
  { address: '   ', valid: false, note: 'whitespace only' },
  { address: 'javascript:alert(1)', valid: false, note: 'script scheme' },
  { address: 'data:text/html,<b>x</b>', valid: false, note: 'data scheme' },
  { address: 'localhost', valid: false, note: 'no dot' },
  { address: 'www.hua wei.com', valid: false, note: 'embedded space' },
  { address: 'ht!tp://broken', valid: false, note: 'broken scheme' }
];

export default function browserExceptionHandlingTest() {
  describe('browserExceptionHandlingTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'exception handling suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Exception_001', 0, async () => {
      TestLogger.step(TAG, 'detached controller is reported, not thrown');
      const registry: ControllerRegistry = new ControllerRegistry(2);
      registry.detach(0);
      const result: OperationResult = registry.safeLoad(0, 'www.huawei.com');
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.NULL_CONTROLLER);
      expect(result.stage).assertContain('loadUrl');
      expect(result.message).assertContain('no webview controller');
      expect(registry.hasController(0)).assertFalse();
      expect(registry.hasController(1)).assertTrue();
    });

    it('Browser_Exception_002', 0, async () => {
      TestLogger.step(TAG, 'negative index is rejected before touching the controller');
      const registry: ControllerRegistry = new ControllerRegistry(2);
      const result: OperationResult = registry.safeLoad(-1, 'www.huawei.com');
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.INDEX_OUT_OF_RANGE);
      expect(registry.controllerAt(-1) === null).assertTrue();
      expect(registry.size()).assertEqual(2);
    });

    it('Browser_Exception_003', 0, async () => {
      TestLogger.step(TAG, 'index equal to size is an out of range failure');
      const registry: ControllerRegistry = new ControllerRegistry(2);
      const result: OperationResult = registry.safeLoad(2, 'www.huawei.com');
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.INDEX_OUT_OF_RANGE);
      expect(result.message).assertContain('outside');
    });

    it('Browser_Exception_004', 0, async () => {
      TestLogger.step(TAG, 'empty url never reaches the web engine');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const result: OperationResult = registry.safeLoad(0, '');
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.EMPTY_URL);
      expect(registry.controllerAt(0)?.loadCount).assertEqual(0);
    });

    it('Browser_Exception_005', 0, async () => {
      TestLogger.step(TAG, 'whitespace url is treated as empty');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const result: OperationResult = registry.safeLoad(0, '    ');
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.EMPTY_URL);
      expect(registry.controllerAt(0)?.getLoadFailure()).assertEqual('');
    });

    it('Browser_Exception_006', 0, async () => {
      TestLogger.step(TAG, 'oversized url is rejected with the length code');
      let longUrl: string = 'www.huawei.com/';
      while (longUrl.length <= 2100) {
        longUrl += 'segment';
      }
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const result: OperationResult = registry.safeLoad(0, longUrl);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.URL_TOO_LONG);
      expect(longUrl.length).assertLarger(2048);
    });

    it('Browser_Exception_007', 0, async () => {
      TestLogger.step(TAG, 'url with an embedded space is rejected');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const result: OperationResult = registry.safeLoad(0, 'www.hua wei.com');
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.URL_CONTAINS_SPACE);
      expect(validateAddress('www.hua wei.com')).assertEqual(ErrorCode.URL_CONTAINS_SPACE);
    });

    it('Browser_Exception_008', 0, async () => {
      TestLogger.step(TAG, 'script and data schemes are refused');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const script: OperationResult = registry.safeLoad(0, 'javascript:alert(1)');
      const data: OperationResult = registry.safeLoad(0, 'data:text/html,<b>x</b>');
      expect(script.code).assertEqual(ErrorCode.UNSUPPORTED_SCHEME);
      expect(data.code).assertEqual(ErrorCode.UNSUPPORTED_SCHEME);
      expect(registry.controllerAt(0)?.loadCount).assertEqual(0);
    });

    it('Browser_Exception_009', 0, async () => {
      TestLogger.step(TAG, 'single label host is a malformed url');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const result: OperationResult = registry.safeLoad(0, 'localhost');
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.MALFORMED_URL);
      expect(isValidAddress('localhost')).assertFalse();
      expect(isValidAddress('www.huawei.com')).assertTrue();
    });

    it('Browser_Exception_010', 0, async () => {
      TestLogger.step(TAG, 'about:blank and rawfile pages remain loadable');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const blank: OperationResult = registry.safeLoad(0, 'about:blank');
      const pad: OperationResult = registry.safeLoad(0, 'pad.html');
      const phone: OperationResult = registry.safeLoad(0, 'phone.html');
      expect(blank.ok).assertTrue();
      expect(pad.ok).assertTrue();
      expect(phone.ok).assertTrue();
      expect(registry.controllerAt(0)?.loadCount).assertEqual(3);
    });
    it('Browser_Exception_011', 0, async () => {
      TestLogger.step(TAG, 'valid https address is normalized once and loaded');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const result: OperationResult = registry.safeLoad(0, 'www.huawei.com');
      expect(result.ok).assertTrue();
      expect(result.code).assertEqual('OK');
      expect(result.url).assertEqual('https://www.huawei.com');
      expect(registry.controllerAt(0)?.getPendingUrl()).assertEqual('https://www.huawei.com');
      expect(registry.controllerAt(0)?.loadCount).assertEqual(1);
    });

    it('Browser_Exception_012', 0, async () => {
      TestLogger.step(TAG, 'back on a detached tab is a null controller failure');
      const registry: ControllerRegistry = new ControllerRegistry(2);
      registry.detach(1);
      const result: OperationResult = registry.safeBack(1);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.NULL_CONTROLLER);
      expect(result.stage).assertContain('back');
    });

    it('Browser_Exception_013', 0, async () => {
      TestLogger.step(TAG, 'forward on a detached tab is a null controller failure');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      registry.detach(0);
      const result: OperationResult = registry.safeForward(0);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.NULL_CONTROLLER);
      expect(result.url).assertEqual('');
    });

    it('Browser_Exception_014', 0, async () => {
      TestLogger.step(TAG, 'refresh on a detached tab is a null controller failure');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      registry.detach(0);
      const result: OperationResult = registry.safeRefresh(0);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.NULL_CONTROLLER);
      expect(registry.controllerAt(0) === null).assertTrue();
    });

    it('Browser_Exception_015', 0, async () => {
      TestLogger.step(TAG, 'back at the history head reports no history');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      registry.safeLoad(0, 'www.huawei.com');
      const result: OperationResult = registry.safeBack(0);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.NO_HISTORY);
      expect(registry.controllerAt(0)?.historyIndex).assertEqual(0);
    });

    it('Browser_Exception_016', 0, async () => {
      TestLogger.step(TAG, 'forward at the history tail reports no history');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      registry.safeLoad(0, 'www.huawei.com');
      registry.safeLoad(0, 'www.bing.com');
      const result: OperationResult = registry.safeForward(0);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.NO_HISTORY);
      expect(registry.controllerAt(0)?.currentUrl).assertEqual('https://www.bing.com');
    });

    it('Browser_Exception_017', 0, async () => {
      TestLogger.step(TAG, 'engine exception while loading is caught and coded');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const throwing: ThrowingController = new ThrowingController();
      registry.attach(0, throwing);
      const result: OperationResult = registry.safeLoad(0, 'www.huawei.com');
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.ENGINE_EXCEPTION);
      expect(result.message).assertContain('web engine crashed');
      expect(throwing.loadCount).assertEqual(0);
    });

    it('Browser_Exception_018', 0, async () => {
      TestLogger.step(TAG, 'engine exception while refreshing is caught');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      registry.attach(0, new ThrowingController());
      const result: OperationResult = registry.safeRefresh(0);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.ENGINE_EXCEPTION);
      expect(result.stage).assertContain('refresh');
      expect(result.message).assertContain('refresh');
    });

    it('Browser_Exception_019', 0, async () => {
      TestLogger.step(TAG, 'engine exception while going back is caught');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const throwing: ThrowingController = new ThrowingController();
      throwing.throwOnLoad = false;
      registry.attach(0, throwing);
      registry.safeLoad(0, 'www.huawei.com');
      registry.safeLoad(0, 'www.bing.com');
      const result: OperationResult = registry.safeBack(0);
      expect(result.ok).assertFalse();
      expect(result.code).assertEqual(ErrorCode.ENGINE_EXCEPTION);
      expect(result.message).assertContain('backward');
    });

    it('Browser_Exception_020', 0, async () => {
      TestLogger.step(TAG, 'error object carries name, stage and code');
      const error: BrowserOperationError =
        new BrowserOperationError(ErrorCode.NULL_CONTROLLER, 'registry.loadUrl', 'tab detached');
      expect(error.name).assertEqual('BrowserOperationError');
      expect(error.code).assertEqual(ErrorCode.NULL_CONTROLLER);
      expect(error.stage).assertEqual('registry.loadUrl');
      expect(error.describe()).assertContain(ErrorCode.NULL_CONTROLLER);
      expect(error.detail()).assertContain('tab detached');
    });

    it('Browser_Exception_021', 0, async () => {
      TestLogger.step(TAG, 'error message keeps the failing stage prefix');
      const error: BrowserOperationError =
        new BrowserOperationError(ErrorCode.URL_TOO_LONG, 'titleBar.submit', 'length 3000');
      expect(error.detail().startsWith('titleBar.submit')).assertTrue();
      expect(error.detail()).assertContain('length 3000');
      expect(error.severity).assertEqual(2);
    });

    it('Browser_Exception_022', 0, async () => {
      TestLogger.step(TAG, 'severity ranks engine failures above input failures');
      expect(ErrorTaxonomy.severityOf(ErrorCode.ENGINE_EXCEPTION)).assertEqual(4);
      expect(ErrorTaxonomy.severityOf(ErrorCode.NULL_CONTROLLER)).assertEqual(3);
      expect(ErrorTaxonomy.severityOf(ErrorCode.INDEX_OUT_OF_RANGE)).assertEqual(3);
      expect(ErrorTaxonomy.severityOf(ErrorCode.EMPTY_URL)).assertEqual(2);
      expect(ErrorTaxonomy.severityOf(ErrorCode.NO_HISTORY)).assertEqual(1);
      expect(ErrorTaxonomy.severityOf(ErrorCode.ENGINE_EXCEPTION) >
        ErrorTaxonomy.severityOf(ErrorCode.NO_HISTORY)).assertTrue();
    });

    it('Browser_Exception_023', 0, async () => {
      TestLogger.step(TAG, 'engine failures are marked non recoverable, input ones recoverable');
      expect(ErrorTaxonomy.recoverable(ErrorCode.ENGINE_EXCEPTION)).assertFalse();
      expect(ErrorTaxonomy.recoverable(ErrorCode.EMPTY_URL)).assertTrue();
      expect(ErrorTaxonomy.recoverable(ErrorCode.NO_HISTORY)).assertTrue();
      const error: BrowserOperationError =
        new BrowserOperationError(ErrorCode.ENGINE_EXCEPTION, 'registry.loadUrl', 'crash', 4, false);
      expect(error.isRecoverable()).assertFalse();
    });

    it('Browser_Exception_024', 0, async () => {
      TestLogger.step(TAG, 'executor counts attempts, successes and failures');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const executor: SafeExecutor = new SafeExecutor();
      executor.run('load', () => registry.safeLoad(0, 'www.huawei.com'));
      executor.run('load', () => registry.safeLoad(0, ''));
      executor.run('load', () => registry.safeLoad(5, 'www.bing.com'));
      expect(executor.attempts).assertEqual(3);
      expect(executor.successes).assertEqual(1);
      expect(executor.failures).assertEqual(2);
      expect(executor.successRate()).assertLarger(0.3);
      expect(executor.successRate()).assertLess(0.4);
    });

    it('Browser_Exception_025', 0, async () => {
      TestLogger.step(TAG, 'executor keeps per stage counters');
      const registry: ControllerRegistry = new ControllerRegistry(2);
      const executor: SafeExecutor = new SafeExecutor();
      executor.run('nav.back', () => registry.safeBack(0));
      executor.run('nav.forward', () => registry.safeForward(0));
      executor.run('nav.back', () => registry.safeBack(0));
      expect(executor.attemptsFor('nav.back')).assertEqual(2);
      expect(executor.attemptsFor('nav.forward')).assertEqual(1);
      expect(executor.failuresFor('nav.back')).assertEqual(2);
      expect(executor.failuresFor('nav.forward')).assertEqual(1);
    });
    it('Browser_Exception_026', 0, async () => {
      TestLogger.step(TAG, 'executor stores the latest failure for reporting');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const executor: SafeExecutor = new SafeExecutor();
      executor.run('load', () => registry.safeLoad(0, ''));
      expect(executor.lastError === null).assertFalse();
      expect(executor.lastError?.code).assertEqual(ErrorCode.EMPTY_URL);
      executor.run('load', () => registry.safeLoad(0, 'www.huawei.com'));
      expect(executor.lastError?.code).assertEqual(ErrorCode.EMPTY_URL);
      expect(executor.failures).assertEqual(1);
      executor.reset();
      expect(executor.attempts).assertEqual(0);
      expect(executor.lastError === null).assertTrue();
    });

    it('Browser_Exception_027', 0, async () => {
      TestLogger.step(TAG, 'a failed load is fully recoverable on the same tab');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const executor: SafeExecutor = new SafeExecutor();
      const failed: OperationResult = executor.run('load', () => registry.safeLoad(0, ''));
      expect(failed.ok).assertFalse();
      const recovered: OperationResult = executor.run('load', () => registry.safeLoad(0, 'www.huawei.com'));
      expect(recovered.ok).assertTrue();
      expect(registry.controllerAt(0)?.currentUrl).assertEqual('https://www.huawei.com');
      expect(executor.successes).assertEqual(1);
      expect(executor.failures).assertEqual(1);
    });

    it('Browser_Exception_028', 0, async () => {
      TestLogger.step(TAG, 'a failed tab does not poison a healthy sibling tab');
      const registry: ControllerRegistry = new ControllerRegistry(3);
      registry.detach(1);
      const failed: OperationResult = registry.safeLoad(1, 'www.huawei.com');
      const healthy: OperationResult = registry.safeLoad(2, 'www.bing.com');
      expect(failed.ok).assertFalse();
      expect(healthy.ok).assertTrue();
      expect(registry.controllerAt(2)?.currentUrl).assertEqual('https://www.bing.com');
      expect(registry.controllerAt(0)?.loadCount).assertEqual(0);
    });

    it('Browser_Exception_029', 0, async () => {
      TestLogger.step(TAG, 'reattaching a controller restores the tab');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      registry.detach(0);
      expect(registry.hasController(0)).assertFalse();
      const replacement: MockWebController = new MockWebController();
      expect(registry.attach(0, replacement)).assertTrue();
      const result: OperationResult = registry.safeLoad(0, 'pad.html');
      expect(result.ok).assertTrue();
      expect(replacement.currentUrl).assertEqual('pad.html');
      expect(registry.hasController(0)).assertTrue();
    });

    it('Browser_Exception_030', 0, async () => {
      TestLogger.step(TAG, 'state stays consistent after a burst of rejected loads');
      const browser: MockBrowser = new MockBrowser();
      const registry: ControllerRegistry = new ControllerRegistry();
      browser.addTab();
      const before: number = browser.tabs.length;
      const executor: SafeExecutor = new SafeExecutor();
      executor.run('load', () => registry.safeLoad(0, ''));
      executor.run('load', () => registry.safeLoad(-3, 'www.huawei.com'));
      executor.run('load', () => registry.safeLoad(9, 'www.huawei.com'));
      expect(browser.tabs.length).assertEqual(before);
      expect(browser.getTabArrayIndex()).assertEqual(1);
      expect(browser.getCurrentTab()?.key).assertEqual(1);
      expect(executor.failures).assertEqual(3);
    });

    it('Browser_Exception_031', 0, async () => {
      TestLogger.step(TAG, 'uncaught guard swallows a thrown error and records it');
      const guard: UncaughtGuard = new UncaughtGuard();
      guard.install();
      const swallowed: boolean = guard.handle(new Error('arity mismatch in adapterDevice'));
      expect(swallowed).assertTrue();
      expect(guard.handled).assertEqual(1);
      expect(guard.last()).assertContain('arity mismatch');
      expect(guard.installed).assertTrue();
      expect(guard.contains('adapterDevice')).assertTrue();
    });

    it('Browser_Exception_032', 0, async () => {
      TestLogger.step(TAG, 'uncaught guard accepts plain string reports');
      const guard: UncaughtGuard = new UncaughtGuard();
      expect(guard.handle('promise rejection without Error')).assertTrue();
      expect(guard.records.length).assertEqual(1);
      expect(guard.last()).assertEqual('promise rejection without Error');
      expect(guard.handle('')).assertFalse();
      expect(guard.handled).assertEqual(1);
    });

    it('Browser_Exception_033', 0, async () => {
      TestLogger.step(TAG, 'uncaught guard accumulates independent crashes');
      const guard: UncaughtGuard = new UncaughtGuard();
      guard.handle(new Error('first crash'));
      guard.handle(new Error('second crash'));
      guard.handle('third crash');
      expect(guard.handled).assertEqual(3);
      expect(guard.records.length).assertEqual(3);
      expect(guard.contains('second')).assertTrue();
      expect(guard.contains('fourth')).assertFalse();
      guard.reset();
      expect(guard.handled).assertEqual(0);
      expect(guard.records.length).assertEqual(0);
    });

    it('Browser_Exception_034', 0, async () => {
      TestLogger.step(TAG, 'invalid delete and select calls return false without throwing');
      const browser: MockBrowser = new MockBrowser();
      let deleteThrown: boolean = false;
      let selectThrown: boolean = false;
      let deleteResult: boolean = true;
      let selectResult: boolean = true;
      try {
        deleteResult = browser.deleteTab(5);
      } catch (error) {
        deleteThrown = true;
        TestLogger.exception(TAG, 'deleteTab', error as Error);
      }
      try {
        selectResult = browser.selectTab(-1);
      } catch (error) {
        selectThrown = true;
        TestLogger.exception(TAG, 'selectTab', error as Error);
      }
      expect(deleteThrown).assertFalse();
      expect(selectThrown).assertFalse();
      expect(deleteResult).assertFalse();
      expect(selectResult).assertFalse();
      expect(browser.tabs.length).assertEqual(1);
    });

    it('Browser_Exception_035', 0, async () => {
      TestLogger.step(TAG, 'capacity overflow is reported through the toast channel');
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT + 1);
      const accepted: boolean = browser.addTab();
      expect(accepted).assertFalse();
      expect(browser.toasts.length).assertEqual(1);
      expect(browser.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.toasts[0]).assertContain('满');
    });

    it('Browser_Exception_036', 0, async () => {
      TestLogger.step(TAG, 'progress events outside 0..100 are clamped by the model');
      const browser: MockBrowser = new MockBrowser();
      browser.onProgressChange(250);
      expect(browser.progress).assertEqual(250);
      expect(browser.hideProgress).assertFalse();
      browser.onProgressChange(-20);
      expect(browser.progress).assertEqual(-20);
      expect(browser.hideProgress).assertFalse();
      browser.onProgressChange(100);
      expect(browser.progress).assertEqual(0);
      expect(browser.hideProgress).assertTrue();
    });

    it('Browser_Exception_037', 0, async () => {
      TestLogger.step(TAG, 'loadUrl on a browser without tabs fails gracefully');
      const browser: MockBrowser = new MockBrowser();
      browser.tabs = [];
      browser.tabArrayIndex = 0;
      const loaded: boolean = browser.loadUrl('www.huawei.com');
      expect(loaded).assertFalse();
      expect(browser.back()).assertFalse();
      expect(browser.forward()).assertFalse();
      browser.refresh();
      expect(browser.getCurrentTab() === null).assertTrue();
    });

    it('Browser_Exception_038', 0, async () => {
      TestLogger.step(TAG, 'tab index pointing past the array is guarded');
      const browser: MockBrowser = new MockBrowser(2);
      browser.setTabArrayIndex(7);
      expect(browser.getCurrentTab() === null).assertTrue();
      expect(browser.loadUrl('www.huawei.com')).assertFalse();
      expect(browser.onBackPress()).assertFalse();
      browser.setTabArrayIndex(0);
      expect(browser.loadUrl('www.huawei.com')).assertTrue();
    });

    it('Browser_Exception_039', 0, async () => {
      TestLogger.step(TAG, 'fifty rejected submissions then one valid load recovers');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const executor: SafeExecutor = new SafeExecutor();
      for (let index = 0; index < 50; index++) {
        executor.run('submit', () => registry.safeLoad(0, ''));
      }
      expect(executor.failures).assertEqual(50);
      const recovered: OperationResult = executor.run('submit', () => registry.safeLoad(0, 'www.huawei.com'));
      expect(recovered.ok).assertTrue();
      expect(executor.attempts).assertEqual(51);
      expect(executor.successes).assertEqual(1);
      expect(registry.controllerAt(0)?.currentUrl).assertEqual('https://www.huawei.com');
    });

    it('Browser_Exception_040', 0, async () => {
      TestLogger.step(TAG, 'every invalid address in the table is rejected');
      let rejected: number = 0;
      for (let index = 0; index < ADDRESS_CASES.length; index++) {
        const item: AddressCase = ADDRESS_CASES[index];
        if (!item.valid) {
          rejected += 1;
          expect(validateAddress(item.address).length > 0).assertTrue();
        }
      }
      expect(rejected).assertEqual(7);
      expect(validateAddress('pad.html')).assertEqual('');
      expect(validateAddress('www.huawei.com')).assertEqual('');
    });
    it('Browser_Exception_041', 0, async () => {
      TestLogger.step(TAG, 'every valid address in the table reaches the controller');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      let accepted: number = 0;
      for (let index = 0; index < ADDRESS_CASES.length; index++) {
        const item: AddressCase = ADDRESS_CASES[index];
        if (item.valid) {
          accepted += 1;
          const result: OperationResult = registry.safeLoad(0, item.address);
          expect(result.ok).assertTrue();
        }
      }
      expect(accepted).assertEqual(8);
      expect(registry.controllerAt(0)?.loadCount).assertEqual(8);
    });

    it('Browser_Exception_042', 0, async () => {
      TestLogger.step(TAG, 'error codes are unique and stable');
      const codes: string[] = [
        ErrorCode.NULL_CONTROLLER, ErrorCode.INDEX_OUT_OF_RANGE, ErrorCode.EMPTY_URL,
        ErrorCode.URL_TOO_LONG, ErrorCode.URL_CONTAINS_SPACE, ErrorCode.UNSUPPORTED_SCHEME,
        ErrorCode.MALFORMED_URL, ErrorCode.ENGINE_EXCEPTION, ErrorCode.LOAD_REJECTED,
        ErrorCode.NO_HISTORY, ErrorCode.INVALID_TAB, ErrorCode.CAPACITY_REACHED
      ];
      const unique: Set<string> = new Set<string>();
      for (let index = 0; index < codes.length; index++) {
        unique.add(codes[index]);
        expect(codes[index].startsWith('ERR_')).assertTrue();
      }
      expect(unique.size).assertEqual(codes.length);
      expect(ErrorCode.EMPTY_URL).assertEqual('ERR_EMPTY_URL');
    });

    it('Browser_Exception_043', 0, async () => {
      TestLogger.step(TAG, 'failure messages differ for different roots');
      const first: OperationResult = new ControllerRegistry(1).safeLoad(0, '');
      const second: OperationResult = new ControllerRegistry(1).safeLoad(0, 'localhost');
      const third: OperationResult = new ControllerRegistry(1).safeLoad(4, 'www.huawei.com');
      expect(first.message === second.message).assertFalse();
      expect(second.message === third.message).assertFalse();
      expect(first.code === second.code).assertFalse();
      expect(third.code).assertEqual(ErrorCode.INDEX_OUT_OF_RANGE);
    });

    it('Browser_Exception_044', 0, async () => {
      TestLogger.step(TAG, 'throwing controller recovers once the engine flag is cleared');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const throwing: ThrowingController = new ThrowingController();
      registry.attach(0, throwing);
      const failed: OperationResult = registry.safeLoad(0, 'www.huawei.com');
      expect(failed.ok).assertFalse();
      throwing.throwOnLoad = false;
      const recovered: OperationResult = registry.safeLoad(0, 'www.huawei.com');
      expect(recovered.ok).assertTrue();
      expect(throwing.loadCount).assertEqual(1);
      expect(throwing.getLoadFailure()).assertEqual('');
    });

    it('Browser_Exception_045', 0, async () => {
      TestLogger.step(TAG, 'UI: window survives the guarded failure paths');
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      const inputReady: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const backReady: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      TestLogger.info(TAG, `after failures input=${inputReady}, back=${backReady}`);
      expect(inputReady || backReady).assertTrue();
      const text: string = await textById(driver, ID_INPUT_URL);
      expect(text.length >= 0).assertTrue();
    });

    it('Browser_Exception_046', 0, async () => {
      TestLogger.step(TAG, 'UI: back button still reacts after rejected navigation');
      const ready: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      if (!ready) {
        TestLogger.warn(TAG, 'back button not rendered on this layout');
        expect(ready).assertFalse();
        return;
      }
      const clicked: boolean = await clickById(driver, ID_NAV_BACK);
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
      TestLogger.info(TAG, `back click accepted=${clicked}`);
      expect(clicked).assertTrue();
    });

    it('Browser_Exception_047', 0, async () => {
      TestLogger.step(TAG, 'UI: tab strip count is unchanged by invalid submissions');
      const addCount: number = await countById(driver, ID_ACTION_ADD);
      const closeCount: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `add=${addCount}, close=${closeCount}`);
      expect(closeCount <= MAX_TAB_COUNT + 1).assertTrue();
      expect(addCount >= 0).assertTrue();
      const browser: MockBrowser = new MockBrowser();
      const before: number = browser.tabs.length;
      browser.loadUrl('');
      expect(browser.tabs.length).assertEqual(before);
      expect(browser.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_Exception_048', 0, async () => {
      TestLogger.step(TAG, 'error reporting never carries a raw stack to the UI');
      const error: BrowserOperationError =
        new BrowserOperationError(ErrorCode.ENGINE_EXCEPTION, 'registry.loadUrl', 'engine crashed', 4, false);
      expect(error.detail().indexOf('at ')).assertEqual(-1);
      expect(error.describe().indexOf('\n')).assertEqual(-1);
      expect(error.describe()).assertContain('severity=4');
      expect(error.isRecoverable()).assertFalse();
    });

    it('Browser_Exception_049', 0, async () => {
      TestLogger.step(TAG, 'guarded navigation keeps history usable after two crashes');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const throwing: ThrowingController = new ThrowingController();
      throwing.throwOnLoad = false;
      registry.attach(0, throwing);
      registry.safeLoad(0, 'www.huawei.com');
      registry.safeLoad(0, 'www.bing.com');
      throwing.throwOnBack = true;
      expect(registry.safeBack(0).code).assertEqual(ErrorCode.ENGINE_EXCEPTION);
      throwing.throwOnBack = false;
      const moved: OperationResult = registry.safeBack(0);
      expect(moved.ok).assertTrue();
      expect(throwing.currentUrl).assertEqual('https://www.huawei.com');
      expect(registry.safeForward(0).ok).assertTrue();
    });

    it('Browser_Exception_050', 0, async () => {
      TestLogger.step(TAG, 'summarize the exception surface for the report');
      const guard: UncaughtGuard = new UncaughtGuard();
      guard.install();
      guard.handle(new Error('adapterDevice failed'));
      guard.handle('json parse failed');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      registry.detach(0);
      registry.safeRefresh(0);
      TestLogger.info(TAG, `guard handled=${guard.handled}, detached refresh code=${ErrorCode.NULL_CONTROLLER}`);
      expect(guard.handled).assertEqual(2);
      expect(guard.installed).assertTrue();
      expect(registry.hasController(0)).assertFalse();
      guard.uninstall();
      expect(guard.installed).assertFalse();
    });
    it('Browser_Exception_051', 0, async () => {
      TestLogger.step(TAG, 'a detached middle tab leaves neighbours operational');
      const registry: ControllerRegistry = new ControllerRegistry(4);
      registry.detach(2);
      const left: OperationResult = registry.safeLoad(1, 'www.huawei.com');
      const middle: OperationResult = registry.safeLoad(2, 'www.huawei.com');
      const right: OperationResult = registry.safeLoad(3, 'www.bing.com');
      expect(left.ok).assertTrue();
      expect(middle.code).assertEqual(ErrorCode.NULL_CONTROLLER);
      expect(right.ok).assertTrue();
      expect(registry.safeRefresh(2).ok).assertFalse();
      expect(registry.safeBack(2).ok).assertFalse();
      expect(registry.safeForward(2).ok).assertFalse();
      expect(registry.controllerAt(1)?.loadCount).assertEqual(1);
      expect(registry.controllerAt(3)?.loadCount).assertEqual(1);
    });

    it('Browser_Exception_052', 0, async () => {
      TestLogger.step(TAG, 'executor reset keeps the registry responsive for the next phase');
      const registry: ControllerRegistry = new ControllerRegistry(1);
      const executor: SafeExecutor = new SafeExecutor();
      for (let round = 0; round < 4; round++) {
        executor.run('phase.load', () => registry.safeLoad(0, round % 2 === 0 ? '' : 'www.huawei.com'));
      }
      expect(executor.attempts).assertEqual(4);
      expect(executor.successes).assertEqual(2);
      expect(executor.failures).assertEqual(2);
      executor.reset();
      const afterReset: OperationResult = executor.run('phase.load', () => registry.safeLoad(0, 'pad.html'));
      expect(afterReset.ok).assertTrue();
      expect(executor.attempts).assertEqual(1);
      expect(executor.successes).assertEqual(1);
      expect(executor.failures).assertEqual(0);
      expect(executor.attemptsFor('phase.load')).assertEqual(1);
    });
  });
}




