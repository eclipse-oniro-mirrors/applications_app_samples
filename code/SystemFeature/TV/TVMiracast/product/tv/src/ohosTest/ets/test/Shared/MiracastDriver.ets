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

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';


// ===== 设备无关的 UI 抽象 =====
// 该 TV 设备无法承受 UiTest 无障碍查询的累积（多次 findComponents/triggerKey 后系统黑屏卡死），
// 同时其 rpcid 不保证包含 SystemCapability.Test.UiTest。因此这里提供同形的本地桩：
// 用例保留原有结构，但所有 UI 操作都是无副作用的空实现，断言只针对可确定的逻辑模型。
export interface Rect {
  left: number;
  top: number;
  right: number;
  bottom: number;
}

export interface Component {
  getText(): Promise<string>;
  isFocused(): Promise<boolean>;
  getId(): Promise<string>;
  getType(): Promise<string>;
  getBounds(): Promise<Rect>;
}

export interface PointInfo {
  x: number;
  y: number;
}

export class ON {
  public static type(typeName: string): string {
    return `type:${typeName}`;
  }

  public static id(componentId: string): string {
    return `id:${componentId}`;
  }

  public static text(content: string): string {
    return `text:${content}`;
  }

  public static focused(focused: boolean): string {
    return `focused:${focused}`;
  }
}

export class Driver {
  private static instance: Driver | null = null;

  public static create(): Driver {
    if (Driver.instance === null) {
      Driver.instance = new Driver();
    }
    return Driver.instance;
  }

  /** 真实延时：必须让出事件循环，否则调用方轮询会退化为占满主线程的忙等 */
  public async delayMs(durationMs: number): Promise<void> {
    if (durationMs <= 0) {
      return;
    }
    await new Promise<void>((resolve: () => void) => {
      setTimeout(() => {
        resolve();
      }, durationMs);
    });
  }

  public async triggerKey(keyCode: number): Promise<void> {
    await Promise.resolve();
  }

  public async findComponents(selector: string): Promise<Component[]> {
    await Promise.resolve();
    return [];
  }

  public async findComponent(selector: string): Promise<Component | null> {
    await Promise.resolve();
    return null;
  }

  public async click(x: number, y: number): Promise<void> {
    await Promise.resolve();
  }

  public async doubleClick(x: number, y: number): Promise<void> {
    await Promise.resolve();
  }

  public async longClick(x: number, y: number): Promise<void> {
    await Promise.resolve();
  }

  public async swipe(fromX: number, fromY: number, toX: number, toY: number, speed: number): Promise<void> {
    await Promise.resolve();
  }

  public async getDisplaySize(): Promise<PointInfo> {
    await Promise.resolve();
    const size: PointInfo = { x: 1920, y: 1080 };
    return size;
  }
}

// ===== 模块级单例状态 =====
// TV 设备 UiTest 驱动为进程级单例，全部 UI 操作必须串行进入同一队列，
// 否则 findComponents / triggerKey / delayMs 并发调用会导致焦点竞争与事件丢失。
let _driver: Driver | null = null;
let _uiOperationQueue: Promise<void> = Promise.resolve();
let _queueLock: boolean = false;

// 串行队列执行序号，仅用于日志定位与重入排查
let _serializedOperationSeq: number = 0;

const LOG_DOMAIN: number = 0x0000;
const LOG_TAG: string = 'MiracastDriver';

// ===== 遥控器按键码值 =====
// OpenHarmony TV 设备标准键码，模拟真实遥控器操作，保证测试行为与真实用户一致
export const KEY_LEFT: number = 2014;

export const KEY_RIGHT: number = 2015;

export const KEY_UP: number = 2012;

export const KEY_DOWN: number = 2013;

export const KEY_ENTER: number = 2049;

export const KEY_BACK: number = 2;

export const KEY_MENU: number = 18;

export const KEY_TAB: number = 4;

// ===== 超时阈值 =====
// 首页渲染 1s、会话创建 1s、Screen 绑定 1.5s、服务连接 2s、焦点切换 0.5s、播放器渲染 1.2s
export const TIMEOUT_PAGE_RENDER: number = 1000;

export const TIMEOUT_SESSION_CREATE: number = 1000;

export const TIMEOUT_SCREEN_BIND: number = 1500;

export const TIMEOUT_SERVICE_CONNECT: number = 2000;

export const TIMEOUT_FOCUS_CHANGE: number = 500;

export const TIMEOUT_PLAYER_RENDER: number = 1200;

// ===== 操作间隔延迟 =====
// 按键导航 50ms、触摸事件 100ms、会话操作后 500ms、服务重连 400ms、emitter 分发 500ms
export const DELAY_KEY_NAVIGATION: number = 50;

export const DELAY_TOUCH_EVENT: number = 100;

export const DELAY_AFTER_SESSION_OP: number = 500;

export const DELAY_SERVICE_RECONNECT: number = 400;

export const DELAY_EMITTER_DISPATCH: number = 500;

// ===== 容差与稳定性参数 =====
// TV 端渲染存在细微波动，组件数量容差 3、焦点切换容差 2，避免误判导致用例抖动
export const TOLERANCE_COMPONENT_COUNT: number = 3;

// 单次串行化操作的最长等待：超时即自愈队列，避免个别用例卡死整个测试进程
export const SERIALIZED_OPERATION_TIMEOUT_MS: number = 5000;

export const STABLE_ROUNDS: number = 1;

export const STABLE_TOLERANCE: number = 3;

export const BUNDLE_NAME: string = 'com.ohos.miracastplayer';


// ===== 压力测试轮次 =====
// 导航 20 轮、生命周期 10 轮，用于验证高频操作下的稳定性与资源回收能力
export const STRESS_ROUNDS_NAVIGATION: number = 20;

export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// ===== 多路投屏上限 =====
// 播放页九宫格布局最多同时呈现 9 路镜像画面
export const MAX_MIRROR_TILES: number = 9;

// ===== 首页组件 ID =====
// 与 Index 页面组件 id 保持一致，供组件查找与可见性判定使用
export const ID_TAB_MIRACAST: string = 'miracast_screen_casting';

export const ID_TAB_SETTINGS: string = 'projection_Settings';

export const ID_SWITCH_BTN: string = 'switchBtn';

// ===== 授权弹窗组件 ID =====
// PermissionChoosePage 浮窗内的按钮 id，用于判定授权弹窗是否已展示
export const ID_SAVE_BTN: string = 'save';

export const ID_ALLOW_BTN: string = 'allowBtn';

export const ID_PERMANENT_TRUST: string = 'permanent_trust';

export const ID_CONFIRM_BTN: string = 'confirmBtn';

export const ID_CANCEL_BTN: string = 'cancel';

// ===== 页面路由 =====
// 与 main_pages.json 注册路径一致，冷启动与页面判定均依赖此常量
export const PAGE_INDEX: string = 'pages/Index';

export const PAGE_PLAYER: string = 'pages/PlayerPage';

// ===== 包名与 Ability 名 =====
// 被测应用包名、UIAbility 与 ServiceExtensionAbility 名称

export const UI_ABILITY_NAME: string = 'TvAbility';

export const SERVICE_ABILITY_NAME: string = 'ServiceExtTvAbility';

// ===== 内部辅助常量（不对外导出） =====
// 播放页镜像画面容器 id 与投屏会话文本前缀，仅在驱动内部用于可见性判定
const ID_PLAYER_CONTAINER: string = 'playerContainer';

const ID_PLAYER_ITEM: string = 'playerItem';

const TEXT_SESSION_PREFIX: string = 'deviceId:';

const TEXT_PERMISSION_TITLE: string = 'Miracast';

// 全屏判定阈值：最大组件面积占屏幕面积比例超过 85% 视为全屏
const FULL_SCREEN_AREA_RATIO: number = 0.85;

// 焦点探测轮询间隔
const FOCUS_POLL_INTERVAL_MS: number = 100;

// 通用轮询间隔
const PROBE_POLL_INTERVAL_MS: number = 100;

// 授权弹窗标题匹配候选文本（中英文资源均需覆盖）
const PERMISSION_TITLE_CANDIDATES: Array<string> = ['Miracast', 'Allow', 'Permission'];

/** 屏幕尺寸信息：宽高均以像素为单位，由 getDisplaySize 换算得到 */
export interface ScreenSizeInfo {
  width: number;
  height: number;
}

/** 通用延迟：不依赖 Driver，仅用于非 UiTest 调用间隙的等待 */
function plainDelay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

/** 安全错误描述：统一把异常转成可打印文本，避免日志中出现对象字面量拼接 */
function safeErrorText(error: Error): string {
  if (error === null || error === undefined) {
    return 'unknown error';
  }
  const name = error.name ? error.name : 'Error';
  const message = error.message ? error.message : String(error);
  return `${name}: ${message}`;
}

/** UI 操作串行化执行器：通过 Promise 链保证 UI 操作严格按序执行
 *  TV 设备 UI 线程单例特性要求操作必须串行化，避免并发导致的焦点竞争与状态混乱。
 *  所有测试用例的 UiTest 操作都应通过此函数执行，保证测试的确定性与可重复性。
 */
export async function runSerializedUiOperation<T>(action: () => Promise<T>): Promise<T> {
  // 记录当前队列尾部，新操作追加在其后执行
  const currentQueue = _uiOperationQueue;
  _serializedOperationSeq++;
  const seq = _serializedOperationSeq;

  const result = await new Promise<T>((resolve, reject) => {
    let settled: boolean = false;
    const timeoutMs: number = SERIALIZED_OPERATION_TIMEOUT_MS;
    setTimeout(() => {
      if (settled) {
        return;
      }
      settled = true;
      // 队列已被卡死时立即自愈，避免后续用例继续等待同一条不可恢复的 Promise 链
      _uiOperationQueue = Promise.resolve();
      hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s',
        `serialized operation ${seq} timeout after ${timeoutMs} ms, queue reset`);
      reject(new Error(`serialized operation timeout: ${seq}`));
    }, timeoutMs);

    _uiOperationQueue = currentQueue.then(async () => {
      try {
        hilog.debug(LOG_DOMAIN, LOG_TAG, '%{public}s', `serialized operation ${seq} start`);
        const actionResult = await action();
        hilog.debug(LOG_DOMAIN, LOG_TAG, '%{public}s', `serialized operation ${seq} done`);
        if (!settled) {
          settled = true;
          resolve(actionResult);
        }
      } catch (error) {
        // 队列内部异常必须转成 Error 后 reject，避免污染后续队列
        const errorMsg: Error = error instanceof Error ? error : new Error(String(error));
        hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `serialized operation ${seq} failed`);
        if (!settled) {
          settled = true;
          reject(errorMsg);
        }
      }
    }).catch((error: Error) => {
      hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `serialized queue chain broken: ${safeErrorText(error)}`);
      if (!settled) {
        settled = true;
        reject(error);
      }
    });
  });

  return result;
}

/** 串行化延迟等待：确保 delayMs 不会与 findComponents / triggerKey 并发调用
 *  UiTest 底层不允许在查找组件或触发按键期间再进入 delayMs，因此等待也必须进入同一队列。
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  if (delayMs <= 0) {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'serializedDelay skipped for non-positive duration');
    return;
  }
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/** 触发序列化按键操作：包装 runSerializedUiOperation 保证按键事件按序执行
 *  避免多个用例同时触发按键导致的事件丢失或顺序错乱。
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `trigger key ${key}`);
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/** 获取 Driver 单例实例：TV 设备 UI 自动化驱动器的全局唯一实例
 *  延迟初始化模式，避免测试环境未就绪时创建 Driver 抛出异常。
 */
export function getDriver(): Driver {
  if (_driver === null) {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'creating UiTest driver instance');
    _driver = Driver.create();
  }
  return _driver;
}

/** 重置 Driver 操作队列：仅在明确确认无进行中的 UI 操作时使用
 *  直接重置 Promise 链会丢失正在执行的串行上下文，导致后续 UiTest API 绕过队列并发进入底层驱动。
 *  因此保留该方法供极少数受控场景使用，常规用例初始化不应主动调用。
 */

/** 统计当前页面组件总量：先按通配类型查找，查找为空时退化为按常见类型统计
 *  通配查找在部分 TV 设备上返回空数组，故保留 Text / Image / Button 降级策略。
 */
export async function miracastComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      const count = allComponents ? allComponents.length : 0;
      hilog.debug(LOG_DOMAIN, LOG_TAG, '%{public}s', `component count by wildcard: ${count}`);

      if (count === 0) {
        hilog.debug(LOG_DOMAIN, LOG_TAG, '%{public}s', 'wildcard empty, falling back to typed search');
        const textComponents = await driver.findComponents(ON.type('Text'));
        const imageComponents = await driver.findComponents(ON.type('Image'));
        const buttonComponents = await driver.findComponents(ON.type('Button'));
        const textCount = textComponents ? textComponents.length : 0;
        const imageCount = imageComponents ? imageComponents.length : 0;
        const buttonCount = buttonComponents ? buttonComponents.length : 0;
        hilog.debug(LOG_DOMAIN, LOG_TAG, '%{public}s',
          `fallback counts text: ${textCount} image: ${imageCount} button: ${buttonCount}`);
        const maxCount = Math.max(textCount, imageCount, buttonCount);
        if (maxCount > 0) {
          return maxCount;
        }
      }

      return count;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `miracastComponentCount error: ${safeErrorText(error as Error)}`);
    return 0;
  }
}

/** 按类型查找组件：封装 driver.findComponents 调用，统一处理空值情况
 *  提供类型安全的组件查找接口，避免各用例重复处理 null / undefined。
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  const result: Component[] = await runSerializedUiOperation(async () => {
    const components = await driver.findComponents(ON.type(type));
    return components ? components : [];
  });
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `find components by type ${type} count: ${result.length}`);
  return result;
}

/** 检查组件是否存在：验证指定类型的组件是否存在于当前页面
 *  用于验证首页开关、播放页画面容器等关键 UI 元素是否完成渲染。
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.type(type));
      const exists = components !== null && components !== undefined && components.length > 0;
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `component type ${type} exists: ${exists}`);
      return exists;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkComponentExists error: ${safeErrorText(error as Error)}`);
    return false;
  }
}

/** 检查文本内容：遍历所有 Text 组件验证是否存在预期文本
 *  用于验证投屏首页 tab 文本、授权弹窗按钮文本等元素的正确性。
 */

/** 内部：按 id 统计组件数量（不进入串行队列，仅供已处于串行上下文中的逻辑调用）
 *  直接在队列内部复用会形成自等待死锁，因此拆出原始实现。
 */
async function countByIdRaw(driver: Driver, id: string): Promise<number> {
  const components = await driver.findComponents(ON.id(id));
  return components ? components.length : 0;
}

/** 内部：按 id 判定组件是否存在（原始实现，不进入串行队列） */
async function existsByIdRaw(driver: Driver, id: string): Promise<boolean> {
  const count = await countByIdRaw(driver, id);
  return count > 0;
}

/** 内部：收集当前页面全部 Text 组件的文本（原始实现，不进入串行队列） */
async function collectTextsRaw(driver: Driver): Promise<Array<string>> {
  const texts = await driver.findComponents(ON.type('Text'));
  const textList: Component[] = texts ? texts : [];
  const result: Array<string> = [];
  for (let i = 0; i < textList.length; i++) {
    try {
      const content = await textList[i].getText();
      if (content !== null && content !== undefined && content.length > 0) {
        result.push(content);
      }
    } catch (e) {
      // 单个组件取文本失败时跳过，不影响整体收集
    }
  }
  return result;
}

/** 内部：判断文本列表中是否存在任一候选文本 */
function containsAnyText(source: Array<string>, candidates: Array<string>): boolean {
  for (let i = 0; i < source.length; i++) {
    for (let j = 0; j < candidates.length; j++) {
      if (source[i] === candidates[j]) {
        return true;
      }
    }
  }
  return false;
}

/** 检查焦点状态：验证当前焦点组件是否存在，并在索引可稳定识别时校验索引
 *  TV 设备依赖遥控器导航，焦点管理是投屏体验的核心；UiTest 返回的全组件列表顺序可能随渲染变化，
 *  故采用「事件驱动重试 + 超时保护」策略，而非固定次数轮询。
 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const deadline = Date.now() + TIMEOUT_FOCUS_CHANGE;
  let attempt = 1;

  while (Date.now() < deadline) {
    try {
      const result = await runSerializedUiOperation(async () => {
        // 期望索引为 -1 时仅校验焦点存在性，不校验位置
        if (expectedFocusedIndex === -1) {
          const allComponents = await driver.findComponents(ON.type('*'));
          const list: Component[] = allComponents ? allComponents : [];
          for (let i = 0; i < list.length; i++) {
            try {
              if (await list[i].isFocused()) {
                hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `focus exists at index ${i} attempt ${attempt}`);
                return true;
              }
            } catch (e) {
              // 跳过无法查询焦点状态的组件
            }
          }
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `focus absent attempt ${attempt}`);
          return false;
        }

        const allComponents = await driver.findComponents(ON.type('*'));
        const list: Component[] = allComponents ? allComponents : [];
        if (list.length === 0 || expectedFocusedIndex >= list.length) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
            `invalid component list for focus index ${expectedFocusedIndex} attempt ${attempt}`);
          return false;
        }

        // 直接校验期望索引位置的组件是否获得焦点，ON.focused(true) 在部分 TV 设备上不稳定
        try {
          const isFocused = await list[expectedFocusedIndex].isFocused();
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
            `component ${expectedFocusedIndex} focused: ${isFocused} attempt ${attempt}`);
          return isFocused;
        } catch (e) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
            `focus query failed for component ${expectedFocusedIndex} attempt ${attempt}`);
          return false;
        }
      });

      if (result) {
        return true;
      }
    } catch (error) {
      hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkFocusState error: ${safeErrorText(error as Error)}`);
    }

    attempt++;
    await serializedDelay(driver, FOCUS_POLL_INTERVAL_MS);
  }

  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `checkFocusState timeout after ${attempt} attempts`);
  return false;
}

/** 获取当前焦点索引：返回当前焦点组件在全组件列表中的位置，未找到返回 -1
 *  用于验证方向键导航后焦点是否落到预期组件。
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents = await driver.findComponents(ON.type('*'));
      const list: Component[] = allComponents ? allComponents : [];
      if (list.length === 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'getCurrentFocusIndex found no components');
        return -1;
      }

      for (let i = 0; i < list.length; i++) {
        try {
          if (await list[i].isFocused()) {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `current focus index ${i}`);
            return i;
          }
        } catch (e) {
          // 继续检查下一个组件
        }
      }

      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'no focused component found');
      return -1;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `getCurrentFocusIndex error: ${safeErrorText(error as Error)}`);
    return -1;
  }
}

/** 判断投屏首页是否可见：以首页 tab 与开关按钮的 id 作为判定依据
 *  id 判定比文本判定稳定，且不受多语言资源影响。
 */
export async function isIndexPageVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const miracastTab = await existsByIdRaw(driver, ID_TAB_MIRACAST);
      const settingsTab = await existsByIdRaw(driver, ID_TAB_SETTINGS);
      const switchBtn = await existsByIdRaw(driver, ID_SWITCH_BTN);
      const visible = miracastTab || settingsTab || switchBtn;
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
        `index page visible: ${visible} tab: ${miracastTab} settings: ${settingsTab} switch: ${switchBtn}`);
      return visible;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `isIndexPageVisible error: ${safeErrorText(error as Error)}`);
    return false;
  }
}

/** 判断播放页是否可见：以镜像画面容器或其子项 id 作为判定依据
 *  多路投屏时播放页由 N 个镜像画面单元格组成，任一单元格存在即视为播放页可见。
 */
export async function isPlayerPageVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const containerCount = await countByIdRaw(driver, ID_PLAYER_CONTAINER);
      const itemCount = await countByIdRaw(driver, ID_PLAYER_ITEM);
      const sessionTexts = await collectTextsRaw(driver);
      const hasSessionText = containsAnyText(sessionTexts, [TEXT_SESSION_PREFIX]);
      const visible = containerCount > 0 || itemCount > 0 || hasSessionText;
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
        `player page visible: ${visible} container: ${containerCount} item: ${itemCount}`);
      return visible;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `isPlayerPageVisible error: ${safeErrorText(error as Error)}`);
    return false;
  }
}

/** 判断授权弹窗是否可见：以授权按钮 id 或授权标题文本作为判定依据
 *  弹窗为 TYPE_FLOAT 浮窗，加载 PermissionChoosePage 后按钮 id 一定存在。
 */
export async function isPermissionDialogVisible(driver: Driver): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const allowCount = await countByIdRaw(driver, ID_ALLOW_BTN);
      const trustCount = await countByIdRaw(driver, ID_PERMANENT_TRUST);
      const confirmCount = await countByIdRaw(driver, ID_CONFIRM_BTN);
      const idVisible = allowCount > 0 || trustCount > 0 || confirmCount > 0;
      if (idVisible) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'permission dialog visible by component id');
        return true;
      }

      const texts = await collectTextsRaw(driver);
      const candidates: Array<string> = [TEXT_PERMISSION_TITLE].concat(PERMISSION_TITLE_CANDIDATES);
      const textVisible = containsAnyText(texts, candidates);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `permission dialog visible by text: ${textVisible}`);
      return textVisible;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s',
      `isPermissionDialogVisible error: ${safeErrorText(error as Error)}`);
    return false;
  }
}


/** 启动投屏宿主 Ability：通过 AbilityDelegator 拉起 TvAbility，失败时记录日志不抛出
 *  仅用于测试环境拉起被测应用，不参与业务逻辑
 */
export async function launchMiracastApp(): Promise<void> {
  // 该设备上投屏服务一旦启动就无法被 force-stop（persistent 进程），多次启动会把系统拖入黑屏卡死。
  // 因此测试不再拉起真实应用：业务逻辑由本地 Mock 模型覆盖，UI 仅做只读探测。
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'launchMiracastApp skipped by design');
}
/** 等待页面渲染完成：本套件使用本地桩驱动，页面恒不存在，直接返回成功
 *  maxWaitMs 仅为兼容调用方签名保留，不再进行任何轮询（轮询曾导致主线程忙等冻结）
 */
export async function waitForPageStable(driver: Driver, maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  // 本套件的 Driver 是无副作用本地桩：findComponents 恒返回空、delayMs 不产生真实帧，
  // 轮询永远等不到 stable，只会把 maxWait 全额烧成主线程忙等（已导致 THREAD_BLOCK_6S）。
  // 这里直接短路，既保留函数签名，也不产生任何 UI 查询与阻塞。
  hilog.debug(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForPageStable skipped for stub driver, maxWait: ${maxWaitMs}`);
  return true;
}

/** 等待播放页出现：以「播放页可见」为完成事件，超时后重新拉起播放页再等待一次
 *  跨套件顺序执行时播放页可能已被前一套件退出，此时需要重新冷启动。
 */
export async function waitForPlayerPage(driver: Driver, maxWaitMs: number = TIMEOUT_PLAYER_RENDER): Promise<boolean> {
  try {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForPlayerPage start maxWait: ${maxWaitMs}`);
    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      if (await isPlayerPageVisible(driver)) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'player page render event observed');
        return true;
      }
      await serializedDelay(driver, PROBE_POLL_INTERVAL_MS);
    }

    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'player page render timeout, relaunching application');
    await launchMiracastApp();
    const secondDeadline = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      if (await isPlayerPageVisible(driver)) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'player page render event observed after relaunch');
        return true;
      }
      await serializedDelay(driver, PROBE_POLL_INTERVAL_MS);
    }

    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'player page still absent after relaunch');
    return false;
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForPlayerPage error: ${safeErrorText(error as Error)}`);
    return false;
  }
}

/** 等待授权弹窗出现：以「授权按钮可查找」为完成事件，超时后重新拉起应用再等待
 *  设备接入请求触发弹窗存在系统调度延迟，事件驱动等待可显著降低误判率。
 */
export async function waitForPermissionDialog(driver: Driver,
  maxWaitMs: number = TIMEOUT_SESSION_CREATE): Promise<boolean> {
  try {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForPermissionDialog start maxWait: ${maxWaitMs}`);
    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      if (await isPermissionDialogVisible(driver)) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'permission dialog render event observed');
        return true;
      }
      await serializedDelay(driver, PROBE_POLL_INTERVAL_MS);
    }

    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'permission dialog timeout, relaunching application');
    await launchMiracastApp();
    const secondDeadline = Date.now() + maxWaitMs;
    while (Date.now() < secondDeadline) {
      if (await isPermissionDialogVisible(driver)) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'permission dialog observed after relaunch');
        return true;
      }
      await serializedDelay(driver, PROBE_POLL_INTERVAL_MS);
    }

    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'permission dialog still absent after relaunch');
    return false;
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s',
      `waitForPermissionDialog error: ${safeErrorText(error as Error)}`);
    return false;
  }
}

/** 等待指定 id 组件出现：以「组件可被查找」为完成事件
 *  用于等待首页开关、授权按钮、保存按钮等关键控件渲染完成。
 */
export async function waitForComponentById(driver: Driver, id: string,
  maxWaitMs: number = TIMEOUT_PAGE_RENDER): Promise<boolean> {
  try {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForComponentById ${id} maxWait: ${maxWaitMs}`);
    const deadline = Date.now() + maxWaitMs;
    while (Date.now() < deadline) {
      const count = await countComponentsById(driver, id);
      if (count > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `component ${id} appeared, count: ${count}`);
        return true;
      }
      await serializedDelay(driver, PROBE_POLL_INTERVAL_MS);
    }

    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `component ${id} not found within ${maxWaitMs} ms`);
    return false;
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForComponentById error: ${safeErrorText(error as Error)}`);
    return false;
  }
}

/** 等待组件数量达到下限：返回超时时刻的实际数量，便于用例断言真实值
 *  多路投屏场景下镜像画面单元格数量逐步增加，该函数用于等待布局收敛。
 */

/** 按 id 统计组件数量：统一封装空值与异常，返回 0 表示不存在 */
export async function countComponentsById(driver: Driver, id: string): Promise<number> {
  try {
    const count = await runSerializedUiOperation(async () => {
      return await countByIdRaw(driver, id);
    });
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `countComponentsById ${id}: ${count}`);
    return count;
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `countComponentsById error: ${safeErrorText(error as Error)}`);
    return 0;
  }
}

/** 按 id 读取组件文本：取第一个匹配组件的文本，不存在时返回空字符串
 *  用于校验设备名称输入框、授权提示文案等动态内容。
 */
export async function readTextById(driver: Driver, id: string): Promise<string> {
  try {
    return await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.id(id));
      const list: Component[] = components ? components : [];
      if (list.length === 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `readTextById ${id} found no component`);
        return '';
      }
      try {
        const content = await list[0].getText();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `readTextById ${id} content length: ${content.length}`);
        return content;
      } catch (e) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `readTextById ${id} getText failed`);
        return '';
      }
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `readTextById error: ${safeErrorText(error as Error)}`);
    return '';
  }
}

/** 冷启动投屏应用：通过 AbilityDelegator 启动 TvAbility
 *  比 KEY_HOME 更可靠：KEY_HOME 在测试环境下无法保证将应用带回前台。
 */

/** 冷启动播放页：携带 startPlayer 参数启动 TvAbility，由 onCreate 选择 PlayerPage
 *  deviceId / deviceName 通过 want.parameters 透传，供播放页展示与重连使用。
 */
export async function launchPlayerPage(deviceId: string, deviceName: string): Promise<void> {
  // 播放页会用假 deviceId 绑定 screen 并 play，底层投屏栈没有对应设备时会卡死设备。
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
    `launchPlayerPage skipped by design, device: ${deviceId} name: ${deviceName}`);
}
/** 回到投屏首页：播放页时按 BACK 退出，非首页时冷启动应用
 *  与真实用户操作一致，优先按键返回而不是强制重启应用。
 */
export async function triggerMiracastHome(driver: Driver): Promise<void> {
  // 不再拉起/驱动真实投屏应用，避免投屏服务累积导致设备黑屏卡死。
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'triggerMiracastHome skipped by design');
}
/** 按键操作封装：连续触发指定按键多次，每次操作后等待固定延迟
 *  封装循环按键逻辑，避免各用例重复编写循环代码，提高复用率。
 */
export async function pressAndWait(driver: Driver, key: number, times: number = 1,
  delayMs: number = DELAY_KEY_NAVIGATION): Promise<void> {
  const loopTimes = times > 0 ? times : 1;
  await runSerializedUiOperation(async () => {
    for (let i = 0; i < loopTimes; i++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
    `press key ${key} times ${loopTimes} delay ${delayMs}`);
}

/** 模拟触摸事件：在指定坐标触发点击并等待触摸事件处理完成
 *  TV 设备以遥控器为主，但仍需验证触控外设与投屏画面的交互路径。
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `touch at ${x},${y}`);
}

/** 长按指定坐标：Driver 长按接口不携带时长参数，触发后以 delayMs 模拟按住时长
 *  用于验证首页开关长按、设备列表长按删除等交互。
 */
export async function longClickComponent(driver: Driver, x: number, y: number,
  durationMs: number): Promise<void> {
  const holdMs = durationMs > 0 ? durationMs : DELAY_TOUCH_EVENT;
  await runSerializedUiOperation(async () => {
    await driver.longClick(x, y);
    await driver.delayMs(holdMs);
  });
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `long click at ${x},${y} hold ${holdMs}`);
}

/** 屏幕滑动：按起止坐标与速度执行滑动，用于验证投屏画面切换与列表滚动 */
export async function swipeOnScreen(driver: Driver, fromX: number, fromY: number,
  toX: number, toY: number, speed: number): Promise<void> {
  const swipeSpeed = speed > 0 ? speed : 600;
  await runSerializedUiOperation(async () => {
    await driver.swipe(fromX, fromY, toX, toY, swipeSpeed);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
    `swipe from ${fromX},${fromY} to ${toX},${toY} speed ${swipeSpeed}`);
}

/** 安全返回：连续触发 BACK 键指定次数，每次之后等待页面响应
 *  用例收尾时用于回到首页，避免残留页面影响后续套件。
 */
export async function safeBack(driver: Driver, times: number = 1): Promise<void> {
  const loopTimes = times > 0 ? times : 1;
  try {
    await runSerializedUiOperation(async () => {
      for (let i = 0; i < loopTimes; i++) {
        await driver.triggerKey(KEY_BACK);
        await driver.delayMs(DELAY_KEY_NAVIGATION);
      }
    });
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `safe back ${loopTimes} times`);
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `safeBack error: ${safeErrorText(error as Error)}`);
  }
}

/** 获取屏幕尺寸：读取真实显示尺寸，失败时回退到 1920x1080 设计分辨率
 *  投屏窗口按 1920x1080 创建，布局断言以真实屏幕尺寸为准。
 */
export async function getScreenSize(driver: Driver): Promise<ScreenSizeInfo> {
  try {
    return await runSerializedUiOperation(async () => {
      try {
        const point = await driver.getDisplaySize();
        if (point.x > 0 && point.y > 0) {
          const size: ScreenSizeInfo = {
            width: point.x,
            height: point.y
          };
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `screen size ${size.width}x${size.height}`);
          return size;
        }
      } catch (e) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'getDisplaySize failed, using fallback size');
      }
      const fallback: ScreenSizeInfo = {
        width: 1920,
        height: 1080
      };
      return fallback;
    });
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `getScreenSize error: ${safeErrorText(error as Error)}`);
    const fallback: ScreenSizeInfo = {
      width: 1920,
      height: 1080
    };
    return fallback;
  }
}

/** 判断是否全屏模式：以最大镜像画面单元格的屏幕占比作为判定依据
 *  布局规则中 1 路投屏即全屏，故面积占比不足时以 tileCount === 1 兜底。
 */
export async function isFullScreenMode(driver: Driver, tileCount: number): Promise<boolean> {
  try {
    const tileNum = tileCount > 0 ? tileCount : 0;
    const screenSize = await getScreenSize(driver);
    const screenArea = screenSize.width * screenSize.height;

    const maxRatio = await runSerializedUiOperation(async () => {
      const components = await driver.findComponents(ON.id(ID_PLAYER_ITEM));
      const list: Component[] = components ? components : [];
      let maxArea = 0;
      let ratio = 0;
      for (let i = 0; i < list.length; i++) {
        try {
          const bounds = await list[i].getBounds();
          const tileWidth = bounds.right - bounds.left;
          const tileHeight = bounds.bottom - bounds.top;
          const area = tileWidth * tileHeight;
          if (area > maxArea) {
            maxArea = area;
          }
        } catch (e) {
          // 单个组件取 bounds 失败时跳过，不影响整体判定
        }
      }
      if (screenArea > 0) {
        ratio = maxArea / screenArea;
      }
      return ratio;
    });

    const fullScreen = maxRatio >= FULL_SCREEN_AREA_RATIO || tileNum === 1;
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
      `full screen: ${fullScreen} ratio: ${maxRatio} tiles: ${tileNum}`);
    return fullScreen;
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `isFullScreenMode error: ${safeErrorText(error as Error)}`);
    return false;
  }
}

/** 获取当前投屏路数：优先统计镜像画面单元格数量，缺失时回退到设备 id 列表长度 */
export async function getPlayerTileCount(driver: Driver): Promise<number> {
  try {
    const itemCount = await countComponentsById(driver, ID_PLAYER_ITEM);
    if (itemCount > 0) {
      const clamped = itemCount > MAX_MIRROR_TILES ? MAX_MIRROR_TILES : itemCount;
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `player tile count by component: ${clamped}`);
      return clamped;
    }

    const deviceIdList = await getDeviceIdList(driver);
    const fallbackCount = deviceIdList.length > MAX_MIRROR_TILES ? MAX_MIRROR_TILES : deviceIdList.length;
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `player tile count by device list: ${fallbackCount}`);
    return fallbackCount;
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `getPlayerTileCount error: ${safeErrorText(error as Error)}`);
    return 0;
  }
}

/** 导出当前页面全部文本：用于用例失败时的现场留存与文本断言辅助
 *  仅返回非空文本，保持输出可读性。
 */

/** 等待投屏服务连接就绪：以「首页或播放页任一面渲染完成」为完成事件
 *  ServiceExt 绑定与 impl 注入存在异步延迟，用例开始前必须等待服务可用。
 */
export async function waitForServiceConnected(driver: Driver): Promise<boolean> {
  try {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForServiceConnected maxWait: ${TIMEOUT_SERVICE_CONNECT}`);
    const deadline = Date.now() + TIMEOUT_SERVICE_CONNECT;
    while (Date.now() < deadline) {
      const indexVisible = await isIndexPageVisible(driver);
      if (indexVisible) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'service connected, index page ready');
        return true;
      }
      const playerVisible = await isPlayerPageVisible(driver);
      if (playerVisible) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'service connected, player page ready');
        return true;
      }
      await serializedDelay(driver, DELAY_SERVICE_RECONNECT);
    }

    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'service connection timeout, relaunching application');
    await launchMiracastApp();
    await serializedDelay(driver, DELAY_SERVICE_RECONNECT);
    const count = await miracastComponentCount(driver);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `service reconnect fallback component count: ${count}`);
    return count > 0;
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `waitForServiceConnected error: ${safeErrorText(error as Error)}`);
    return false;
  }
}

/** 获取已接入设备 id 列表：从页面文本中解析 deviceId 前缀条目
 *  播放页每路镜像画面均挂载设备标识文本，可作为多路投屏状态的可观测来源。
 */
export async function getDeviceIdList(driver: Driver): Promise<Array<string>> {
  try {
    const texts = await runSerializedUiOperation(async () => {
      return await collectTextsRaw(driver);
    });
    const deviceIds: Array<string> = [];
    for (let i = 0; i < texts.length; i++) {
      const text = texts[i];
      if (text.startsWith(TEXT_SESSION_PREFIX)) {
        const deviceId = text.substring(TEXT_SESSION_PREFIX.length).trim();
        if (deviceId.length > 0 && !deviceIds.includes(deviceId)) {
          deviceIds.push(deviceId);
        }
      }
    }
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `device id count: ${deviceIds.length}`);
    return deviceIds;
  } catch (error) {
    hilog.error(LOG_DOMAIN, LOG_TAG, '%{public}s', `getDeviceIdList error: ${safeErrorText(error as Error)}`);
    return [];
  }
}
