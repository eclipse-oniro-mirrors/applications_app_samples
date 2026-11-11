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
 * 单步组件等待预算。页面跳转后已 waitForIdle，正常渲染只需几十毫秒，
 * 这里刻意取小值：踩满预算只发生在页面状态异常时，取值过大会让
 * 单条用例串起多个等待后突破 aa test 的每用例超时。
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
 * 纯定时器等待。UiTest 接口通道被占用时不能使用 driver.delayMs。
 */
function delay(durationMs: number): Promise<void> {
  return new Promise<void>((resolve: () => void): void => {
    setTimeout((): void => {
      resolve();
    }, durationMs);
  });
}

/**
 * 判断 UiTest 通道是否处于“暂时不可用”状态。
 * 17000002：上一条用例超时遗留的操作还占着接口通道。
 * 17000001：AAMS 侧连接未就绪，既可能是上一次测试进程的链接尚未回收，
 *           也可能是设备上别的 uitest 客户端（例如另一个样例的 uitest start-daemon）
 *           正在独占通道。两者都会自行释放，需要退避重试而不是直接放弃，
 *           否则一条用例的占用会把后续所有 UI 用例瞬间打成 Error。
 */
function isChannelBusyError(error: Object): boolean {
  const businessError: BusinessError = error as BusinessError;
  return businessError.code === CONCURRENT_CALL_CODE || businessError.code === CHANNEL_CONNECT_CODE;
}

/**
 * Driver 是 UiTest 服务的无状态门面，整个测试进程共用一个实例即可，
 * 避免每条用例重复承担创建开销。
 */
let sharedDriver: Driver | null = null;

/**
 * 页面测试公共驱动。业务结果断言由各测试用例自行完成。
 * Driver 在首次使用时（即用例的 try 之内）才创建，避免上一条用例超时残留的
 * 操作让新用例在构造阶段就被并发错误打断，连清理逻辑都执行不到。
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
   * 取得 Driver；通道被上一次测试进程或设备上别的 uitest 客户端短暂独占时，退避等待其释放。
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
   * 首个 UiTest 调用同样需要等待通道空闲。
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
   * 记录页面驱动单步耗时，便于定位用例超时来自哪一次 UiTest 调用。
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
   * 清理动作尽力完成并记录，避免 finally 中的异常掩盖用例本身的结论。
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
   * 在超时范围内轮询文本是否出现，用于需要等待页面渲染完成的存在性判断。
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
    // 默认滚动速度只有 600px/s，长页面一次回顶要 10 秒以上，这里显式提速
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
   * 定位需要滚动才能露出的组件。
   * 不使用 Component.scrollSearch：它在懒加载日志面板上会反复回扫，实测单次要 11 秒以上；
   * 这里改为“就地查找 → 到底查找 → 自顶向下有界回扫”，并给整个回扫加硬预算，
   * 保证目标文本确实不存在时快速失败，而不是把用例剩余时间全烧在滚动上。
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
