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
import { Component as NativeComponent, Driver as NativeDriver, ON as NATIVE_ON, On,
  Rect, Point, MatchPattern, abilityDelegatorRegistry } from '@kit.TestKit';
import { loggedIt as it } from './TestLog';
import { beforeAll } from '@ohos/hypium';
import { inputMethod } from '@kit.IMEKit';
import { RUNNER_TIMEOUT_MS } from './BoundedCase';
import { logError } from '../../../main/ets/core/Logger';

const SESSION_PARAMETER: string = 'sampleUiSession';
let sequence: number = 0;
let current: UiTestSession | undefined = undefined;
let pendingNative: UiTestSession | undefined = undefined;
let dispatching: UiTestSession | undefined = undefined;
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
  if (current !== undefined || pendingNative !== undefined || dispatching !== undefined) {
    throw new Error('Cannot prepare UiTest while a previous owned session is still active');
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
interface SelectorPart { kind: string; value: string; pattern?: MatchPattern; }

/** Plain descriptors only: even synchronous native On calls are inside the single-flight gate. */
export class UiSelector {
  private parts: SelectorPart[];
  private after: UiSelector | undefined;
  constructor(parts: SelectorPart[] = [], after: UiSelector | undefined = undefined) {
    this.parts = parts; this.after = after;
  }
  private add(kind: string, value: string, pattern?: MatchPattern): UiSelector {
    return new UiSelector(this.parts.concat([{ kind: kind, value: value, pattern: pattern }]), this.after);
  }
  id(value: string): UiSelector { return this.add('id', value); }
  text(value: string, pattern?: MatchPattern): UiSelector { return this.add('text', value, pattern); }
  type(value: string): UiSelector { return this.add('type', value); }
  inWindow(value: string): UiSelector { return this.add('window', value); }
  isAfter(value: UiSelector): UiSelector { return new UiSelector(this.parts, value); }
  sameAs(other: UiSelector): boolean {
    if (this.parts.length !== other.parts.length) { return false; }
    for (let index: number = 0; index < this.parts.length; index++) {
      const left: SelectorPart = this.parts[index];
      const right: SelectorPart = other.parts[index];
      if (left.kind !== right.kind || left.value !== right.value || left.pattern !== right.pattern) { return false; }
    }
    const after = this.after;
    const otherAfter = other.after;
    if (after === undefined || otherAfter === undefined) { return after === otherAfter; }
    return after.sameAs(otherAfter);
  }
  materialize(session: UiTestSession): On {
    session.requireLive();
    if (dispatching !== session || pendingNative !== session) { throw new Error('Native selector outside dispatch gate'); }
    let selector: On = NATIVE_ON;
    this.parts.forEach((part: SelectorPart): void => {
      if (part.kind === 'id') {
        selector = selector.id(part.value);
      } else if (part.kind === 'text') {
        selector = selector.text(part.value, part.pattern);
      } else if (part.kind === 'type') {
        selector = selector.type(part.value);
      } else if (part.kind === 'window') {
        selector = selector.inWindow(part.value);
      } else {
        throw new Error('Unsupported UI selector descriptor');
      }
    });
    if (this.after !== undefined) { selector = selector.isAfter(this.after.materialize(session)); }
    return selector;
  }
}
export const ON: UiSelector = new UiSelector();

export class UiTestSession {
  public readonly id: string;
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
  private cleanupFailed: boolean = false;
  private closing: Promise<void> | undefined = undefined;
  private termination: Promise<void> | undefined = undefined;
  private ownerSignal: Promise<void>;
  private signalOwner: (() => void) | undefined = undefined;
  private ownedCleanups: (() => void)[] = [];
  private destroyedCleanups: (() => void)[] = [];

  constructor() {
    if (current !== undefined || pendingNative !== undefined) {
      throw new Error('Previous UI/native session has not drained; restart the test process if it never settles');
    }
    const parameters = abilityDelegatorRegistry.getArguments().parameters;
    const supplied: number = Number(parameters['timeout'] ?? parameters['-s timeout']);
    const limit: number = Number.isFinite(supplied) && supplied > 0 ? supplied : RUNNER_TIMEOUT_MS;
    // Reserve cleanup and a framework margin, including for an externally shortened CLI timeout.
    this.deadline = Date.now() + Math.max(1, limit - Math.min(2500, limit * 0.3));
    this.cleanupMs = Math.min(2000, limit * 0.2);
    sequence++; this.id = String(sequence);
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
    if (!this.cleanupFailed) {
      this.cleanupFailed = true;
      this.cleanupFailure = new Error(`UI cleanup failed at ${phase}; code=${code}`);
    }
  }
  diagnostic(): string { return this.initializationFailure === undefined ? 'owned UI session' : this.initializationFailure.message; }
  isLive(): boolean {
    return this.accepting && !this.destroyed && current === this && Date.now() < this.deadline &&
      this.initializationFailure === undefined;
  }
  requireLive(): void {
    if (this.initializationFailure !== undefined) { throw this.initializationFailure; }
    if (!this.isLive()) { throw new Error('UI session ended or its case budget expired; late actions are cancelled'); }
  }
  remaining(): number { return Math.max(1, this.deadline - Date.now()); }
  private releaseIfSafe(): void {
    if (!this.accepting && pendingNative !== this && !this.awaitingOwner &&
      (this.owner === undefined || this.destroyed) && current === this) { current = undefined; }
  }
  ownCleanup(cleanup: () => void): void { this.requireLive(); this.ownedCleanups.push(cleanup); }
  ownDestroyCleanup(cleanup: () => void): void { this.requireLive(); this.destroyedCleanups.push(cleanup); }
  private restoreDestroyedResources(): void {
    const cleanups = this.destroyedCleanups; this.destroyedCleanups = [];
    cleanups.forEach((cleanup: () => void): void => {
      try { cleanup(); } catch (error) {
        if (!this.cleanupFailed) { this.cleanupFailed = true; this.cleanupFailure = error as Error; }
      }
    });
  }
  retire(): void {
    if (this.accepting) {
      this.accepting = false;
      const cleanups = this.ownedCleanups; this.ownedCleanups = [];
      cleanups.forEach((cleanup: () => void): void => {
        try { cleanup(); } catch (error) {
        if (!this.cleanupFailed) { this.cleanupFailed = true; this.cleanupFailure = error as Error; }
      }
      });
    }
    this.releaseIfSafe();
  }
  attach(owner: common.UIAbilityContext): void {
    if (this.owner !== undefined && this.owner !== owner) { throw new Error('UI session already owns another Ability'); }
    this.owner = owner; this.awaitingOwner = false;
    const signal = this.signalOwner; this.signalOwner = undefined;
    if (signal !== undefined) { signal(); }
    if (!this.accepting) {
      this.terminateOwned(owner).catch((): void => { logError('Late owned UI Ability termination failed'); });
    }
  }
  private terminateOwned(owner: common.UIAbilityContext): Promise<void> {
    if (this.termination === undefined) {
      this.termination = Promise.resolve().then((): Promise<void> => owner.terminateSelf());
    }
    return this.termination;
  }
  markDestroyed(owner: common.UIAbilityContext): void {
    if (this.owner !== owner) { return; }
    this.retire();
    this.restoreDestroyedResources();
    this.destroyed = true;
    const signal = this.signalDestroyed; this.signalDestroyed = undefined;
    if (signal !== undefined) { signal(); }
    this.releaseIfSafe();
  }
  async pause(ms: number): Promise<void> {
    this.requireLive();
    await new Promise<void>((resolve): void => { setTimeout(resolve, Math.min(ms, this.remaining())); });
    this.requireLive();
  }
  async requireOwnedForeground(): Promise<void> {
    this.requireLive();
    const owner = this.owner;
    if (owner === undefined) { throw new Error('UI action requires its captured Ability owner'); }
    const top = await this.call(() => abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility());
    this.requireLive();
    if (this.owner !== owner || top === undefined || top === null ||
      top.context.abilityInfo.bundleName !== owner.abilityInfo.bundleName ||
      top.context.abilityInfo.moduleName !== owner.abilityInfo.moduleName ||
      top.context.abilityInfo.name !== owner.abilityInfo.name) {
      throw new Error('Owned UI Ability is no longer foreground; input action cancelled');
    }
  }
  /** Model awaiters need the same post-await invalidation check as native awaiters. */
  async guard<T>(operation: Promise<T>): Promise<T> {
    // The argument may already have rejected while being constructed; consume it even if this lease expired.
    operation.catch((): void => {});
    this.requireLive();
    const value = await operation;
    this.requireLive();
    return value;
  }
  async call<T>(work: () => Promise<T>): Promise<T> {
    this.requireLive();
    if (pendingNative !== undefined) { throw new Error('Concurrent native UI operation rejected before dispatch'); }
    pendingNative = this; dispatching = this;
    let operation: Promise<T>;
    try { operation = work(); } catch (error) {
      pendingNative = undefined;
      throw error as Error;
    } finally { dispatching = undefined; }
    // This observer alone releases busy. A deadline/race/close never pretends to cancel native work.
    const tracked: Promise<T> = operation.then((value: T): T => {
      if (pendingNative === this) { pendingNative = undefined; }
      this.releaseIfSafe(); this.requireLive(); return value;
    }, (error: Error): T => {
      if (pendingNative === this) { pendingNative = undefined; }
      this.releaseIfSafe(); throw error;
    });
    // Observe real settlement without changing the original call's rejection.
    this.nativeDrain = tracked.then((): void => {}, (): void => {});
    let timer: number = -1;
    const timeout = new Promise<T>((_resolve, reject): void => {
      timer = setTimeout((): void => {
        this.retire(); reject(new Error('Native UI operation exceeded its budget; actual pending call remains quarantined'));
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
    if (pendingNative !== undefined) { throw new Error('Native UI is busy; Driver.create was not dispatched'); }
    pendingNative = this; dispatching = this;
    try {
      const native = initializedUiDriver();
      pendingNative = undefined; this.requireLive(); return new UiTestDriver(this, native);
    } catch (error) {
      // Initialization failure can indicate untracked platform work. Fail closed; do not retry create.
      this.retire(); throw error as Error;
    } finally { dispatching = undefined; }
  }
  async startAbility(bundle: string, ability: string, parameters: Record<string, Object>): Promise<void> {
    this.requireLive(); parameters[SESSION_PARAMETER] = this.id; this.awaitingOwner = true;
    await this.call((): Promise<void> => abilityDelegatorRegistry.getAbilityDelegator().startAbility({
      bundleName: bundle, moduleName: 'entry_test', abilityName: ability, parameters: parameters
    }).catch((error: Error): void => {
      this.awaitingOwner = false;
      const signal = this.signalOwner; this.signalOwner = undefined;
      if (signal !== undefined) { signal(); }
      this.releaseIfSafe(); throw error;
    }));
  }
  close(): Promise<void> {
    this.retire();
    if (this.closing === undefined) { this.closing = this.closeOwned(); }
    return this.closing;
  }
  private async closeOwned(): Promise<void> {
    let watchdog: number = -1;
    const timeout = new Promise<void>((_resolve, reject): void => {
      watchdog = setTimeout((): void => {
        reject(new Error('Owned UI Ability attachment/destruction was not acknowledged'));
      }, this.cleanupMs);
    });
    const complete = async (): Promise<void> => {
      if (this.owner === undefined && this.awaitingOwner) { await this.ownerSignal; }
      const owner = this.owner;
      if (owner !== undefined && !this.destroyed) {
        await Promise.all([this.terminateOwned(owner), this.destroySignal]);
      } else if (owner === undefined) {
        this.restoreDestroyedResources();
      }
      await this.nativeDrain;
      if (this.cleanupFailed) { throw this.cleanupFailure as Error; }
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

/** A late host is identified by its exact nonce, then must requireLive before loading a page. */
export function claimUiTestSession(want: Want, owner: common.UIAbilityContext): UiTestSession | undefined {
  const session = current;
  if (session === undefined || want.parameters === undefined ||
    want.parameters[SESSION_PARAMETER] !== session.id) {
    return undefined;
  }
  session.attach(owner); return session;
}
export function requireUiTestSession(id: string): UiTestSession {
  const session = current;
  if (session === undefined || session.id !== id) { throw new Error('Test page belongs to an obsolete UI launch'); }
  session.requireLive(); return session;
}

export class UiTestDriver {
  public readonly session: UiTestSession;
  private native: NativeDriver;
  private displays: Map<number, Point> = new Map<number, Point>();
  private inputSelector: UiSelector | undefined = undefined;
  private inputTarget: UiTestComponent | undefined = undefined;
  private pendingTextInput: boolean = false;
  constructor(session: UiTestSession, native: NativeDriver) { this.session = session; this.native = native; }
  invalidateInputTarget(): void { this.inputSelector = undefined; this.inputTarget = undefined; }
  hasPendingTextInput(): boolean { this.session.requireLive(); return this.pendingTextInput; }
  noteTextInput(): void { this.session.requireLive(); this.invalidateInputTarget(); this.pendingTextInput = true; }
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
    await this.session.call((): Promise<void> => inputMethod.getController().hideTextInput());
    this.pendingTextInput = false;
  }
  async finishTextInput(): Promise<void> {
    this.session.requireLive();
    this.invalidateInputTarget();
    if (this.pendingTextInput) { await this.hideTextInput(); }
  }
  async findComponent(selector: UiSelector): Promise<UiTestComponent | undefined> {
    this.invalidateInputTarget();
    let node = await this.session.call((): Promise<NativeComponent> =>
      this.native.findComponent(selector.materialize(this.session)));
    if ((node === undefined || node === null) && this.pendingTextInput) {
      await this.finishTextInput();
      // Only a read-only lookup can be retried after IME dismissal.
      node = await this.session.call((): Promise<NativeComponent> =>
        this.native.findComponent(selector.materialize(this.session)));
    }
    return node === undefined || node === null ? undefined : new UiTestComponent(this, node, selector);
  }
  async waitForComponent(selector: UiSelector, ms: number): Promise<UiTestComponent | undefined> {
    const deadline = Date.now() + Math.min(ms, this.session.remaining());
    while (true) {
      const node = await this.findComponent(selector);
      if (node !== undefined && await node.isDisplayed()) { return node; }
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
      const component: UiTestComponent | undefined = candidate === undefined ?
        await this.findComponent(selector) : candidate;
      if (component !== undefined && await component.getText() === expected) { return; }
      if (Date.now() >= deadline) { throw new Error('UI text did not reach its requested value'); }
      candidate = undefined;
      await this.session.pause(50);
    }
  }
  async waitForIdle(idleMs: number, limitMs: number): Promise<boolean> {
    await this.finishTextInput();
    return this.session.call((): Promise<boolean> =>
      this.native.waitForIdle(idleMs, Math.min(limitMs, 500, this.session.remaining())));
  }
  async wakeUpDisplay(): Promise<void> {
    this.invalidateInputTarget();
    await this.session.call((): Promise<void> => this.native.wakeUpDisplay());
  }
  async swipe(x: number, y: number, toX: number, toY: number, speed: number = 600): Promise<void> {
    this.invalidateInputTarget();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.swipe(x, y, toX, toY, speed));
  }
  async getDisplaySize(displayId: number = 0): Promise<Point> {
    this.session.requireLive();
    this.invalidateInputTarget();
    let display = this.displays.get(displayId);
    if (display === undefined) {
      display = await this.session.call((): Promise<Point> => this.native.getDisplaySize(displayId));
      this.displays.set(displayId, display);
    }
    return display;
  }
}
export class UiTestComponent {
  private driver: UiTestDriver;
  private native: NativeComponent;
  private selector: UiSelector | undefined;
  constructor(driver: UiTestDriver, native: NativeComponent, selector: UiSelector | undefined = undefined) {
    this.driver = driver; this.native = native; this.selector = selector;
  }
  matches(driver: UiTestDriver, selector: UiSelector): boolean {
    return this.driver === driver && this.selector !== undefined && this.selector.sameAs(selector);
  }
  async getText(): Promise<string> {
    this.driver.invalidateInputTarget();
    return this.driver.session.call((): Promise<string> => this.native.getText());
  }
  async isEnabled(): Promise<boolean> {
    this.driver.invalidateInputTarget();
    return this.driver.session.call((): Promise<boolean> => this.native.isEnabled());
  }
  async isDisplayed(): Promise<boolean> {
    const bounds = await this.getBounds(); const display = await this.driver.getDisplaySize(bounds.displayId ?? 0);
    const x = (bounds.left + bounds.right) / 2; const y = (bounds.top + bounds.bottom) / 2;
    return bounds.right > bounds.left && bounds.bottom > bounds.top &&
      x >= 0 && x < display.x && y >= 0 && y < display.y;
  }
  private async actionTarget(): Promise<NativeComponent> {
    if (await this.isDisplayed()) { return this.native; }
    const selector = this.selector;
    if (selector === undefined) { throw new Error('UI action target is outside the display and has no lookup descriptor'); }
    const scroll = await this.driver.findComponent(ON.type('Scroll'));
    if (scroll === undefined) { throw new Error('UI action target is outside the display'); }
    const visible = await scroll.scrollSearch(selector);
    if (visible === undefined) { throw new Error('UI action target could not be scrolled into view'); }
    return visible.native;
  }
  async click(): Promise<void> {
    const refresh = this.driver.hasPendingTextInput();
    if (refresh && this.selector === undefined) {
      throw new Error('UI click target has no descriptor for relocation after input');
    }
    await this.driver.finishTextInput();
    const selector = this.selector;
    let component: UiTestComponent = this;
    if (refresh && selector !== undefined) {
      const found = await this.driver.findComponent(selector);
      if (found === undefined) { throw new Error('UI click target disappeared after input dismissal'); }
      component = found;
    }
    const target = await component.actionTarget();
    await this.driver.session.requireOwnedForeground();
    await this.driver.session.call((): Promise<void> => target.click());
  }
  async inputText(value: string): Promise<void> { await this.inputTextTarget(value); }
  async inputTextTarget(value: string): Promise<UiTestComponent> {
    this.driver.invalidateInputTarget();
    const target = await this.actionTarget();
    await this.driver.session.requireOwnedForeground();
    await this.driver.session.call((): Promise<void> => target.inputText(value));
    const selector = this.selector;
    const input = new UiTestComponent(this.driver, target, selector);
    if (selector !== undefined) {
      this.driver.rememberInputTarget(selector, input);
    } else {
      this.driver.noteTextInput();
    }
    return input;
  }
  async getBounds(): Promise<Rect> {
    this.driver.invalidateInputTarget();
    return this.driver.session.call((): Promise<Rect> => this.native.getBounds());
  }
  async scrollSearch(selector: UiSelector): Promise<UiTestComponent | undefined> {
    this.driver.invalidateInputTarget();
    if (this.driver.hasPendingTextInput()) {
      const ownSelector = this.selector;
      if (ownSelector === undefined) { throw new Error('UI scroll container has no descriptor for relocation after input'); }
      await this.driver.finishTextInput();
      const refreshed = await this.driver.findComponent(ownSelector);
      if (refreshed === undefined) { throw new Error('UI scroll container disappeared after input dismissal'); }
      return refreshed.scrollSearch(selector);
    }
    // Each gesture is one bounded RPC; never use native multi-gesture scrollToTop.
    const viewport = await this.getBounds();
    if ((viewport.displayId ?? 0) !== 0) { throw new Error('Relative fixture scrolling requires the default display'); }
    const display = await this.driver.getDisplaySize(viewport.displayId ?? 0);
    const top = Math.max(0, viewport.top) + 20;
    const bottom = Math.min(display.y - 1, viewport.bottom) - 20;
    const x = Math.max(1, Math.min(display.x - 1, Math.floor((viewport.left + viewport.right) / 2)));
    if (bottom <= top) { return undefined; }
    const speed = Math.max(200, Math.min(15000, Math.round((bottom - top) * 2)));
    for (let step: number = 0; step <= 16; step++) {
      const found = await this.driver.findComponent(selector);
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
      if (step === 16) { return undefined; }
      if (towardTop) {
        await this.driver.swipe(x, top, x, bottom, speed);
      } else {
        await this.driver.swipe(x, bottom, x, top, speed);
      }
      await this.driver.session.pause(50);
    }
    return undefined;
  }
}
export type UiCaseBody = (session: UiTestSession) => Promise<void>;

/** Framework afterEach is not a finally: revoke and destroy the captured owner inside this body. */
export function uiCase(name: string, filter: number, body: UiCaseBody): void {
  prepareUiSuite(name);
  it(name, filter, async (): Promise<void> => {
    let session: UiTestSession | undefined = undefined;
    let primary: Error | undefined = undefined;
    let failed: boolean = false;
    let watchdog: number = -1;
    try {
      session = new UiTestSession(); const owned = session;
      const deadline = new Promise<void>((_resolve, reject): void => {
        watchdog = setTimeout((): void => {
          owned.retire(); reject(new Error('UI case exceeded its internal budget before framework timeout'));
        }, owned.remaining());
      });
      await Promise.race([body(owned), deadline]);
    } catch (error) {
      failed = true;
      primary = error as Error;
    } finally {
      if (watchdog >= 0) { clearTimeout(watchdog); }
      if (session !== undefined) {
        try { await session.close(); } catch (error) {
          logError(`${name} owned UI cleanup failed; original body failure has priority`);
          if (!failed) { failed = true; primary = error as Error; }
        }
      }
    }
    if (failed) { throw primary as Error; }
  });
}
