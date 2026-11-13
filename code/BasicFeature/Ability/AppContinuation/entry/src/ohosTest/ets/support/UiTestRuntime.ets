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
import { beforeAll, it } from '@ohos/hypium';
import { inputMethod } from '@kit.IMEKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppContinuation]';
const SESSION_PARAMETER: string = 'sampleUiSession';
let sequence: number = 0;
let current: UiTestSession | undefined = undefined;
let pendingNative: UiTestSession | undefined = undefined;
// These resources belong only to this module/test process, never to another project.
let sharedDriver: NativeDriver | undefined = undefined;
let driverInitializationFailed: boolean = false;
const preparedUiSuites: Set<string> = new Set<string>();

function initializedUiDriver(): NativeDriver {
  if (driverInitializationFailed) { throw new Error('UiTest driver initialization previously failed; restart the test process'); }
  const existing = sharedDriver;
  if (existing !== undefined) { return existing; }
  try {
    const created = NativeDriver.create();
    if (created === undefined || created === null) { throw new Error('UiTest Driver is unavailable'); }
    sharedDriver = created;
    return created;
  } catch (error) {
    driverInitializationFailed = true;
    throw error as Error;
  }
}

export function prepareUiTestDriver(): void {
  if (current !== undefined || pendingNative !== undefined) {
    const active: UiTestSession | undefined = pendingNative === undefined ? current : pendingNative;
    const detail: string = active === undefined ? 'no session diagnostic' : active.diagnostic();
    throw new Error(`Cannot prepare UiTest while a previous owned session is still active; ${detail}`);
  }
  initializedUiDriver();
}

function prepareUiSuite(name: string): void {
  const separator: number = name.lastIndexOf('_');
  const suiteKey: string = separator > 0 ? name.slice(0, separator) : name;
  if (preparedUiSuites.has(suiteKey)) { return; }
  beforeAll((): void => { prepareUiTestDriver(); });
  preparedUiSuites.add(suiteKey);
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
    for (let index: number = 0; index < this.parts.length; index++) {
      const left: SelectorPart = this.parts[index];
      const right: SelectorPart = other.parts[index];
      if (left.kind !== right.kind || left.value !== right.value) { return false; }
    }
    const after = this.after;
    const otherAfter = other.after;
    if (after === undefined || otherAfter === undefined) { return after === otherAfter; }
    return after.sameAs(otherAfter);
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
  private nativeDrain: Promise<void> = Promise.resolve();
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
    this.deadline = Date.now() + Math.max(1, limit - Math.min(2500, limit * 0.3));
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
      `awaitingOwner=${this.awaitingOwner}, destroyed=${this.destroyed}`;
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
  owns(owner: common.UIAbilityContext): boolean { return this.owner === owner && !this.destroyed; }
  verifyOwnedForeground(foreground: common.UIAbilityContext): void {
    this.requireLive();
    const owner = this.owner;
    if (owner === undefined || this.destroyed) { throw new Error('UI session has no live owned Ability'); }
    const expected = owner.abilityInfo;
    const observed = foreground.abilityInfo;
    if (observed.bundleName !== expected.bundleName || observed.moduleName !== expected.moduleName ||
      observed.name !== expected.name) { throw new Error('Foreground Ability does not match the owned UI host'); }
  }
  async requireOwnedForeground(): Promise<void> {
    this.requireLive();
    const owner = this.owner;
    if (owner === undefined) { throw new Error('UI action requires its captured Ability owner'); }
    const top = await this.call(() => abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility(),
      'AbilityDelegator.getCurrentTopAbility');
    this.requireLive();
    if (this.owner !== owner || top === undefined || top === null ||
      top.context.abilityInfo.bundleName !== owner.abilityInfo.bundleName ||
      top.context.abilityInfo.moduleName !== owner.abilityInfo.moduleName ||
      top.context.abilityInfo.name !== owner.abilityInfo.name) {
      throw new Error('Owned UI Ability is no longer foreground; input action cancelled');
    }
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
    let operation: Promise<T>;
    try { operation = work(); } catch (error) {
      pendingNative = undefined;
      this.operation = 'none';
      throw error as Error;
    }
    // Keep the busy marker until the REAL native promise settles, not until a race times out.
    const tracked: Promise<T> = operation.then((value: T): T => {
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
    // Observe real settlement without changing the original call's rejection.
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
      pendingNative = undefined;
      this.requireLive();
      return new UiTestDriver(this, native);
    } catch (error) {
      // A create failure can mean an untracked platform call is still active. Do not blindly retry.
      this.retire();
      throw error as Error;
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
      watchdog = setTimeout((): void => { reject(new Error(`Owned UI Ability attachment/destruction was not acknowledged; ${this.diagnostic()}`)); }, this.cleanupMs);
    });
    const complete = async (): Promise<void> => {
      if (this.owner === undefined && this.awaitingOwner) { await this.ownerSignal; }
      const owner = this.owner;
      if (owner !== undefined && !this.destroyed) {
        await Promise.all([this.terminateOwned(owner), this.destroySignal]);
      }
      await this.nativeDrain;
      if (this.cleanupFailure !== undefined) { throw this.cleanupFailure; }
      if (this.initializationFailure !== undefined) { throw this.initializationFailure; }
    };
    try {
      await Promise.race([complete(), timeout]);
    } finally {
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

export class UiTestDriver {
  readonly session: UiTestSession;
  private native: NativeDriver;
  private displays: Map<number, Point> = new Map<number, Point>();
  private inputSelector: UiSelector | undefined = undefined;
  private inputTarget: UiTestComponent | undefined = undefined;
  private pendingTextInput: boolean = false;
  private scrollOffsetProbe: (() => number) | undefined = undefined;
  constructor(session: UiTestSession, native: NativeDriver) { this.session = session; this.native = native; }
  observeScrollOffset(probe: () => number): void {
    this.session.requireLive();
    this.invalidateInputTarget();
    this.scrollOffsetProbe = probe;
  }
  readScrollOffset(): number | undefined {
    this.session.requireLive();
    const probe = this.scrollOffsetProbe;
    if (probe === undefined) { return undefined; }
    const offset: number = probe();
    if (!Number.isFinite(offset)) { throw new Error('Owned UI scroll offset probe returned an invalid value'); }
    return offset;
  }
  invalidateInputTarget(): void { this.inputSelector = undefined; this.inputTarget = undefined; }
  hasPendingTextInput(): boolean { this.session.requireLive(); return this.pendingTextInput; }
  rememberInputTarget(selector: UiSelector, target: UiTestComponent): void {
    this.session.requireLive();
    if (!target.matches(this, selector)) { throw new Error('Input target belongs to another driver or selector'); }
    this.inputSelector = selector; this.inputTarget = target; this.pendingTextInput = true;
  }
  private takeInputTarget(selector: UiSelector): UiTestComponent | undefined {
    this.session.requireLive();
    const savedSelector = this.inputSelector;
    const savedTarget = this.inputTarget;
    this.invalidateInputTarget();
    return savedSelector !== undefined && savedSelector.sameAs(selector) && savedTarget !== undefined &&
      savedTarget.matches(this, selector) ? savedTarget : undefined;
  }
  async hideTextInput(): Promise<void> {
    this.invalidateInputTarget();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => inputMethod.getController().hideTextInput(), 'InputMethod.hideTextInput');
    this.pendingTextInput = false;
  }
  async finishTextInput(): Promise<void> {
    this.session.requireLive();
    this.invalidateInputTarget();
    if (this.pendingTextInput) { await this.hideTextInput(); }
  }
  /** A read-only lookup is one RPC; geometry is checked before actions, not every property read. */
  async findComponent(selector: UiSelector): Promise<UiTestComponent | undefined> {
    this.invalidateInputTarget();
    let component = await this.session.call((): Promise<NativeComponent> =>
      this.native.findComponent(selector.materialize()), `Driver.findComponent:${selector.traceName()}`);
    if ((component === undefined || component === null) && this.pendingTextInput) {
      await this.finishTextInput();
      // Only replay a read-only lookup after IME dismissal, never a click or text injection.
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
    const retained = this.takeInputTarget(selector);
    if (initial !== undefined && !initial.matches(this, selector)) {
      throw new Error('Text read target belongs to another driver or selector');
    }
    let candidate: UiTestComponent | undefined = initial === undefined ? retained : initial;
    while (true) {
      const component: UiTestComponent | undefined =
        candidate === undefined ? await this.findComponent(selector) : candidate;
      if (component !== undefined && await component.getText() === expected) { return; }
      if (Date.now() >= deadline) { throw new Error(`UI text did not reach its requested value: ${selector.traceName()}`); }
      candidate = undefined;
      await this.session.pause(50);
    }
  }
  async waitForIdle(idleMs: number, limitMs: number): Promise<boolean> {
    await this.finishTextInput();
    return this.session.call((): Promise<boolean> =>
      this.native.waitForIdle(idleMs, Math.min(limitMs, 500, this.session.remaining())), 'Driver.waitForIdle');
  }
  async wakeUpDisplay(): Promise<void> {
    this.invalidateInputTarget();
    await this.session.call((): Promise<void> => this.native.wakeUpDisplay(), 'Driver.wakeUpDisplay');
  }
  async pressBack(): Promise<void> {
    this.invalidateInputTarget();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.pressBack(), 'Driver.pressBack');
  }
  async triggerKey(key: number): Promise<void> {
    this.invalidateInputTarget();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.triggerKey(key), 'Driver.triggerKey');
  }
  async triggerCombineKeys(first: number, second: number): Promise<void> {
    this.invalidateInputTarget();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.triggerCombineKeys(first, second), 'Driver.triggerCombineKeys');
  }
  async swipe(startX: number, startY: number, endX: number, endY: number): Promise<void> {
    this.invalidateInputTarget();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.swipe(startX, startY, endX, endY, 1600), 'Driver.swipe');
  }
  async getDisplaySize(displayId: number = 0): Promise<Point> {
    this.session.requireLive();
    this.invalidateInputTarget();
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
    this.driver.invalidateInputTarget();
    return this.driver.session.call((): Promise<string> => this.native.getText(), `Component.getText:${this.selector.traceName()}`);
  }
  async isEnabled(): Promise<boolean> {
    this.driver.invalidateInputTarget();
    return this.driver.session.call((): Promise<boolean> => this.native.isEnabled(), `Component.isEnabled:${this.selector.traceName()}`);
  }
  async isChecked(): Promise<boolean> {
    this.driver.invalidateInputTarget();
    return this.driver.session.call((): Promise<boolean> => this.native.isChecked(), `Component.isChecked:${this.selector.traceName()}`);
  }
  async isDisplayed(): Promise<boolean> {
    const bounds = await this.getBounds();
    const display = await this.driver.getDisplaySize(bounds.displayId ?? 0);
    const x = (bounds.left + bounds.right) / 2;
    const y = (bounds.top + bounds.bottom) / 2;
    const visible: boolean = bounds.right > bounds.left && bounds.bottom > bounds.top &&
      x >= 0 && x < display.x && y >= 0 && y < display.y;
    if (!visible) {
      safeUiLog('info', `UI target not visible id=${this.selector.traceName()} ` +
        `bounds=${bounds.left},${bounds.top},${bounds.right},${bounds.bottom} display=${display.x},${display.y}`);
    }
    return visible;
  }
  private async actionTarget(): Promise<NativeComponent> {
    if (await this.isDisplayed()) { return this.native; }
    const scroll = await this.driver.findComponent(ON.type('Scroll'));
    if (scroll === undefined) { throw new Error(`UI action target is outside the display: ${this.selector.traceName()}`); }
    const visible = await scroll.scrollSearch(this.selector, this);
    if (visible === undefined) { throw new Error(`UI action target could not be scrolled into view: ${this.selector.traceName()}`); }
    return visible.native;
  }
  async click(): Promise<void> {
    const refresh = this.driver.hasPendingTextInput();
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
    this.driver.invalidateInputTarget();
    const target = await this.actionTarget();
    await this.driver.session.requireOwnedForeground();
    await this.driver.session.call((): Promise<void> => target.inputText(value), `Component.inputText:${this.selector.traceName()}`);
    const input = new UiTestComponent(this.driver, target, this.selector);
    this.driver.rememberInputTarget(this.selector, input);
    return input;
  }
  async getBounds(): Promise<Rect> {
    this.driver.invalidateInputTarget();
    return this.driver.session.call((): Promise<Rect> => this.native.getBounds(), `Component.getBounds:${this.selector.traceName()}`);
  }
  async scrollSearch(selector: UiSelector,
    initial: UiTestComponent | undefined = undefined): Promise<UiTestComponent | undefined> {
    this.driver.invalidateInputTarget();
    if (initial !== undefined && !initial.matches(this.driver, selector)) {
      throw new Error('Initial scroll target belongs to another driver or selector');
    }
    if (this.driver.hasPendingTextInput()) {
      await this.driver.finishTextInput();
      const refreshed = await this.driver.findComponent(this.selector);
      if (refreshed === undefined) { throw new Error('UI scroll container disappeared after input dismissal'); }
      // No pre-dismissal handle or geometry survives the layout transition.
      return refreshed.scrollSearch(selector);
    }
    // All scrolling remains a bounded sequence of real gestures, never a native auto-loop.
    const viewport: Rect = await this.getBounds();
    const displayId: number = viewport.displayId ?? 0;
    if (displayId !== 0) { throw new Error('Relative fixture scrolling requires the default display'); }
    const display: Point = await this.driver.getDisplaySize(displayId);
    const left: number = Math.max(0, viewport.left);
    const right: number = Math.min(display.x - 1, viewport.right);
    const top: number = Math.max(0, viewport.top) + 20;
    const bottom: number = Math.min(display.y - 1, viewport.bottom) - 20;
    if (right - left <= 4 || bottom <= top) { return undefined; }
    // The outer gutter keeps the gesture outside the TextArea's internal scroll container.
    const x: number = Math.max(Math.ceil(left) + 1, Math.floor(right - 3));
    let towardTop: boolean = false;
    let directed: boolean = false;
    let reversed: boolean = false;
    let exhausted: boolean = false;
    for (let step: number = 0; step <= 8; step++) {
      const found: UiTestComponent | undefined = step === 0 && initial !== undefined ? initial :
        await this.driver.findComponent(selector);
      if (found !== undefined) {
        const bounds: Rect = await found.getBounds();
        if ((bounds.displayId ?? 0) !== displayId) { return undefined; }
        const center: number = (bounds.top + bounds.bottom) / 2;
        if (bounds.right > bounds.left && bounds.bottom > bounds.top) {
          if (center >= top && center <= bottom && (bounds.left + bounds.right) / 2 >= left &&
            (bounds.left + bounds.right) / 2 < right) { return found; }
          towardTop = center < top;
          directed = true;
        }
      }
      if (step === 8 || exhausted) { return undefined; }
      const before: number | undefined = this.driver.readScrollOffset();
      // Without a harness probe this remains bounded blind search, not proof of an edge.
      if (before === undefined && !directed) { towardTop = step >= 2; }
      const movingTowardTop: boolean = towardTop;
      if (movingTowardTop) { await this.driver.swipe(x, top, x, bottom); }
      else { await this.driver.swipe(x, bottom, x, top); }
      await this.driver.session.pause(30);
      const after: number | undefined = this.driver.readScrollOffset();
      if (before !== undefined && after !== undefined) {
        const progressed: boolean = Math.abs(after - before) > 0.5;
        safeUiLog('info', `UI scroll probe target=${selector.traceName()}, step=${step}, ` +
          `direction=${movingTowardTop ? 'top' : 'bottom'}, before=${before}, after=${after}, progressed=${progressed}`);
        if (!progressed) {
          if (reversed) { exhausted = true; }
          else { reversed = true; towardTop = !movingTowardTop; }
        }
      }
    }
    return undefined;
  }
}

export type UiCaseBody = (session: UiTestSession) => Promise<void>;

/** Hypium 1.0.25 skips afterEach after rejection/timeout: cleanup belongs inside this body. */
export function uiCase(name: string, filter: number, body: UiCaseBody): void {
  prepareUiSuite(name);
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
