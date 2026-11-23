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

import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import { common, application, contextConstant, bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { buffer } from '@kit.ArkTS';
import { resourceManager } from '@kit.LocalizationKit';
import { waitForEntryForeground } from './EntryReadiness';

const TAG: string = '[Sample_ApplicationContext]';
const DOMAIN: number = 0xF811;

export const BUNDLE_NAME: string = 'com.samples.applicationcontext';

export const MAIN_ABILITY_NAME: string = 'EntryAbility';

let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_HOME: number = 3;

export const KEY_POWER: number = 26;

export const KEY_TAB: number = 4;

export const KEY_SPACE: number = 57;

export const KEY_ESCAPE: number = 1;

export const KEY_MENU: number = 18;

export const KEY_SETTINGS: number = 176;

export const TIMEOUT_PAGE_RENDER: number = 1000;

export const TIMEOUT_CONTEXT_OPERATION: number = 2000;

export const TIMEOUT_REFRESH: number = 1000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const TIMEOUT_FILE_OPERATION: number = 3000;

export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_OPERATION: number = 500;

export const TOLERANCE_COMPONENT_COUNT: number = 3;

export const TOLERANCE_FOCUS_CHANGE: number = 2;

export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

export const STRESS_ROUNDS_CONTEXT: number = 30;

export const TEXT_HELLO_WORLD: string = 'Hello World';

export const TEXT_WELCOME: string = 'Welcome';

export const TEXT_CREATE_FILE: string = 'create file';

export const TEXT_TOP: string = 'top';

export const TEXT_LIST: string = 'list';

export const TEXT_EVENT_HUB: string = 'eventhub';

export const TEXT_BASIC_USAGE: string = 'basic usage start';

export const TEXT_USAGE: string = 'usage start';

export const TEXT_FUNC_B: string = 'FuncAbilityB';

export const TEST_FILE_NAME: string = 'ohos_test_context.txt';

export const AREA_MODE_EL1: number = contextConstant.AreaMode.EL1;

export const AREA_MODE_EL2: number = contextConstant.AreaMode.EL2;

export const AREA_MODE_EL3: number = contextConstant.AreaMode.EL3;

export const AREA_MODE_EL4: number = contextConstant.AreaMode.EL4;

export const AREA_MODE_EL5: number = contextConstant.AreaMode.EL5;

/**
 * UI操作串行化执行器：通过Promise链确保UI操作按序执行
 * 设备UI线程单例特性要求操作必须串行化，避免并发导致的焦点竞争和状态混乱
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  const currentQueue: Promise<void> = _uiOperationQueue;

  const result: T = await new Promise<T>((resolve, reject) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult: T = await action();
        resolve(actionResult);
      } catch (error) {
        const errorObject: Error = error instanceof Error ? error : new Error(String(error));
        reject(errorObject);
      }
    }).catch((error: Error) => {
      reject(error);
    });
  });

  return result;
}

/**
 * 串行化延迟等待：确保delayMs不会与其他UiTest API并发调用
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/**
 * 获取Driver单例实例：全局唯一UI自动化驱动器
 * 延迟初始化模式避免在测试环境未就绪时创建Driver导致异常
 */
export function getDriver(): Driver {
  if (_driver === null) {
    const driver: Driver = Driver.create();
    if (driver === null || driver === undefined) {
      throw new Error('UiTest driver initialization failed: Driver.create returned no driver');
    }
    _driver = driver;
  }
  return _driver;
}

/**
 * 初始化Driver并清空串行队列：测试套件beforeAll阶段调用
 */
export async function initializeDriver(): Promise<Driver> {
  const driver: Driver = getDriver();
  await serializedDelay(driver, 300);
  hilog.info(DOMAIN, TAG, '%{public}s', 'initializeDriver: driver ready');
  return driver;
}

/**
 * 重置Driver操作队列：仅在明确确认无进行中的UI操作时使用
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
  _queueLock = false;
  _driver = null;
}

/**
 * 统计当前页面组件数量：采用多级降级查找策略，避免单次查找失败导致的误判
 */
export async function pageComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      const count: number = allComponents.length;

      hilog.info(DOMAIN, TAG, '%{public}s', `pageComponentCount: total=${count}`);

      if (count === 0) {
        const textComponents: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
        const imageComponents: Component[] = await driver.findComponents(ON.type('Image')) ?? [];
        const buttonComponents: Component[] = await driver.findComponents(ON.type('Button')) ?? [];

        hilog.info(DOMAIN, TAG, '%{public}s', `pageComponentCount: text=${textComponents.length} image=${imageComponents.length} button=${buttonComponents.length}`);

        const maxCount: number = Math.max(textComponents.length, imageComponents.length, buttonComponents.length);
        if (maxCount > 0) {
          return maxCount;
        }
      }

      return count;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `pageComponentCount error: ${error}`);
    return 0;
  }
}

/**
 * 按类型查找组件：封装driver.findComponents调用，统一处理空值情况
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type(type)) ?? [];
      return components;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `findComponentsByType error: ${error}`);
    return [];
  }
}

/**
 * 按类型统计组件数量：用于验证页面特定UI元素的渲染完整性
 */
export async function countComponentsByType(driver: Driver, type: string): Promise<number> {
  const components: Component[] = await findComponentsByType(driver, type);
  return components.length;
}

/**
 * 检查组件是否存在：验证指定类型的组件是否存在于当前UI中
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components: Component[] = await driver.findComponents(ON.type(type)) ?? [];
      const exists: boolean = components.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `checkComponentExists: type=${type} exists=${exists}`);
      return exists;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `checkComponentExists error: ${error}`);
    return false;
  }
}

/**
 * 检查文本内容：遍历所有Text组件验证是否存在预期文本
 * 用于验证页面按钮文本、提示文本、状态文本等UI元素的正确性
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];

      if (texts.length === 0) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'checkTextContent: no text components');
        return false;
      }

      for (let index: number = 0; index < texts.length; index++) {
        try {
          const content: string = await texts[index].getText();
          if (content === expectedText) {
            hilog.info(DOMAIN, TAG, '%{public}s', `checkTextContent: matched ${expectedText}`);
            return true;
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', `checkTextContent: read text failed at index ${index}`);
        }
      }

      hilog.info(DOMAIN, TAG, '%{public}s', `checkTextContent: no match for ${expectedText}`);
      return false;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `checkTextContent error: ${error}`);
    return false;
  }
}

/**
 * 收集当前页面的全部文本内容：用于文本集合类断言与本地化校验
 */
export async function collectVisibleTexts(driver: Driver): Promise<string[]> {
  try {
    return await runSerializedUiOperation(async () => {
      const texts: Component[] = await driver.findComponents(ON.type('Text')) ?? [];
      const contents: string[] = [];
      for (let index: number = 0; index < texts.length; index++) {
        try {
          const content: string = await texts[index].getText();
          if (content.length > 0) {
            contents.push(content);
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', `collectVisibleTexts: skip index ${index}`);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `collectVisibleTexts: collected=${contents.length}`);
      return contents;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `collectVisibleTexts error: ${error}`);
    return [];
  }
}

/**
 * 判断应用主页面是否已显示：以首页标志文本作为渲染完成信号
 */
export async function isPageVisible(driver: Driver): Promise<boolean> {
  const helloVisible: boolean = await checkTextContent(driver, TEXT_HELLO_WORLD);
  if (helloVisible) {
    return true;
  }
  const welcomeVisible: boolean = await checkTextContent(driver, TEXT_WELCOME);
  if (welcomeVisible) {
    return true;
  }
  return await checkTextContent(driver, TEXT_TOP);
}

/**
 * 直接启动EntryAbility：通过AbilityDelegator冷启动主Ability
 * 用于测试套件间页面状态已被重置的场景
 */
export async function launchEntryAbility(): Promise<void> {
  try {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    const bundleName: string = args.bundleName !== undefined && args.bundleName !== null && args.bundleName.length > 0
      ? args.bundleName : BUNDLE_NAME;
    const want: Want = {
      bundleName: bundleName,
      abilityName: MAIN_ABILITY_NAME
    };
    await delegator.startAbility(want);
    await waitForEntryForeground();
    hilog.info(DOMAIN, TAG, '%{public}s', `launchEntryAbility: started ${bundleName}/${MAIN_ABILITY_NAME}`);
  } catch (error) {
    const businessError: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, '%{public}s', `launchEntryAbility failed: ${businessError.code} ${businessError.message}`);
    throw new Error(`EntryAbility launch failed: ${businessError.code} ${businessError.message}`);
  }
}

/**
 * 等待页面渲染完成：以「首页标志文本出现」这一真实渲染事件为完成条件
 * maxWaitMs仅作为超时保护；超时后重新拉起EntryAbility再等待一次
 */
export async function waitForPageStable(driver: Driver, maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  try {
    hilog.info(DOMAIN, TAG, '%{public}s', `waitForPageStable: maxWaitMs=${maxWaitMs}`);

    const deadline: number = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      const visible: boolean = await isPageVisible(driver);
      if (visible) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'waitForPageStable: page render event observed');
        return true;
      }
      await serializedDelay(driver, 100);
    }

    hilog.info(DOMAIN, TAG, '%{public}s', 'waitForPageStable: timeout, relaunching application');
    await launchEntryAbility();

    const secondDeadline: number = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      const visible: boolean = await isPageVisible(driver);
      if (visible) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'waitForPageStable: page observed after relaunch');
        return true;
      }
      await serializedDelay(driver, 100);
    }

    hilog.info(DOMAIN, TAG, '%{public}s', 'waitForPageStable: page still not rendered');
    return false;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `waitForPageStable error: ${error}`);
    return false;
  }
}

/**
 * 等待指定文本出现：事件驱动等待，超时返回false
 */
export async function waitForTextVisible(driver: Driver, text: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const matched: boolean = await checkTextContent(driver, text);
    if (matched) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

/**
 * 按键操作封装：连续触发指定按键多次，每次操作后等待固定延迟
 */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let index: number = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/**
 * 模拟触摸事件：在指定坐标触发点击操作并等待触摸事件处理完成
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/**
 * 按文本点击：查找目标文本组件并触发点击，返回是否点击成功
 */
export async function clickByText(driver: Driver, text: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const target: Component | null = await driver.findComponent(ON.text(text));
      if (target === null || target === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', `clickByText: component not found ${text}`);
        return false;
      }
      await target.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      hilog.info(DOMAIN, TAG, '%{public}s', `clickByText: clicked ${text}`);
      return true;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `clickByText error: ${error}`);
    return false;
  }
}

/**
 * 获取当前焦点索引：返回当前焦点组件的索引位置
 * ON.focused(true)在部分设备上不稳定，因此获取全部组件后使用isFocused()逐个校验
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];
      if (allComponents.length === 0) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'getCurrentFocusIndex: no components');
        return -1;
      }

      for (let index: number = 0; index < allComponents.length; index++) {
        try {
          const isFocused: boolean = await allComponents[index].isFocused();
          if (isFocused) {
            hilog.info(DOMAIN, TAG, '%{public}s', `getCurrentFocusIndex: focus at ${index}`);
            return index;
          }
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', `getCurrentFocusIndex: skip index ${index}`);
        }
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'getCurrentFocusIndex: no focused component');
      return -1;
    });
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

/**
 * 检查焦点状态：验证当前是否存在焦点组件，并在索引可稳定识别时校验索引
 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs: number = 100;
  const deadline: number = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt: number = 1;

  while (Date.now() < deadline) {
    try {
      const result: boolean = await runSerializedUiOperation(async () => {
        const focusedComponent: Component | null = await driver.findComponent(ON.focused(true));
        const allComponents: Component[] = await driver.findComponents(ON.type('*')) ?? [];

        if (expectedFocusedIndex === -1) {
          let hasFocus: boolean = focusedComponent !== null && focusedComponent !== undefined;
          if (!hasFocus) {
            for (let index: number = 0; index < allComponents.length; index++) {
              try {
                if (await allComponents[index].isFocused()) {
                  hasFocus = true;
                  break;
                }
              } catch (error) {
                hilog.info(DOMAIN, TAG, '%{public}s', `checkFocusState: skip focus query ${index}`);
              }
            }
          }
          hilog.info(DOMAIN, TAG, '%{public}s', `checkFocusState: existence=${hasFocus} attempt=${attempt}`);
          return hasFocus;
        }

        if (allComponents.length === 0 || expectedFocusedIndex >= allComponents.length) {
          hilog.info(DOMAIN, TAG, '%{public}s', `checkFocusState: invalid index ${expectedFocusedIndex}`);
          return false;
        }

        try {
          const isFocused: boolean = await allComponents[expectedFocusedIndex].isFocused();
          hilog.info(DOMAIN, TAG, '%{public}s', `checkFocusState: index=${expectedFocusedIndex} focused=${isFocused}`);
          return isFocused;
        } catch (error) {
          hilog.info(DOMAIN, TAG, '%{public}s', `checkFocusState: query failed at ${expectedFocusedIndex}`);
          return false;
        }
      });

      if (result) {
        return true;
      }
    } catch (error) {
      hilog.error(DOMAIN, TAG, '%{public}s', `checkFocusState error: ${error} attempt=${attempt}`);
    }

    attempt++;
    await serializedDelay(driver, retryIntervalMs);
  }

  return false;
}

/**
 * 获取应用上下文：通过AbilityDelegator获取应用级Context
 * 返回null表示测试环境暂未就绪，调用方需做空值分支处理
 */
export function getApplicationContext(): common.ApplicationContext | null {
  try {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const appContext: common.Context = delegator.getAppContext();
    if (appContext === null || appContext === undefined) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'getApplicationContext: null context');
      return null;
    }
    hilog.info(DOMAIN, TAG, '%{public}s', 'getApplicationContext: success');
    return appContext as common.ApplicationContext;
  } catch (error) {
    const businessError: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, '%{public}s', `getApplicationContext failed: ${businessError.code} ${businessError.message}`);
    return null;
  }
}

/**
 * 获取当前栈顶UIAbility的上下文：用于验证UIAbilityContext能力
 */
export async function getTopAbilityContext(): Promise<common.UIAbilityContext | null> {
  try {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const topAbility: UIAbility = await delegator.getCurrentTopAbility();
    if (topAbility === null || topAbility === undefined) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'getTopAbilityContext: no top ability');
      return null;
    }
    hilog.info(DOMAIN, TAG, '%{public}s', 'getTopAbilityContext: success');
    return topAbility.context;
  } catch (error) {
    const businessError: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, '%{public}s', `getTopAbilityContext failed: ${businessError.code} ${businessError.message}`);
    return null;
  }
}

/**
 * 创建指定模块的ModuleContext：验证createModuleContext能力
 */
export async function getModuleContext(moduleName: string): Promise<common.Context | null> {
  try {
    const appContext: common.ApplicationContext | null = getApplicationContext();
    if (appContext === null) {
      return null;
    }
    const moduleContext: common.Context = await application.createModuleContext(appContext, moduleName);
    hilog.info(DOMAIN, TAG, '%{public}s', `getModuleContext: ${moduleName} created`);
    return moduleContext;
  } catch (error) {
    const businessError: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, '%{public}s', `getModuleContext failed: ${businessError.code} ${businessError.message}`);
    return null;
  }
}

/**
 * 获取资源管理器：ApplicationContext.resourceManager
 */
export function getResourceManager(): resourceManager.ResourceManager | null {
  try {
    const appContext: common.ApplicationContext | null = getApplicationContext();
    if (appContext === null) {
      return null;
    }
    return appContext.resourceManager;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `getResourceManager failed: ${error}`);
    return null;
  }
}

/**
 * 获取应用缓存目录：ApplicationContext.cacheDir
 */
export function getCacheDir(): string {
  const appContext: common.ApplicationContext | null = getApplicationContext();
  if (appContext === null) {
    return '';
  }
  try {
    return appContext.cacheDir;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `getCacheDir failed: ${error}`);
    return '';
  }
}

/**
 * 获取应用文件目录：ApplicationContext.filesDir
 */
export function getFilesDir(): string {
  const appContext: common.ApplicationContext | null = getApplicationContext();
  if (appContext === null) {
    return '';
  }
  try {
    return appContext.filesDir;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `getFilesDir failed: ${error}`);
    return '';
  }
}

/**
 * 获取应用包名：ApplicationContext.applicationInfo.name
 */
export function getApplicationBundleName(): string {
  const appContext: common.ApplicationContext | null = getApplicationContext();
  if (appContext === null) {
    return '';
  }
  try {
    return appContext.applicationInfo.name;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `getApplicationBundleName failed: ${error}`);
    return '';
  }
}

/**
 * 获取应用版本号：BundleInfo.versionName
 */
export function getApplicationVersionName(): string {
  const appContext: common.ApplicationContext | null = getApplicationContext();
  if (appContext === null) {
    return '';
  }
  try {
    return bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION).versionName;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `getApplicationVersionName failed: ${error}`);
    return '';
  }
}

/**
 * 判断目录是否可访问：用于目录类属性的可用性校验
 */
export function isDirectoryAccessible(dirPath: string): boolean {
  if (dirPath.length === 0) {
    return false;
  }
  try {
    return fileIo.accessSync(dirPath);
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `isDirectoryAccessible failed: ${error}`);
    return false;
  }
}

/**
 * 写入文本文件：在应用文件目录下创建或覆盖文件，返回写入字节数
 * 返回-1表示写入失败
 */
export async function writeTextFile(dirPath: string, fileName: string, content: string): Promise<number> {
  if (dirPath.length === 0 || fileName.length === 0) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'writeTextFile: invalid arguments');
    return -1;
  }
  let file: fileIo.File | null = null;
  try {
    const fullPath: string = `${dirPath}/${fileName}`;
    file = await fileIo.open(fullPath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC);
    const writeLen: number = await fileIo.write(file.fd, content);
    hilog.info(DOMAIN, TAG, '%{public}s', `writeTextFile: ${fullPath} length=${writeLen}`);
    return writeLen;
  } catch (error) {
    const businessError: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, '%{public}s', `writeTextFile failed: ${businessError.code} ${businessError.message}`);
    return -1;
  } finally {
    if (file !== null) {
      try {
        await fileIo.close(file);
      } catch (error) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'writeTextFile: close failed');
      }
    }
  }
}

/**
 * 读取文本文件：读取应用文件目录下的文件内容，失败时返回空字符串
 */
export async function readTextFile(dirPath: string, fileName: string): Promise<string> {
  if (dirPath.length === 0 || fileName.length === 0) {
    return '';
  }
  let file: fileIo.File | null = null;
  try {
    const fullPath: string = `${dirPath}/${fileName}`;
    file = await fileIo.open(fullPath, fileIo.OpenMode.READ_ONLY);
    const stat: fileIo.Stat = await fileIo.stat(fullPath);
    const arrayBuffer: ArrayBuffer = new ArrayBuffer(stat.size);
    const readLen: number = await fileIo.read(file.fd, arrayBuffer);
    const readBuffer: buffer.Buffer = buffer.from(arrayBuffer, 0, readLen);
    return readBuffer.toString();
  } catch (error) {
    const businessError: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, '%{public}s', `readTextFile failed: ${businessError.code} ${businessError.message}`);
    return '';
  } finally {
    if (file !== null) {
      try {
        await fileIo.close(file);
      } catch (error) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'readTextFile: close failed');
      }
    }
  }
}

/**
 * 删除文件：删除应用文件目录下的指定文件，返回是否删除成功
 */
export async function removeFile(dirPath: string, fileName: string): Promise<boolean> {
  if (dirPath.length === 0 || fileName.length === 0) {
    return false;
  }
  try {
    const fullPath: string = `${dirPath}/${fileName}`;
    await fileIo.unlink(fullPath);
    hilog.info(DOMAIN, TAG, '%{public}s', `removeFile: ${fullPath}`);
    return true;
  } catch (error) {
    const businessError: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, '%{public}s', `removeFile failed: ${businessError.code} ${businessError.message}`);
    return false;
  }
}

/**
 * 判断文件是否存在
 */
export function isFileExist(fullPath: string): boolean {
  try {
    return fileIo.accessSync(fullPath);
  } catch (error) {
    return false;
  }
}

/**
 * 测量异步操作耗时：用于上下文获取、文件读写等场景的性能度量
 */
export async function measureElapsed(action: () => Promise<void>): Promise<number> {
  const startTime: number = Date.now();
  await action();
  const elapsed: number = Date.now() - startTime;
  hilog.info(DOMAIN, TAG, '%{public}s', `measureElapsed: ${elapsed}ms`);
  return elapsed;
}

/**
 * 测量同步操作耗时
 */
export function measureElapsedSync(action: () => void): number {
  const startTime: number = Date.now();
  action();
  const elapsed: number = Date.now() - startTime;
  hilog.info(DOMAIN, TAG, '%{public}s', `measureElapsedSync: ${elapsed}ms`);
  return elapsed;
}

/**
 * 数值近似相等判定：用于耗时、尺寸等允许波动的度量比较
 */
export function isApproximateEqual(actual: number, expected: number, tolerance: number): boolean {
  return Math.abs(actual - expected) <= tolerance;
}

/**
 * 区域加密模式名称：将contextConstant.AreaMode数值映射为可读名称
 */
export function getAreaModeName(areaMode: number): string {
  if (areaMode === AREA_MODE_EL1) {
    return 'EL1';
  }
  if (areaMode === AREA_MODE_EL2) {
    return 'EL2';
  }
  if (areaMode === AREA_MODE_EL3) {
    return 'EL3';
  }
  if (areaMode === AREA_MODE_EL4) {
    return 'EL4';
  }
  if (areaMode === AREA_MODE_EL5) {
    return 'EL5';
  }
  return 'UNKNOWN';
}

/**
 * 判断是否为合法的区域加密模式
 */
export function isValidAreaMode(areaMode: number): boolean {
  return areaMode >= AREA_MODE_EL1 && areaMode <= AREA_MODE_EL5;
}

/**
 * 路径规范化：去除末尾分隔符，便于路径比较
 */
export function normalizePath(path: string): string {
  if (path.length === 0) {
    return '';
  }
  let normalized: string = path;
  while (normalized.length > 1 && normalized.endsWith('/')) {
    normalized = normalized.substring(0, normalized.length - 1);
  }
  return normalized;
}

/**
 * 判断路径是否归属于指定父目录
 */
export function isSubPath(childPath: string, parentPath: string): boolean {
  const child: string = normalizePath(childPath);
  const parent: string = normalizePath(parentPath);
  if (child.length === 0 || parent.length === 0) {
    return false;
  }
  return child === parent || child.startsWith(`${parent}/`);
}

/**
 * 摘要输出应用上下文关键路径信息：用于日志诊断，便于失败定位
 */
export function summarizeContextPaths(): string {
  const cacheDir: string = getCacheDir();
  const filesDir: string = getFilesDir();
  const bundleName: string = getApplicationBundleName();
  return `bundle=${bundleName} cache=${cacheDir} files=${filesDir}`;
}

/**
 * 安全字符串比较：空值安全的等值判断，避免直接调用equals导致的异常
 */
export function safeEquals(left: string, right: string): boolean {
  if (left === null || left === undefined || right === null || right === undefined) {
    return false;
  }
  return left === right;
}

/**
 * 统计字符串中指定字符出现次数：用于键码串、路径串的结构校验
 */
export function countChar(content: string, target: string): number {
  let count: number = 0;
  for (let index: number = 0; index < content.length; index++) {
    if (content.charAt(index) === target) {
      count++;
    }
  }
  return count;
}

/**
 * 生成重复字符串：用于构造边界长度的测试数据
 */
export function repeatString(content: string, times: number): string {
  if (times <= 0) {
    return '';
  }
  let result: string = '';
  for (let index: number = 0; index < times; index++) {
    result += content;
  }
  return result;
}

/**
 * 简单延迟函数：不依赖Driver的场景使用
 */
export async function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

/**
 * 清理测试现场：按返回键退出页面并等待系统稳定
 */
export async function cleanUpPage(driver: Driver): Promise<void> {
  try {
    await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
    await serializedDelay(driver, DELAY_AFTER_OPERATION);
    hilog.info(DOMAIN, TAG, '%{public}s', 'cleanUpPage: done');
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', `cleanUpPage error: ${error}`);
  }
}

/**
 * 重启应用主页面：先回退清理，再冷启动EntryAbility
 */
export async function restartEntryAbility(driver: Driver): Promise<boolean> {
  await cleanUpPage(driver);
  await launchEntryAbility();
  return await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
}
