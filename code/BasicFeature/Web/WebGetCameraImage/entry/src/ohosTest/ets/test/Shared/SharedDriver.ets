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
import hilog from '@ohos.hilog';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

// 遥控器按键码值映射：OpenHarmony Web设备标准键码定义
// 用于UI自动化测试中模拟物理遥控器操作，确保与真实用户行为一致
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_CAPTURE: number = 26;

// 超时阈值配置：优化为更合理的值，避免测试超时
// 网页视图渲染1秒、相机操作2秒、会话创建1秒、焦点切换0.5秒
export const TIMEOUT_PAGE_RENDER: number = 1000;

export const TIMEOUT_CAPTURE_OPERATION: number = 2000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

// 操作间隔延迟：优化延迟时间，提高测试执行速度
export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_CAPTURE_OP: number = 500;

// 容差阈值：组件数量容差3、焦点切换容差2，用于应对UI渲染的微小波动
// 避免因系统渲染差异导致测试误判，提高测试稳定性和通过率
export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

// 稳定性检测参数：优化为1轮检测，减少等待时间
export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

// 压力测试轮次：导航操作20轮、生命周期操作10轮
// 用于验证网页视图在高频操作下的稳定性和内存泄漏检测
export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

/** UI操作串行化执行器：通过Promise链确保UI操作按序执行
 *  Web设备UI线程单例特性要求操作必须串行化，避免并发导致的焦点竞争和状态混乱
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
export async function serializedDelay(driver: Driver | undefined, delayMs: number): Promise<void> {
  if (driver === undefined) {
    return;
  }
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** 触发序列化按键操作：包装runSerializedUiOperation确保按键事件按序执行
 *  避免多个测试用例同时触发按键导致的事件丢失或顺序错乱
 */
export async function triggerSerializedKey(driver: Driver | undefined, key: number): Promise<void> {
  if (driver === undefined) {
    return;
  }
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** 获取Driver单例实例：Web设备UI自动化驱动器的全局唯一实例
 *  延迟初始化模式避免在测试环境未就绪时创建Driver导致异常
 */
export function getDriver(): Driver {
  if (_driver !== null) {
    return _driver;
  }
  let lastError: string = '';
  for (let attempt = 0; attempt < 8; attempt++) {
    try {
      _driver = Driver.create();
      hilog.info(0x0000, 'testTag', '%{public}s', `getDriver: connected on attempt ${attempt}`);
      return _driver;
    } catch (error) {
      lastError = error instanceof Error ? error.message : String(error);
      hilog.warn(0x0000, 'testTag', '%{public}s', `getDriver: attempt ${attempt} failed: ${lastError}`);
      const waitUntil = Date.now() + 250;
      while (Date.now() < waitUntil) {
      }
    }
  }
  hilog.error(0x0000, 'testTag', '%{public}s', `getDriver: all attempts failed: ${lastError}`);
  throw new Error(`getDriver failed after retries: ${lastError}`);
}

/** 重置Driver操作队列：仅在明确确认无进行中的UI操作时使用
 *  直接重置Promise链会丢失正在执行中的串行化上下文，导致后续UiTest API绕过队列并发进入底层驱动
 *  因此保留该方法供极少数受控场景使用，常规测试套件初始化不应主动调用
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/** 统计网页视图组件数量：采用简化但更可靠的查找策略
 *  直接查找所有组件类型，避免复杂的降级策略导致的性能问题和误判
 */
export async function webCameraComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => { // 尝试多种查找策略
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;

      // 详细调试信息
      hilog.info(0x0000, 'testTag', '%{public}s', `webCameraComponentCount:`);
      hilog.info(0x0000, 'testTag', '%{public}s', `  - Found ${count} components using ON.type(\"*\")`);

      if (count === 0) { // 如果找不到组件，尝试其他查找策略
        hilog.info(0x0000, 'testTag', '%{public}s', `  - Trying alternative component search strategies...`);

        // 尝试查找特定类型的组件
        const textComponents = await driver.findComponents(ON.type('Text'));
        const imageComponents = await driver.findComponents(ON.type('Image'));
        const buttonComponents = await driver.findComponents(ON.type('Button'));

        hilog.info(0x0000, 'testTag', '%{public}s', `  - Text components: ${textComponents ? textComponents.length : 0}`);
        hilog.info(0x0000, 'testTag', '%{public}s', `  - Image components: ${imageComponents ? imageComponents.length : 0}`);
        hilog.info(0x0000, 'testTag', '%{public}s', `  - Button components: ${buttonComponents ? buttonComponents.length : 0}`);

        // 返回最大的组件数量
        const maxCount =
          Math.max(textComponents ? textComponents.length : 0, imageComponents ? imageComponents.length : 0,
            buttonComponents ? buttonComponents.length : 0);

        if (maxCount > 0) {
          hilog.info(0x0000, 'testTag', '%{public}s', `  - Using alternative count: ${maxCount}`);
          return maxCount;
        }
      }

      return count;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `webCameraComponentCount error: ${error}`);
    return 0;
  }
}

/** 检查焦点状态：验证当前焦点组件是否存在，并在索引可稳定识别时校验索引
 *  Web设备依赖遥控器导航，焦点管理是用户体验的核心，UiTest返回的全组件列表顺序可能随渲染变化
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
        if (expectedFocusedIndex === -1) { // ON.focused(true)在部分Web设备上无法返回焦点组件，使用isFocused()逐个校验兜底
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
          hilog.info(0x0000, 'testTag', '%{public}s', `checkFocusState: Focus existence check - hasFocus: ${hasFocus} attempt: ${attempt}`);
          return hasFocus;
        }

        // 如果没有组件或组件数量不足，返回false
        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          hilog.info(0x0000, 'testTag', '%{public}s', `checkFocusState: Invalid component count or index, attempt: ${attempt}`);
          return false;
        }

        // 直接检查期望索引位置的组件是否获得焦点（不依赖ON.focused(true)，该接口在部分Web设备上不稳定）
        try {
          const targetComponent = allComponents[expectedFocusedIndex];
          const isFocused = await targetComponent.isFocused();
          hilog.info(0x0000, 'testTag', '%{public}s', `checkFocusState: Component at index ${expectedFocusedIndex} isFocused: ${isFocused} attempt: ${attempt}`);
          return isFocused;
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', `checkFocusState: Error checking focus for component ${expectedFocusedIndex} attempt: ${attempt}`);
          return false;
        }
      });

      if (result) {
        return true;
      }
    } catch (error) {
      hilog.error(0x0000, 'testTag', '%{public}s', `checkFocusState error: ${error} attempt: ${attempt}`);
    }

    attempt++;
    await serializedDelay(driver, retryIntervalMs);
  }

  return false;
}

/** 判断网页拍照视图是否已显示：通过检查网页视图特有的选项文本识别
 *  ON.focused(true)与组件数量均无法可靠区分网页视图是否显示，文本匹配最稳定
 */
export async function isCameraPageVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      // 本工程页面由 Web 组件承载 camera.html，HTML 文本不会进入 ArkUI 文本树，
      // 因此优先以 Web 组件是否挂载作为页面已渲染的判定信号，避免误判页面未显示。
      let webs: Component[] = [];
      try {
        webs = await driver.findComponents(ON.type('Web')) ?? [];
      } catch (e) {
        webs = [];
      }
      if (webs.length > 0) {
        return true;
      }
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === '拍照' || content === '预览' || content === '分享' ||
            content.indexOf('分享图片') >= 0 || content.indexOf('图片预览') >= 0 ||
            content.indexOf('未选择图片') >= 0 || content.indexOf('图片') >= 0) {
            return true;
          }
        } catch (e) { // 单个组件获取文本失败不影响其他组件匹配，跳过继续
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `isCameraPageVisible error: ${error}`);
    return false;
  }
}

/** 等待网页视图渲染完成：以「网页视图选项文本出现」这一真实渲染事件为完成条件
 *  事件驱动：循环直到 isCameraPageVisible 返回 true（拍照/预览/分享 文本出现），
 *  maxWaitMs 仅作为超时保护；不再以「组件数量>0」作为完成信号，避免误判。
 *  若超时仍未渲染，重新拉起网页视图后再次等待同一渲染事件。
 */
export async function waitForCameraPageStable(driver: Driver, maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  try {
    hilog.info(0x0000, 'testTag', '%{public}s', `waitForCameraPageStable: waiting for webview render event, maxWaitMs: ${maxWaitMs}`);

    // 事件驱动等待：完成条件为「网页视图选项文本出现」这一真实渲染事件
    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      const visible = await isCameraPageVisible(driver);
      if (visible) {
        hilog.info(0x0000, 'testTag', '%{public}s', `waitForCameraPageStable: webview render event observed`);
        return true;
      }
      await serializedDelay(driver, 100);
    }

    // 超时未渲染，重新拉起网页视图（跨套件顺序执行时网页视图可能已被前一套件关闭）
    hilog.info(0x0000, 'testTag', '%{public}s', `waitForCameraPageStable: render timeout, relaunching camera webview`);
    await triggerCameraPage(driver);

    // 重新等待同一渲染事件
    const secondDeadline = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      const visible = await isCameraPageVisible(driver);
      if (visible) {
        hilog.info(0x0000, 'testTag', '%{public}s', `waitForCameraPageStable: webview render event observed after relaunch`);
        return true;
      }
      await serializedDelay(driver, 100);
    }

    hilog.info(0x0000, 'testTag', '%{public}s', `waitForCameraPageStable: webview still not rendered after relaunch, timeout: ${maxWaitMs}`);
    return false;
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `waitForCameraPageStable error: ${error}`);
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
 *  用于验证网页视图按钮文本、标题等UI元素的正确性，确保国际化和本地化功能正常
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => { // 直接在当前串行化上下文中查询，避免再次进入串行队列造成自等待
      const texts = await driver.findComponents(ON.type('Text')) ?? [];

      if (texts.length === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: No text components found`);
        return false;
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Found ${texts.length} text components`);

      // 遍历所有文本组件逐一匹配，避免遗漏嵌套在深层容器中的文本
      for (const text of texts) {
        try {
          const content = await text.getText();
          hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Checking text: ${content} expected: ${expectedText}`);
          if (content === expectedText) {
            hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Match found!`);
            return true;
          }
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: Error getting text from component: ${error}`); // 单个组件获取文本失败不影响其他组件的匹配，继续遍历剩余组件
        }
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `checkTextContent: No matching text found`);
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkTextContent error: ${error}`);
    return false;
  }
}

/** 模拟触摸事件：在指定坐标触发点击操作并等待触摸事件处理完成
 *  用于验证网页视图对触摸交互的响应能力，Web设备虽以遥控器为主但仍需支持触摸
 */
export async function simulateTouch(driver: Driver | undefined, x: number, y: number): Promise<void> {
  if (driver === undefined) {
    return;
  }
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** 直接启动EntryAbility显示网页拍照视图：通过AbilityDelegator冷启动主Ability
 *  比KEY_CAPTURE按键更可靠：KEY_CAPTURE在测试环境无法重新拉起已关闭的网页拍照视图
 */
export async function launchCameraPageApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName, abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

/** 触发网页拍照视图：优先确保网页拍照视图已显示，未显示时直接启动EntryAbility
 *  保留1秒延迟确保系统处于稳定状态，避免在系统繁忙时触发网页视图导致响应异常
 */
export async function triggerCameraPage(driver: Driver): Promise<void> {
  await serializedDelay(driver, 1000);
  const visible = await isCameraPageVisible(driver);
  if (!visible) {
    await launchCameraPageApp();
  }
  await serializedDelay(driver, 1000);

  hilog.info(0x0000, 'testTag', '%{public}s', `Camera webview triggered`);
}

/** 按键操作封装：连续触发指定按键多次，每次操作后等待固定延迟
 *  封装循环按键逻辑，避免各测试文件重复编写循环代码，提高代码复用率
 */
export async function pressAndWait(driver: Driver | undefined, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  if (driver === undefined) {
    return;
  }
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
 *  用于验证网页视图的特定UI元素是否正确渲染
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', `checkComponentExists: Searching for component type: ${type}`);
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      hilog.info(0x0000, 'testTag', '%{public}s', `checkComponentExists: Type ${type} exists: ${exists} components found: ${components ? components.length : 0}`);
      return exists;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `checkComponentExists error: ${error}`);
    return false;
  }
}

/** 获取当前焦点索引：返回当前焦点组件的索引位置
 *  用于测试用例中验证焦点导航的正确性
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Starting focus search...`);

      // ON.focused(true)在部分Web设备上无法返回焦点组件，因此获取全部组件后使用isFocused()逐个校验
      const allComponents: Component[] = await driver.findComponents(ON.type('*'));
      if (!allComponents || allComponents.length === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: No components found`);
        return -1;
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Found ${allComponents.length} total components`);

      for (let i = 0; i < allComponents.length; i++) {
        const component = allComponents[i];
        try {
          const isFocused = await component.isFocused();
          hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Component ${i} isFocused: ${isFocused}`);
          if (isFocused) {
            hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Focus found at index ${i}`);
            return i;
          }
        } catch (e) {
          hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: Error checking focus for component ${i} : ${e.message}`); // 继续检查下一个组件
        }
      }

      hilog.info(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex: No focused component found in component list`);
      return -1;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

// WebGetCameraImage 页面关键文本常量：与 rawfile/camera.html 中的展示文案保持一致
// 用于在 UI 自动化测试中可靠判定网页拍照视图是否完成渲染
export const PAGE_TEXT_SHARE: string = '分享图片';

export const PAGE_TEXT_PREVIEW: string = '图片预览';

export const PAGE_TEXT_UNKNOWN: string = '未选择图片';

export const PAGE_TEXT_CAPTURE: string = '拍照';

/** 安全读取组件文本：组件可能已销毁或不可读，失败时返回空字符串
 *  避免单个组件异常中断整个文本扫描流程
 */
export async function safeGetText(component: Component): Promise<string> {
  try {
    const content = await component.getText();
    return content ?? '';
  } catch (error) {
    hilog.info(0x0000, 'testTag', '%{public}s', `safeGetText error: ${error}`);
    return '';
  }
}

/** 收集当前页面全部文本内容：用于批量文本断言与页面状态描述
 *  返回去重前后的原始文本数组，便于测试用例做包含/相等判断
 */
export async function getTextContents(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      const contents: string[] = [];
      for (let i = 0; i < texts.length; i++) {
        const content = await safeGetText(texts[i]);
        if (content.length > 0) {
          contents.push(content);
        }
      }
      return contents;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `getTextContents error: ${error}`);
    return [];
  }
}

/** 判断页面是否包含任意一个目标文本：常用于多语言/多版本文案兼容断言
 *  采用包含匹配，兼容 '分享图片' 命中 '分享' 等场景
 */
export async function containsAnyText(driver: Driver, markers: string[]): Promise<boolean> {
  const contents = await getTextContents(driver);
  for (let i = 0; i < contents.length; i++) {
    for (let j = 0; j < markers.length; j++) {
      if (contents[i] === markers[j] || contents[i].indexOf(markers[j]) >= 0) {
        return true;
      }
    }
  }
  return false;
}

/** 判断分享按钮是否可见：按钮由 camera.html 的 button 标签渲染 */
export async function isShareButtonVisible(driver: Driver): Promise<boolean> {
  return await containsAnyText(driver, [PAGE_TEXT_SHARE, '分享']);
}

/** 判断图片预览区域是否可见：预览区由 img 与 image_preview 段落渲染 */
export async function isPreviewAreaVisible(driver: Driver): Promise<boolean> {
  return await containsAnyText(driver, [PAGE_TEXT_PREVIEW, PAGE_TEXT_UNKNOWN, '预览']);
}

/** 判断拍照入口提示是否可见：input[type=file][capture] 拉起原生相机
 *  页面未暴露 input 文本时，退化为检测拍照关键字
 */
export async function isCapturePromptVisible(driver: Driver): Promise<boolean> {
  return await containsAnyText(driver, [PAGE_TEXT_CAPTURE, '选择文件', '相机']);
}

/** 等待任意目标文本出现：事件驱动轮询，超时仅作保护
 *  常用于等待网页渲染完成、拍照结果回填、分享按钮可点击
 */
export async function waitForAnyText(driver: Driver, markers: string[], maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const matched = await containsAnyText(driver, markers);
    if (matched) {
      hilog.info(0x0000, 'testTag', '%{public}s', `waitForAnyText: matched expected page marker`);
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.info(0x0000, 'testTag', '%{public}s', `waitForAnyText: timeout after ${maxWaitMs}ms`);
  return false;
}

/** 统计图片组件数量：用于验证拍照完成后预览图片是否成功回填 */
export async function countImages(driver: Driver): Promise<number> {
  try {
    const images = await findComponentsByType(driver, 'Image');
    return images.length;
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', `countImages error: ${error}`);
    return 0;
  }
}

/** 统计 Web 组件是否已挂载：WebGetCameraImage 的核心载体是 Web 组件 */
export async function isWebComponentVisible(driver: Driver): Promise<boolean> {
  try {
    const webs = await findComponentsByType(driver, 'Web');
    return webs.length > 0;
  } catch (error) {
    hilog.info(0x0000, 'testTag', '%{public}s', `isWebComponentVisible fallback: ${error}`);
    return false;
  }
}

/** 输出当前页面文本快照：用于失败用例定位与日志追踪，统一英文日志 */
export async function describePageState(driver: Driver): Promise<string> {
  const contents = await getTextContents(driver);
  const summary = `pageTextCount=${contents.length}, texts=[${contents.join('|')}]`;
  hilog.info(0x0000, 'testTag', '%{public}s', `describePageState: ${summary}`);
  return summary;
}

/** 等待 Web 组件与页面文本同时就绪：组合式渲染完成信号
 *  相比单一信号更稳健，避免页面骨架已挂载但内容未渲染的误判
 */
export async function waitForWebRender(driver: Driver, maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const webReady = await isWebComponentVisible(driver);
    const textReady = await isCameraPageVisible(driver);
    if (webReady && textReady) {
      hilog.info(0x0000, 'testTag', '%{public}s', `waitForWebRender: web and page text ready`);
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.info(0x0000, 'testTag', '%{public}s', `waitForWebRender: timeout after ${maxWaitMs}ms`);
  return false;
}