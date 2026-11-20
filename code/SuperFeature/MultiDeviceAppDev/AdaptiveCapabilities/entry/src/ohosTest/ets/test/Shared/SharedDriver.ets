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

import { Driver, ON, Component, ResizeDirection } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import { TARGET_BUNDLE, TARGET_ABILITY } from './ProjectConfig';

const DOMAIN: number = 0xF811;
const TAG: string = '[Breakpoint_Shared]';

let _driver: Driver | null = null;
let _uiQueue: Promise<void> = Promise.resolve();

// 断点点位：覆盖 xs/sm/md/lg 四档，用于响应式布局验证
export const WIDTH_XS: number = 280;

export const WIDTH_SM: number = 480;

export const WIDTH_MD: number = 720;

export const WIDTH_LG: number = 1000;

// 超时阈值：窗口 resize 后布局重排需要系统动画时间
export const TIMEOUT_RENDER: number = 1500;

export const TIMEOUT_NAVIGATION: number = 2000;

// 操作间隔：连续窗口操作需留出系统稳定时间，避免丢失中间态
export const DELAY_RESIZE: number = 600;

export const DELAY_NAV: number = 500;

export const DELAY_TOUCH: number = 200;

export const DELAY_LAUNCH: number = 1500;

// 容差：不同设备存在像素级差异，避免误判
export const TOLERANCE_COUNT: number = 3;

export const TOLERANCE_PX: number = 8;

// 稳定性采样参数
export const STABLE_ROUNDS: number = 3;

// 压力轮次：高频切换下不应出现状态泄漏
export const STRESS_ROUNDS: number = 12;

/** 串行化 UI 操作：UiTest 底层驱动不允许 findComponents/resize 并发进入
 *  所有 UI 操作统一经此队列，保证测试确定性
 */
export async function runSerialized<T>(action: () => Promise<T>): Promise<T> {
  const previous = _uiQueue;
  return await new Promise<T>((resolve, reject) => {
    _uiQueue = previous.then(async () => {
      try {
        resolve(await action());
      } catch (err) {
        reject(err instanceof Error ? err : new Error(String(err)));
      }
    }).catch((err: Error) => {
      reject(err);
    });
  });
}

/** 串行化延迟：避免 delayMs 与其他 UI API 并发 */
export async function sdelay(driver: Driver, ms: number): Promise<void> {
  await runSerialized(async () => {
    await driver.delayMs(ms);
  });
}

/** Driver 单例：延迟初始化，避免测试环境未就绪时创建失败 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** 重置驱动队列：仅在确认无进行中操作时使用 */
export function resetDriver(): void {
  _uiQueue = Promise.resolve();
}

/** 启动被测应用：通过 AbilityDelegator 冷启动，不依赖桌面图标位置 */
export async function launchApp(): Promise<boolean> {
  try {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const want: Want = { bundleName: TARGET_BUNDLE, abilityName: TARGET_ABILITY };
    await delegator.startAbility(want);
    hilog.info(DOMAIN, TAG, '%{public}s', 'launchApp succeeded');
    return true;
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'launchApp failed: %{public}s', JSON.stringify(err) ?? '');
    return false;
  }
}

/** 关闭被测应用：测试结束清理，避免残留窗口影响后续套件 */
export async function terminateApp(): Promise<boolean> {
  try {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const top = await delegator.getCurrentTopAbility();
    await top.context.terminateSelf();
    hilog.info(DOMAIN, TAG, '%{public}s', 'terminateApp succeeded');
    return true;
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'terminateApp failed: %{public}s', JSON.stringify(err) ?? '');
    return false;
  }
}

/** 拖拽窗口到指定物理宽度：保持高度不变，从左侧拖拽
 *  断点系统依赖窗口宽度变化触发 mediaQuery 回调
 */
export async function resizeWindow(driver: Driver, targetWidthPx: number): Promise<boolean> {
  try {
    return await runSerialized(async () => {
      const win = await driver.findWindow({ actived: true });
      if (!win) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'resizeWindow: window not found');
        return false;
      }
      const bounds = await win.getBounds();
      const height = bounds.bottom - bounds.top;
      await win.resize(targetWidthPx, height, ResizeDirection.LEFT);
      hilog.info(DOMAIN, TAG, 'resizeWindow: width=%{public}d', targetWidthPx);
      return true;
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'resizeWindow failed: %{public}s', JSON.stringify(err) ?? '');
    return false;
  }
}

/** 切换窗口宽度并等待重排完成：把 resize + 等待封装为原子操作 */
export async function switchWidth(driver: Driver, widthPx: number): Promise<boolean> {
  const ok = await resizeWindow(driver, widthPx);
  if (!ok) {
    return false;
  }
  await sdelay(driver, DELAY_RESIZE);
  return true;
}

/** 读取当前窗口像素宽度：验证 resize 是否真实生效 */
export async function currentWindowWidth(driver: Driver): Promise<number> {
  try {
    return await runSerialized(async () => {
      const win = await driver.findWindow({ actived: true });
      if (!win) {
        return -1;
      }
      const bounds = await win.getBounds();
      return bounds.right - bounds.left;
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'currentWindowWidth failed: %{public}s', JSON.stringify(err) ?? '');
    return -1;
  }
}

/** 按宽度推算断点名：与工程 BreakpointSystem 的阈值分段严格一致
 *  xs: <320  sm: <600  md: <840  lg: >=840
 */
export function resolveBreakpoint(widthVp: number): string {
  if (widthVp < 0) {
    return 'unknown';
  } else if (widthVp < 320) {
    return 'xs';
  } else if (widthVp < 600) {
    return 'sm';
  } else if (widthVp < 840) {
    return 'md';
  }
  return 'lg';
}

/** 统计组件总数：通配符查找，失败时降级按常见类型统计 */
export async function componentCount(driver: Driver): Promise<number> {
  try {
    return await runSerialized(async () => {
      const all = await driver.findComponents(ON.type('*'));
      const count = all ? all.length : 0;
      hilog.info(DOMAIN, TAG, 'componentCount: %{public}d', count);
      if (count > 0) {
        return count;
      }
      const texts = await driver.findComponents(ON.type('Text'));
      const images = await driver.findComponents(ON.type('Image'));
      const buttons = await driver.findComponents(ON.type('Button'));
      const lists = await driver.findComponents(ON.type('List'));
      const fallback = Math.max(
        texts ? texts.length : 0,
        images ? images.length : 0,
        buttons ? buttons.length : 0,
        lists ? lists.length : 0
      );
      hilog.info(DOMAIN, TAG, 'componentCount fallback: %{public}d', fallback);
      return fallback;
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'componentCount failed: %{public}s', JSON.stringify(err) ?? '');
    return 0;
  }
}

/** 按类型查找组件：统一处理空值 */
export async function findByType(driver: Driver, type: string): Promise<Component[]> {
  try {
    return await runSerialized(async () => {
      const list = await driver.findComponents(ON.type(type));
      return list ?? [];
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'findByType failed: %{public}s type=%{public}s',
      JSON.stringify(err) ?? '', type);
    return [];
  }
}

/** 按 id 查找组件 */
export async function findById(driver: Driver, id: string): Promise<Component | null> {
  try {
    return await runSerialized(async () => {
      return await driver.findComponent(ON.id(id));
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'findById miss: %{public}s id=%{public}s',
      JSON.stringify(err) ?? '', id);
    return null;
  }
}

/** 检查 id 是否存在 */
export async function existsById(driver: Driver, id: string): Promise<boolean> {
  const c = await findById(driver, id);
  return c !== null && c !== undefined;
}

/** 点击指定 id：组件缺失返回 false 而非抛出 */
export async function clickId(driver: Driver, id: string): Promise<boolean> {
  try {
    return await runSerialized(async () => {
      const c = await driver.findComponent(ON.id(id));
      if (!c) {
        return false;
      }
      await c.click();
      await driver.delayMs(DELAY_TOUCH);
      return true;
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'clickId failed: %{public}s id=%{public}s',
      JSON.stringify(err) ?? '', id);
    return false;
  }
}

/** 点击指定文本 */
export async function clickText(driver: Driver, text: string): Promise<boolean> {
  try {
    return await runSerialized(async () => {
      const c = await driver.findComponent(ON.text(text));
      if (!c) {
        return false;
      }
      await c.click();
      await driver.delayMs(DELAY_TOUCH);
      return true;
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'clickText failed: %{public}s text=%{public}s',
      JSON.stringify(err) ?? '', text);
    return false;
  }
}

/** 文本是否存在：遍历所有 Text 组件逐一匹配，避免深层嵌套漏匹配 */
export async function textExists(driver: Driver, expected: string): Promise<boolean> {
  try {
    return await runSerialized(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      for (const t of texts) {
        try {
          const content = await t.getText();
          if (content === expected) {
            return true;
          }
        } catch (e) {
          // 单个组件取文本失败不影响其他组件匹配
        }
      }
      return false;
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'textExists failed: %{public}s', JSON.stringify(err) ?? '');
    return false;
  }
}

/** 读取组件边界：[left, top, right, bottom]，组件缺失返回全零 */
export async function boundsOf(driver: Driver, id: string): Promise<number[]> {
  try {
    return await runSerialized(async () => {
      const c = await driver.findComponent(ON.id(id));
      if (!c) {
        return [0, 0, 0, 0];
      }
      const b = await c.getBounds();
      return [b.left, b.top, b.right, b.bottom];
    });
  } catch (err) {
    hilog.info(DOMAIN, TAG, 'boundsOf failed: %{public}s id=%{public}s',
      JSON.stringify(err) ?? '', id);
    return [0, 0, 0, 0];
  }
}

/** 组件宽度 */
export async function widthOf(driver: Driver, id: string): Promise<number> {
  const b = await boundsOf(driver, id);
  return b[2] - b[0];
}

/** 组件高度 */
export async function heightOf(driver: Driver, id: string): Promise<number> {
  const b = await boundsOf(driver, id);
  return b[3] - b[1];
}

/** 触摸点击坐标：验证布局区域可点击性 */
export async function touchAt(driver: Driver, x: number, y: number): Promise<void> {
  await runSerialized(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH);
  });
}

/** 返回上一页并等待导航动画 */
export async function backAndWait(driver: Driver): Promise<void> {
  await runSerialized(async () => {
    await driver.pressBack();
    await driver.delayMs(DELAY_NAV);
  });
}

/** 事件驱动等待文本出现：超时仅作保护，避免固定 sleep */
export async function waitText(driver: Driver, text: string, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await textExists(driver, text)) {
      return true;
    }
    await sdelay(driver, 100);
  }
  hilog.info(DOMAIN, TAG, 'waitText timeout: %{public}s', text);
  return false;
}

/** 事件驱动等待组件数量达到下限 */
export async function waitCount(driver: Driver, min: number, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    if (await componentCount(driver) >= min) {
      return true;
    }
    await sdelay(driver, 100);
  }
  return false;
}

/** 连续采样组件数量：稳定性断言的输入 */
export async function sampleCount(driver: Driver, rounds: number = STABLE_ROUNDS,
  intervalMs: number = 200): Promise<number[]> {
  const samples: number[] = [];
  for (let i = 0; i < rounds; i++) {
    samples.push(await componentCount(driver));
    await sdelay(driver, intervalMs);
  }
  return samples;
}

/** 极差：max - min */
export function rangeOf(samples: number[]): number {
  if (samples.length === 0) {
    return 0;
  }
  let lo = samples[0];
  let hi = samples[0];
  for (let i = 1; i < samples.length; i++) {
    lo = samples[i] < lo ? samples[i] : lo;
    hi = samples[i] > hi ? samples[i] : hi;
  }
  return hi - lo;
}

/** 均值 */
export function averageOf(samples: number[]): number {
  if (samples.length === 0) {
    return 0;
  }
  let sum = 0;
  for (let i = 0; i < samples.length; i++) {
    sum += samples[i];
  }
  return sum / samples.length;
}

/** 安全除法：避免除零污染断言 */
export function safeDivide(a: number, b: number): number {
  return b === 0 ? 0 : a / b;
}

/** 等待 UI 空闲：连续两次采样一致即视为渲染稳定 */
export async function waitIdle(driver: Driver, maxWaitMs: number = TIMEOUT_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  let previous = -1;
  while (Date.now() < deadline) {
    const current = await componentCount(driver);
    if (previous >= 0 && current === previous) {
      return true;
    }
    previous = current;
    await sdelay(driver, 150);
  }
  return false;
}

/** 滑动：封装 swipe 并等待动画 */
export async function swipeOnce(driver: Driver, x1: number, y1: number, x2: number, y2: number,
  durationMs: number = 300): Promise<void> {
  await runSerialized(async () => {
    await driver.swipe(x1, y1, x2, y2, durationMs);
    await driver.delayMs(DELAY_TOUCH);
  });
}
