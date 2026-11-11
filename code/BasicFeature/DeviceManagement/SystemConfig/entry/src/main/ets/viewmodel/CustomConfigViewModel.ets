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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from 'library';
import { CustomConfigService } from 'library';
import { TraceService, TraceName } from 'library';
import { EventService } from 'library';
import { ChannelConfigModel, ChannelConfigStatus } from 'library';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 定制配置视图模型。
 * 负责管理 CustomConfigPage 页面的数据和业务逻辑，
 * 协调 CustomConfigService、TraceService 和 EventService 的调用。
 */
export class CustomConfigViewModel {
  /** 定制配置服务实例 */
  private configService: CustomConfigService = new CustomConfigService();
  /** 追踪服务实例 */
  private traceService: TraceService = new TraceService();
  /** 事件服务实例 */
  private eventService: EventService = new EventService();
  /** 页面操作日志 */
  public pageLogs: string[] = [];
  /** 当前渠道号 */
  public currentChannelId: string = '';
  /** 当前状态 */
  public currentStatus: ChannelConfigStatus = ChannelConfigStatus.UNINITIALIZED;
  /** 是否正在加载 */
  public isLoading: boolean = false;

  /**
   * 初始化视图模型。
   * 创建并初始化所有依赖服务。
   */
  initialize(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel initialize: starting');
    this.traceService.initialize(true);
    this.eventService.initialize();
    this.configService.initialize();
    this.addLog('视图模型初始化完成');
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel initialize: complete');
  }

  // ========================================
  // 业务操作方法
  // ========================================

  /**
   * 获取渠道号。
   * 调用 CustomConfigService.getChannelId() 并通过追踪和事件服务记录。
   */
  fetchChannelId(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel fetchChannelId: starting');
    this.isLoading = true;
    this.addLog('正在获取渠道号...');

    const taskId: number = this.traceService.startTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL, 'fetchChannelId');

    try {
      const channelId: string = this.configService.getChannelId();
      this.currentChannelId = channelId;

      const model: ChannelConfigModel = this.configService.getChannelConfigModel();
      this.currentStatus = model.status;

      if (model.isSuccess()) {
        this.addLog(`获取渠道号成功: ${channelId}`);
        hilog.info(DOMAIN, TAG, 'CustomConfigViewModel fetchChannelId: success, id=%{public}s', channelId);
      } else {
        this.addLog(`获取渠道号失败: ${model.errorMessage}`);
        hilog.error(DOMAIN, TAG, 'CustomConfigViewModel fetchChannelId: failed');
      }

      this.eventService.reportChannelFetched(channelId, model.isSuccess());
    } catch (err) {
      this.addLog('获取渠道号异常');
      hilog.error(DOMAIN, TAG, 'CustomConfigViewModel fetchChannelId: exception');
    } finally {
      this.traceService.finishTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL, taskId);
      this.isLoading = false;
    }
  }

  /**
   * 重置视图模型状态。
   * 清除所有已获取的数据和日志。
   */
  resetState(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel resetState: clearing');
    this.configService.reset();
    this.currentChannelId = '';
    this.currentStatus = ChannelConfigStatus.UNINITIALIZED;
    this.isLoading = false;
    this.pageLogs = [];
    this.addLog('状态已重置');
  }

  /**
   * 获取渠道配置模型的 JSON 表示。
   * @returns {string} JSON 字符串
   */
  getConfigDetail(): string {
    const model: ChannelConfigModel = this.configService.getChannelConfigModel();
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
    hilog.debug(DOMAIN, TAG, 'CustomConfigViewModel addLog: %{public}s', message);
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
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel clearLogs');
    this.pageLogs = [];
  }

  // ========================================
  // 销毁方法
  // ========================================

  /**
   * 销毁视图模型，释放所有服务资源。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel destroy: releasing');
    this.configService.destroy();
    this.traceService.destroy();
    this.eventService.destroy();
    this.pageLogs = [];
  }
}
