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
 * Trace name constants.
 * Defines the name identifiers of all hiTraceMeter trace points.
 */
export class TraceName {
  /** Custom config - get channel id */
  public static readonly CUSTOM_CONFIG_GET_CHANNEL: string = 'CustomConfig_getChannelId';
  /** Intelligent scene - query DND state */
  public static readonly SCENE_QUERY_DND: string = 'IntelligentScene_queryDnd';
  /** Intelligent scene - query notify-allowed state */
  public static readonly SCENE_QUERY_NOTIFY: string = 'IntelligentScene_queryNotify';
  /** Intelligent scene - query all states */
  public static readonly SCENE_QUERY_ALL: string = 'IntelligentScene_queryAll';
  /** Settings lite - open PIN setting */
  public static readonly SETTINGS_OPEN_PIN: string = 'SettingsLite_openPin';
  /** Settings lite - open NFC setting */
  public static readonly SETTINGS_OPEN_NFC: string = 'SettingsLite_openNfc';
  /** Settings lite - open double-click setting */
  public static readonly SETTINGS_OPEN_DOUBLE_CLICK: string = 'SettingsLite_openDoubleClick';
  /** Settings lite - query double-click app */
  public static readonly SETTINGS_QUERY_DOUBLE_CLICK: string = 'SettingsLite_queryDoubleClick';
  /** Service initialization */
  public static readonly SERVICE_INIT: string = 'Service_initialize';
  /** Page load */
  public static readonly PAGE_LOAD: string = 'Page_load';
}

/**
 * Active trace task record.
 * Stores the full name and taskId used by hiTraceMeter instrumentation,
 * ensuring strict startTrace / finishTrace pairing.
 */
interface TraceTask {
  /** Base trace name from the business side */
  traceName: string;
  /** Full name actually used for instrumentation (including processStage) */
  fullTraceName: string;
  /** hiTraceMeter taskId; must match between start and finish */
  taskId: number;
}

/**
 * Trace service.
 * Encapsulates the performance tracing capability of hiTraceMeter,
 * automatically instrumenting around key operations with nested tracing and taskId pairing.
 */
export class TraceService {
  /** Current active trace count */
  private activeTraceCount: number = 0;
  /** Whether tracing is enabled */
  private isEnabled: boolean = true;
  /** Next available taskId (hiTraceMeter requires a positive integer) */
  private nextTaskId: number = 1;
  /** List of active trace tasks */
  private activeTasks: TraceTask[] = [];

  /**
   * Initializes the trace service.
   * @param {boolean} enabled - Whether tracing is enabled
   */
  initialize(enabled: boolean = true): void {
    hilog.info(DOMAIN, TAG, 'TraceService initialize: enabled=%{public}s', enabled.toString());
    this.isEnabled = enabled;
    this.activeTraceCount = 0;
    this.activeTasks = [];
    this.nextTaskId = 1;
  }

  /**
   * Starts a trace point.
   * Called before an operation begins, paired with finishTrace.
   * @param {string} traceName - Trace name
   * @param {string} [processStage] - Processing stage description
   * @returns {number} taskId of this trace (0 when tracing is disabled)
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
   * Finishes a trace point.
   * Calls hiTraceMeter.finishTrace with the same name and taskId as startTrace.
   * @param {string} traceName - Trace name (the base name passed to startTrace)
   * @param {number} [taskId] - taskId returned by startTrace;
   *   when omitted, finishes the most recent trace with the same name
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
   * Traces around an asynchronous operation.
   * Automatically instruments before and after the Promise to simplify async tracing.
   * @param {string} traceName - Trace name
   * @param {function(): Promise<T>} operation - Asynchronous operation function
   * @returns {Promise<T>} Operation result
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
   * Traces around a synchronous operation.
   * Automatically instruments before and after the function to simplify sync tracing.
   * @param {string} traceName - Trace name
   * @param {function(): T} operation - Synchronous operation function
   * @returns {T} Operation result
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
   * Gets the number of currently active trace points.
   * @returns {number} Active trace count
   */
  getActiveTraceCount(): number {
    hilog.debug(DOMAIN, TAG, 'TraceService getActiveTraceCount: %{public}d', this.activeTraceCount);
    return this.activeTraceCount;
  }

  /**
   * Determines whether the trace service is enabled.
   * @returns {boolean} Whether it is enabled
   */
  isTraceEnabled(): boolean {
    return this.isEnabled;
  }

  /**
   * Enables or disables the trace service.
   * @param {boolean} enabled - Whether to enable
   */
  setEnabled(enabled: boolean): void {
    hilog.info(DOMAIN, TAG, 'TraceService setEnabled: %{public}s', enabled.toString());
    this.isEnabled = enabled;
  }

  /**
   * Resets the trace service state.
   * Closes all active trace points and clears the counter.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'TraceService reset: closing %{public}d active traces',
      this.activeTasks.length);
    this.closeAllActiveTraces();
    this.activeTraceCount = 0;
  }

  /**
   * Destroys the trace service.
   * Ensures all active trace points are closed.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'TraceService destroy: activeCount=%{public}d', this.activeTraceCount);
    this.closeAllActiveTraces();
    this.activeTraceCount = 0;
    this.isEnabled = false;
  }

  /**
   * Closes all active traces to guarantee paired hiTraceMeter instrumentation.
   */
  private closeAllActiveTraces(): void {
    for (const task of this.activeTasks) {
      hiTraceMeter.finishTrace(task.fullTraceName, task.taskId);
    }
    this.activeTasks = [];
  }
}
