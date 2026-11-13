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
const TAG: string = '[Sample_AppStartupAuto]';
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
    const created = NativeDriver.create();
    if (created === undefined || created === null) { throw new Error('UiTest Driver is unavailable'); }
    sharedNativeDriver = created;
    return created;
  } catch (error) {
    // A failed exporter initialization may leave platform work in flight. Never retry it blindly.
    driverInitializationFailed = true;
    throw error as Error;
  }
}

/** Infrastructure only: no owned Ability or native operation may overlap initialization. */
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
    const left = this.after; const right = other.after;
    if (left === undefined || right === undefined) { return left === right; }
    return left.sameAs(right);
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

interface OwnedAbilityIdentity { bundleName: string; moduleName: string; name: string; }

export class UiTestSession {
  readonly id: string;
  private accepting: boolean = true;
  private deadline: number;
  private cleanupMs: number;
  private owner: common.UIAbilityContext | undefined = undefined;
  private ownerIdentity: OwnedAbilityIdentity | undefined = undefined;
  private nativeDrain: Promise<void> = Promise.resolve();
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

  constructor() {
    if (current !== undefined || pendingNative !== undefined) {
      throw new Error('Previous UI session has not drained or its owned Ability has not been destroyed; restart the test process if the native call never returns');
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
  private releaseIfSafe(): void {
    if (!this.accepting && pendingNative !== this && !this.awaitingOwner &&
      (this.owner === undefined || this.destroyed) && current === this) { current = undefined; }
  }
  retire(): void { this.accepting = false; this.releaseIfSafe(); }
  attach(owner: common.UIAbilityContext): void {
    if (this.owner !== undefined && this.owner !== owner) { throw new Error('UI session already owns another Ability'); }
    if (this.owner === undefined) {
      const info = owner.abilityInfo;
      this.ownerIdentity = { bundleName: info.bundleName, moduleName: info.moduleName, name: info.name };
    }
    this.owner = owner;
    this.awaitingOwner = false;
    const signal = this.signalOwner;
    if (signal !== undefined) { signal(); }
    if (!this.accepting) {
      // close may already have timed out waiting for this late onCreate. Still close ONLY this owner.
      this.terminateOwned(owner).catch((): void => { safeUiLog('error', 'Late owned UI Ability termination failed'); });
    }
  }
  owns(owner: common.UIAbilityContext): boolean { return this.owner === owner && !this.destroyed; }
  verifyOwnedForeground(foreground: common.UIAbilityContext): void {
    this.requireLive();
    const expected = this.ownerIdentity;
    if (this.owner === undefined || this.destroyed || expected === undefined) {
      throw new Error('UI session has no live owned Ability');
    }
    const observed = foreground.abilityInfo;
    // Delegator can return a context wrapper; compare the identity captured at exact-owner attach.
    if (observed.bundleName !== expected.bundleName || observed.moduleName !== expected.moduleName ||
      observed.name !== expected.name) { throw new Error('Foreground Ability does not match the owned UI host'); }
  }
  async requireOwnedForeground(): Promise<void> {
    this.requireLive();
    if (this.owner === undefined || this.destroyed || this.ownerIdentity === undefined) {
      throw new Error('UI session has no live owned Ability');
    }
    const top = await this.call(() =>
      abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility(), 'AbilityDelegator.getCurrentTopAbility');
    if (top === undefined || top === null) { throw new Error('No foreground UI Ability is available'); }
    this.verifyOwnedForeground(top.context);
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
    let operation: Promise<T>;
    try { operation = work(); } catch (error) {
      pendingNative = undefined;
      throw error as Error;
    }
    // Keep the busy marker until the REAL native promise settles, not until a race times out.
    const tracked: Promise<T> = operation.then((value: T): T => {
      if (pendingNative === this) { pendingNative = undefined; }
      this.releaseIfSafe();
      this.requireLive();
      return value;
    }, (error: Error): T => {
      if (pendingNative === this) { pendingNative = undefined; }
      this.releaseIfSafe();
      throw error;
    });
    // This observer acknowledges real settlement; the original error still reaches the caller.
    // It never clears pendingNative itself, including after the timeout race has rejected.
    this.nativeDrain = tracked.then((): void => {}, (): void => {});
    let timer: number = -1;
    const timeout = new Promise<T>((_resolve, reject): void => {
      timer = setTimeout((): void => {
        this.retire();
        reject(new Error(`Native UI operation ${operationName} exceeded its budget; its pending call remains quarantined`));
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
      watchdog = setTimeout((): void => {
        reject(new Error('Owned UI Ability attachment/destruction or native drain was not acknowledged'));
      }, this.cleanupMs);
    });
    const complete = async (): Promise<void> => {
      if (this.owner === undefined && this.awaitingOwner) { await this.ownerSignal; }
      const owner = this.owner;
      if (owner !== undefined && !this.destroyed) {
        await Promise.all([this.terminateOwned(owner), this.destroySignal]);
      }
      // onDestroy alone does not prove that the outstanding Driver RPC has really settled.
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

interface RetainedUiInput { selector: UiSelector; target: UiTestComponent; }

function centerInside(bounds: Rect, left: number, top: number, right: number, bottom: number): boolean {
  const x = (bounds.left + bounds.right) / 2;
  const y = (bounds.top + bounds.bottom) / 2;
  return bounds.right > bounds.left && bounds.bottom > bounds.top &&
    x >= left && x < right && y >= top && y < bottom;
}

export class UiTestDriver {
  public readonly session: UiTestSession;
  private native: NativeDriver;
  private displays: Map<number, Point> = new Map<number, Point>();
  private retainedInput: RetainedUiInput | undefined = undefined;
  private pendingTextInput: boolean = false;
  private scrollOffsetProbe: (() => number) | undefined = undefined;
  constructor(session: UiTestSession, native: NativeDriver) { this.session = session; this.native = native; }
  clearRetainedInput(): void { this.session.requireLive(); this.retainedInput = undefined; }
  rememberInputTarget(selector: UiSelector, target: UiTestComponent): void {
    this.clearRetainedInput();
    if (!target.belongsTo(this, selector)) { throw new Error('Input acknowledgment target belongs to another driver or selector'); }
    this.retainedInput = { selector: selector, target: target };
  }
  private takeInputTarget(selector: UiSelector): UiTestComponent | undefined {
    this.session.requireLive();
    const retained = this.retainedInput;
    this.retainedInput = undefined;
    return retained !== undefined && retained.selector.sameAs(selector) && retained.target.belongsTo(this, selector) ?
      retained.target : undefined;
  }
  noteTextInput(): void { this.clearRetainedInput(); this.pendingTextInput = true; }
  hasPendingTextInput(): boolean { this.session.requireLive(); return this.pendingTextInput; }
  async finishTextInput(): Promise<void> {
    if (this.hasPendingTextInput()) { await this.hideTextInput(); }
  }
  observeScrollOffset(probe: () => number): void {
    this.clearRetainedInput();
    this.scrollOffsetProbe = probe;
  }
  readScrollOffset(): number | undefined {
    this.session.requireLive();
    const probe = this.scrollOffsetProbe;
    if (probe === undefined) { return undefined; }
    const offset = probe();
    if (!Number.isFinite(offset)) { throw new Error('Owned UI scroll offset probe returned an invalid value'); }
    return offset;
  }
  /** A lookup is one RPC. Only actions and visible waits need geometry. */
  private async lookupComponent(selector: UiSelector): Promise<UiTestComponent | undefined> {
    const component = await this.session.call((): Promise<NativeComponent> =>
      this.native.findComponent(selector.materialize()), `Driver.findComponent:${selector.traceName()}`);
    if (component === undefined || component === null) { return undefined; }
    return new UiTestComponent(this, component, selector);
  }
  async findComponent(selector: UiSelector): Promise<UiTestComponent | undefined> {
    this.clearRetainedInput();
    let component = await this.lookupComponent(selector);
    if (component === undefined && this.hasPendingTextInput()) {
      // Retry only this read after dismissing our own IME; never replay a click or edit.
      await this.finishTextInput();
      component = await this.lookupComponent(selector);
    }
    return component;
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
    if (initial !== undefined && !initial.belongsTo(this, selector)) {
      throw new Error('Initial text acknowledgment target belongs to another driver or selector');
    }
    let candidate: UiTestComponent | undefined = initial === undefined ? retained : initial;
    while (true) {
      // Consume the actual input action target once and read native text, never a cached string.
      const component = candidate === undefined ? await this.findComponent(selector) : candidate;
      if (component !== undefined && await component.getText() === expected) { return; }
      if (Date.now() >= deadline) { throw new Error(`UI text did not reach its requested value: ${selector.traceName()}`); }
      candidate = undefined;
      await this.session.pause(50);
    }
  }
  async waitForIdle(idleMs: number, limitMs: number): Promise<boolean> {
    this.clearRetainedInput();
    // Legacy Archive helpers explicitly wait after input. Hide before waiting for a quiet tree.
    await this.finishTextInput();
    return this.session.call((): Promise<boolean> => this.native.waitForIdle(
      idleMs, Math.min(limitMs, 500, this.session.remaining())), 'Driver.waitForIdle');
  }
  async wakeUpDisplay(): Promise<void> {
    this.clearRetainedInput();
    await this.session.call((): Promise<void> => this.native.wakeUpDisplay(), 'Driver.wakeUpDisplay');
  }
  async hideTextInput(): Promise<void> {
    this.clearRetainedInput();
    // Unlike Back, hiding input cannot dismiss the page. Still verify our exact owner identity first.
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => inputMethod.getController().hideTextInput(), 'InputMethod.hideTextInput');
    this.pendingTextInput = false;
  }
  async pressBack(): Promise<void> {
    this.clearRetainedInput();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.pressBack(), 'Driver.pressBack');
  }
  async triggerKey(key: number): Promise<void> {
    this.clearRetainedInput();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.triggerKey(key), 'Driver.triggerKey');
  }
  async triggerCombineKeys(first: number, second: number): Promise<void> {
    this.clearRetainedInput();
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.triggerCombineKeys(first, second), 'Driver.triggerCombineKeys');
  }
  async swipe(startX: number, startY: number, endX: number, endY: number): Promise<void> {
    this.clearRetainedInput();
    await this.finishTextInput();
    const dx = endX - startX; const dy = endY - startY;
    // Speed is pixels/second, not a timeout. One swipe has about 500ms of gesture travel.
    const speed = Math.min(40000, Math.max(600, Math.ceil(Math.sqrt(dx * dx + dy * dy) * 2)));
    await this.session.requireOwnedForeground();
    await this.session.call((): Promise<void> => this.native.swipe(startX, startY, endX, endY, speed), 'Driver.swipe');
  }
  async getDisplaySize(displayId: number = 0): Promise<Point> {
    this.clearRetainedInput();
    // Geometry is cached only in this session's wrapper, never in the shared native exporter.
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
  private hasSelector: boolean;
  constructor(driver: UiTestDriver, native: NativeComponent, selector: UiSelector | undefined = undefined) {
    this.driver = driver; this.native = native;
    this.selector = selector === undefined ? ON : selector;
    this.hasSelector = selector !== undefined;
  }
  belongsTo(driver: UiTestDriver, selector: UiSelector): boolean {
    return this.driver === driver && this.hasSelector && this.selector.sameAs(selector);
  }
  async getText(): Promise<string> {
    this.driver.clearRetainedInput();
    return this.driver.session.call((): Promise<string> => this.native.getText(), `Component.getText:${this.selector.traceName()}`);
  }
  async isEnabled(): Promise<boolean> {
    this.driver.clearRetainedInput();
    return this.driver.session.call((): Promise<boolean> => this.native.isEnabled(), `Component.isEnabled:${this.selector.traceName()}`);
  }
  async isChecked(): Promise<boolean> {
    this.driver.clearRetainedInput();
    return this.driver.session.call((): Promise<boolean> => this.native.isChecked(), `Component.isChecked:${this.selector.traceName()}`);
  }
  async isDisplayed(): Promise<boolean> {
    const bounds = await this.getBounds();
    const display = await this.driver.getDisplaySize(bounds.displayId ?? 0);
    return centerInside(bounds, 0, 0, display.x, display.y);
  }
  private async actionTarget(): Promise<NativeComponent> {
    if (await this.isDisplayed()) { return this.native; }
    // Legacy two-argument wrappers have no descriptor with which to safely re-find an offscreen node.
    if (!this.hasSelector) { throw new Error('Offscreen UI action target has no selector descriptor'); }
    const scroll = await this.driver.findComponent(ON.type('Scroll'));
    if (scroll === undefined) { throw new Error(`UI action target is outside the display: ${this.selector.traceName()}`); }
    const visible = await scroll.scrollSearch(this.selector, this);
    if (visible === undefined) { throw new Error(`UI action target could not be scrolled into view: ${this.selector.traceName()}`); }
    return visible.native;
  }
  async click(): Promise<void> {
    const refresh = this.driver.hasPendingTextInput();
    if (refresh && !this.hasSelector) {
      throw new Error('UI click target has no descriptor for relocation after input');
    }
    this.driver.clearRetainedInput();
    await this.driver.finishTextInput();
    let component: UiTestComponent = this;
    if (refresh && this.hasSelector) {
      const found = await this.driver.findComponent(this.selector);
      if (found === undefined) { throw new Error('UI click target disappeared after input dismissal'); }
      component = found;
    }
    const target = await component.actionTarget();
    // Recheck immediately before dispatch, after any geometry lookup or scrolling awaits.
    await this.driver.session.requireOwnedForeground();
    await this.driver.session.call((): Promise<void> => target.click(), `Component.click:${this.selector.traceName()}`);
  }
  async inputText(value: string): Promise<void> { await this.inputTextTarget(value); }
  async inputTextTarget(value: string): Promise<UiTestComponent> {
    // Adjacent fields keep IME open; only actions, explicit idle or missing lookups finish it.
    this.driver.clearRetainedInput();
    const target = await this.actionTarget();
    await this.driver.session.requireOwnedForeground();
    await this.driver.session.call((): Promise<void> => target.inputText(value), `Component.inputText:${this.selector.traceName()}`);
    this.driver.noteTextInput();
    // Scrolling can re-find a different native handle. Keep only this actual action target.
    const actual = new UiTestComponent(this.driver, target, this.hasSelector ? this.selector : undefined);
    if (this.hasSelector) { this.driver.rememberInputTarget(this.selector, actual); }
    return actual;
  }
  async getBounds(): Promise<Rect> {
    this.driver.clearRetainedInput();
    return this.driver.session.call((): Promise<Rect> => this.native.getBounds(), `Component.getBounds:${this.selector.traceName()}`);
  }
  async scrollSearch(selector: UiSelector,
    initial: UiTestComponent | undefined = undefined): Promise<UiTestComponent | undefined> {
    this.driver.clearRetainedInput();
    if (initial !== undefined && !initial.belongsTo(this.driver, selector)) {
      throw new Error('Initial scroll target belongs to another driver or selector');
    }
    if (this.driver.hasPendingTextInput()) {
      if (!this.hasSelector) { throw new Error('UI scroll container has no descriptor for relocation after input'); }
      await this.driver.finishTextInput();
      const refreshed = await this.driver.findComponent(this.selector);
      if (refreshed === undefined) { throw new Error('UI scroll container disappeared after input dismissal'); }
      // No pre-dismissal initial handle or viewport survives the layout transition.
      return refreshed.scrollSearch(selector);
    }
    // Never dispatch native scrollToTop/scrollSearch: their internal loops can outlive the lease.
    const viewport = await this.getBounds();
    const displayId = viewport.displayId ?? 0;
    if (displayId !== 0) { throw new Error('Relative fixture scrolling requires the default display'); }
    const display = await this.driver.getDisplaySize(displayId);
    const left = Math.max(0, viewport.left); const right = Math.min(display.x, viewport.right);
    const top = Math.max(0, viewport.top); const bottom = Math.min(display.y, viewport.bottom);
    if (right - left <= 4 || bottom - top <= 40) { return undefined; }
    // Stay just inside the outer Scroll rather than swiping through an inner text editor.
    const x = Math.max(Math.ceil(left) + 1, Math.floor(right - 3));
    const gestureTop = Math.ceil(top + 20); const gestureBottom = Math.floor(bottom - 20);
    let towardTop: boolean = false;
    let directed: boolean = false;
    let reversed: boolean = false;
    let exhausted: boolean = false;
    for (let step = 0; step <= 16; step++) {
      this.driver.session.requireLive();
      const found = step === 0 && initial !== undefined ? initial : await this.driver.findComponent(selector);
      if (found !== undefined) {
        const bounds = await found.getBounds();
        if ((bounds.displayId ?? 0) !== displayId) { return undefined; }
        // Zero-sized clipped nodes cannot establish a scroll direction.
        if (bounds.right > bounds.left && bounds.bottom > bounds.top) {
          if (centerInside(bounds, left, top, right, bottom)) { return found; }
          const center = (bounds.top + bounds.bottom) / 2;
          if (center < top) { towardTop = true; directed = true; }
          else if (center >= bottom) { towardTop = false; directed = true; }
          else { return undefined; }
        }
      }
      if (step === 16 || exhausted) { return undefined; }
      const before = this.driver.readScrollOffset();
      // Legacy harnesses expose no offset probe. This is only a bounded blind search,
      // not evidence that a gesture moved the viewport or reached either edge.
      if (before === undefined && !directed) { towardTop = step >= 8; }
      const movingTowardTop: boolean = towardTop;
      if (movingTowardTop) { await this.driver.swipe(x, gestureTop, x, gestureBottom); }
      else { await this.driver.swipe(x, gestureBottom, x, gestureTop); }
      await this.driver.session.pause(50);
      const after = this.driver.readScrollOffset();
      if (before !== undefined && after !== undefined && Math.abs(after - before) < 0.5) {
        // Only real probe readings establish no progress. Reverse once, then do a final lookup.
        if (reversed) {
          exhausted = true;
        } else {
          reversed = true;
          towardTop = !movingTowardTop;
        }
      }
    }
    return undefined;
  }
}

export type UiCaseBody = (session: UiTestSession) => Promise<void>;

/** Hypium 1.0.25 skips afterEach after rejection/timeout: cleanup belongs inside this body. */
export function uiCase(name: string, filter: number, body: UiCaseBody): void {
  const separator = name.lastIndexOf('_');
  const feature = separator < 0 ? name : name.substring(0, separator);
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
          reject(new Error('UI case exceeded its internal budget before the framework timeout'));
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
