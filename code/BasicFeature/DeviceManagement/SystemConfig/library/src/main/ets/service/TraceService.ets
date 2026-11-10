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

import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from '../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 追踪名称常量。
 * 定义所有 hiTraceMeter 追踪点的名称标识。
 */
export class TraceName {
  /** 定制配置 - 获取渠道号 */
  static readonly CUSTOM_CONFIG_GET_CHANNEL: string = 'CustomConfig_getChannelId';
  /** 情景模式 - 查询免打扰状态 */
  static readonly SCENE_QUERY_DND: string = 'IntelligentScene_queryDnd';
  /** 情景模式 - 查询通知允许状态 */
  static readonly SCENE_QUERY_NOTIFY: string = 'IntelligentScene_queryNotify';
  /** 情景模式 - 查询全部状态 */
  static readonly SCENE_QUERY_ALL: string = 'IntelligentScene_queryAll';
  /** 设置信息 - 打开 PIN 设置 */
  static readonly SETTINGS_OPEN_PIN: string = 'SettingsLite_openPin';
  /** 设置信息 - 打开 NFC 设置 */
  static readonly SETTINGS_OPEN_NFC: string = 'SettingsLite_openNfc';
  /** 设置信息 - 打开双击设置 */
  static readonly SETTINGS_OPEN_DOUBLE_CLICK: string = 'SettingsLite_openDoubleClick';
  /** 设置信息 - 查询双击应用 */
  static readonly SETTINGS_QUERY_DOUBLE_CLICK: string = 'SettingsLite_queryDoubleClick';
  /** 服务初始化 */
  static readonly SERVICE_INIT: string = 'Service_initialize';
  /** 页面加载 */
  static readonly PAGE_LOAD: string = 'Page_load';
}

/**
 * 追踪服务。
 * 封装 hiTraceMeter 的性能追踪能力，
 * 在关键操作前后自动打点，支持嵌套追踪和计数标记。
 */
export class TraceService {
  /** 当前活跃的追踪计数 */
  private activeTraceCount: number = 0;
  /** 追踪是否已启用 */
  private isEnabled: boolean = true;

  /**
   * 初始化追踪服务。
   * @param {boolean} enabled - 是否启用追踪
   */
  initialize(enabled: boolean = true): void {
    hilog.info(DOMAIN, TAG, 'TraceService initialize: enabled=%{public}s', enabled.toString());
    this.isEnabled = enabled;
    this.activeTraceCount = 0;
  }

  /**
   * 开始一个同步追踪点。
   * 在操作开始前调用，与 finishTrace 配对使用。
   * @param {string} traceName - 追踪名称
   * @param {string} [processStage] - 处理阶段描述
   */
  startTrace(traceName: string, processStage?: string): void {
    if (!this.isEnabled) {
      hilog.debug(DOMAIN, TAG, 'TraceService startTrace: tracing disabled, skip %{public}s', traceName);
      return;
    }
    const fullTraceName: string = processStage ? `${traceName}_${processStage}` : traceName;
    hilog.info(DOMAIN, TAG, 'TraceService startTrace: name=%{public}s', fullTraceName);
    hiTraceMeter.startTrace(fullTraceName, SystemConfigConstants.TRACE_DOMAIN);
    this.activeTraceCount += 1;
    hilog.debug(DOMAIN, TAG, 'TraceService startTrace: activeCount=%{public}d', this.activeTraceCount);
  }

  /**
   * 结束一个同步追踪点。
   * 在操作完成后调用，与 startTrace 配对使用。
   * @param {string} traceName - 追踪名称
   * @param {number} [count] - 计数值（可选，用于统计操作次数）
   */
  finishTrace(traceName: string, count?: number): void {
    if (!this.isEnabled) {
      hilog.debug(DOMAIN, TAG, 'TraceService finishTrace: tracing disabled, skip %{public}s', traceName);
      return;
    }
    hilog.info(DOMAIN, TAG, 'TraceService finishTrace: name=%{public}s, count=%{public}s',
      traceName, (count ?? 0).toString());
    if (count !== undefined && count > 0) {
      hiTraceMeter.finishTrace(traceName, count);
    } else {
      hiTraceMeter.finishTrace(traceName, 1);
    }
    this.activeTraceCount = Math.max(0, this.activeTraceCount - 1);
    hilog.debug(DOMAIN, TAG, 'TraceService finishTrace: activeCount=%{public}d', this.activeTraceCount);
  }

  /**
   * 在异步操作周围执行追踪。
   * 自动在 Promise 执行前后打点，简化异步追踪的使用。
   * @param {string} traceName - 追踪名称
   * @param {function(): Promise<T>} operation - 异步操作函数
   * @returns {Promise<T>} 操作结果
   */
  async traceAsync<T>(traceName: string, operation: () => Promise<T>): Promise<T> {
    hilog.info(DOMAIN, TAG, 'TraceService traceAsync: wrapping %{public}s', traceName);
    this.startTrace(traceName, 'async');
    try {
      const result: T = await operation();
      hilog.info(DOMAIN, TAG, 'TraceService traceAsync: %{public}s completed successfully', traceName);
      this.finishTrace(traceName);
      return result;
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'TraceService traceAsync: %{public}s failed', traceName);
      this.finishTrace(traceName);
      const error: Error = err instanceof Error ? err : new Error(String(err));
      throw error;
    }
  }

  /**
   * 在同步操作周围执行追踪。
   * 自动在函数执行前后打点，简化同步追踪的使用。
   * @param {string} traceName - 追踪名称
   * @param {function(): T} operation - 同步操作函数
   * @returns {T} 操作结果
   */
  traceSync<T>(traceName: string, operation: () => T): T {
    hilog.info(DOMAIN, TAG, 'TraceService traceSync: wrapping %{public}s', traceName);
    this.startTrace(traceName, 'sync');
    try {
      const result: T = operation();
      hilog.info(DOMAIN, TAG, 'TraceService traceSync: %{public}s completed successfully', traceName);
      this.finishTrace(traceName);
      return result;
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'TraceService traceSync: %{public}s failed', traceName);
      this.finishTrace(traceName);
      const error: Error = err instanceof Error ? err : new Error(String(err));
      throw error;
    }
  }

  /**
   * 获取当前活跃追踪点数量。
   * @returns {number} 活跃追踪计数
   */
  getActiveTraceCount(): number {
    hilog.debug(DOMAIN, TAG, 'TraceService getActiveTraceCount: %{public}d', this.activeTraceCount);
    return this.activeTraceCount;
  }

  /**
   * 判断追踪服务是否已启用。
   * @returns {boolean} 是否启用
   */
  isTraceEnabled(): boolean {
    return this.isEnabled;
  }

  /**
   * 启用或禁用追踪服务。
   * @param {boolean} enabled - 是否启用
   */
  setEnabled(enabled: boolean): void {
    hilog.info(DOMAIN, TAG, 'TraceService setEnabled: %{public}s', enabled.toString());
    this.isEnabled = enabled;
  }

  /**
   * 重置追踪服务状态。
   * 清除所有活跃追踪计数。
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'TraceService reset: clearing active traces');
    this.activeTraceCount = 0;
  }

  /**
   * 销毁追踪服务。
   * 确保所有活跃追踪点都已关闭。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'TraceService destroy: activeCount=%{public}d', this.activeTraceCount);
    this.activeTraceCount = 0;
    this.isEnabled = false;
  }
}
