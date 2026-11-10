/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from '../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 事件类型枚举。
 * 定义所有通过 hiAppEvent 上报的事件类型。
 */
export enum EventTypeName {
  /** 渠道号获取事件 */
  CHANNEL_FETCHED = 'channelFetched',
  /** 免打扰状态变更事件 */
  DND_STATE_CHANGED = 'dndStateChanged',
  /** 通知允许状态变更事件 */
  NOTIFY_STATE_CHANGED = 'notifyStateChanged',
  /** 设置页面打开事件 */
  SETTINGS_PAGE_OPENED = 'settingsPageOpened',
  /** 双击查询事件 */
  DOUBLE_CLICK_QUERIED = 'doubleClickQueried',
  /** 错误事件 */
  ERROR_OCCURRED = 'errorOccurred',
  /** 服务初始化事件 */
  SERVICE_INITIALIZED = 'serviceInitialized'
}

/**
 * 事件过滤器接口。
 * 用于按事件类型和时间范围过滤事件。
 */
export interface EventFilter {
  /** 要过滤的事件类型列表 */
  eventTypes?: EventTypeName[];
  /** 起始时间戳 */
  startTime?: number;
  /** 结束时间戳 */
  endTime?: number;
  /** 最大返回数量 */
  maxCount?: number;
}

/**
 * 事件统计信息接口。
 * 用于汇总事件上报的统计结果。
 */
export interface EventStatistics {
  /** 总事件数 */
  totalCount: number;
  /** 按类型分组的事件计数 */
  countByType: Map<string, number>;
  /** 最早事件时间 */
  earliestTime: number;
  /** 最近事件时间 */
  latestTime: number;
}

/**
 * 事件监听器接口。
 * 用于接收事件上报通知。
 */
export interface EventListener {
  /** 事件上报时回调 */
  onEvent(eventName: string, eventData: Record<string, Object>): void;
}

/**
 * 事件历史记录接口。
 * 用于存储单条事件记录。
 */
export interface EventHistoryRecord {
  /** 事件名称 */
  name: string;
  /** 事件数据 */
  data: Record<string, Object>;
  /** 事件时间戳 */
  time: number;
}

/**
 * 事件服务。
 * 封装 hiAppEvent 的事件上报能力，
 * 提供事件注册、上报、过滤和统计功能。
 */
export class EventService {
  /** 事件监听器列表 */
  private listeners: EventListener[] = [];
  /** 事件历史记录 */
  private eventHistory: EventHistoryRecord[] = [];
  /** 服务是否已初始化 */
  private isInitialized: boolean = false;
  /** 最大历史记录数 */
  private maxHistorySize: number = SystemConfigConstants.MAX_LOG_ENTRIES;

  /**
   * 初始化事件服务。
   * 初始化事件历史记录。
   * @returns {boolean} 初始化是否成功
   */
  initialize(): boolean {
    hilog.info(DOMAIN, TAG, 'EventService initialize: starting initialization');

    try {
      // hiAppEvent 在 Stage 模型下直接使用，无需注册 watcher
      hilog.info(DOMAIN, TAG, 'EventService initialize: event service initialized');
      this.isInitialized = true;
      this.eventHistory = [];
      hilog.info(DOMAIN, TAG, 'EventService initialize: initialization complete');
      return true;
    } catch (err) {
      const errObj = err as Record<string, Object>;
      const errMsg: string = (errObj['message'] as string) ?? 'Unknown error';
      hilog.error(DOMAIN, TAG, 'EventService initialize: failed, error=%{public}s', errMsg);
      return false;
    }
  }

  // ========================================
  // 事件上报方法
  // ========================================

  /**
   * 上报渠道号获取事件。
   * @param {string} channelId - 获取到的渠道号
   * @param {boolean} success - 是否成功
   */
  reportChannelFetched(channelId: string, success: boolean): void {
    hilog.info(DOMAIN, TAG, 'EventService reportChannelFetched: channelId=%{public}s, success=%{public}s',
      channelId, success.toString());
    this.emitEvent(EventTypeName.CHANNEL_FETCHED, {
      'channelId': channelId,
      'success': success,
      'timestamp': Date.now()
    });
  }

  /**
   * 上报免打扰状态变更事件。
   * @param {boolean} dndEnabled - 免打扰是否启用
   * @param {boolean} notifyAllowed - 通知是否允许
   */
  reportDndStateChanged(dndEnabled: boolean, notifyAllowed: boolean): void {
    hilog.info(DOMAIN, TAG, 'EventService reportDndStateChanged: dnd=%{public}s, notify=%{public}s',
      dndEnabled.toString(), notifyAllowed.toString());
    this.emitEvent(EventTypeName.DND_STATE_CHANGED, {
      'dndEnabled': dndEnabled,
      'notifyAllowed': notifyAllowed,
      'timestamp': Date.now()
    });
  }

  /**
   * 上报设置页面打开事件。
   * @param {string} pageType - 页面类型（pin/nfc/doubleClick）
   * @param {boolean} success - 是否成功
   */
  reportSettingsPageOpened(pageType: string, success: boolean): void {
    hilog.info(DOMAIN, TAG, 'EventService reportSettingsPageOpened: page=%{public}s, success=%{public}s',
      pageType, success.toString());
    this.emitEvent(EventTypeName.SETTINGS_PAGE_OPENED, {
      'pageType': pageType,
      'success': success,
      'timestamp': Date.now()
    });
  }

  /**
   * 上报双击查询事件。
   * @param {string} result - 查询结果
   */
  reportDoubleClickQueried(result: string): void {
    hilog.info(DOMAIN, TAG, 'EventService reportDoubleClickQueried: result=%{public}s', result);
    this.emitEvent(EventTypeName.DOUBLE_CLICK_QUERIED, {
      'result': result,
      'timestamp': Date.now()
    });
  }

  /**
   * 上报错误事件。
   * @param {string} source - 错误来源
   * @param {string} errorMessage - 错误信息
   * @param {number} errorCode - 错误码
   */
  reportError(source: string, errorMessage: string, errorCode: number): void {
    hilog.error(DOMAIN, TAG, 'EventService reportError: source=%{public}s, error=%{public}s, code=%{public}d',
      source, errorMessage, errorCode);
    this.emitEvent(EventTypeName.ERROR_OCCURRED, {
      'source': source,
      'errorMessage': errorMessage,
      'errorCode': errorCode,
      'timestamp': Date.now()
    });
  }

  /**
   * 上报服务初始化事件。
   * @param {string} serviceName - 服务名称
   */
  reportServiceInitialized(serviceName: string): void {
    hilog.info(DOMAIN, TAG, 'EventService reportServiceInitialized: service=%{public}s', serviceName);
    this.emitEvent(EventTypeName.SERVICE_INITIALIZED, {
      'serviceName': serviceName,
      'timestamp': Date.now()
    });
  }

  // ========================================
  // 事件监听方法
  // ========================================

  /**
   * 添加事件监听器。
   * @param {EventListener} listener - 监听器实例
   */
  addListener(listener: EventListener): void {
    hilog.info(DOMAIN, TAG, 'EventService addListener: adding listener');
    this.listeners.push(listener);
  }

  /**
   * 移除事件监听器。
   * @param {EventListener} listener - 要移除的监听器
   */
  removeListener(listener: EventListener): void {
    hilog.info(DOMAIN, TAG, 'EventService removeListener: removing listener');
    const index: number = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }

  /**
   * 获取事件历史记录。
   * @param {EventFilter} [filter] - 过滤条件
   * @returns {EventHistoryRecord[]} 事件历史
   */
  getEventHistory(filter?: EventFilter): EventHistoryRecord[] {
    hilog.debug(DOMAIN, TAG, 'EventService getEventHistory: historySize=%{public}d', this.eventHistory.length);
    let result = [...this.eventHistory];

    if (filter) {
      if (filter.eventTypes && filter.eventTypes.length > 0) {
        const typeNames: string[] = filter.eventTypes.map(t => t as string);
        result = result.filter(e => typeNames.includes(e.name));
      }
      if (filter.startTime !== undefined) {
        result = result.filter(e => e.time >= filter.startTime!);
      }
      if (filter.endTime !== undefined) {
        result = result.filter(e => e.time <= filter.endTime!);
      }
      if (filter.maxCount !== undefined && filter.maxCount > 0) {
        result = result.slice(-filter.maxCount);
      }
    }
    hilog.debug(DOMAIN, TAG, 'EventService getEventHistory: filteredSize=%{public}d', result.length);
    return result;
  }

  /**
   * 获取事件统计信息。
   * @returns {EventStatistics} 统计结果
   */
  getStatistics(): EventStatistics {
    hilog.info(DOMAIN, TAG, 'EventService getStatistics: calculating');
    const countByType: Map<string, number> = new Map<string, number>();
    let earliestTime: number = Number.MAX_VALUE;
    let latestTime: number = 0;

    for (const event of this.eventHistory) {
      const count: number = countByType.get(event.name) ?? 0;
      countByType.set(event.name, count + 1);
      if (event.time < earliestTime) {
        earliestTime = event.time;
      }
      if (event.time > latestTime) {
        latestTime = event.time;
      }
    }

    if (this.eventHistory.length === 0) {
      earliestTime = 0;
    }

    const stats: EventStatistics = {
      totalCount: this.eventHistory.length,
      countByType: countByType,
      earliestTime: earliestTime,
      latestTime: latestTime
    };
    hilog.info(DOMAIN, TAG, 'EventService getStatistics: total=%{public}d, types=%{public}d',
      stats.totalCount, countByType.size);
    return stats;
  }

  // ========================================
  // 内部方法
  // ========================================

  /**
   * 发送事件到所有监听器并记录历史。
   * @param {EventTypeName} eventName - 事件名称
   * @param {Record<string, Object>} eventData - 事件数据
   */
  private emitEvent(eventName: EventTypeName, eventData: Record<string, Object>): void {
    hilog.debug(DOMAIN, TAG, 'EventService emitEvent: name=%{public}s', eventName);

    const record: EventHistoryRecord = {
      name: eventName as string,
      data: eventData,
      time: Date.now()
    };
    this.eventHistory.push(record);

    if (this.eventHistory.length > this.maxHistorySize) {
      hilog.debug(DOMAIN, TAG, 'EventService emitEvent: trimming history, size=%{public}d',
        this.eventHistory.length);
      this.eventHistory = this.eventHistory.slice(-this.maxHistorySize);
    }

    for (const listener of this.listeners) {
      try {
        listener.onEvent(eventName as string, eventData);
      } catch (listenerErr) {
        hilog.error(DOMAIN, TAG, 'EventService emitEvent: listener error');
      }
    }
  }

  /**
   * 判断服务是否已初始化。
   * @returns {boolean} 是否已初始化
   */
  isServiceInitialized(): boolean {
    return this.isInitialized;
  }

  /**
   * 清空事件历史。
   */
  clearHistory(): void {
    hilog.info(DOMAIN, TAG, 'EventService clearHistory: clearing %{public}d events', this.eventHistory.length);
    this.eventHistory = [];
  }

  /**
   * 销毁事件服务。
   * 移除所有监听器并清空历史。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'EventService destroy: releasing resources');
    this.listeners = [];
    this.eventHistory = [];
    this.isInitialized = false;
    hilog.info(DOMAIN, TAG, 'EventService destroy: resources released');
  }
}
