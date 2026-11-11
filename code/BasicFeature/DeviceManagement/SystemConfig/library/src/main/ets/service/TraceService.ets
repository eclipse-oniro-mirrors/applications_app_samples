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
  public static readonly CUSTOM_CONFIG_GET_CHANNEL: string = 'CustomConfig_getChannelId';
  /** 情景模式 - 查询免打扰状态 */
  public static readonly SCENE_QUERY_DND: string = 'IntelligentScene_queryDnd';
  /** 情景模式 - 查询通知允许状态 */
  public static readonly SCENE_QUERY_NOTIFY: string = 'IntelligentScene_queryNotify';
  /** 情景模式 - 查询全部状态 */
  public static readonly SCENE_QUERY_ALL: string = 'IntelligentScene_queryAll';
  /** 设置信息 - 打开 PIN 设置 */
  public static readonly SETTINGS_OPEN_PIN: string = 'SettingsLite_openPin';
  /** 设置信息 - 打开 NFC 设置 */
  public static readonly SETTINGS_OPEN_NFC: string = 'SettingsLite_openNfc';
  /** 设置信息 - 打开双击设置 */
  public static readonly SETTINGS_OPEN_DOUBLE_CLICK: string = 'SettingsLite_openDoubleClick';
  /** 设置信息 - 查询双击应用 */
  public static readonly SETTINGS_QUERY_DOUBLE_CLICK: string = 'SettingsLite_queryDoubleClick';
  /** 服务初始化 */
  public static readonly SERVICE_INIT: string = 'Service_initialize';
  /** 页面加载 */
  public static readonly PAGE_LOAD: string = 'Page_load';
}

/**
 * 活动追踪任务记录。
 * 保存 hiTraceMeter 打点时使用的完整名称与 taskId，
 * 保证 startTrace / finishTrace 严格配对。
 */
interface TraceTask {
  /** 业务侧追踪基础名称 */
  traceName: string;
  /** 实际打点使用的完整名称（含 processStage） */
  fullTraceName: string;
  /** hiTraceMeter taskId，start/finish 必须一致 */
  taskId: number;
}

/**
 * 追踪服务。
 * 封装 hiTraceMeter 的性能追踪能力，
 * 在关键操作前后自动打点，支持嵌套追踪和 taskId 配对。
 */
export class TraceService {
  /** 当前活跃的追踪计数 */
  private activeTraceCount: number = 0;
  /** 追踪是否已启用 */
  private isEnabled: boolean = true;
  /** 下一个可用的 taskId（hiTraceMeter 要求正整数） */
  private nextTaskId: number = 1;
  /** 活跃追踪任务列表 */
  private activeTasks: TraceTask[] = [];

  /**
   * 初始化追踪服务。
   * @param {boolean} enabled - 是否启用追踪
   */
  initialize(enabled: boolean = true): void {
    hilog.info(DOMAIN, TAG, 'TraceService initialize: enabled=%{public}s', enabled.toString());
    this.isEnabled = enabled;
    this.activeTraceCount = 0;
    this.activeTasks = [];
    this.nextTaskId = 1;
  }

  /**
   * 开始一个追踪点。
   * 在操作开始前调用，与 finishTrace 配对使用。
   * @param {string} traceName - 追踪名称
   * @param {string} [processStage] - 处理阶段描述
   * @returns {number} 本次追踪的 taskId（未启用时返回 0）
   */
  startTrace(traceName: string, processStage?: string): number {
    if (!this.isEnabled) {
      hilog.debug(DOMAIN, TAG, 'TraceService startTrace: tracing disabled, skip %{public}s', traceName);
      return 0;
    }
    const fullTraceName: string = processStage ? `${traceName}_${processStage}` : traceName;
    const taskId: number = this.nextTaskId;
    hilog.info(DOMAIN, TAG, 'TraceService startTrace: name=%{public}s, taskId=%{public}d',
      fullTraceName, taskId);
    hiTraceMeter.startTrace(fullTraceName, taskId);
    this.nextTaskId += 1;
    const task: TraceTask = {
      traceName: traceName,
      fullTraceName: fullTraceName,
      taskId: taskId
    };
    this.activeTasks.push(task);
    this.activeTraceCount += 1;
    hilog.debug(DOMAIN, TAG, 'TraceService startTrace: activeCount=%{public}d', this.activeTraceCount);
    return taskId;
  }

  /**
   * 结束一个追踪点。
   * 使用与 startTrace 相同的名称和 taskId 调用 hiTraceMeter.finishTrace。
   * @param {string} traceName - 追踪名称（startTrace 的基础名称）
   * @param {number} [taskId] - startTrace 返回的 taskId；
   *   未提供时结束最近一条同名追踪
   */
  finishTrace(traceName: string, taskId?: number): void {
    if (!this.isEnabled) {
      hilog.debug(DOMAIN, TAG, 'TraceService finishTrace: tracing disabled, skip %{public}s', traceName);
      return;
    }
    let index: number = -1;
    if (taskId !== undefined && taskId > 0) {
      for (let i = this.activeTasks.length - 1; i >= 0; i--) {
        if (this.activeTasks[i].taskId === taskId) {
          index = i;
          break;
        }
      }
    } else {
      for (let i = this.activeTasks.length - 1; i >= 0; i--) {
        if (this.activeTasks[i].traceName === traceName) {
          index = i;
          break;
        }
      }
    }
    if (index === -1) {
      hilog.warn(DOMAIN, TAG,
        'TraceService finishTrace: no active trace matched name=%{public}s, taskId=%{public}s',
        traceName, taskId === undefined ? 'latest' : taskId.toString());
      return;
    }
    const task: TraceTask = this.activeTasks[index];
    hilog.info(DOMAIN, TAG, 'TraceService finishTrace: name=%{public}s, taskId=%{public}d',
      task.fullTraceName, task.taskId);
    hiTraceMeter.finishTrace(task.fullTraceName, task.taskId);
    this.activeTasks.splice(index, 1);
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
    const taskId: number = this.startTrace(traceName, 'async');
    try {
      const result: T = await operation();
      hilog.info(DOMAIN, TAG, 'TraceService traceAsync: %{public}s completed successfully', traceName);
      this.finishTrace(traceName, taskId);
      return result;
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'TraceService traceAsync: %{public}s failed', traceName);
      this.finishTrace(traceName, taskId);
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
    const taskId: number = this.startTrace(traceName, 'sync');
    try {
      const result: T = operation();
      hilog.info(DOMAIN, TAG, 'TraceService traceSync: %{public}s completed successfully', traceName);
      this.finishTrace(traceName, taskId);
      return result;
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'TraceService traceSync: %{public}s failed', traceName);
      this.finishTrace(traceName, taskId);
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
   * 结束所有活跃追踪点并清除计数。
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'TraceService reset: closing %{public}d active traces',
      this.activeTasks.length);
    this.closeAllActiveTraces();
    this.activeTraceCount = 0;
  }

  /**
   * 销毁追踪服务。
   * 确保所有活跃追踪点都已关闭。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'TraceService destroy: activeCount=%{public}d', this.activeTraceCount);
    this.closeAllActiveTraces();
    this.activeTraceCount = 0;
    this.isEnabled = false;
  }

  /**
   * 结束全部活动追踪，保证 hiTraceMeter 打点成对关闭。
   */
  private closeAllActiveTraces(): void {
    for (const task of this.activeTasks) {
      hiTraceMeter.finishTrace(task.fullTraceName, task.taskId);
    }
    this.activeTasks = [];
  }
}
