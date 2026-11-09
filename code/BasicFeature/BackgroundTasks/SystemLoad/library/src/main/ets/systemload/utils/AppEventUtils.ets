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

import { hiAppEvent } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** 日志域ID */
const DOMAIN: number = 0xFF00;
/** 日志标签 */
const TAG: string = 'AppEventUtils';

/**
 * 事件类型枚举
 * 定义hiAppEvent支持的事件类型（数值与hiAppEvent.EventType一致）
 */
export enum EventType {
  /** 故障事件 */
  FAULT = 1,
  /** 统计事件 */
  STATISTIC = 2,
  /** 安全事件 */
  SECURITY = 3,
  /** 行为事件 */
  BEHAVIOR = 4
}

/**
 * 事件域枚举
 * 定义hiAppEvent的事件域
 */
export enum EventDomain {
  /** 系统域 */
  OS = 'os',
  /** 应用域 */
  APP = 'app',
  /** 定制域 */
  CUSTOM = 'custom'
}

/**
 * 事件数据结构体
 * 用于存储和传递事件数据
 */
export class EventData {
  /** 事件名称 */
  public name: string = '';
  /** 事件类型 */
  public type: EventType = EventType.STATISTIC;
  /** 事件域 */
  public domain: EventDomain = EventDomain.APP;
  /** 事件参数 */
  public params: Record<string, string> = {};
  /** 时间戳 */
  public timestamp: number = 0;
}

/**
 * 应用事件工具类
 * 封装hiAppEvent接口，提供事件上报、订阅等功能
 * 
 * @remarks
 * 该类为静态工具类，无需实例化
 * 支持故障、统计、安全、行为等多种事件类型
 * 
 * @example
 * ```typescript
 * // 初始化事件服务
 * await AppEventUtils.init(context);
 * 
 * // 上报统计事件
 * AppEventUtils.reportStatistic('button_click', { buttonId: 'submit' });
 * 
 * // 上报故障事件
 * AppEventUtils.reportFault('network_error', { errorCode: '500' });
 * ```
 */
export class AppEventUtils {
  /** 应用事件名称 */
  private static readonly EVENT_NAME: string = 'app_event';
  /** 是否已初始化 */
  private static isInitialized: boolean = false;
  /** 应用上下文 */
  private static appContext: common.Context | null = null;

  /**
   * 初始化应用事件服务
   * 
   * @param context - 应用上下文
   * @returns Promise<boolean> 初始化成功返回true，失败返回false
   */
  static async init(context: common.Context): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'init() called');
    // 检查是否已初始化
    if (AppEventUtils.isInitialized) {
      hilog.info(DOMAIN, TAG, 'init() already initialized');
      return true;
    }
    try {
      // 保存上下文
      AppEventUtils.appContext = context;
      // 标记为已初始化
      AppEventUtils.isInitialized = true;
      hilog.info(DOMAIN, TAG, 'init() success');
      return true;
    } catch (error) {
      // 记录初始化失败
      hilog.error(DOMAIN, TAG, `init() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 上报事件
   * 将事件数据通过hiAppEvent.write写入
   * 
   * @param eventData - 事件数据
   * @returns Promise<boolean> 上报成功返回true，失败返回false
   */
  static async reportEvent(eventData: EventData): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `reportEvent() called with name: ${eventData.name}`);
    // 检查是否已初始化
    if (!AppEventUtils.isInitialized) {
      hilog.warn(DOMAIN, TAG, 'reportEvent() not initialized');
      return false;
    }
    try {
      // 使用hiAppEvent.write直接写入事件（替代不存在的createWriter）
      const eventInfo: hiAppEvent.AppEventInfo = {
        domain: eventData.domain as string,
        name: eventData.name,
        eventType: eventData.type as number,
        params: eventData.params
      };
      await hiAppEvent.write(eventInfo);
      hilog.info(DOMAIN, TAG, `reportEvent() success for: ${eventData.name}`);
      return true;
    } catch (error) {
      // 记录上报失败
      hilog.error(DOMAIN, TAG, `reportEvent() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 上报故障事件
   * 记录应用运行中的故障信息
   * 
   * @param name - 故障名称
   * @param params - 故障参数
   * @returns Promise<boolean> 上报成功返回true，失败返回false
   */
  static async reportFault(name: string, params?: Record<string, string>): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `reportFault() called with name: ${name}`);
    // 构建事件数据
    const eventData: EventData = new EventData();
    eventData.name = name;
    eventData.type = EventType.FAULT;
    eventData.domain = EventDomain.APP;
    eventData.params = params || {};
    eventData.timestamp = Date.now();
    // 上报事件
    return await AppEventUtils.reportEvent(eventData);
  }

  /**
   * 上报统计事件
   * 记录用户行为统计数据
   * 
   * @param name - 统计事件名称
   * @param params - 统计参数
   * @returns Promise<boolean> 上报成功返回true，失败返回false
   */
  static async reportStatistic(name: string, params?: Record<string, string>): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `reportStatistic() called with name: ${name}`);
    // 构建事件数据
    const eventData: EventData = new EventData();
    eventData.name = name;
    eventData.type = EventType.STATISTIC;
    eventData.domain = EventDomain.APP;
    eventData.params = params || {};
    eventData.timestamp = Date.now();
    // 上报事件
    return await AppEventUtils.reportEvent(eventData);
  }

  /**
   * 上报安全事件
   * 记录安全相关的告警信息
   * 
   * @param name - 安全事件名称
   * @param params - 安全参数
   * @returns Promise<boolean> 上报成功返回true，失败返回false
   */
  static async reportSecurity(name: string, params?: Record<string, string>): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `reportSecurity() called with name: ${name}`);
    // 构建事件数据
    const eventData: EventData = new EventData();
    eventData.name = name;
    eventData.type = EventType.SECURITY;
    eventData.domain = EventDomain.APP;
    eventData.params = params || {};
    eventData.timestamp = Date.now();
    // 上报事件
    return await AppEventUtils.reportEvent(eventData);
  }

  /**
   * 上报行为事件
   * 记录用户操作行为
   * 
   * @param name - 行为事件名称
   * @param params - 行为参数
   * @returns Promise<boolean> 上报成功返回true，失败返回false
   */
  static async reportBehavior(name: string, params?: Record<string, string>): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `reportBehavior() called with name: ${name}`);
    // 构建事件数据
    const eventData: EventData = new EventData();
    eventData.name = name;
    eventData.type = EventType.BEHAVIOR;
    eventData.domain = EventDomain.APP;
    eventData.params = params || {};
    eventData.timestamp = Date.now();
    // 上报事件
    return await AppEventUtils.reportEvent(eventData);
  }

  /**
   * 订阅事件
   * 使用hiAppEvent.addWatcher注册事件监听
   * 
   * @param watcherName - 观察者名称
   * @param domain - 事件域
   * @param callback - 事件回调函数
   * @returns boolean 订阅成功返回true，失败返回false
   */
  static subscribe(
    watcherName: string,
    domain: string,
    callback: (domain: string, appEventGroups: hiAppEvent.AppEventGroup[]) => void
  ): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `subscribe() called with watcher: ${watcherName}`);
    try {
      // 构建过滤器
      const filter: hiAppEvent.AppEventFilter = {
        domain: domain
      };
      // 创建观察者并使用addWatcher注册（替代不存在的createSubscriber/subscribe）
      const watcher: hiAppEvent.Watcher = {
        name: watcherName,
        appEventFilters: [filter],
        onReceive: callback
      };
      hiAppEvent.addWatcher(watcher);
      hilog.info(DOMAIN, TAG, `subscribe() success for watcher: ${watcherName}`);
      return true;
    } catch (error) {
      // 记录订阅失败
      hilog.error(DOMAIN, TAG, `subscribe() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 取消订阅
   * 使用hiAppEvent.removeWatcher注销事件监听
   * 
   * @param watcherName - 要注销的观察者名称
   * @returns boolean 取消成功返回true，失败返回false
   */
  static unsubscribe(watcherName: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `unsubscribe() called for watcher: ${watcherName}`);
    try {
      // 构建观察者对象并使用removeWatcher注销（替代不存在的unsubscribe）
      const watcher: hiAppEvent.Watcher = {
        name: watcherName
      };
      hiAppEvent.removeWatcher(watcher);
      hilog.info(DOMAIN, TAG, `unsubscribe() success for watcher: ${watcherName}`);
      return true;
    } catch (error) {
      // 记录取消失败
      hilog.error(DOMAIN, TAG, `unsubscribe() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 检查是否已初始化
   * 返回事件服务的初始化状态
   * 
   * @returns boolean 已初始化返回true，否则返回false
   */
  static isInit(): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isInit() called');
    return AppEventUtils.isInitialized;
  }

  /**
   * 获取应用上下文
   * 返回保存的应用上下文
   * 
   * @returns common.Context | null 应用上下文或null
   */
  static getContext(): common.Context | null {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getContext() called');
    return AppEventUtils.appContext;
  }
}
