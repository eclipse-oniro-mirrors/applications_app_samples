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
import { UIAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  abilityDelegatorRegistry,
  Component,
  Driver,
  MatchPattern,
  ON,
  On,
  UiDirection,
  UiWindow
} from '@kit.TestKit';

const DOMAIN: number = 0xF821;
const TAG: string = '[Sample_SystemConfig]';
const BUNDLE_NAME: string = 'com.samples.systemconfig';
const ENTRY_ABILITY: string = 'EntryAbility';
/**
 * Per-step component wait budget. After a page transition waitForIdle has already run and
 * normal rendering only needs tens of milliseconds, so a small value is chosen deliberately:
 * exhausting the budget only happens when the page state is abnormal, and a value too large
 * would let a single case chain several waits and exceed the per-case aa test timeout.
 */
const DEFAULT_TIMEOUT_MS: number = 4000;
const LAUNCH_TIMEOUT_MS: number = 6000;
const ABILITY_POLL_TIMEOUT_MS: number = 3000;
const SCROLL_LOCATE_TIMEOUT_MS: number = 2000;
const LOCATE_BUDGET_MS: number = 5000;
const EXTERNAL_WINDOW_TIMEOUT_MS: number = 8000;
const READ_IDLE_MS: number = 150;
const READ_IDLE_TIMEOUT_MS: number = 1500;
const NAVIGATION_IDLE_MS: number = 250;
const NAVIGATION_IDLE_TIMEOUT_MS: number = 2500;
const POLL_INTERVAL_MS: number = 150;
const CONCURRENT_CALL_CODE: number = 17000002;
const CHANNEL_CONNECT_CODE: number = 17000001;
const BUSY_RETRY_LIMIT: number = 10;
const BUSY_RETRY_BACKOFF_MS: number = 600;
const SWEEP_VIEWPORT_LIMIT: number = 4;
const SWEEP_FLING_SPEED: number = 8000;
const FAST_SCROLL_SPEED: number = 8000;

/**
 * Pure timer-based wait. driver.delayMs cannot be used while the UiTest channel is occupied.
 */
function delay(durationMs: number): Promise<void> {
  return new Promise<void>((resolve: () => void): void => {
    setTimeout((): void => {
      resolve();
    }, durationMs);
  });
}

/**
 * Whether the UiTest channel is in a "temporarily unavailable" state.
 * 17000002: an operation left over from the previous timed-out case still holds the channel.
 * 17000001: the AAMS-side connection is not ready, either because the previous test process's
 *           link has not been reclaimed yet, or because another uitest client on the device
 *           (e.g. another sample's uitest start-daemon) is exclusively holding the channel.
 *           Both release on their own, so back off and retry instead of giving up immediately,
 *           otherwise one case occupying the channel would turn all subsequent UI cases into Error at once.
 */
function isChannelBusyError(error: Object): boolean {
  const businessError: BusinessError = error as BusinessError;
  return businessError.code === CONCURRENT_CALL_CODE || businessError.code === CHANNEL_CONNECT_CODE;
}

/**
 * Driver is a stateless facade over the UiTest service, so the whole test process can share one
 * instance to avoid paying the creation overhead repeatedly for every case.
 */
let sharedDriver: Driver | null = null;

/**
 * Shared driver for page tests. Business-result assertions are done by each test case itself.
 * The Driver is created only on first use (inside the case's try block), so that an operation left
 * over from a previous timed-out case cannot interrupt a new case with a concurrency error during
 * construction and prevent even its cleanup logic from running.
 */
export class UiTestSession {
  private readonly delegator: abilityDelegatorRegistry.AbilityDelegator =
    abilityDelegatorRegistry.getAbilityDelegator();
  private entryAbility: UIAbility | null = null;
  private readonly monitor: abilityDelegatorRegistry.AbilityMonitor;
  private monitorRegistered: boolean = false;

  constructor() {
    this.monitor = {
      abilityName: ENTRY_ABILITY,
      moduleName: 'entry',
      onAbilityCreate: (ability: UIAbility): void => {
        this.entryAbility = ability;
      },
      onAbilityForeground: (ability: UIAbility): void => {
        this.entryAbility = ability;
      }
    };
  }

  /**
   * Acquire the Driver; when the channel is briefly held by the previous test process or another uitest client on the device, back off and wait for it to be released.
   */
  private async acquireDriver(): Promise<Driver> {
    if (sharedDriver !== null) {
      return sharedDriver;
    }
    let lastMessage: string = 'unknown';
    for (let attempt: number = 0; attempt < BUSY_RETRY_LIMIT; attempt++) {
      try {
        const driver: Driver = Driver.create();
        sharedDriver = driver;
        if (attempt > 0) {
          hilog.warn(DOMAIN, TAG, 'UiTest channel released after %{public}d retries', attempt);
        }
        return driver;
      } catch (error) {
        const businessError: BusinessError = error as BusinessError;
        lastMessage = `${businessError.code}: ${businessError.message}`;
        if (!isChannelBusyError(error as Object)) {
          throw new Error(`Failed to create UiTest driver: ${lastMessage}`);
        }
        await delay(BUSY_RETRY_BACKOFF_MS);
      }
    }
    throw new Error(`UiTest channel is occupied by another client: ${lastMessage}`);
  }

  /**
   * The first UiTest call also needs to wait for the channel to be idle.
   */
  private async wakeUpDisplay(driver: Driver): Promise<void> {
    let lastMessage: string = 'unknown';
    for (let attempt: number = 0; attempt < BUSY_RETRY_LIMIT; attempt++) {
      try {
        await driver.wakeUpDisplay();
        return;
      } catch (error) {
        if (!isChannelBusyError(error as Object)) {
          throw error instanceof Error ? error : new Error(String(error));
        }
        const businessError: BusinessError = error as BusinessError;
        lastMessage = `${businessError.code}: ${businessError.message}`;
        await delay(BUSY_RETRY_BACKOFF_MS);
      }
    }
    throw new Error(`UiTest channel is occupied on wakeUpDisplay: ${lastMessage}`);
  }

  /**
   * Record the per-step cost of the page driver to pinpoint which UiTest call caused a case timeout.
   */
  private logStep(step: string, startedAt: number, detail: string = ''): void {
    hilog.info(DOMAIN, TAG, 'UiStep %{public}s cost=%{public}dms %{public}s',
      step, Date.now() - startedAt, detail);
  }

  async start(): Promise<void> {
    const acquiredAt: number = Date.now();
    const driver: Driver = await this.acquireDriver();
    this.logStep('acquireDriver', acquiredAt);
    const wakeUpAt: number = Date.now();
    await this.wakeUpDisplay(driver);
    this.logStep('wakeUpDisplay', wakeUpAt);
    const monitorAt: number = Date.now();
    await this.delegator.addAbilityMonitor(this.monitor);
    this.monitorRegistered = true;
    this.logStep('addAbilityMonitor', monitorAt);
    const homeAt: number = Date.now();
    await driver.pressHome();
    this.logStep('pressHome', homeAt);
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY
    };
    const abilityAt: number = Date.now();
    await this.delegator.startAbility(want);
    this.logStep('startAbility', abilityAt);
    await driver.waitForIdle(NAVIGATION_IDLE_MS, NAVIGATION_IDLE_TIMEOUT_MS);
    const textAt: number = Date.now();
    await this.waitText('SystemConfig 示例', false, LAUNCH_TIMEOUT_MS);
    this.logStep('waitHomeTitle', textAt);
    const deadline: number = Date.now() + ABILITY_POLL_TIMEOUT_MS;
    while (this.entryAbility === null && Date.now() < deadline) {
      await delay(POLL_INTERVAL_MS);
    }
    if (this.entryAbility === null) {
      throw new Error('EntryAbility monitor did not provide an ability instance');
    }
    this.logStep('abilityReference', textAt);
  }

  /**
   * Cleanup is best-effort and logged, so an exception in finally cannot mask the case's own result.
   */
  async cleanup(): Promise<void> {
    const driver: Driver | null = sharedDriver;
    if (driver !== null) {
      try {
        await driver.pressHome();
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'cleanup pressHome failed: %{public}s', String(error));
      }
    }
    if (this.monitorRegistered) {
      try {
        await this.delegator.removeAbilityMonitor(this.monitor);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'cleanup removeAbilityMonitor failed: %{public}s', String(error));
      }
      this.monitorRegistered = false;
    }
    const ability: UIAbility | null = this.entryAbility;
    this.entryAbility = null;
    if (ability !== null && ability.launchWant.abilityName === ENTRY_ABILITY) {
      try {
        await ability.context.terminateSelf();
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'cleanup terminateSelf failed: %{public}s', String(error));
      }
      await delay(200);
    }
  }

  async textOf(text: string, contains: boolean = false, timeoutMs: number = DEFAULT_TIMEOUT_MS): Promise<string> {
    const component: Component = await this.waitText(text, contains, timeoutMs);
    return await component.getText();
  }

  async textExists(text: string, contains: boolean = false): Promise<boolean> {
    const driver: Driver = await this.acquireDriver();
    const component: Component | null = await driver.findComponent(this.textOn(text, contains));
    return component !== null;
  }

  /**
   * Poll whether a text appears within the timeout, for existence checks that must wait for the page to finish rendering.
   */
  async textAppears(text: string, contains: boolean = false, timeoutMs: number = 3000): Promise<boolean> {
    const driver: Driver = await this.acquireDriver();
    const on: On = this.textOn(text, contains);
    const deadline: number = Date.now() + timeoutMs;
    while (Date.now() < deadline) {
      const component: Component | null = await driver.findComponent(on);
      if (component !== null) {
        return true;
      }
      await delay(POLL_INTERVAL_MS);
    }
    return false;
  }

  async textCount(text: string, contains: boolean = false): Promise<number> {
    const driver: Driver = await this.acquireDriver();
    const components: Component[] | null = await driver.findComponents(this.textOn(text, contains));
    return components === null ? 0 : components.length;
  }

  async scrollToTop(): Promise<void> {
    const driver: Driver = await this.acquireDriver();
    const scroll: Component = await this.scrollContainer(driver);
    const startedAt: number = Date.now();
    // The default scroll speed is only 600px/s, so returning a long page to the top takes over 10 seconds; speed it up explicitly here
    await scroll.scrollToTop(FAST_SCROLL_SPEED);
    await driver.waitForIdle(READ_IDLE_MS, READ_IDLE_TIMEOUT_MS);
    this.logStep('scrollToTop', startedAt);
  }

  async waitForAnyText(texts: string[]): Promise<string> {
    const driver: Driver = await this.acquireDriver();
    const deadline: number = Date.now() + DEFAULT_TIMEOUT_MS;
    while (Date.now() < deadline) {
      for (const text of texts) {
        const component: Component | null = await driver.findComponent(this.textOn(text, false));
        if (component !== null) {
          return await component.getText();
        }
      }
      await delay(POLL_INTERVAL_MS);
    }
    throw new Error(`None of the UI texts appeared: ${texts.join(', ')}`);
  }

  async waitForExternalWindow(): Promise<UiWindow> {
    const driver: Driver = await this.acquireDriver();
    const deadline: number = Date.now() + EXTERNAL_WINDOW_TIMEOUT_MS;
    while (Date.now() < deadline) {
      const window: UiWindow | null = await driver.findWindow({ focused: true });
      if (window !== null && await window.getBundleName() !== BUNDLE_NAME) {
        return window;
      }
      await delay(POLL_INTERVAL_MS);
    }
    throw new Error('External settings page did not enter foreground');
  }

  async clickText(text: string, contains: boolean = false): Promise<void> {
    const driver: Driver = await this.acquireDriver();
    const component: Component = await this.waitText(text, contains);
    await component.click();
    await driver.waitForIdle(NAVIGATION_IDLE_MS, NAVIGATION_IDLE_TIMEOUT_MS);
  }

  async openHomeEntry(entryText: string, pageTitle: string): Promise<void> {
    await this.clickText(entryText);
    await this.scrollTextOf(pageTitle);
  }

  async pressBack(): Promise<void> {
    const driver: Driver = await this.acquireDriver();
    await driver.pressBack();
    await driver.waitForIdle(NAVIGATION_IDLE_MS, NAVIGATION_IDLE_TIMEOUT_MS);
  }

  /**
   * Locate a component that only becomes visible after scrolling.
   * Component.scrollSearch is not used: it repeatedly rescans the lazily-loaded log panel, measured at over 11 seconds per call;
   * this instead does "find in place → find at bottom → bounded top-down resweep", with a hard budget over the whole sweep,
   * so that it fails fast when the target text truly does not exist rather than burning all remaining case time on scrolling.
   */
  private async locateScrolled(on: On, label: string): Promise<Component> {
    const driver: Driver = await this.acquireDriver();
    const direct: Component | null = await driver.findComponent(on);
    if (direct !== null) {
      return direct;
    }
    const startedAt: number = Date.now();
    const deadline: number = startedAt + LOCATE_BUDGET_MS;
    const scroll: Component = await this.scrollContainer(driver);
    await scroll.scrollToBottom(FAST_SCROLL_SPEED);
    await driver.waitForIdle(READ_IDLE_MS, READ_IDLE_TIMEOUT_MS);
    const bottom: Component | null = await driver.findComponent(on);
    if (bottom !== null) {
      this.logStep('locateScrolled', startedAt, `bottom ${label}`);
      return bottom;
    }
    if (Date.now() >= deadline) {
      this.logStep('locateScrolled', startedAt, `budget ${label}`);
      throw new Error(`UI text not found within the sweep budget: ${label}`);
    }
    await scroll.scrollToTop(FAST_SCROLL_SPEED);
    await driver.waitForIdle(READ_IDLE_MS, READ_IDLE_TIMEOUT_MS);
    for (let step: number = 0; step < SWEEP_VIEWPORT_LIMIT && Date.now() < deadline; step++) {
      const hit: Component | null = await driver.findComponent(on);
      if (hit !== null) {
        this.logStep('locateScrolled', startedAt, `sweep${step} ${label}`);
        return hit;
      }
      await driver.fling(UiDirection.UP, SWEEP_FLING_SPEED);
      await driver.waitForIdle(READ_IDLE_MS, READ_IDLE_TIMEOUT_MS);
    }
    this.logStep('locateScrolled', startedAt, `missing ${label}`);
    throw new Error(`UI text not found after sweeping the scroll container: ${label}`);
  }

  async scrollTextOf(text: string, contains: boolean = false): Promise<string> {
    const startedAt: number = Date.now();
    const target: Component = await this.locateScrolled(this.textOn(text, contains), text);
    const value: string = await target.getText();
    this.logStep('scrollTextOf', startedAt, text);
    return value;
  }

  async scrollClickText(text: string, contains: boolean = false): Promise<void> {
    const driver: Driver = await this.acquireDriver();
    const startedAt: number = Date.now();
    const target: Component = await this.locateScrolled(this.textOn(text, contains), text);
    await target.click();
    await driver.waitForIdle(NAVIGATION_IDLE_MS, NAVIGATION_IDLE_TIMEOUT_MS);
    this.logStep('scrollClickText', startedAt, text);
  }

  private async scrollContainer(driver: Driver): Promise<Component> {
    const scroll: Component | null = await driver.waitForComponent(ON.type('Scroll'), SCROLL_LOCATE_TIMEOUT_MS);
    if (scroll === null) {
      throw new Error('Scroll container not found on current page');
    }
    return scroll;
  }

  private async waitText(text: string, contains: boolean = false,
    timeoutMs: number = DEFAULT_TIMEOUT_MS): Promise<Component> {
    const driver: Driver = await this.acquireDriver();
    const component: Component | null = await driver.waitForComponent(this.textOn(text, contains), timeoutMs);
    if (component === null) {
      throw new Error(`UI text not found: ${text}`);
    }
    return component;
  }

  private textOn(text: string, contains: boolean): On {
    return contains ? ON.text(text, MatchPattern.CONTAINS) : ON.text(text);
  }
}
