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

import { common, Want } from '@kit.AbilityKit';
import {
  Component as NativeComponent, Driver as NativeDriver, ON as NATIVE_ON, On,
  Rect, Point, abilityDelegatorRegistry
} from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { inputMethod } from '@kit.IMEKit';
import { beforeAll, it } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Shortcut]';
const SESSION_PARAMETER: string = 'sampleUiSession';
let sequence: number = 0;
let current: UiTestSession | undefined = undefined;
let pendingNative: UiTestSession | undefined = undefined;
let sharedNativeDriver: NativeDriver | undefined = undefined;
let driverInitializationFailed: boolean = false;
const preparedFeatures: Set<string> = new Set<string>();

function initializedUiDriver(): NativeDriver {
  if (driverInitializationFailed) {
    throw new Error('UiTest driver initialization previously failed; restart the test process');
  }
  const existing = sharedNativeDriver;
  if (existing !== undefined) { return existing; }
  try {
    const native = NativeDriver.create();
    if (native === undefined || native === null) { throw new Error('UiTest Driver is unavailable'); }
    sharedNativeDriver = native;
    return native;
  } catch (error) {
    // A failed exporter initialization may leave native work in flight. Never blindly retry it.
    driverInitializationFailed = true;
    throw error as Error;
  }
}

/** Prepare module-local infrastructure before case deadlines, never alongside an owned session. */
export function prepareUiTestDriver(): void {
  if (current !== undefined || pendingNative !== undefined) {
    throw new Error('Cannot prepare UiTest while a previous owned session is still active');
  }
  initializedUiDriver();
}

function safeUiLog(level: string, message: string): void {
  try {
    if (level === 'error') {
      hilog.error(DOMAIN, TAG, '%{public}s', message);
    } else {
      hilog.info(DOMAIN, TAG, '%{public}s', message);
    }
  } catch (_) { /* Logging must not skip owned cleanup or replace the real failure. */ }
}

interface SelectorPart { kind: string; value: string; }

/** Pure JS descriptor: native On objects are built only inside the exclusive native call. */
export class UiSelector {
  private parts: SelectorPart[];
  private after: UiSelector | undefined;
  constructor(parts: SelectorPart[] = [], after: UiSelector | undefined = undefined) {
    this.parts = parts;
    this.after = after;
  }
  private add(kind: string, value: string): UiSelector {
    return new UiSelector(this.parts.concat([{ kind: kind, value: value }]), this.after);
  }
  id(value: string): UiSelector { return this.add('id', value); }
  text(value: string): UiSelector { return this.add('text', value); }
  type(value: string): UiSelector { return this.add('type', value); }
  isAfter(value: UiSelector): UiSelector { return new UiSelector(this.parts, value); }
  sameAs(other: UiSelector): boolean {
    if (this.parts.length !== other.parts.length) { return false; }
    for (let index = 0; index < this.parts.length; index++) {
      if (this.parts[index].kind !== other.parts[index].kind ||
        this.parts[index].value !== other.parts[index].value) { return false; }
    }
    if (this.after === undefined) { return other.after === undefined; }
    if (other.after === undefined) { return false; }
    return this.after.sameAs(other.after);
  }
  traceName(): string {
    for (const part of this.parts) { if (part.kind === 'id') { return part.value; } }
    return this.parts.map((part: SelectorPart): string => part.kind).join('+');
  }
  materialize(): On {
    let selector: On = NATIVE_ON;
    this.parts.forEach((part: SelectorPart): void => {
      if (part.kind === 'id') {
        selector = selector.id(part.value);
      } else if (part.kind === 'text') {
        selector = selector.text(part.value);
      } else if (part.kind === 'type') {
        selector = selector.type(part.value);
      } else {
        throw new Error('Unsupported UI selector descriptor');
      }
    });
    if (this.after !== undefined) { selector = selector.isAfter(this.after.materialize()); }
    return selector;
  }
}
export const ON: UiSelector = new UiSelector();

export class UiTestSession {
  readonly id: string;
  private accepting: boolean = true;
  private deadline: number;
  private cleanupMs: number;
  private caseLimitMs: number;
  private startedAt: number = Date.now();
  private nativeDrain: Promise<void> = Promise.resolve();
  private traceUi: boolean = false;
  private owner: common.UIAbilityContext | undefined = undefined;
  private destroyed: boolean = false;
  private awaitingOwner: boolean = false;
  private destroySignal: Promise<void>;
  private signalDestroyed: (() => void) | undefined = undefined;
  private initializationFailure: Error | undefined = undefined;
  private cleanupFailure: Error | undefined = undefined;
  private ownerSignal: Promise<void>;
  private signalOwner: (() => void) | undefined = undefined;
  private termination: Promise<void> | undefined = undefined;
  private closing: Promise<void> | undefined = undefined;
  private phase: string = 'case-start';
  private operation: string = 'none';
  private operationSince: number = 0;
  private lastOperation: string = 'none';

  constructor() {
    if (current !== undefined || pendingNative !== undefined) {
      const blocked = current === undefined ? 'native gate has not settled' : current.diagnostic();
      throw new Error(`Previous UI session is still draining: ${blocked}`);
    }
    const parameters = abilityDelegatorRegistry.getArguments().parameters;
    const supplied: number = Number(parameters['timeout'] ?? parameters['-s timeout']);
    const limit: number = Number.isFinite(supplied) && supplied > 0 ? supplied : 5000;
    this.caseLimitMs = limit;
    this.traceUi = String(parameters['traceUi'] ?? parameters['-s traceUi']) === 'true';
    this.deadline = this.startedAt + Math.max(1, limit - Math.min(2500, limit * 0.3));
    this.cleanupMs = Math.min(2000, limit * 0.2);
    sequence++;
    this.id = String(sequence);
    this.destroySignal = new Promise<void>((resolve): void => { this.signalDestroyed = resolve; });
    this.ownerSignal = new Promise<void>((resolve): void => { this.signalOwner = resolve; });
    current = this;
  }
  failInitialization(phase: string, code: number = 0): void {
    if (this.initializationFailure === undefined) {
      this.initializationFailure = new Error(`UI initialization failed at ${phase}; code=${code}`);
    }
  }
  failCleanup(phase: string, code: number = 0): void {
    if (this.cleanupFailure === undefined) {
      this.cleanupFailure = new Error(`Owned UI cleanup failed at ${phase}; code=${code}`);
    }
  }
  requireLive(): void {
    if (this.initializationFailure !== undefined) { throw this.initializationFailure; }
    if (!this.accepting || this.destroyed || current !== this || Date.now() >= this.deadline) {
      throw new Error('UI session ended or its case budget expired; late actions are cancelled');
    }
  }
  remaining(): number { return Math.max(1, this.deadline - Date.now()); }
  enterPhase(phase: string): void { this.requireLive(); this.phase = phase; }
  diagnostic(): string {
    const elapsed = this.operation === 'none' ? 0 : Date.now() - this.operationSince;
    return `phase=${this.phase}, operation=${this.operation}, elapsedMs=${elapsed}, last=${this.lastOperation}, ` +
      `awaitingOwner=${this.awaitingOwner}, destroyed=${this.destroyed}, nativePending=${pendingNative === this}, ` +
      `timeoutMs=${this.caseLimitMs}, caseElapsedMs=${Date.now() - this.startedAt}`;
  }
  private releaseIfSafe(): void {
    if (!this.accepting && pendingNative !== this && !this.awaitingOwner &&
      (this.owner === undefined || this.destroyed) && current === this) { current = undefined; }
  }
  retire(): void { this.accepting = false; this.releaseIfSafe(); }
  attach(owner: common.UIAbilityContext): void {
    if (this.owner !== undefined && this.owner !== owner) { throw new Error('UI session already owns another Ability'); }
    this.owner = owner;
    this.awaitingOwner = false;
    const signal = this.signalOwner;
    if (signal !== undefined) { signal(); }
    if (!this.accepting) {
      // close may already have timed out waiting for this late onCreate. Still close ONLY this owner.
      this.terminateOwned(owner).catch((): void => { safeUiLog('error', 'Late owned UI Ability termination failed'); });
    }
  }
  private terminateOwned(owner: common.UIAbilityContext): Promise<void> {
    let termination = this.termination;
    if (termination === undefined) {
      try {
        termination = owner.terminateSelf();
      } catch (error) {
        termination = Promise.reject(error as Error);
      }
      this.termination = termination;
    }
    return termination;
  }
  markDestroyed(owner: common.UIAbilityContext): void {
    if (this.owner !== owner) { return; }
    this.destroyed = true;
    this.accepting = false;
    const signal = this.signalDestroyed;
    if (signal !== undefined) { signal(); }
    this.releaseIfSafe();
  }
  async guard<T>(pending: Promise<T>): Promise<T> {
    // Observe an already-created rejection even if the expired lease rejects before await.
    // Await the original Promise below: its failure is still propagated unchanged.
    pending.catch((): void => {});
    this.requireLive();
    const value = await pending;
    this.requireLive();
    return value;
  }
  async pause(ms: number): Promise<void> {
    this.requireLive();
    await new Promise<void>((resolve): void => { setTimeout(resolve, Math.min(ms, this.remaining())); });
    this.requireLive();
  }
  async call<T>(work: () => Promise<T>, operationName: string = 'platform-call'): Promise<T> {
    this.requireLive();
    if (pendingNative !== undefined) { throw new Error('Concurrent native UI operation rejected before dispatch'); }
    pendingNative = this;
    this.operation = operationName;
    this.operationSince = Date.now();
    const dispatchedAt: number = this.operationSince;
    let operation: Promise<T>;
    try { operation = work(); } catch (error) {
      pendingNative = undefined;
      this.operation = 'none';
      throw error as Error;
    }
    // Keep the busy marker until the REAL native promise settles, not until a race times out.
    const tracked: Promise<T> = operation.then((value: T): T => {
      if (this.traceUi) {
        safeUiLog('info', `UI_RPC name=${operationName}, durationMs=${Date.now() - dispatchedAt}, ` +
          `caseElapsedMs=${Date.now() - this.startedAt}`);
      }
      if (pendingNative === this) { pendingNative = undefined; }
      this.lastOperation = operationName;
      this.operation = 'none';
      this.releaseIfSafe();
      this.requireLive();
      return value;
    }, (error: Error): T => {
      if (pendingNative === this) { pendingNative = undefined; }
      this.lastOperation = operationName;
      this.operation = 'none';
      this.releaseIfSafe();
      throw error;
    });
    // Observe actual gate settlement without replacing the original rejection or cancellation.
    this.nativeDrain = tracked.then((): void => {}, (): void => {});
    let timer: number = -1;
    const timeout = new Promise<T>((_resolve, reject): void => {
      timer = setTimeout((): void => {
        this.retire();
        reject(new Error(`Native UI operation exceeded its budget; ${this.diagnostic()}`));
      }, Math.min(3000, this.remaining()));
    });
    try {
      return await Promise.race([tracked, timeout]);
    } finally {
      if (timer >= 0) { clearTimeout(timer); }
    }
  }
  createDriver(): UiTestDriver {
    this.requireLive();
    if (pendingNative !== undefined) { throw new Error('Native UI is still busy; Driver.create was not dispatched'); }
    pendingNative = this;
    try {
      const native = initializedUiDriver();
      if (native === undefined || native === null) { throw new Error('UiTest Driver is unavailable'); }
      pendingNative = undefined;
      return new UiTestDriver(this, native);
    } catch (error) {
      // A create failure can mean an untracked platform call is still active. Do not blindly retry.
      this.retire();
      throw error as Error;
    }
  }
  async requireOwnedForeground(): Promise<void> {
    this.requireLive();
    const owner = this.owner;
    if (owner === undefined) { throw new Error('UI session has no owned Ability'); }
    const top = await this.call(() => abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility(),
      'AbilityDelegator.getCurrentTopAbility');
    this.requireLive();
    if (this.owner !== owner || top === undefined || top === null) {
      throw new Error('Owned UI Ability is not foreground; no UI action was dispatched');
    }
    const actual = top.context.abilityInfo;
    const expected = owner.abilityInfo;
    if (actual.bundleName !== expected.bundleName || actual.moduleName !== expected.moduleName ||
      actual.name !== expected.name) {
      throw new Error('Owned UI Ability is not foreground; no UI action was dispatched');
    }
  }
  async startAbility(bundle: string, ability: string, parameters: Record<string, Object>): Promise<void> {
    this.requireLive();
    parameters[SESSION_PARAMETER] = this.id;
    this.awaitingOwner = true;
    await this.call((): Promise<void> => abilityDelegatorRegistry.getAbilityDelegator().startAbility({
      bundleName: bundle, moduleName: 'entry_test', abilityName: ability, parameters: parameters
    }).catch((error: Error): void => {
      this.awaitingOwner = false;
      const signal = this.signalOwner;
      if (signal !== undefined) { signal(); }
      this.releaseIfSafe();
      throw error;
    }), 'AbilityDelegator.startAbility');
  }
  close(): Promise<void> {
    let closing = this.closing;
    if (closing === undefined) { closing = this.closeOwned(); this.closing = closing; }
    return closing;
  }
  private async closeOwned(): Promise<void> {
    this.retire();
    let watchdog: number = -1;
    const timeout = new Promise<void>((_resolve, reject): void => {
      watchdog = setTimeout((): void => { reject(new Error(`Owned UI attachment/destruction/native drain did not finish; ${this.diagnostic()}`)); }, this.cleanupMs);
    });
    const complete = async (): Promise<void> => {
      if (this.owner === undefined && this.awaitingOwner) { await this.ownerSignal; }
      const owner = this.owner;
      if (owner !== undefined && !this.destroyed) {
        await Promise.all([this.terminateOwned(owner), this.destroySignal]);
      }
      // Destruction can precede a Driver RPC settling. Keep the same cleanup watchdog and gate.
      await this.nativeDrain;
      if (this.cleanupFailure !== undefined) { throw this.cleanupFailure; }
      if (this.initializationFailure !== undefined) { throw this.initializationFailure; }
    };
    try { await Promise.race([complete(), timeout]); } finally {
      if (watchdog >= 0) { clearTimeout(watchdog); }
      this.releaseIfSafe();
    }
  }
}

/** The Ability must keep the returned exact session and acknowledge destruction with it. */
export function claimUiTestSession(want: Want, owner: common.UIAbilityContext): UiTestSession | undefined {
  const session = current;
  if (session === undefined || want.parameters === undefined ||
    want.parameters[SESSION_PARAMETER] !== session.id) { return undefined; }
  session.attach(owner);
  return session;
}

interface RetainedUiInput { selector: UiSelector; target: UiTestComponent; }

export class UiTestDriver {
  public readonly session: UiTestSession;
  private native: NativeDriver;
  private displays: Map<number, Point> = new Map<number, Point>();
  private retainedInput: RetainedUiInput | undefined = undefined;
  private pendingTextInput: boolean = false;
  constructor(session: UiTestSession, native: NativeDriver) { this.session = session; this.native = native; }
  invalidateRetainedInput(): void { this.session.requireLive(); this.retainedInput = undefined; }
  rememberInputTarget(selector: UiSelector, target: UiTestComponent): void {
    this.session.requireLive();
    if (!target.matches(this, selector)) { throw new Error('Input target does not belong to this driver/selector'); }
    this.retainedInput = { selector: selector, target: target };
  }
  private consumeInputTarget(selector: UiSelector): UiTestComponent | undefined {
    this.session.requireLive();
    const retained = this.retainedInput;
    this.retainedInput = undefined;
    if (retained === undefined || !retained.selector.sameAs(selector)) { return undefined; }
    if (!retained.target.matches(this, selector)) { throw new Error('Retained input target ownership changed'); }
    return retained.target;
  }
  noteTextInput(): void { this.invalidateRetainedInput(); this.pendingTextInput = true; }
  hasPendingTextInput(): boolean { this.session.requireLive(); return this.pendingTextInput; }
  async finishTextInput(): Promise<void> {
    this.invalidateRetainedInput();
    if (this.hasPendingTextInput()) { await this.hideTextInput(); }
  }
  /** A lookup is one RPC. Geometry is required for actions, not for every text/property read. */
  async findComponent(selector: UiSelector): Promise<UiTestComponent | undefined> {
    this.invalidateRetainedInput();
    let component = await this.session.call((): Promise<NativeComponent> =>
      this.native.findComponent(selector.materialize()), `Driver.findComponent:${selector.traceName()}`);
    if ((component === undefined || component === null) && this.hasPendingTextInput()) {
      // A missing node may be occluded by the IME. Close only our owned input, then retry once.
      await this.finishTextInput();
      component = await this.session.call((): Promise<NativeComponent> =>
        this.native.findComponent(selector.materialize()), `Driver.findComponent:${selector.traceName()}`);
    }
    if (component === undefined || component === null) { return undefined; }
    return new UiTestComponent(this, component, selector);
  }
  async waitForComponent(selector: UiSelector, ms: number): Promise<UiTestComponent | undefined> {
    const deadline = Date.now() + Math.min(ms, this.session.remaining());
    while (true) {
      const component = await this.findComponent(selector);
      if (component !== undefined && await component.isDisplayed()) { return component; }
      if (Date.now() >= deadline) { return undefined; }
      await this.session.pause(50);
    }
  }
  async waitForText(selector: UiSelector, expected: string, ms: number,
    initial: UiTestComponent | undefined = undefined): Promise<void> {
    const deadline = Date.now() + Math.min(ms, this.session.remaining());
    const retained = this.consumeInputTarget(selector);
    if (initial !== undefined && !initial.matches(this, selector)) {
      throw new Error('Initial text target does not belong to this driver/selector');
    }
    let candidate: UiTestComponent | undefined = initial === undefined ? retained : initial;
    while (true) {
      // Consume only this first real native read, never a text value or a cross-step cache.
      const component = candidate === undefined ? await this.findComponent(selector) : candidate;
      candidate = undefined;
      if (component !== undefined && await component.getText() === expected) { return; }
      if (Date.now() >= deadline) { throw new Error(`UI text did not reach its requested value: ${selector.traceName()}`); }
      await this.session.pause(50);
    }
  }
  async waitForIdle(idleMs: number, limitMs: number): Promise<boolean> {
    this.invalidateRetainedInput();
    await this.finishTextInput();
    return this.session.call((): Promise<boolean> =>
      this.native.waitForIdle(idleMs, Math.min(limitMs, 500, this.session.remaining())), 'Driver.waitForIdle');
  }
  async wakeUpDisplay(): Promise<void> {
    this.invalidateRetainedInput();
    await this.session.call((): Promise<void> => this.native.wakeUpDisplay(), 'Driver.wakeUpDisplay');
  }
  async hideTextInput(): Promise<void> {
    this.invalidateRetainedInput();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => inputMethod.getController().hideTextInput(), 'InputMethod.hideTextInput');
    this.pendingTextInput = false;
  }
  async pressBack(): Promise<void> {
    this.invalidateRetainedInput();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.pressBack(), 'Driver.pressBack');
  }
  async triggerKey(key: number): Promise<void> {
    this.invalidateRetainedInput();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.triggerKey(key), 'Driver.triggerKey');
  }
  async triggerCombineKeys(first: number, second: number): Promise<void> {
    this.invalidateRetainedInput();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.triggerCombineKeys(first, second), 'Driver.triggerCombineKeys');
  }
  async swipe(startX: number, startY: number, endX: number, endY: number): Promise<void> {
    this.invalidateRetainedInput();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.swipe(startX, startY, endX, endY, 1600), 'Driver.swipe');
  }
  async getDisplaySize(displayId: number = 0): Promise<Point> {
    this.invalidateRetainedInput();
    let display = this.displays.get(displayId);
    if (display === undefined) {
      display = await this.session.call((): Promise<Point> => this.native.getDisplaySize(displayId), 'Driver.getDisplaySize');
      this.displays.set(displayId, display);
    }
    return display;
  }
}

export class UiTestComponent {
  private driver: UiTestDriver;
  private native: NativeComponent;
  private selector: UiSelector;
  constructor(driver: UiTestDriver, native: NativeComponent, selector: UiSelector) {
    this.driver = driver; this.native = native; this.selector = selector;
  }
  matches(driver: UiTestDriver, selector: UiSelector): boolean {
    return this.driver === driver && this.selector.sameAs(selector);
  }
  async getText(): Promise<string> {
    this.driver.invalidateRetainedInput();
    return this.driver.session.call((): Promise<string> => this.native.getText(), `Component.getText:${this.selector.traceName()}`);
  }
  async isEnabled(): Promise<boolean> {
    this.driver.invalidateRetainedInput();
    return this.driver.session.call((): Promise<boolean> => this.native.isEnabled(), `Component.isEnabled:${this.selector.traceName()}`);
  }
  async isChecked(): Promise<boolean> {
    this.driver.invalidateRetainedInput();
    return this.driver.session.call((): Promise<boolean> => this.native.isChecked(), `Component.isChecked:${this.selector.traceName()}`);
  }
  async isDisplayed(): Promise<boolean> {
    const bounds = await this.getBounds();
    const display = await this.driver.getDisplaySize(bounds.displayId ?? 0);
    const x = (bounds.left + bounds.right) / 2;
    const y = (bounds.top + bounds.bottom) / 2;
    return bounds.right > bounds.left && bounds.bottom > bounds.top &&
      x >= 0 && x < display.x && y >= 0 && y < display.y;
  }
  private async actionTarget(): Promise<NativeComponent> {
    if (await this.isDisplayed()) { return this.native; }
    let scroll = await this.driver.findComponent(ON.id('note-trash-list'));
    if (scroll === undefined) { scroll = await this.driver.findComponent(ON.type('Scroll')); }
    if (scroll === undefined) { throw new Error(`UI action target is outside the display: ${this.selector.traceName()}`); }
    const visible = await scroll.scrollSearch(this.selector, this);
    if (visible === undefined) { throw new Error(`UI action target could not be scrolled into view: ${this.selector.traceName()}`); }
    return visible.native;
  }
  async click(): Promise<void> {
    const refresh = this.driver.hasPendingTextInput();
    this.driver.invalidateRetainedInput();
    await this.driver.finishTextInput();
    let component: UiTestComponent = this;
    if (refresh) {
      const found = await this.driver.findComponent(this.selector);
      if (found === undefined) { throw new Error('UI click target disappeared after input dismissal'); }
      component = found;
    }
    const target = await component.actionTarget();
    await this.driver.session.requireOwnedForeground();
    await this.driver.session.call((): Promise<void> => target.click(), `Component.click:${this.selector.traceName()}`);
  }
  async inputText(value: string): Promise<void> { await this.inputTextTarget(value); }
  async inputTextTarget(value: string): Promise<UiTestComponent> {
    this.driver.invalidateRetainedInput();
    const target = await this.actionTarget();
    await this.driver.session.requireOwnedForeground();
    await this.driver.session.call((): Promise<void> => target.inputText(value), `Component.inputText:${this.selector.traceName()}`);
    this.driver.noteTextInput();
    const actual = new UiTestComponent(this.driver, target, this.selector);
    this.driver.rememberInputTarget(this.selector, actual);
    return actual;
  }
  async getBounds(): Promise<Rect> {
    this.driver.invalidateRetainedInput();
    return this.driver.session.call((): Promise<Rect> => this.native.getBounds(), `Component.getBounds:${this.selector.traceName()}`);
  }
  async scrollSearch(selector: UiSelector,
    initial: UiTestComponent | undefined = undefined): Promise<UiTestComponent | undefined> {
    if (this.driver.hasPendingTextInput()) {
      await this.driver.finishTextInput();
      const refreshed = await this.driver.findComponent(this.selector);
      if (refreshed === undefined) { throw new Error('UI scroll container disappeared after input dismissal'); }
      // Do not reuse the optional pre-dismissal input target or viewport.
      return refreshed.scrollSearch(selector);
    }
    // Never call scrollToTop/scrollSearch: both may perform an unbounded number of gestures natively.
    const viewport = await this.getBounds();
    const displayId = viewport.displayId ?? 0;
    if (displayId !== 0) { throw new Error('Relative fixture scrolling requires the default display'); }
    const display = await this.driver.getDisplaySize(displayId);
    const top = Math.max(0, viewport.top) + 20;
    const bottom = Math.min(display.y - 1, viewport.bottom) - 20;
    const x = Math.max(1, Math.min(display.x - 1, Math.floor((viewport.left + viewport.right) / 2)));
    if (bottom <= top) { return undefined; }
    for (let step = 0; step <= 8; step++) {
      const found = step === 0 && initial !== undefined ? initial : await this.driver.findComponent(selector);
      let towardTop: boolean = step < 2;
      if (found !== undefined) {
        const bounds = await found.getBounds();
        const center = (bounds.top + bounds.bottom) / 2;
        if (bounds.right > bounds.left && bounds.bottom > bounds.top) {
          if (center >= top && center <= bottom && (bounds.left + bounds.right) / 2 >= 0 &&
            (bounds.left + bounds.right) / 2 < display.x) { return found; }
          towardTop = center < top;
        }
      }
      if (step === 8) { return undefined; }
      safeUiLog('info', `UI scroll target=${selector.traceName()} step=${step} towardTop=${towardTop}`);
      // Relative, viewport-sized gestures only. The case deadline remains the sole overall budget.
      if (towardTop) {
        await this.driver.swipe(x, top, x, bottom);
      } else {
        await this.driver.swipe(x, bottom, x, top);
      }
      await this.driver.session.pause(30);
    }
    return undefined;
  }
}

export type UiCaseBody = (session: UiTestSession) => Promise<void>;

/** Hypium 1.0.25 skips afterEach after rejection/timeout: cleanup belongs inside this body. */
export function uiCase(name: string, filter: number, body: UiCaseBody): void {
  const separator: number = name.lastIndexOf('_');
  const feature: string = separator < 0 ? name : name.substring(0, separator);
  if (!preparedFeatures.has(feature)) {
    beforeAll(prepareUiTestDriver);
    preparedFeatures.add(feature);
  }
  it(name, filter, async (): Promise<void> => {
    safeUiLog('info', `${name} begin`);
    let session: UiTestSession | undefined = undefined;
    let failed: boolean = false;
    let primary: Error | undefined = undefined;
    let watchdog: number = -1;
    try {
      session = new UiTestSession();
      const owned = session;
      const deadline = new Promise<void>((_resolve, reject): void => {
        watchdog = setTimeout((): void => {
          owned.retire();
          reject(new Error(`UI case exceeded its internal budget; ${owned.diagnostic()}`));
        }, owned.remaining());
      });
      await Promise.race([body(owned), deadline]);
    } catch (error) {
      failed = true; primary = error as Error;
      safeUiLog('error', `${name} failure`);
    } finally {
      if (watchdog >= 0) { clearTimeout(watchdog); }
      if (session !== undefined) {
        try { await session.close(); } catch (error) {
          safeUiLog('error', `${name} cleanup failure; original body failure has priority`);
          if (!failed) { failed = true; primary = error as Error; }
        }
      }
      safeUiLog('info', `${name} end`);
    }
    if (failed) { throw primary as Error; }
  });
}
