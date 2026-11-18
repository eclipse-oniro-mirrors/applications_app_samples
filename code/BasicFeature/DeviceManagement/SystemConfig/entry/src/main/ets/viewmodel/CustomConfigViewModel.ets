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
import { common } from '@kit.AbilityKit';
import { SystemConfigConstants } from 'library';
import { CustomConfigService } from 'library';
import { TraceService, TraceName } from 'library';
import { EventService } from 'library';
import { ChannelConfigModel, ChannelConfigStatus } from 'library';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Custom Config view model.
 * Manages the data and business logic of CustomConfigPage,
 * coordinating calls to CustomConfigService, TraceService and EventService.
 */
export class CustomConfigViewModel {
  /** Custom config service instance */
  private configService: CustomConfigService = new CustomConfigService();
  /** Trace service instance */
  private traceService: TraceService = new TraceService();
  /** Event service instance */
  private eventService: EventService = new EventService();
  /** UIAbility context (used to resolve localized text resources) */
  private context: common.UIAbilityContext | null = null;
  /** Page operation logs */
  public pageLogs: string[] = [];
  /** Current channel id */
  public currentChannelId: string = '';
  /** Current status */
  public currentStatus: ChannelConfigStatus = ChannelConfigStatus.UNINITIALIZED;
  /** Whether loading */
  public isLoading: boolean = false;

  /**
   * Initializes the view model.
   * Creates and initializes all dependent services.
   * @param {common.UIAbilityContext} context - UIAbility context, used to resolve localized text resources
   */
  initialize(context: common.UIAbilityContext): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel initialize: starting');
    this.context = context;
    this.traceService.initialize(true);
    this.eventService.initialize();
    this.configService.initialize();
    this.addLog(this.fmt($r('app.string.log_vm_initialized')));
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel initialize: complete');
  }

  // ========================================
  // Business operation methods
  // ========================================

  /**
   * Fetches the channel id.
   * Calls CustomConfigService.getChannelId() and records it via the trace and event services.
   */
  fetchChannelId(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel fetchChannelId: starting');
    this.isLoading = true;
    this.addLog(this.fmt($r('app.string.log_fetching_channel_id')));

    const taskId: number = this.traceService.startTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL, 'fetchChannelId');

    try {
      const channelId: string = this.configService.getChannelId();
      this.currentChannelId = channelId;

      const model: ChannelConfigModel = this.configService.getChannelConfigModel();
      this.currentStatus = model.status;

      if (model.isSuccess()) {
        this.addLog(this.fmt($r('app.string.log_channel_success'), channelId));
        hilog.info(DOMAIN, TAG, 'CustomConfigViewModel fetchChannelId: success, id=%{public}s', channelId);
      } else {
        this.addLog(this.fmt($r('app.string.log_channel_failed'), model.errorMessage));
        hilog.error(DOMAIN, TAG, 'CustomConfigViewModel fetchChannelId: failed');
      }

      this.eventService.reportChannelFetched(channelId, model.isSuccess());
    } catch (err) {
      this.addLog(this.fmt($r('app.string.log_channel_exception')));
      hilog.error(DOMAIN, TAG, 'CustomConfigViewModel fetchChannelId: exception');
    } finally {
      this.traceService.finishTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL, taskId);
      this.isLoading = false;
    }
  }

  /**
   * Resets the view model state.
   * Clears all fetched data and logs.
   */
  resetState(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel resetState: clearing');
    this.configService.reset();
    this.currentChannelId = '';
    this.currentStatus = ChannelConfigStatus.UNINITIALIZED;
    this.isLoading = false;
    this.pageLogs = [];
    this.addLog(this.fmt($r('app.string.log_state_reset')));
  }

  /**
   * Gets the JSON representation of the channel config model.
   * @returns {string} JSON string
   */
  getConfigDetail(): string {
    const model: ChannelConfigModel = this.configService.getChannelConfigModel();
    return JSON.stringify(model.toJSON(), null, 2);
  }

  // ========================================
  // Log management methods
  // ========================================

  /**
   * Resolves a localized text resource into a string.
   * @param {Resource} resource - Resource object obtained via $r reference
   * @param {Array<string | number>} args - Format placeholder arguments
   * @returns {string} The resolved localized string, or an empty string when the context is not ready
   */
  private fmt(resource: Resource, ...args: Array<string | number>): string {
    if (!this.context) {
      return '';
    }
    return this.context.resourceManager.getStringSync(resource.id, ...args);
  }

  /**
   * Adds a page operation log.
   * @param {string} message - Log message
   */
  private addLog(message: string): void {
    const timestamp: string = new Date().toLocaleTimeString();
    const logEntry: string = `[${timestamp}] ${message}`;
    this.pageLogs.push(logEntry);
    if (this.pageLogs.length > SystemConfigConstants.MAX_LOG_ENTRIES) {
      this.pageLogs = this.pageLogs.slice(-SystemConfigConstants.MAX_LOG_ENTRIES);
    }
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel addLog: %{public}s', message);
  }

  /**
   * Gets all page logs.
   * @returns {string[]} Log array
   */
  getLogs(): string[] {
    return [...this.pageLogs];
  }

  /**
   * Clears page logs.
   */
  clearLogs(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel clearLogs');
    this.pageLogs = [];
  }

  // ========================================
  // Destroy methods
  // ========================================

  /**
   * Destroys the view model and releases all service resources.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigViewModel destroy: releasing');
    this.configService.destroy();
    this.traceService.destroy();
    this.eventService.destroy();
    this.pageLogs = [];
  }
}
