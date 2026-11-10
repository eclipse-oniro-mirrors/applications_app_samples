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
import { SystemConfigConstants } from 'library';
import { IntelligentSceneService } from 'library';
import { TraceService, TraceName } from 'library';
import { EventService } from 'library';
import { DoNotDisturbModel, DoNotDisturbStatus } from 'library';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 情景模式视图模型。
 * 负责管理 IntelligentScenePage 页面的数据和业务逻辑，
 * 协调 IntelligentSceneService、TraceService 和 EventService 的调用。
 */
export class IntelligentSceneViewModel {
  /** 情景模式服务实例 */
  private sceneService: IntelligentSceneService = new IntelligentSceneService();
  /** 追踪服务实例 */
  private traceService: TraceService = new TraceService();
  /** 事件服务实例 */
  private eventService: EventService = new EventService();
  /** 页面操作日志 */
  pageLogs: string[] = [];
  /** 免打扰是否启用 */
  isDndEnabled: boolean = false;
  /** 免打扰时是否允许通知 */
  isNotifyAllowed: boolean = true;
  /** 当前查询状态 */
  currentStatus: DoNotDisturbStatus = DoNotDisturbStatus.IDLE;
  /** 是否正在加载 */
  isLoading: boolean = false;

  /**
   * 初始化视图模型。
   * 创建并初始化所有依赖服务。
   */
  initialize(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel initialize: starting');
    this.traceService.initialize(true);
    this.eventService.initialize();
    this.sceneService.initialize();
    this.addLog('视图模型初始化完成');
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel initialize: complete');
  }

  // ========================================
  // 业务操作方法
  // ========================================

  /**
   * 查询免打扰启用状态。
   * 调用 IntelligentSceneService.isDoNotDisturbEnabled() 异步接口。
   */
  async queryDndState(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryDndState: starting');
    this.isLoading = true;
    this.addLog('正在查询免打扰状态...');

    const enabled: boolean = await this.traceService.traceAsync(
      TraceName.SCENE_QUERY_DND,
      () => this.sceneService.isDoNotDisturbEnabled()
    );

    this.isDndEnabled = enabled;
    const model: DoNotDisturbModel = this.sceneService.getDoNotDisturbModel();
    this.currentStatus = model.status;

    if (model.isReady()) {
      this.addLog(`免打扰状态: ${enabled ? '已启用' : '未启用'}`);
      this.eventService.reportDndStateChanged(enabled, this.isNotifyAllowed);
    } else {
      this.addLog(`查询失败: ${model.errorMessage}`);
    }

    this.isLoading = false;
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryDndState: dnd=%{public}s', enabled.toString());
  }

  /**
   * 查询免打扰时通知允许状态。
   * 调用 IntelligentSceneService.isNotifyAllowedInDoNotDisturb() 异步接口。
   */
  async queryNotifyState(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryNotifyState: starting');
    this.isLoading = true;
    this.addLog('正在查询通知允许状态...');

    const allowed: boolean = await this.traceService.traceAsync(
      TraceName.SCENE_QUERY_NOTIFY,
      () => this.sceneService.isNotifyAllowedInDoNotDisturb()
    );

    this.isNotifyAllowed = allowed;
    const model: DoNotDisturbModel = this.sceneService.getDoNotDisturbModel();
    this.currentStatus = model.status;

    if (model.isReady()) {
      this.addLog(`通知允许状态: ${allowed ? '允许' : '不允许'}`);
      this.eventService.reportDndStateChanged(this.isDndEnabled, allowed);
    } else {
      this.addLog(`查询失败: ${model.errorMessage}`);
    }

    this.isLoading = false;
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryNotifyState: notify=%{public}s', allowed.toString());
  }

  /**
   * 同时查询所有免打扰相关状态。
   * 调用 IntelligentSceneService.queryAllDndStates() 一次性获取。
   */
  async queryAllStates(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryAllStates: starting');
    this.isLoading = true;
    this.addLog('正在查询所有免打扰状态...');

    const model: DoNotDisturbModel = await this.traceService.traceAsync(
      TraceName.SCENE_QUERY_ALL,
      () => this.sceneService.queryAllDndStates()
    );

    this.isDndEnabled = model.isDoNotDisturbEnabled;
    this.isNotifyAllowed = model.isNotifyAllowed;
    this.currentStatus = model.status;

    if (model.isReady()) {
      this.addLog(`查询完成 - 免打扰: ${this.isDndEnabled ? '启用' : '未启用'}, 通知: ${this.isNotifyAllowed ? '允许' : '不允许'}`);
      this.eventService.reportDndStateChanged(this.isDndEnabled, this.isNotifyAllowed);
    } else {
      this.addLog(`查询失败: ${model.errorMessage}`);
    }

    this.isLoading = false;
  }

  /**
   * 重置视图模型状态。
   * 清除所有已查询的数据和日志。
   */
  resetState(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel resetState: clearing');
    this.sceneService.reset();
    this.isDndEnabled = false;
    this.isNotifyAllowed = true;
    this.currentStatus = DoNotDisturbStatus.IDLE;
    this.isLoading = false;
    this.pageLogs = [];
    this.addLog('状态已重置');
  }

  /**
   * 获取免打扰模型的 JSON 表示。
   * @returns {string} JSON 字符串
   */
  getDndDetail(): string {
    const model: DoNotDisturbModel = this.sceneService.getDoNotDisturbModel();
    return JSON.stringify(model.toJSON(), null, 2);
  }

  // ========================================
  // 日志管理方法
  // ========================================

  /**
   * 添加页面操作日志。
   * @param {string} message - 日志消息
   */
  private addLog(message: string): void {
    const timestamp: string = new Date().toLocaleTimeString();
    const logEntry: string = `[${timestamp}] ${message}`;
    this.pageLogs.push(logEntry);
    if (this.pageLogs.length > SystemConfigConstants.MAX_LOG_ENTRIES) {
      this.pageLogs = this.pageLogs.slice(-SystemConfigConstants.MAX_LOG_ENTRIES);
    }
    hilog.debug(DOMAIN, TAG, 'IntelligentSceneViewModel addLog: %{public}s', message);
  }

  /**
   * 获取所有页面日志。
   * @returns {string[]} 日志数组
   */
  getLogs(): string[] {
    return [...this.pageLogs];
  }

  /**
   * 清空页面日志。
   */
  clearLogs(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel clearLogs');
    this.pageLogs = [];
  }

  // ========================================
  // 销毁方法
  // ========================================

  /**
   * 销毁视图模型，释放所有服务资源。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel destroy: releasing');
    this.sceneService.destroy();
    this.traceService.destroy();
    this.eventService.destroy();
    this.pageLogs = [];
  }
}
