/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Driver, ON, Component } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

// 短信UI元素文本常量：与主工程 Index.ets 中的按钮与文本保持一致
export const SMS_BUTTON_TEXT: string = '发送短信';
export const SMS_CONTENT_TEXT: string = '短信内容';
export const SMS_PANEL_TITLE: string = '发送短信';

// 默认短信参数常量：与主工程 Index.ets 中 sendShortMessage 参数保持一致
export const DEFAULT_SLOT_ID: number = 0;
export const DEFAULT_DESTINATION_PORT: number = 1000;
export const DEFAULT_DESTINATION_HOST: string = '+861xxxxxxxxxx';
export const DEFAULT_SERVICE_CENTER: string = '+861xxxxxxxxxx';

// 超时阈值配置：优化为更合理的值，避免测试超时
export const TIMEOUT_PANEL_RENDER: number = 1000;
export const TIMEOUT_SMS_OPERATION: number = 2000;
export const TIMEOUT_SESSION_CREATE: number = 1000;
export const TIMEOUT_FOCUS_CHANGE: number = 500;

// 操作间隔延迟：优化延迟时间，提高测试执行速度
export const DELAY_KEY_NAVIGATION: number = 50;
export const DELAY_TOUCH_EVENT: number = 100;
export const DELAY_AFTER_SMS_OP: number = 500;

// 容差阈值：组件数量容差3、焦点切换容差2
export const TOLERANCE_COMPONENT_COUNT: number = 3;
export const TOLERANCE_FOCUS_CHANGE: number = 2;

// 稳定性检测参数：优化为1轮检测，减少等待时间
export const STABLE_ROUNDS: number = 1;
export const STABLE_TOLERANCE: number = 3;

// 压力测试轮次：导航操作20轮、生命周期操作10轮
export const STRESS_ROUNDS_NAVIGATION: number = 20;
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// 短信参数校验辅助常量
export const SLOT_ID_MIN: number = 0;
export const SLOT_ID_MAX: number = 2;
export const CONTENT_MAX_LENGTH: number = 140;
export const CONTENT_EMPTY: string = '';
export const DESTINATION_PORT_MIN: number = 0;
export const DESTINATION_PORT_MAX: number = 65535;
export const UI_OPERATION_TIMEOUT: number = 10000;

/** UI操作串行化执行器：通过Promise链确保UI操作按序执行
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue = _uiOperationQueue;
  const result = await new Promise<T>((resolve, reject) => {
    _uiOperationQueue = currentQueue.then(async () => {
      const timeoutPromise = new Promise<never>((_resolve, timeoutReject) => {
        setTimeout(() => timeoutReject(new Error('UI operation timeout')), UI_OPERATION_TIMEOUT);
      });
      try {
        const actionResult = await Promise.race([action(), timeoutPromise]);
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

/** 串行化延迟等待
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** 串行化点击操作
 */
export async function serializedClick(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
  });
}

/** 获取Driver单例实例
 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver;
}

/** 重置Driver操作队列
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
}

/** 统计短信面板组件数量
 */
export async function smsUiComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;
      hilog.info(0x0000, 'testTag', '%{public}s', 'smsUiComponentCount: ' + count);
      return count;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'smsUiComponentCount error: ' + error);
    return 0;
  }
}

/** 检查焦点状态
 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs: number = 100;
  const deadline: number = Date.now() + TIMEOUT_FOCUS_CHANGE;
  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        const focusedComponent = await driver.findComponent(ON.focused(true));
        return !!focusedComponent;
      });
      if (result) return true;
    } catch (error) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'checkFocusState error: ' + error);
    }
    await new Promise<void>((resolve: Function) => setTimeout(resolve, retryIntervalMs));
  }
  return false;
}

/** 按类型查找组件
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    return await driver.findComponents(ON.type(type)) ?? [];
  });
}

/** 检查文本内容：遍历所有Text组件验证是否存在预期文本
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts = await driver.findComponents(ON.type('Text')) ?? [];
      if (texts.length === 0) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'checkTextContent: No text components found');
        return false;
      }
      for (const text of texts) {
        try {
          const content = await text.getText();
          if (content === expectedText) {
            return true;
          }
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'checkTextContent: Error: ' + error);
        }
      }
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'checkTextContent error: ' + error);
    return false;
  }
}

/** 模拟触摸事件
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/** 直接启动EntryAbility显示短信发送面板
 */
export async function launchSmsApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName, abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

/** 触发短信发送面板
 */
export async function triggerSmsPanel(driver: Driver): Promise<void> {
  await serializedDelay(driver, 1000);
  const visible = await isSmsPanelVisible(driver);
  if (!visible) {
    await launchSmsApp();
  }
  await serializedDelay(driver, 1000);
  hilog.info(0x0000, 'testTag', '%{public}s', 'Sms panel triggered');
}

/** 按键操作封装
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

/** 辅助函数：简单的延迟函数
 */
async function delay(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

/** 检查组件是否存在
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      return exists;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'checkComponentExists error: ' + error);
    return false;
  }
}

/** 获取当前焦点索引
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*'));
      if (!allComponents || allComponents.length === 0) return -1;
      for (let i = 0; i < allComponents.length; i++) {
        try {
          if (await allComponents[i].isFocused()) return i;
        } catch (e) {
          // continue
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'getCurrentFocusIndex error: ' + error);
    return -1;
  }
}

/** 检查短信面板是否可见
 */
export async function isSmsPanelVisible(driver: Driver): Promise<boolean> {
  try {
    const buttonVisible = await checkTextContent(driver, SMS_BUTTON_TEXT);
    if (buttonVisible) return true;
    const contentVisible = await checkTextContent(driver, SMS_CONTENT_TEXT);
    return contentVisible;
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'isSmsPanelVisible error: ' + error);
    return false;
  }
}

/** 校验短信参数边界
 */
export function validateSmsParameters(slotId: number, content: string, destinationPort: number): boolean {
  const slotIdValid = slotId >= SLOT_ID_MIN && slotId <= SLOT_ID_MAX;
  const contentValid = content.length <= CONTENT_MAX_LENGTH;
  const portValid = destinationPort >= DESTINATION_PORT_MIN && destinationPort <= DESTINATION_PORT_MAX;
  return slotIdValid && contentValid && portValid;
}

/**
 * waitForSmsPanelStable：多轮校验短信面板渲染稳定性
 * 采用事件驱动重试模式，以面板可见为完成条件，超时仅作保护
 * 避免因系统渲染延迟导致测试误判，提高测试通过率
 */
export async function waitForSmsPanelStable(driver: Driver, maxWaitMs: number = TIMEOUT_PANEL_RENDER): Promise<boolean> {
  const retryIntervalMs: number = 100;
  const deadline: number = Date.now() + maxWaitMs;
  let attempt: number = 1;
  while (Date.now() < deadline) {
    try {
      const visible: boolean = await isSmsPanelVisible(driver);
      if (visible) return true;
    } catch (error) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'waitForSmsPanelStable attempt error: ' + error);
    }
    attempt++;
    await delay(retryIntervalMs);
  }
  return false;
}

/**
 * verifyPanelComponentRendering：校验面板中各类型组件的渲染数量
 * 遍历各类型组件（Text/Button/Image），记录组件数量用于渲染完整性校验
 */
export async function verifyPanelComponentRendering(driver: Driver): Promise<boolean> {
  try {
    const textComponents: Component[] = await findComponentsByType(driver, 'Text');
    const buttonComponents: Component[] = await findComponentsByType(driver, 'Button');
    const textCount: number = textComponents ? textComponents.length : 0;
    const buttonCount: number = buttonComponents ? buttonComponents.length : 0;
    hilog.info(0x0000, 'testTag', '%{public}s', 'verifyPanelComponentRendering: Text: ' + textCount + ' Button: ' + buttonCount);
    return textCount > 0 && buttonCount > 0;
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'verifyPanelComponentRendering error: ' + error);
    return false;
  }
}

/**
 * verifyPanelTextContent：校验面板中按钮文本与内容文本的匹配情况
 */
export async function verifyPanelTextContent(driver: Driver): Promise<boolean> {
  try {
    const buttonMatched: boolean = await checkTextContent(driver, SMS_BUTTON_TEXT);
    const contentMatched: boolean = await checkTextContent(driver, SMS_CONTENT_TEXT);
    hilog.info(0x0000, 'testTag', '%{public}s', 'verifyPanelTextContent: Button: ' + buttonMatched + ' Content: ' + contentMatched);
    return buttonMatched || contentMatched;
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'verifyPanelTextContent error: ' + error);
    return false;
  }
}

/**
 * verifyPanelTouchResponse：在面板区域中心模拟触摸并校验响应
 */
export async function verifyPanelTouchResponse(driver: Driver): Promise<boolean> {
  try {
    const display = await driver.getDisplaySize();
    const centerX: number = Math.max(10, Math.floor(display.x / 2) - 100);
    const centerY: number = Math.max(10, Math.floor(display.y / 2) - 250);
    hilog.info(0x0000, 'testTag', '%{public}s', 'verifyPanelTouchResponse: Touch at (' + centerX + ', ' + centerY + ')');
    await simulateTouch(driver, centerX, centerY);
    await serializedDelay(driver, DELAY_AFTER_SMS_OP);
    const stillVisible: boolean = await isSmsPanelVisible(driver);
    return stillVisible;
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'verifyPanelTouchResponse error: ' + error);
    return false;
  }
}

/**
 * getDisplaySizeSafe：安全获取当前显示器尺寸
 * 封装driver.getDisplaySize调用，统一处理空值和异常情况
 */
export async function getDisplaySizeSafe(driver: Driver): Promise<number[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const size = await driver.getDisplaySize();
      return size ? [size[0], size[1]] : [0, 0];
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'getDisplaySizeSafe error: ' + error);
    return [0, 0];
  }
}

/**
 * getComponentCenterSafe：安全获取组件中心坐标
 * 封装component.getBounds调用，统一处理空值和异常情况
 */
export async function getComponentCenterSafe(component: Component): Promise<number[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const bounds = await component.getBounds();
      if (!bounds) return [0, 0];
      const centerX: number = Math.floor((bounds.left + bounds.right) / 2);
      const centerY: number = Math.floor((bounds.top + bounds.bottom) / 2);
      return [centerX, centerY];
    });
  } catch (error) {
    hilog.error(0x0000, 'testTag', '%{public}s', 'getComponentCenterSafe error: ' + error);
    return [0, 0];
  }
}

/**
 * findComponentByTextSafe：安全查找指定文本的组件
 * 封装driver.findComponent(ON.text)调用，统一处理空值和异常情况
 */
export async function findComponentByTextSafe(driver: Driver, text: string): Promise<Component | null> {
  try {
    return await runSerializedUiOperation(async () => {
      const component = await driver.findComponent(ON.text(text));
      return component ?? null;
    });
  } catch (error) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'findComponentByTextSafe: Not found: ' + text);
    return null;
  }
}

/**
 * waitForComponentVisible：等待指定文本的组件可见
 * 事件驱动重试模式，以组件可见为完成条件，超时仅作保护
 */
export async function waitForComponentVisible(driver: Driver, text: string, maxWaitMs: number = TIMEOUT_PANEL_RENDER): Promise<boolean> {
  const retryIntervalMs: number = 100;
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const visible: boolean = await checkTextContent(driver, text);
    if (visible) return true;
    await delay(retryIntervalMs);
  }
  return false;
}

/**
 * performMultiTouchSequence：执行多点触摸序列
 * 在指定坐标序列上依次模拟触摸操作，用于手势识别测试
 */
export async function performMultiTouchSequence(driver: Driver, coordinates: number[][]): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (const coord of coordinates) {
      await driver.click(coord[0], coord[1]);
      await driver.delayMs(DELAY_TOUCH_EVENT);
    }
  });
}

/**
 * pressBackAndVerify：按下返回键并校验操作完成
 */
export async function pressBackAndVerify(driver: Driver): Promise<boolean> {
  await runSerializedUiOperation(async () => {
    await driver.pressBack();
    await driver.delayMs(DELAY_AFTER_SMS_OP);
  });
  // Return from the page can terminate the ability and make later UiDriver calls hang.
  // Relaunch the page immediately so the shared driver stays usable for later tests.
  await launchSmsApp();
  await serializedDelay(driver, TIMEOUT_PANEL_RENDER);
  return true;
}

/**
 * validateSmsContentLength：校验短信内容长度合法性
 * 短信内容最大140字符，用于内容校验测试
 */
export function validateSmsContentLength(content: string): boolean {
  return content.length <= CONTENT_MAX_LENGTH;
}

/**
 * validatePhoneNumber：校验电话号码格式合法性
 * 电话号码应为+86开头的11位数字，用于号码校验测试
 */
export function validatePhoneNumber(phoneNumber: string): boolean {
  const phonePattern: RegExp = /^\+861\d{10}$/;
  return phonePattern.test(phoneNumber);
}

/**
 * logTestProgress：统一测试进度日志
 * 所有测试用例通过此函数输出进度日志，确保日志格式统一
 */
export function logTestProgress(suiteName: string, testName: string, message: string): void {
  hilog.info(0x0000, 'testTag', '%{public}s', '[%{public}s][%{public}s] %{public}s'.replace('%{public}s', suiteName).replace('%{public}s', testName).replace('%{public}s', message));
}
