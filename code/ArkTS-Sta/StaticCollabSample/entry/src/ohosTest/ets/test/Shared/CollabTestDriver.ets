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

/**
 * 分布式协作示例（ArkTS 1.2 静态模式）测试公共驱动模块。
 *
 * 本模块为所有测试套件提供统一的 UI 驱动封装、可串行化的 UI 操作队列、
 * 以及一组与本示例业务模型完全对应的 Mock 对象（会话、桥接管理器、设备管理器、
 * AppStorage 状态容器、日志与指标采集器）。
 *
 * 设计目标：
 * 1. 所有 UI 自动化操作串行化，避免 UiTest 底层并发调用导致的焦点竞争与事件丢失；
 * 2. 所有 Mock 对象保持确定性（不依赖真实设备、不依赖真实分布式连接），
 *    使跨设备场景可以在单机测试环境中被稳定验证；
 * 3. 日志统一使用 hilog 输出，禁止 console.log，日志文本统一使用英文。
 */

import { Driver, ON, Component, abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';

export const TAG: string = 'CollabSampleTest';

// ============================== UI 常量定义 ==============================

/** 返回键键码：用于关闭输入法、退出页面等操作 */
export const KEY_BACK: number = 2;

/** Home 键键码：用于将应用切到后台后再次拉起 */
export const KEY_HOME: number = 3;

/** 方向键（上）键码：用于在按钮之间移动焦点 */
export const KEY_UP: number = 2012;

/** 方向键（下）键码：用于在按钮之间移动焦点 */
export const KEY_DOWN: number = 2013;

/** 方向键（左）键码 */
export const KEY_LEFT: number = 2014;

/** 方向键（右）键码 */
export const KEY_RIGHT: number = 2015;

/** 确认键键码 */
export const KEY_ENTER: number = 2049;

/** 页面渲染超时时间（毫秒） */
export const TIMEOUT_UI_RENDER: number = 1000;

/** 连接建立超时时间（毫秒） */
export const TIMEOUT_CONNECT: number = 2000;

/** 会话创建超时时间（毫秒） */
export const TIMEOUT_SESSION_CREATE: number = 1000;

/** 状态刷新超时时间（毫秒） */
export const TIMEOUT_STATE_CHANGE: number = 500;

/** 按键操作间隔（毫秒） */
export const DELAY_KEY_NAVIGATION: number = 50;

/** 触摸操作间隔（毫秒） */
export const DELAY_TOUCH_EVENT: number = 100;

/** 业务操作完成后的等待时间（毫秒） */
export const DELAY_AFTER_OPERATION: number = 500;

/** 组件数量容差：用于抵消渲染抖动对断言的影响 */
export const TOLERANCE_COMPONENT_COUNT: number = 3;

/** 状态切换容差 */
export const TOLERANCE_STATE_CHANGE: number = 2;

/** 稳定性检测轮次 */
export const STABLE_ROUNDS: number = 1;

/** 稳定性容差 */
export const STABLE_TOLERANCE: number = 3;

/** 压力测试导航轮次 */
export const STRESS_ROUNDS_NAVIGATION: number = 20;

/** 压力测试生命周期轮次 */
export const STRESS_ROUNDS_LIFECYCLE: number = 10;

// ============================== 业务常量定义 ==============================

/** 示例应用包名，与 AppScope/app.json5 保持一致 */
export const COLLAB_BUNDLE_NAME: string = 'com.example.staticCollabSample';

/** 示例应用的主模块名 */
export const COLLAB_MODULE_NAME: string = 'entry';

/** 示例应用的主 Ability 名 */
export const COLLAB_ABILITY_NAME: string = 'EntryAbility';

/** 协作服务名，用于对端服务发现 */
export const COLLAB_SERVICE_NAME: string = 'collabService';

/** 会话名称，Index 页面创建会话时固定使用该名称 */
export const COLLAB_SESSION_NAME: string = 'collabTest';

/** 页面标题文本 */
export const PAGE_TITLE: string = 'Distributed Collaboration Sample';

/** 页面上的按钮文本集合 */
export const BUTTON_CONNECT: string = 'Connect';

export const BUTTON_SEND_MESSAGE: string = 'Send Message';

export const BUTTON_SEND_DATA: string = 'Send Data';

export const BUTTON_DISCONNECT: string = 'Disconnect';

export const BUTTON_DESTROY_SESSION: string = 'Destroy Session';

/** 主页面输入框组件标识 */
export const MESSAGE_INPUT_ID: string = 'messageInput';

/** 发送文本消息时固定的消息体 */
export const MESSAGE_HELLO: string = 'Hello from peer';

/** 发送二进制数据时固定的数据体 */
export const DATA_PAYLOAD: string = 'Data from peer';

/** 连接成功状态文本 */
export const STATUS_CONNECT_SUCCESS: string = 'Connection success';

/** 连接失败状态文本 */
export const STATUS_CONNECT_FAILED: string = 'Connection failed';

/** 连接异常状态文本 */
export const STATUS_CONNECT_ERROR: string = 'Connection error';

/** 无可用设备状态文本 */
export const STATUS_NO_DEVICE: string = 'No remote device found';

/** 会话创建失败状态文本 */
export const STATUS_CREATE_FAILED: string = 'Create session failed';

/** 会话无效状态文本 */
export const STATUS_INVALID_SESSION: string = 'Invalid session ID';

/** 未连接状态文本 */
export const STATUS_NOT_CONNECTED: string = 'Not connected';

/** 销毁成功状态文本 */
export const STATUS_SESSION_DESTROYED: string = 'Session destroyed';

/** 无效会话 ID 常量：会话创建失败或销毁后的占位值 */
export const INVALID_SESSION_ID: number = -1;

/** AppStorage 中保存会话 ID 的键 */
export const STORAGE_KEY_SESSION_ID: string = 'sessionId';

/** AppStorage 中保存连接状态的键 */
export const STORAGE_KEY_IS_CONNECTED: string = 'isConnected';

/** AppStorage 中保存接收消息的键 */
export const STORAGE_KEY_RECEIVE_MESSAGE: string = 'receiveMessage';

/** AppStorage 中保存协作消息的键 */
export const STORAGE_KEY_RECEIVE_WATCH_MESSAGE: string = 'receiveWatchMessage';

/** 协作参数中 PeerInfo 的键 */
export const PARAM_KEY_PEER_INFO: string = 'PeerInfo';

/** 协作参数中 ConnectOption 的键 */
export const PARAM_KEY_CONNECT_OPTION: string = 'ConnectOption';

/** 协作参数中协作令牌的键 */
export const PARAM_KEY_COLLAB_TOKEN: string = 'ohos.dms.collabToken';

/** 协作参数中协作索引的键 */
export const PARAM_KEY_COLLAB_INDEX: string = 'ohos.extra.param.key.supportCollaborateIndex';

/** 示例应用运行时申请的权限列表，顺序与 Index.ets 保持一致 */
export const REQUESTED_PERMISSIONS: string[] = [
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE',
  'ohos.permission.READ_MEDIA',
  'ohos.permission.WRITE_MEDIA',
  'ohos.permission.DISTRIBUTED_DATASYNC'
];

/** 传输编码：示例中编解码统一使用 UTF-8 */
export const TEXT_ENCODING: string = 'utf-8';

// ============================== 枚举定义 ==============================

/** 会话状态：描述一个协作会话从创建到销毁的完整状态机 */
export enum SessionState {
  IDLE = 'idle',
  CREATED = 'created',
  CONNECTING = 'connecting',
  CONNECTED = 'connected',
  DISCONNECTING = 'disconnecting',
  DISCONNECTED = 'disconnected',
  DESTROYED = 'destroyed',
  FAILED = 'failed'
}

/** 协作事件类型：与会话事件监听回调一一对应 */
export enum CollabEventType {
  CREATE = 'create',
  ACCEPT = 'accept',
  CONNECT = 'connect',
  DISCONNECT = 'disconnect',
  DESTROY = 'destroy',
  SEND_MESSAGE = 'sendMessage',
  SEND_DATA = 'sendData',
  RECEIVE_MESSAGE = 'receiveMessage',
  RECEIVE_DATA = 'receiveData',
  ERROR = 'error'
}

/** 操作状态：描述一次协作操作请求的处理阶段 */
export enum OperationStatus {
  QUEUED = 'queued',
  RUNNING = 'running',
  COMPLETED = 'completed',
  FAILED = 'failed',
  CANCELLED = 'cancelled'
}

/** 连接启动选项：对应 abilityConnectionManager.StartOptionParams */
export enum ConnectStartOption {
  START_IN_FOREGROUND = 'startInForeground',
  START_IN_BACKGROUND = 'startInBackground'
}

// ============================== 接口定义 ==============================

/** 对端设备信息：对应 abilityConnectionManager.PeerInfo 的字段结构 */
export interface PeerInfoLike {
  deviceId: string;
  bundleName: string;
  moduleName: string;
  abilityName: string;
  serviceName: string;
}

/** 连接选项：对应 abilityConnectionManager.ConnectOptions 的字段结构 */
export interface ConnectOptionsLike {
  needSendData: boolean;
  startOption: ConnectStartOption;
}

/** 协作事件记录：用于断言事件触发顺序与次数 */
export interface CollabEventRecord {
  type: CollabEventType;
  sessionId: number;
  detail: string;
  timestamp: number;
}

/** 会话快照：用于断言某一时刻会话的完整状态 */
export interface SessionSnapshot {
  sessionId: number;
  sessionName: string;
  state: SessionState;
  peerInfo: PeerInfoLike;
  options: ConnectOptionsLike;
  messageCount: number;
  dataCount: number;
  accepted: boolean;
  errorCount: number;
}

/** 可用设备信息：对应 distributedDeviceManager.DeviceBasicInfo 的最小结构 */
export interface DeviceInfoLike {
  deviceId: string;
  networkId: string;
  deviceName: string;
  deviceType: string;
}

/** 权限条目：用于权限申请的静态校验 */
export interface PermissionItem {
  name: string;
  granted: boolean;
  sensitive: boolean;
}

/** 日志记录：供日志相关用例断言日志级别与内容 */
export interface LogRecord {
  level: string;
  tag: string;
  message: string;
  timestamp: number;
}

/** 性能指标：供性能与稳定性用例断言 */
export interface CollabMetrics {
  operationCount: number;
  successCount: number;
  failureCount: number;
  totalCostMs: number;
  maxCostMs: number;
  minCostMs: number;
}

/** 超时等待用的判定函数类型 */
export type Predicate = () => boolean;

/** 异步动作类型：供串行化执行器使用 */
export type AsyncAction<T> = () => Promise<T>;

// ============================== UI 串行化执行器 ==============================

let _driver: Driver | null = null;

let _uiOperationQueue: Promise<void> = Promise.resolve();

/**
 * UI 操作串行化执行器：通过 Promise 链确保 UI 操作按序执行。
 * 设备 UI 线程为单例，并发调用 UiTest 接口会导致焦点竞争与事件丢失，
 * 因此所有测试用例的 UI 操作都应通过此函数执行。
 * @param action 待执行的异步动作
 * @returns 动作执行结果
 */
export async function runSerializedUiOperation<T>(action: AsyncAction<T>): Promise<T> {
  const currentQueue: Promise<void> = _uiOperationQueue;
  const result: T = await new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
    _uiOperationQueue = currentQueue.then(async () => {
      try {
        const actionResult: T = await action();
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

/**
 * 串行化延迟：确保 delayMs 不会与其他 UiTest 调用并发执行。
 * @param driver UI 驱动实例
 * @param delayMs 延迟毫秒数
 */
export async function serializedDelay(driver: Driver, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.delayMs(delayMs);
  });
}

/**
 * 串行化按键：将按键事件纳入串行队列。
 * @param driver UI 驱动实例
 * @param key 键码
 */
export async function triggerSerializedKey(driver: Driver, key: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.triggerKey(key);
  });
}

/**
 * 获取 Driver 单例：延迟初始化，避免测试环境未就绪时创建驱动导致异常。
 * @returns Driver 实例
 */
export function getDriver(): Driver {
  if (_driver === null) {
    _driver = Driver.create();
  }
  return _driver as Driver;
}

/**
 * 重置 UI 操作队列：仅在确认没有进行中的 UI 操作时使用。
 */
export function resetDriver(): void {
  _uiOperationQueue = Promise.resolve();
}

/**
 * 按类型查找组件。
 * @param driver UI 驱动实例
 * @param type 组件类型名
 * @returns 组件数组，查询失败时返回空数组
 */
export async function findComponentsByType(driver: Driver, type: string): Promise<Component[]> {
  return await runSerializedUiOperation(async () => {
    const components: Component[] | null = await driver.findComponents(ON.type(type));
    return components === null ? [] : components;
  });
}

/**
 * 统计当前页面组件数量。
 * 优先统计全部组件，若为空则退回统计 Text / Button / TextInput 三种关键组件。
 * @param driver UI 驱动实例
 * @returns 组件数量
 */
export async function collabComponentCount(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] | null = await driver.findComponents(ON.type('*'));
      const count: number = allComponents === null ? 0 : allComponents.length;
      if (count > 0) {
        hilog.info(0x0000, TAG, '%{public}s', `collabComponentCount: total=${count}`);
        return count;
      }

      const textComponents: Component[] | null = await driver.findComponents(ON.type('Text'));
      const buttonComponents: Component[] | null = await driver.findComponents(ON.type('Button'));
      const inputComponents: Component[] | null = await driver.findComponents(ON.type('TextInput'));

      const textCount: number = textComponents === null ? 0 : textComponents.length;
      const buttonCount: number = buttonComponents === null ? 0 : buttonComponents.length;
      const inputCount: number = inputComponents === null ? 0 : inputComponents.length;

      const maxCount: number = Math.max(textCount, buttonCount, inputCount);
      hilog.info(0x0000, TAG, '%{public}s',
        `collabComponentCount fallback: text=${textCount}, button=${buttonCount}, input=${inputCount}`);
      return maxCount;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', `collabComponentCount error: ${error}`);
    return 0;
  }
}

/**
 * 检查页面中是否存在指定文本。
 * @param driver UI 驱动实例
 * @param expectedText 期望文本
 * @returns 存在返回 true
 */
export async function checkTextContent(driver: Driver, expectedText: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const matched: Component[] | null = await driver.findComponents(ON.text(expectedText));
      if (matched !== null && matched.length > 0) {
        hilog.info(0x0000, TAG, '%{public}s', `checkTextContent: match ${expectedText}`);
        return true;
      }
      const texts: Component[] | null = await driver.findComponents(ON.type('Text'));
      if (texts === null || texts.length === 0) {
        hilog.info(0x0000, TAG, '%{public}s', 'checkTextContent: no text component');
        return false;
      }
      for (const text of texts) {
        try {
          const content: string = await text.getText();
          if (content === expectedText) {
            hilog.info(0x0000, TAG, '%{public}s', `checkTextContent: match ${expectedText}`);
            return true;
          }
        } catch (error) {
          hilog.warn(0x0000, TAG, '%{public}s', `checkTextContent: read text failed: ${error}`);
        }
      }
      hilog.info(0x0000, TAG, '%{public}s', `checkTextContent: miss ${expectedText}`);
      return false;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', `checkTextContent error: ${error}`);
    return false;
  }
}

/**
 * 关闭可能遮挡被测页面的系统弹窗（USB 模式选择、权限授权等）。
 * @param driver UI 驱动实例
 * @returns 点击到任一弹窗按钮返回 true
 */
export async function dismissSystemDialog(driver: Driver): Promise<boolean> {
  const labels: string[] = ['允许', '始终允许', '确定', '取消'];
  for (const label of labels) {
    try {
      const clicked: boolean = await runSerializedUiOperation(async () => {
        const components: Component[] | null = await driver.findComponents(ON.text(label));
        if (components !== null && components.length > 0) {
          await components[0].click();
          await driver.delayMs(DELAY_AFTER_OPERATION);
          return true;
        }
        return false;
      });
      if (clicked) {
        hilog.info(0x0000, TAG, '%{public}s', `dismissSystemDialog: clicked ${label}`);
        return true;
      }
    } catch (error) {
      hilog.warn(0x0000, TAG, '%{public}s', `dismissSystemDialog: ${label} failed: ${error}`);
    }
  }
  return false;
}

/**
 * 检查指定类型组件是否存在。
 * @param driver UI 驱动实例
 * @param type 组件类型名
 * @returns 存在返回 true
 */
export async function checkComponentExists(driver: Driver, type: string): Promise<boolean> {
  try {
    const components: Component[] = await findComponentsByType(driver, type);
    const exists: boolean = components.length > 0;
    hilog.info(0x0000, TAG, '%{public}s', `checkComponentExists: type=${type}, exists=${exists}`);
    return exists;
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', `checkComponentExists error: ${error}`);
    return false;
  }
}

/**
 * 模拟触摸点击。
 * @param driver UI 驱动实例
 * @param x 横坐标
 * @param y 纵坐标
 */
export async function simulateTouch(driver: Driver, x: number, y: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    await driver.click(x, y);
    await driver.delayMs(DELAY_TOUCH_EVENT);
  });
}

/**
 * 按文本点击按钮。
 * @param driver UI 驱动实例
 * @param text 按钮文本
 * @returns 点击成功返回 true
 */
export async function clickButtonByText(driver: Driver, text: string): Promise<boolean> {
  try {
    return await runSerializedUiOperation(async () => {
      const buttons: Component[] | null = await driver.findComponents(ON.text(text));
      if (buttons === null || buttons.length === 0) {
        hilog.warn(0x0000, TAG, '%{public}s', `clickButtonByText: button not found: ${text}`);
        return false;
      }
      await buttons[0].click();
      await driver.delayMs(DELAY_AFTER_OPERATION);
      hilog.info(0x0000, TAG, '%{public}s', `clickButtonByText: clicked ${text}`);
      return true;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', `clickButtonByText error: ${error}`);
    return false;
  }
}

/**
 * 读取页面输入框文本；未找到输入框时返回空串。
 * @param driver UI 驱动实例
 * @returns 输入框文本
 */
export async function readInputText(driver: Driver): Promise<string> {
  try {
    return await runSerializedUiOperation(async () => {
      const inputs: Component[] | null = await driver.findComponents(ON.type('TextInput'));
      if (inputs === null || inputs.length === 0) {
        return '';
      }
      return await inputs[0].getText();
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', `readInputText error: ${error}`);
    return '';
  }
}

/**
 * 获取当前焦点组件索引。
 * 部分设备 ON.focused(true) 不可靠，因此遍历全部组件调用 isFocused 兜底。
 * @param driver UI 驱动实例
 * @returns 焦点索引，未找到返回 -1
 */
export async function getCurrentFocusIndex(driver: Driver): Promise<number> {
  try {
    return await runSerializedUiOperation(async () => {
      const allComponents: Component[] | null = await driver.findComponents(ON.type('*'));
      if (allComponents === null || allComponents.length === 0) {
        return -1;
      }
      for (let index = 0; index < allComponents.length; index++) {
        try {
          const focused: boolean = await allComponents[index].isFocused();
          if (focused) {
            hilog.info(0x0000, TAG, '%{public}s', `getCurrentFocusIndex: focus at ${index}`);
            return index;
          }
        } catch (error) {
          hilog.warn(0x0000, TAG, '%{public}s', `getCurrentFocusIndex: check ${index} failed`);
        }
      }
      return -1;
    });
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', `getCurrentFocusIndex error: ${error}`);
    return -1;
  }
}

/**
 * 校验焦点状态：在超时时间内轮询，等待焦点落到期望索引。
 * @param driver UI 驱动实例
 * @param expectedFocusedIndex 期望索引，-1 表示只要求存在焦点
 * @returns 满足期望返回 true
 */
export async function checkFocusState(driver: Driver, expectedFocusedIndex: number): Promise<boolean> {
  const retryIntervalMs: number = 100;
  const deadline: number = Date.now() + TIMEOUT_STATE_CHANGE;
  while (Date.now() < deadline) {
    try {
      if (expectedFocusedIndex === INVALID_SESSION_ID) {
        const focusedIndex: number = await getCurrentFocusIndex(driver);
        if (focusedIndex !== INVALID_SESSION_ID) {
          return true;
        }
      } else {
        const components: Component[] = await findComponentsByType(driver, '*');
        if (expectedFocusedIndex < components.length) {
          const focused: boolean = await runSerializedUiOperation(async () => {
            return await components[expectedFocusedIndex].isFocused();
          });
          if (focused) {
            return true;
          }
        }
      }
    } catch (error) {
      hilog.warn(0x0000, TAG, '%{public}s', `checkFocusState error: ${error}`);
    }
    await serializedDelay(driver, retryIntervalMs);
  }
  return false;
}

/**
 * 按键操作封装：连续触发指定按键多次。
 * @param driver UI 驱动实例
 * @param key 键码
 * @param times 触发次数
 * @param delayMs 每次间隔
 */
export async function pressAndWait(driver: Driver, key: number, times: number, delayMs: number): Promise<void> {
  await runSerializedUiOperation(async () => {
    for (let index = 0; index < times; index++) {
      await driver.triggerKey(key);
      await driver.delayMs(delayMs);
    }
  });
}

/**
 * 冷启动示例应用主 Ability。
 */
export async function launchSampleApp(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: COLLAB_ABILITY_NAME
  };
  await delegator.startAbility(want);
  hilog.info(0x0000, TAG, '%{public}s', 'launchSampleApp: EntryAbility started');
}

/**
 * 等待页面进入可用状态：以「组件数大于 0」为真实渲染事件。
 * @param driver UI 驱动实例
 * @param maxWaitMs 最长等待时间
 * @returns 渲染完成返回 true
 */
export async function waitForUiReady(driver: Driver, maxWaitMs: number): Promise<boolean> {
  const deadline: number = Date.now() + maxWaitMs;
  while (Date.now() < deadline) {
    const count: number = await collabComponentCount(driver);
    if (count > 0) {
      hilog.info(0x0000, TAG, '%{public}s', `waitForUiReady: ready with ${count} components`);
      return true;
    }
    await serializedDelay(driver, 100);
  }
  hilog.warn(0x0000, TAG, '%{public}s', 'waitForUiReady: timeout, relaunch sample app');
  try {
    await launchSampleApp();
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', `waitForUiReady: launch failed: ${error}`);
  }
  const secondDeadline: number = Date.now() + maxWaitMs;
  while (Date.now() < secondDeadline) {
    const count: number = await collabComponentCount(driver);
    if (count > 0) {
      return true;
    }
    await serializedDelay(driver, 100);
  }
  return false;
}

/**
 * 轮询等待任意布尔条件成立。
 * @param predicate 判定函数
 * @param timeoutMs 超时时间
 * @param intervalMs 轮询间隔
 * @returns 条件成立返回 true
 */
export async function waitUntil(predicate: Predicate, timeoutMs: number, intervalMs: number): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (predicate()) {
      return true;
    }
    await delay(intervalMs);
  }
  return predicate();
}

/**
 * 简单延迟。
 * @param ms 毫秒数
 */
export function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

// ============================== 文本编解码工具 ==============================

/**
 * 将字符串编码为 UTF-8 ArrayBuffer。
 * @param text 待编码文本
 * @returns 编码结果
 */
export function encodeUtf8(text: string): ArrayBuffer {
  const encoder: util.TextEncoder = util.TextEncoder.create(TEXT_ENCODING);
  const encoded: Uint8Array = encoder.encodeInto(text);
  return encoded.buffer;
}

/**
 * 将 UTF-8 ArrayBuffer 解码为字符串。
 * @param buffer 待解码数据
 * @returns 解码文本
 */
export function decodeUtf8(buffer: ArrayBuffer): string {
  const decoder: util.TextDecoder = util.TextDecoder.create(TEXT_ENCODING);
  const bytes: Uint8Array = new Uint8Array(buffer);
  return decoder.decodeToString(bytes);
}

/**
 * 计算字符串的 UTF-8 字节长度。
 * @param text 文本
 * @returns 字节长度
 */
export function utf8ByteLength(text: string): number {
  return encodeUtf8(text).byteLength;
}

/**
 * 拼接二进制数据块，用于验证分片传输。
 * @param chunks 数据块数组
 * @returns 拼接后的 ArrayBuffer
 */
export function concatBuffers(chunks: ArrayBuffer[]): ArrayBuffer {
  let totalLength: number = 0;
  for (const chunk of chunks) {
    totalLength += chunk.byteLength;
  }
  const merged: Uint8Array = new Uint8Array(totalLength);
  let offset: number = 0;
  for (const chunk of chunks) {
    merged.set(new Uint8Array(chunk), offset);
    offset += chunk.byteLength;
  }
  return merged.buffer;
}

// ============================== Mock 对端信息 ==============================

/**
 * 对端信息模型：封装 PeerInfo 的构造、校验与序列化。
 */
export class PeerInfoModel {
  public deviceId: string;
  public bundleName: string;
  public moduleName: string;
  public abilityName: string;
  public serviceName: string;

  constructor(deviceId: string, bundleName: string = COLLAB_BUNDLE_NAME,
    moduleName: string = COLLAB_MODULE_NAME, abilityName: string = COLLAB_ABILITY_NAME,
    serviceName: string = COLLAB_SERVICE_NAME) {
    this.deviceId = deviceId;
    this.bundleName = bundleName;
    this.moduleName = moduleName;
    this.abilityName = abilityName;
    this.serviceName = serviceName;
  }

  /** 全部字段非空则视为完整 */
  public isComplete(): boolean {
    return this.deviceId.length > 0 && this.bundleName.length > 0 && this.moduleName.length > 0 &&
      this.abilityName.length > 0 && this.serviceName.length > 0;
  }

  /** 返回缺失字段名列表 */
  public missingFields(): string[] {
    const missing: string[] = [];
    if (this.deviceId.length === 0) {
      missing.push('deviceId');
    }
    if (this.bundleName.length === 0) {
      missing.push('bundleName');
    }
    if (this.moduleName.length === 0) {
      missing.push('moduleName');
    }
    if (this.abilityName.length === 0) {
      missing.push('abilityName');
    }
    if (this.serviceName.length === 0) {
      missing.push('serviceName');
    }
    return missing;
  }

  /** 转换为普通结构体 */
  public toLike(): PeerInfoLike {
    return {
      deviceId: this.deviceId,
      bundleName: this.bundleName,
      moduleName: this.moduleName,
      abilityName: this.abilityName,
      serviceName: this.serviceName
    };
  }

  /** 转换为 Record，模拟协作参数在 Want 中的传递形式 */
  public toRecord(): Record<string, string> {
    const record: Record<string, string> = {};
    record['deviceId'] = this.deviceId;
    record['bundleName'] = this.bundleName;
    record['moduleName'] = this.moduleName;
    record['abilityName'] = this.abilityName;
    record['serviceName'] = this.serviceName;
    return record;
  }

  /** 从 Record 还原对端信息，缺失字段按空串处理 */
  public static fromRecord(record: Record<string, string>): PeerInfoModel {
    const deviceId: string = record['deviceId'] === undefined ? '' : record['deviceId'];
    const bundleName: string = record['bundleName'] === undefined ? '' : record['bundleName'];
    const moduleName: string = record['moduleName'] === undefined ? '' : record['moduleName'];
    const abilityName: string = record['abilityName'] === undefined ? '' : record['abilityName'];
    const serviceName: string = record['serviceName'] === undefined ? '' : record['serviceName'];
    return new PeerInfoModel(deviceId, bundleName, moduleName, abilityName, serviceName);
  }

  /** 复制一份对端信息 */
  public clone(): PeerInfoModel {
    return new PeerInfoModel(this.deviceId, this.bundleName, this.moduleName, this.abilityName, this.serviceName);
  }

  /** 结构化比较 */
  public equals(other: PeerInfoModel): boolean {
    return this.deviceId === other.deviceId && this.bundleName === other.bundleName &&
      this.moduleName === other.moduleName && this.abilityName === other.abilityName &&
      this.serviceName === other.serviceName;
  }

  /** 调试文本 */
  public describe(): string {
    return `PeerInfo(deviceId=${this.deviceId}, bundle=${this.bundleName}, module=${this.moduleName}, ` +
      `ability=${this.abilityName}, service=${this.serviceName})`;
  }
}

/**
 * 构造默认对端信息。
 * @param deviceId 设备标识
 * @returns 对端信息模型
 */
export function buildPeerInfo(deviceId: string): PeerInfoModel {
  return new PeerInfoModel(deviceId);
}

// ============================== 连接选项模型 ==============================

/**
 * 连接选项模型：封装 ConnectOptions 的构造与校验。
 */
export class ConnectOptionsModel {
  public needSendData: boolean;
  public startOption: ConnectStartOption;

  constructor(needSendData: boolean = true, startOption: ConnectStartOption = ConnectStartOption.START_IN_FOREGROUND) {
    this.needSendData = needSendData;
    this.startOption = startOption;
  }

  public toLike(): ConnectOptionsLike {
    return {
      needSendData: this.needSendData,
      startOption: this.startOption
    };
  }

  public equals(other: ConnectOptionsModel): boolean {
    return this.needSendData === other.needSendData && this.startOption === other.startOption;
  }

  public clone(): ConnectOptionsModel {
    return new ConnectOptionsModel(this.needSendData, this.startOption);
  }

  public describe(): string {
    return `ConnectOptions(needSendData=${this.needSendData}, startOption=${this.startOption})`;
  }
}

/**
 * 构造默认连接选项。
 * @param needSendData 是否需要收发数据
 * @returns 连接选项模型
 */
export function buildConnectOptions(needSendData: boolean): ConnectOptionsModel {
  return new ConnectOptionsModel(needSendData);
}

// ============================== Mock 设备管理器 ==============================

/**
 * 设备管理器 Mock：对应 distributedDeviceManager 的可用设备列表能力。
 * 通过注入设备列表模拟单机、双机、多机与空列表场景。
 */
export class MockDeviceManager {
  private devices: DeviceInfoLike[] = [];
  private created: boolean = false;
  private queryCount: number = 0;

  constructor(deviceCount: number) {
    for (let index = 0; index < deviceCount; index++) {
      this.devices.push({
        deviceId: `device_${index}`,
        networkId: `network_${index}`,
        deviceName: `deviceName_${index}`,
        deviceType: index === 0 ? 'phone' : 'tablet'
      });
    }
  }

  /** 模拟 createDeviceManager 调用 */
  public createDeviceManager(bundleName: string): boolean {
    this.created = bundleName === COLLAB_BUNDLE_NAME;
    return this.created;
  }

  /** 模拟 getAvailableDeviceListSync 调用 */
  public getAvailableDeviceListSync(): DeviceInfoLike[] {
    this.queryCount++;
    return this.devices.slice(0);
  }

  /** 获取第一个可用设备的 networkId，与 Index.ets 的取用逻辑一致 */
  public getFirstNetworkId(): string {
    const list: DeviceInfoLike[] = this.getAvailableDeviceListSync();
    if (list.length === 0) {
      return '';
    }
    return list[0].networkId;
  }

  public isCreated(): boolean {
    return this.created;
  }

  public getQueryCount(): number {
    return this.queryCount;
  }

  public addDevice(device: DeviceInfoLike): void {
    this.devices.push(device);
  }

  public removeAllDevices(): void {
    this.devices = [];
  }

  public size(): number {
    return this.devices.length;
  }
}

// ============================== 会话 ID 生成器 ==============================

/**
 * 会话 ID 生成器：模拟 abilityConnectionManager 返回的会话 ID 序列。
 */
export class SessionIdGenerator {
  private prefix: string;
  private sequence: number = 0;

  constructor(prefix: string = 'session') {
    this.prefix = prefix;
  }

  public generate(): string {
    const id: string = `${this.prefix}_${this.sequence}`;
    this.sequence++;
    return id;
  }

  public generateBatch(count: number): string[] {
    const ids: string[] = [];
    for (let index = 0; index < count; index++) {
      ids.push(this.generate());
    }
    return ids;
  }

  public getNextSequence(): number {
    return this.sequence;
  }

  public reset(): void {
    this.sequence = 0;
  }
}

// ============================== Mock 协作会话 ==============================

/**
 * 协作会话 Mock：与 abilityConnectionManager 会话的语义保持一致。
 * 会话只有在 CONNECTED 状态下才允许发送消息与数据，销毁后不可恢复。
 */
export class MockCollabSession {
  public sessionId: number;
  public sessionName: string;
  public peerInfo: PeerInfoModel;
  public options: ConnectOptionsModel;
  private state: SessionState = SessionState.CREATED;
  private accepted: boolean = false;
  private messages: string[] = [];
  private dataChunks: ArrayBuffer[] = [];
  private errorCount: number = 0;
  private lastError: string = '';

  constructor(sessionId: number, sessionName: string, peerInfo: PeerInfoModel, options: ConnectOptionsModel) {
    this.sessionId = sessionId;
    this.sessionName = sessionName;
    this.peerInfo = peerInfo;
    this.options = options;
  }

  public getState(): SessionState {
    return this.state;
  }

  public isConnected(): boolean {
    return this.state === SessionState.CONNECTED;
  }

  public isDestroyed(): boolean {
    return this.state === SessionState.DESTROYED;
  }

  public isAccepted(): boolean {
    return this.accepted;
  }

  /** 接受对端连接请求 */
  public acceptConnect(token: string): boolean {
    if (this.state === SessionState.DESTROYED) {
      this.recordError('accept after destroy');
      return false;
    }
    if (token.length === 0) {
      this.recordError('empty token');
      return false;
    }
    this.accepted = true;
    this.state = SessionState.CONNECTED;
    return true;
  }

  /** 发起连接 */
  public connect(): boolean {
    if (this.state !== SessionState.CREATED && this.state !== SessionState.DISCONNECTED) {
      this.recordError(`connect in state ${this.state}`);
      return false;
    }
    if (!this.peerInfo.isComplete()) {
      this.state = SessionState.FAILED;
      this.recordError('peer info incomplete');
      return false;
    }
    this.state = SessionState.CONNECTED;
    return true;
  }

  /** 断开连接 */
  public disconnect(): boolean {
    if (this.state !== SessionState.CONNECTED) {
      this.recordError(`disconnect in state ${this.state}`);
      return false;
    }
    this.state = SessionState.DISCONNECTED;
    return true;
  }

  /** 销毁会话 */
  public destroy(): boolean {
    if (this.state === SessionState.DESTROYED) {
      this.recordError('destroy twice');
      return false;
    }
    this.state = SessionState.DESTROYED;
    this.messages = [];
    this.dataChunks = [];
    return true;
  }

  /** 发送文本消息：仅连接态允许 */
  public sendMessage(message: string): boolean {
    if (this.state !== SessionState.CONNECTED) {
      this.recordError(`sendMessage in state ${this.state}`);
      return false;
    }
    if (message.length === 0) {
      this.recordError('empty message');
      return false;
    }
    this.messages.push(message);
    return true;
  }

  /** 发送二进制数据：需要会话选项开启 needSendData */
  public sendData(buffer: ArrayBuffer): boolean {
    if (this.state !== SessionState.CONNECTED) {
      this.recordError(`sendData in state ${this.state}`);
      return false;
    }
    if (!this.options.needSendData) {
      this.recordError('sendData disabled by options');
      return false;
    }
    if (buffer.byteLength === 0) {
      this.recordError('empty data');
      return false;
    }
    this.dataChunks.push(buffer);
    return true;
  }

  /** 模拟收到消息 */
  public receiveMessage(message: string): void {
    this.messages.push(message);
  }

  /** 模拟收到数据 */
  public receiveData(buffer: ArrayBuffer): void {
    this.dataChunks.push(buffer);
  }

  public getMessages(): string[] {
    return this.messages.slice(0);
  }

  public getDataChunks(): ArrayBuffer[] {
    return this.dataChunks.slice(0);
  }

  public getMessageCount(): number {
    return this.messages.length;
  }

  public getDataCount(): number {
    return this.dataChunks.length;
  }

  public getErrorCount(): number {
    return this.errorCount;
  }

  public getLastError(): string {
    return this.lastError;
  }

  public recordError(reason: string): void {
    this.errorCount++;
    this.lastError = reason;
  }

  /** 获取会话快照 */
  public snapshot(): SessionSnapshot {
    return {
      sessionId: this.sessionId,
      sessionName: this.sessionName,
      state: this.state,
      peerInfo: this.peerInfo.toLike(),
      options: this.options.toLike(),
      messageCount: this.messages.length,
      dataCount: this.dataChunks.length,
      accepted: this.accepted,
      errorCount: this.errorCount
    };
  }

  /** 恢复接收数据内容，便于断言编解码往返一致 */
  public receivedText(index: number): string {
    if (index < 0 || index >= this.dataChunks.length) {
      return '';
    }
    return decodeUtf8(this.dataChunks[index]);
  }
}

// ============================== Mock 协作桥接管理器 ==============================

/**
 * 协作桥接管理器 Mock：对应 abilityConnectionManager 的会话管理能力。
 * 支持故障注入（创建失败、连接失败、发送失败），用于异常与恢复类测试。
 */
export class MockCollabBridge {
  private sessions: Map<number, MockCollabSession> = new Map<number, MockCollabSession>();
  private nextSessionId: number = 0;
  private events: CollabEventRecord[] = [];
  public failCreate: boolean = false;
  public failConnect: boolean = false;
  public failSendMessage: boolean = false;
  public failSendData: boolean = false;

  /**
   * 创建会话。
   * @param sessionName 会话名称
   * @param peerInfo 对端信息
   * @param options 连接选项
   * @returns 会话 ID，失败返回 -1
   */
  public createAbilityConnectionSession(sessionName: string, peerInfo: PeerInfoModel,
    options: ConnectOptionsModel): number {
    if (this.failCreate) {
      this.recordEvent(CollabEventType.CREATE, INVALID_SESSION_ID, 'create failed by injection');
      return INVALID_SESSION_ID;
    }
    if (sessionName.length === 0 || !peerInfo.isComplete()) {
      this.recordEvent(CollabEventType.CREATE, INVALID_SESSION_ID, 'invalid arguments');
      return INVALID_SESSION_ID;
    }
    const sessionId: number = this.nextSessionId;
    this.nextSessionId++;
    this.sessions.set(sessionId, new MockCollabSession(sessionId, sessionName, peerInfo, options));
    this.recordEvent(CollabEventType.CREATE, sessionId, sessionName);
    return sessionId;
  }

  public getSession(sessionId: number): MockCollabSession | null {
    const session: MockCollabSession | undefined = this.sessions.get(sessionId);
    return session === undefined ? null : session;
  }

  public destroyAbilityConnectionSession(sessionId: number): boolean {
    const session: MockCollabSession | null = this.getSession(sessionId);
    if (session === null) {
      return false;
    }
    const result: boolean = session.destroy();
    if (result) {
      this.recordEvent(CollabEventType.DESTROY, sessionId, 'destroyed');
    }
    return result;
  }

  public connect(sessionId: number): boolean {
    const session: MockCollabSession | null = this.getSession(sessionId);
    if (session === null || this.failConnect) {
      this.recordEvent(CollabEventType.ERROR, sessionId, 'connect failed');
      return false;
    }
    const result: boolean = session.connect();
    this.recordEvent(result ? CollabEventType.CONNECT : CollabEventType.ERROR, sessionId, 'connect');
    return result;
  }

  public disconnect(sessionId: number): boolean {
    const session: MockCollabSession | null = this.getSession(sessionId);
    if (session === null) {
      return false;
    }
    const result: boolean = session.disconnect();
    this.recordEvent(CollabEventType.DISCONNECT, sessionId, 'disconnect');
    return result;
  }

  public acceptConnect(sessionId: number, collabToken: string): boolean {
    const session: MockCollabSession | null = this.getSession(sessionId);
    if (session === null) {
      return false;
    }
    const result: boolean = session.acceptConnect(collabToken);
    this.recordEvent(CollabEventType.ACCEPT, sessionId, collabToken);
    return result;
  }

  public sendMessage(sessionId: number, message: string): boolean {
    const session: MockCollabSession | null = this.getSession(sessionId);
    if (session === null || this.failSendMessage) {
      this.recordEvent(CollabEventType.ERROR, sessionId, 'sendMessage failed');
      return false;
    }
    const result: boolean = session.sendMessage(message);
    if (result) {
      this.recordEvent(CollabEventType.SEND_MESSAGE, sessionId, message);
    }
    return result;
  }

  public sendData(sessionId: number, buffer: ArrayBuffer): boolean {
    const session: MockCollabSession | null = this.getSession(sessionId);
    if (session === null || this.failSendData) {
      this.recordEvent(CollabEventType.ERROR, sessionId, 'sendData failed');
      return false;
    }
    const result: boolean = session.sendData(buffer);
    if (result) {
      this.recordEvent(CollabEventType.SEND_DATA, sessionId, `bytes=${buffer.byteLength}`);
    }
    return result;
  }

  public getSessionCount(): number {
    return this.sessions.size;
  }

  public getAllSessionIds(): number[] {
    const ids: number[] = [];
    this.sessions.forEach((session: MockCollabSession) => {
      ids.push(session.sessionId);
    });
    return ids;
  }

  public getEvents(): CollabEventRecord[] {
    return this.events.slice(0);
  }

  public getEventCount(type: CollabEventType): number {
    let count: number = 0;
    for (const event of this.events) {
      if (event.type === type) {
        count++;
      }
    }
    return count;
  }

  public clearEvents(): void {
    this.events = [];
  }

  public reset(): void {
    this.sessions = new Map<number, MockCollabSession>();
    this.nextSessionId = 0;
    this.events = [];
    this.failCreate = false;
    this.failConnect = false;
    this.failSendMessage = false;
    this.failSendData = false;
  }

  private recordEvent(type: CollabEventType, sessionId: number, detail: string): void {
    this.events.push({
      type: type,
      sessionId: sessionId,
      detail: detail,
      timestamp: Date.now()
    });
  }
}

// ============================== 事件记录器 ==============================

/**
 * 协作事件记录器：配合 MockCollabBridge 断点事件顺序。
 */
export class CollabEventRecorder {
  private records: CollabEventRecord[] = [];

  public record(type: CollabEventType, sessionId: number, detail: string): void {
    this.records.push({
      type: type,
      sessionId: sessionId,
      detail: detail,
      timestamp: Date.now()
    });
  }

  public size(): number {
    return this.records.length;
  }

  public all(): CollabEventRecord[] {
    return this.records.slice(0);
  }

  public countOf(type: CollabEventType): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.type === type) {
        count++;
      }
    }
    return count;
  }

  public firstOf(type: CollabEventType): CollabEventRecord | null {
    for (const record of this.records) {
      if (record.type === type) {
        return record;
      }
    }
    return null;
  }

  public lastOf(type: CollabEventType): CollabEventRecord | null {
    let result: CollabEventRecord | null = null;
    for (const record of this.records) {
      if (record.type === type) {
        result = record;
      }
    }
    return result;
  }

  public sequenceOfTypes(): CollabEventType[] {
    const sequence: CollabEventType[] = [];
    for (const record of this.records) {
      sequence.push(record.type);
    }
    return sequence;
  }

  public clear(): void {
    this.records = [];
  }
}

// ============================== AppStorage 状态模型 ==============================

/**
 * AppStorage 状态模型 Mock：复刻 Index.ets 与 EntryAbility.ets 通过 AppStorage 共享的四个键。
 * 支持 @Watch 语义：键值变化时同步触发监听回调。
 */
export class AppStorageModel {
  private values: Map<string, Object> = new Map<string, Object>();
  private watchers: Map<string, string[]> = new Map<string, string[]>();
  private watchInvokeCount: number = 0;
  private lastWatchedKey: string = '';

  constructor() {
    this.values.set(STORAGE_KEY_SESSION_ID, INVALID_SESSION_ID);
    this.values.set(STORAGE_KEY_IS_CONNECTED, false);
    this.values.set(STORAGE_KEY_RECEIVE_MESSAGE, '');
    this.values.set(STORAGE_KEY_RECEIVE_WATCH_MESSAGE, '');
  }

  /**
   * 写入键值并触发监听。
   * @param key 键
   * @param value 值
   * @returns 值发生变化返回 true
   */
  public setOrCreate(key: string, value: Object): boolean {
    const previous: Object | undefined = this.values.get(key);
    this.values.set(key, value);
    const changed: boolean = previous === undefined || previous !== value;
    if (changed) {
      this.triggerWatchers(key);
    }
    return changed;
  }

  /**
   * 读取键值。
   * @param key 键
   * @returns 值，不存在返回 undefined
   */
  public get(key: string): Object | undefined {
    return this.values.get(key);
  }

  public has(key: string): boolean {
    return this.values.has(key);
  }

  public remove(key: string): boolean {
    return this.values.delete(key);
  }

  /**
   * 注册监听（模拟 @Watch 回调绑定）。
   * @param key 键
   * @param watcherName 监听函数名
   */
  public addWatcher(key: string, watcherName: string): void {
    const existing: string[] | undefined = this.watchers.get(key);
    if (existing === undefined) {
      this.watchers.set(key, [watcherName]);
      return;
    }
    existing.push(watcherName);
  }

  public getWatchers(key: string): string[] {
    const existing: string[] | undefined = this.watchers.get(key);
    return existing === undefined ? [] : existing.slice(0);
  }

  public getWatchInvokeCount(): number {
    return this.watchInvokeCount;
  }

  public getLastWatchedKey(): string {
    return this.lastWatchedKey;
  }

  public getSessionId(): number {
    const value: Object | undefined = this.values.get(STORAGE_KEY_SESSION_ID);
    return typeof value === 'number' ? value as number : INVALID_SESSION_ID;
  }

  public isConnected(): boolean {
    const value: Object | undefined = this.values.get(STORAGE_KEY_IS_CONNECTED);
    return typeof value === 'boolean' ? value as boolean : false;
  }

  public getReceiveMessage(): string {
    const value: Object | undefined = this.values.get(STORAGE_KEY_RECEIVE_MESSAGE);
    return typeof value === 'string' ? value as string : '';
  }

  public getReceiveWatchMessage(): string {
    const value: Object | undefined = this.values.get(STORAGE_KEY_RECEIVE_WATCH_MESSAGE);
    return typeof value === 'string' ? value as string : '';
  }

  public clearAll(): void {
    this.values.clear();
    this.watchers.clear();
    this.watchInvokeCount = 0;
    this.lastWatchedKey = '';
  }

  private triggerWatchers(key: string): void {
    const names: string[] | undefined = this.watchers.get(key);
    if (names === undefined) {
      return;
    }
    for (const name of names) {
      this.watchInvokeCount++;
      this.lastWatchedKey = key;
      hilog.info(0x0000, TAG, '%{public}s', `AppStorageModel watch ${name} on ${key}`);
    }
  }
}

// ============================== 日志采集器 ==============================

/**
 * 测试日志采集器：统一通过 hilog 输出，并保留内存副本供日志类用例断言。
 */
export class CollabTestLogger {
  private static instance: CollabTestLogger | null = null;
  private records: LogRecord[] = [];

  public static getInstance(): CollabTestLogger {
    if (CollabTestLogger.instance === null) {
      CollabTestLogger.instance = new CollabTestLogger();
    }
    return CollabTestLogger.instance as CollabTestLogger;
  }

  public info(message: string): void {
    hilog.info(0x0000, TAG, '%{public}s', message);
    this.append('info', message);
  }

  public warn(message: string): void {
    hilog.warn(0x0000, TAG, '%{public}s', message);
    this.append('warn', message);
  }

  public error(message: string): void {
    hilog.error(0x0000, TAG, '%{public}s', message);
    this.append('error', message);
  }

  public debug(message: string): void {
    hilog.debug(0x0000, TAG, '%{public}s', message);
    this.append('debug', message);
  }

  public all(): LogRecord[] {
    return this.records.slice(0);
  }

  public size(): number {
    return this.records.length;
  }

  public countOf(level: string): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.level === level) {
        count++;
      }
    }
    return count;
  }

  public contains(messagePart: string): boolean {
    for (const record of this.records) {
      if (record.message.indexOf(messagePart) >= 0) {
        return true;
      }
    }
    return false;
  }

  public last(): LogRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  public clear(): void {
    this.records = [];
  }

  private append(level: string, message: string): void {
    this.records.push({
      level: level,
      tag: TAG,
      message: message,
      timestamp: Date.now()
    });
    if (this.records.length > 4096) {
      this.records.splice(0, 1024);
    }
  }
}

// ============================== 指标采集器 ==============================

/**
 * 指标采集器：记录操作次数、成功失败次数与耗时分布，用于性能稳定性断言。
 */
export class CollabMetricsCollector {
  private metrics: CollabMetrics = {
    operationCount: 0,
    successCount: 0,
    failureCount: 0,
    totalCostMs: 0,
    maxCostMs: 0,
    minCostMs: -1
  };

  /**
   * 记录一次操作。
   * @param success 是否成功
   * @param costMs 耗时
   */
  public record(success: boolean, costMs: number): void {
    this.metrics.operationCount++;
    if (success) {
      this.metrics.successCount++;
    } else {
      this.metrics.failureCount++;
    }
    this.metrics.totalCostMs += costMs;
    if (costMs > this.metrics.maxCostMs) {
      this.metrics.maxCostMs = costMs;
    }
    if (this.metrics.minCostMs < 0 || costMs < this.metrics.minCostMs) {
      this.metrics.minCostMs = costMs;
    }
  }

  public snapshot(): CollabMetrics {
    return {
      operationCount: this.metrics.operationCount,
      successCount: this.metrics.successCount,
      failureCount: this.metrics.failureCount,
      totalCostMs: this.metrics.totalCostMs,
      maxCostMs: this.metrics.maxCostMs,
      minCostMs: this.metrics.minCostMs
    };
  }

  public averageCostMs(): number {
    if (this.metrics.operationCount === 0) {
      return 0;
    }
    return this.metrics.totalCostMs / this.metrics.operationCount;
  }

  public successRate(): number {
    if (this.metrics.operationCount === 0) {
      return 0;
    }
    return this.metrics.successCount / this.metrics.operationCount;
  }

  public reset(): void {
    this.metrics = {
      operationCount: 0,
      successCount: 0,
      failureCount: 0,
      totalCostMs: 0,
      maxCostMs: 0,
      minCostMs: -1
    };
  }
}

// ============================== 通用工具函数 ==============================

/**
 * 构造一组测试用设备网络 ID。
 * @param count 数量
 * @returns 网络 ID 列表
 */
export function mockNetworkIds(count: number): string[] {
  const ids: string[] = [];
  for (let index = 0; index < count; index++) {
    ids.push(`network_${index}`);
  }
  return ids;
}

/**
 * 构造固定长度的测试负载文本。
 * @param length 字符长度
 * @returns 负载文本
 */
export function mockPayload(length: number): string {
  let text: string = '';
  while (text.length < length) {
    text += 'collab';
  }
  return text.substring(0, length);
}

/**
 * 判断文本是否为合法的协作令牌（示例中协作令牌不允许为空）。
 * @param token 令牌
 * @returns 合法返回 true
 */
export function isValidCollabToken(token: string): boolean {
  return token.length > 0;
}

/**
 * 模拟权限申请结果：返回请求的权限条目列表。
 * @param grantedCount 已授权数量
 * @returns 权限条目列表
 */
export function buildPermissionItems(grantedCount: number): PermissionItem[] {
  const items: PermissionItem[] = [];
  for (let index = 0; index < REQUESTED_PERMISSIONS.length; index++) {
    items.push({
      name: REQUESTED_PERMISSIONS[index],
      granted: index < grantedCount,
      sensitive: REQUESTED_PERMISSIONS[index] !== 'ohos.permission.DISTRIBUTED_DATASYNC'
    });
  }
  return items;
}

/**
 * 判定会话 ID 是否合法。
 * @param sessionId 会话 ID
 * @returns 合法返回 true
 */
export function isValidSessionId(sessionId: number): boolean {
  return sessionId >= 0;
}

/**
 * 将能力连接回调中的消息字段归一化为字符串，避免 undefined 参与断言。
 * @param message 消息字段
 * @returns 归一化后的消息
 */
export function normalizeCallbackMessage(message: string | undefined): string {
  if (message === undefined || message === null) {
    return '';
  }
  return message;
}

/**
 * 安全执行同步动作并返回是否抛出异常。
 * @param action 同步动作
 * @returns 未抛出异常返回 true
 */
export function safeInvoke(action: () => void): boolean {
  try {
    action();
    return true;
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', `safeInvoke caught: ${error}`);
    return false;
  }
}

/**
 * 安全执行异步动作并返回结果对象。
 * @param action 异步动作
 * @returns 执行成功标志与错误信息
 */
export async function safeInvokeAsync(action: () => Promise<void>): Promise<boolean> {
  try {
    await action();
    return true;
  } catch (error) {
    hilog.error(0x0000, TAG, '%{public}s', `safeInvokeAsync caught: ${error}`);
    return false;
  }
}
