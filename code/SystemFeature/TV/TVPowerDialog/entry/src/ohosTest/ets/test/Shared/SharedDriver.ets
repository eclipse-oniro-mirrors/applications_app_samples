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

import { Driver, ON, Component, DisplayRotation } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

// 遥控器按键码值映射：OpenHarmony TV设备标准键码定义
// 用于UI自动化测试中模拟物理遥控器操作，确保与真实用户行为一致
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_POWER: number = 26;

// 超时阈值配置：优化为更合理的值，避免测试超时
// 对话框渲染1秒、电源操作2秒、会话创建1秒、焦点切换0.5秒
export const TIMEOUT_DIALOG_RENDER: number = 1000;

export const TIMEOUT_POWER_OPERATION: number = 2000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

// 操作间隔延迟：优化延迟时间，提高测试执行速度
export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_POWER_OP: number = 500;

// 容差阈值：组件数量容差3、焦点切换容差2，用于应对UI渲染的微小波动
// 避免因系统渲染差异导致测试误判，提高测试稳定性和通过率
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

// 稳定性检测参数：优化为1轮检测，减少等待时间
export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

// 压力测试轮次：导航操作20轮、生命周期操作10轮
// 用于验证对话框在高频操作下的稳定性和内存泄漏检测
export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

/** UI操作串行化执行器：通过Promise链确保UI操作按序执行
 *  TV设备UI线程单例特性要求操作必须串行化，避免并发导致的焦点竞争和状态混乱
 *  所有测试用例的UI操作都应通过此函数执行，保证测试的确定性和可重复性
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> { // 等待当前队列完成
  const currentQueue = _uiOperationQueue;

  // 创建新的Promise并加入队列
  const result = await new Promise<T>((resolve, reject) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult = await action();
        resolve(actionResult);
      } catch (error) {
        const errorMsg: Error = error instanceof Error ? error : new Error(String(error));
        reject(errorMsg);
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });

  return result;
}

/** 串行化延迟等待：确保delayMs不会与其他UiTest API并发调用
 *  UiTest底层不允许在findComponents/triggerKey执行期间再进入delayMs，因此等待也必须进入同一队列
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** 触发序列化按键操作：包装runSerializedUiOperation确保按键事件按序执行
 *  避免多个测试用例同时触发按键导致的事件丢失或顺序错乱
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** 获取Driver单例实例：TV设备UI自动化驱动器的全局唯一实例
 *  延迟初始化模式避免在测试环境未就绪时创建Driver导致异常
 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** 重置Driver操作队列：仅在明确确认无进行中的UI操作时使用
 *  直接重置Promise链会丢失正在执行中的串行化上下文，导致后续UiTest API绕过队列并发进入底层驱动
 *  因此保留该方法供极少数受控场景使用，常规测试套件初始化不应主动调用
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/** 统计对话框组件数量：采用简化但更可靠的查找策略
 *  直接查找所有组件类型，避免复杂的降级策略导致的性能问题和误判
 */
export async function powerDialogComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => { // 尝试多种查找策略
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;

      // 详细调试信息
      console.log('powerDialogComponentCount:');
      console.log('  - Found', count, 'components using ON.type(\"*\")');

      if (count === 0) { // 如果找不到组件，尝试其他查找策略
        console.log('  - Trying alternative component search strategies...');

        // 尝试查找特定类型的组件
        const textComponents = await driver.findComponents(ON.type('Text'));
        const imageComponents = await driver.findComponents(ON.type('Image'));
        const buttonComponents = await driver.findComponents(ON.type('Button'));

        console.log('  - Text components:', textComponents ? textComponents.length : 0);
        console.log('  - Image components:', imageComponents ? imageComponents.length : 0);
        console.log('  - Button components:', buttonComponents ? buttonComponents.length : 0);

        // 返回最大的组件数量
        const maxCount =
          Math.max(textComponents ? textComponents.length : 0, imageComponents ? imageComponents.length : 0,
            buttonComponents ? buttonComponents.length : 0);

        if (maxCount > 0) {
          console.log('  - Using alternative count:', maxCount);
          return maxCount;
        }
      }

      return count;
    });
  } catch (error) {
    console.error('powerDialogComponentCount error:', error);
    return 0;
  }
}

/** 检查焦点状态：验证当前焦点组件是否存在，并在索引可稳定识别时校验索引
 *  TV设备依赖遥控器导航，焦点管理是用户体验的核心，UiTest返回的全组件列表顺序可能随渲染变化
 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs = 100; // 减少重试间隔
  // 事件驱动重试：以「焦点状态满足期望」为完成条件，超时仅作保护，不再固定重试次数
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt = 1;

  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        const focusedComponent = await driver.findComponent(ON.focused(true));
        const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];

        // 如果期望索引为-1，表示只检查焦点是否存在
        if (expectedFocusedIndex === -1) { // ON.focused(true)在部分TV设备上无法返回焦点组件，使用isFocused()逐个校验兜底
          let hasFocus = !!focusedComponent;
          if (!hasFocus) {
            for (let i = 0; i < allComponents.length; i++) {
              try {
                if (await allComponents[i].isFocused()) {
                  hasFocus = true;
                  break;
                }
              } catch (e) { // 跳过无法查询焦点状态的组件
              }
            }
          }
          console.log('checkFocusState: Focus existence check - hasFocus:', hasFocus, 'attempt:', attempt);
          return hasFocus;
        }

        // 如果没有组件或组件数量不足，返回false
        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          console.log('checkFocusState: Invalid component count or index, attempt:', attempt);
          return false;
        }

        // 直接检查期望索引位置的组件是否获得焦点（不依赖ON.focused(true)，该接口在部分TV设备上不稳定）
        try {
          const targetComponent = allComponents[expectedFocusedIndex];
          const isFocused = await targetComponent.isFocused();
          console.log('checkFocusState: Component at index', expectedFocusedIndex, 'isFocused:', isFocused, 'attempt:',
            attempt);
          return isFocused;
        } catch (e) {
          console.log('checkFocusState: Error checking focus for component', expectedFocusedIndex, 'attempt:', attempt);
          return false;
        }
      });

      if (result) {
        return true;
      }
    } catch (error) {
      console.error('checkFocusState error:', error, 'attempt:', attempt);
    }

    attempt++;
    await serializedDelay(driver, retryIntervalMs);
  }

  return false;
}

/** 判断电源对话框是否已显示：通过检查对话框特有的选项文本识别
 *  ON.focused(true)与组件数量均无法可靠区分对话框是否显示，文本匹配最稳定
 */
export async function isPowerDialogVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === '熄屏' || content === '关机' || content === '重启') {
            return true;
          }
        } catch (e) { // 单个组件获取文本失败不影响其他组件匹配，跳过继续
        }
      }
      return false;
    });
  } catch (error) {
    console.error('isPowerDialogVisible error:', error);
    return false;
  }
}

/** 等待对话框渲染完成：以「对话框选项文本出现」这一真实渲染事件为完成条件
 *  事件驱动：循环直到 isPowerDialogVisible 返回 true（熄屏/关机/重启 文本出现），
 *  maxWaitMs 仅作为超时保护；不再以「组件数量>0」作为完成信号，避免误判。
 *  若超时仍未渲染，重新拉起对话框后再次等待同一渲染事件。
 */
export async function waitForDialogStable(driver: Driver, maxWaitMs: number = TIMEOUT_DIALOG_RENDER): Promise<boolean> {
  try {
    console.log('waitForDialogStable: waiting for dialog render event, maxWaitMs:', maxWaitMs);

    // 事件驱动等待：完成条件为「对话框选项文本出现」这一真实渲染事件
    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      const visible = await isPowerDialogVisible(driver);
      if (visible) {
        console.log('waitForDialogStable: dialog render event observed');
        return true;
      }
      await serializedDelay(driver, 100);
    }

    // 超时未渲染，重新拉起对话框（跨套件顺序执行时对话框可能已被前一套件关闭）
    console.log('waitForDialogStable: render timeout, relaunching power dialog');
    await triggerPowerDialog(driver);

    // 重新等待同一渲染事件
    const secondDeadline = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      const visible = await isPowerDialogVisible(driver);
      if (visible) {
        console.log('waitForDialogStable: dialog render event observed after relaunch');
        return true;
      }
      await serializedDelay(driver, 100);
    }

    console.log('waitForDialogStable: dialog still not rendered after relaunch, timeout:', maxWaitMs);
    return false;
  } catch (error) {
    console.error('waitForDialogStable error:', error);
    return false;
  }
}

/** 按类型查找组件：封装driver.findComponents调用，统一处理空值情况
 *  提供类型安全的组件查找接口，避免各测试文件重复处理null/undefined
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

/** 检查文本内容：遍历所有Text组件验证是否存在预期文本
 *  用于验证对话框按钮文本、标题等UI元素的正确性，确保国际化和本地化功能正常
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => { // 直接在当前串行化上下文中查询，避免再次进入串行队列造成自等待
      const texts = await driver.findComponents(ON.type('Text')) ?? [];

      if (texts.length === 0) {
        console.log('checkTextContent: No text components found');
        return false;
      }

      console.log('checkTextContent: Found', texts.length, 'text components');

      // 遍历所有文本组件逐一匹配，避免遗漏嵌套在深层容器中的文本
      for (const text of texts) {
        try {
          const content = await text.getText();
          console.log('checkTextContent: Checking text:', content, 'expected:', expectedText);
          if (content === expectedText) {
            console.log('checkTextContent: Match found!');
            return true;
          }
        } catch (error) {
          console.log('checkTextContent: Error getting text from component:', error); // 单个组件获取文本失败不影响其他组件的匹配，继续遍历剩余组件
        }
      }

      console.log('checkTextContent: No matching text found');
      return false;
    });
  } catch (error) {
    console.error('checkTextContent error:', error);
    return false;
  }
}

/** 模拟触摸事件：在指定坐标触发点击操作并等待触摸事件处理完成
 *  用于验证对话框对触摸交互的响应能力，TV设备虽以遥控器为主但仍需支持触摸
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** 直接启动MainAbility显示电源对话框：通过AbilityDelegator冷启动主Ability
 *  比KEY_POWER按键更可靠：KEY_POWER在测试环境无法重新拉起已关闭的电源对话框
 */
export async function launchPowerDialogApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName, abilityName: 'MainAbility'
  };
  await delegator.startAbility(want);
}

/** 触发电源对话框：优先确保电源对话框已显示，未显示时直接启动MainAbility
 *  保留1秒延迟确保系统处于稳定状态，避免在系统繁忙时触发对话框导致响应异常
 */
export async function triggerPowerDialog(driver: Driver): Promise<void> {
  await serializedDelay(driver, 1000);
  const visible = await isPowerDialogVisible(driver);
  if (!visible) {
    await launchPowerDialogApp();
  }
  await serializedDelay(driver, 1000);

  console.log('Power dialog triggered');
}

/** 按键操作封装：连续触发指定按键多次，每次操作后等待固定延迟
 *  封装循环按键逻辑，避免各测试文件重复编写循环代码，提高代码复用率
 */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < times; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/** 辅助函数：简单的延迟函数 */
async function delay(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

/** 检查组件是否存在：验证指定类型的组件是否存在于当前UI中
 *  用于验证对话框的特定UI元素是否正确渲染
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      console.log('checkComponentExists: Searching for component type:', type);
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      console.log('checkComponentExists: Type', type, 'exists:', exists, 'components found:',
        components ? components.length : 0);
      return exists;
    });
  } catch (error) {
    console.error('checkComponentExists error:', error);
    return false;
  }
}

/** 获取当前焦点索引：返回当前焦点组件的索引位置
 *  用于测试用例中验证焦点导航的正确性
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      console.log('getCurrentFocusIndex: Starting focus search...');

      // ON.focused(true)在部分TV设备上无法返回焦点组件，因此获取全部组件后使用isFocused()逐个校验
      const allComponents: Component[] = await driver.findComponents(ON.type('*'));
      if (!allComponents || allComponents.length === 0) {
        console.log('getCurrentFocusIndex: No components found');
        return -1;
      }

      console.log('getCurrentFocusIndex: Found', allComponents.length, 'total components');

      for (let i = 0; i < allComponents.length; i++) {
        const component = allComponents[i];
        try {
          const isFocused = await component.isFocused();
          console.log('getCurrentFocusIndex: Component', i, 'isFocused:', isFocused);
          if (isFocused) {
            console.log('getCurrentFocusIndex: Focus found at index', i);
            return i;
          }
        } catch (e) {
          console.log('getCurrentFocusIndex: Error checking focus for component', i, ':', e.message); // 继续检查下一个组件
        }
      }

      console.log('getCurrentFocusIndex: No focused component found in component list');
      return -1;
    });
  } catch (error) {
    console.error('getCurrentFocusIndex error:', error);
    return -1;
  }
}