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
import { IntelligentSceneService } from 'library';
import { TraceService, TraceName } from 'library';
import { EventService } from 'library';
import { DoNotDisturbModel, DoNotDisturbStatus } from 'library';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Intelligent Scene view model.
 * Manages the data and business logic of IntelligentScenePage,
 * coordinating calls to IntelligentSceneService, TraceService and EventService.
 */
export class IntelligentSceneViewModel {
  /** Intelligent scene service instance */
  private sceneService: IntelligentSceneService = new IntelligentSceneService();
  /** Trace service instance */
  private traceService: TraceService = new TraceService();
  /** Event service instance */
  private eventService: EventService = new EventService();
  /** UIAbility context (used to resolve localized text resources) */
  private context: common.UIAbilityContext | null = null;
  /** Page operation logs */
  public pageLogs: string[] = [];
  /** Whether Do Not Disturb is enabled */
  public isDndEnabled: boolean = false;
  /** Whether notifications are allowed during Do Not Disturb */
  public isNotifyAllowed: boolean = true;
  /** Current query status */
  public currentStatus: DoNotDisturbStatus = DoNotDisturbStatus.IDLE;
  /** Whether loading */
  public isLoading: boolean = false;

  /**
   * Initializes the view model.
   * Creates and initializes all dependent services.
   * @param {common.UIAbilityContext} context - UIAbility context, used to resolve localized text resources
   */
  initialize(context: common.UIAbilityContext): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel initialize: starting');
    this.context = context;
    this.traceService.initialize(true);
    this.eventService.initialize();
    this.sceneService.initialize();
    this.addLog(this.fmt($r('app.string.log_vm_initialized')));
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel initialize: complete');
  }

  // ========================================
  // Business operation methods
  // ========================================

  /**
   * Queries the Do Not Disturb enabled status.
   * Calls the IntelligentSceneService.isDoNotDisturbEnabled() asynchronous API.
   */
  async queryDndState(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryDndState: starting');
    this.isLoading = true;
    this.addLog(this.fmt($r('app.string.log_querying_dnd')));

    const enabled: boolean = await this.traceService.traceAsync(
      TraceName.SCENE_QUERY_DND,
      () => this.sceneService.isDoNotDisturbEnabled()
    );

    this.isDndEnabled = enabled;
    const model: DoNotDisturbModel = this.sceneService.getDoNotDisturbModel();
    this.currentStatus = model.status;

    if (model.isReady()) {
      this.addLog(this.fmt($r('app.string.log_dnd_state'), this.enabledText(enabled)));
      this.eventService.reportDndStateChanged(enabled, this.isNotifyAllowed);
    } else {
      this.addLog(this.fmt($r('app.string.log_query_failed'), model.errorMessage));
    }

    this.isLoading = false;
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryDndState: dnd=%{public}s', enabled.toString());
  }

  /**
   * Queries the notification-allowed status during Do Not Disturb.
   * Calls the IntelligentSceneService.isNotifyAllowedInDoNotDisturb() asynchronous API.
   */
  async queryNotifyState(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryNotifyState: starting');
    this.isLoading = true;
    this.addLog(this.fmt($r('app.string.log_querying_notify')));

    const allowed: boolean = await this.traceService.traceAsync(
      TraceName.SCENE_QUERY_NOTIFY,
      () => this.sceneService.isNotifyAllowedInDoNotDisturb()
    );

    this.isNotifyAllowed = allowed;
    const model: DoNotDisturbModel = this.sceneService.getDoNotDisturbModel();
    this.currentStatus = model.status;

    if (model.isReady()) {
      this.addLog(this.fmt($r('app.string.log_notify_state'), this.allowedText(allowed)));
      this.eventService.reportDndStateChanged(this.isDndEnabled, allowed);
    } else {
      this.addLog(this.fmt($r('app.string.log_query_failed'), model.errorMessage));
    }

    this.isLoading = false;
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryNotifyState: notify=%{public}s', allowed.toString());
  }

  /**
   * Queries all Do Not Disturb related statuses at once.
   * Calls IntelligentSceneService.queryAllDndStates() to fetch them in a single request.
   */
  async queryAllStates(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel queryAllStates: starting');
    this.isLoading = true;
    this.addLog(this.fmt($r('app.string.log_querying_all')));

    const model: DoNotDisturbModel = await this.traceService.traceAsync(
      TraceName.SCENE_QUERY_ALL,
      () => this.sceneService.queryAllDndStates()
    );

    this.isDndEnabled = model.isDoNotDisturbEnabled;
    this.isNotifyAllowed = model.isNotifyAllowed;
    this.currentStatus = model.status;

    if (model.isReady()) {
      this.addLog(this.fmt($r('app.string.log_query_all_done'), this.enabledText(this.isDndEnabled), this.allowedText(this.isNotifyAllowed)));
      this.eventService.reportDndStateChanged(this.isDndEnabled, this.isNotifyAllowed);
    } else {
      this.addLog(this.fmt($r('app.string.log_query_failed'), model.errorMessage));
    }

    this.isLoading = false;
  }

  /**
   * Resets the view model state.
   * Clears all queried data and logs.
   */
  resetState(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel resetState: clearing');
    this.sceneService.reset();
    this.isDndEnabled = false;
    this.isNotifyAllowed = true;
    this.currentStatus = DoNotDisturbStatus.IDLE;
    this.isLoading = false;
    this.pageLogs = [];
    this.addLog(this.fmt($r('app.string.log_state_reset')));
  }

  /**
   * Gets the JSON representation of the Do Not Disturb model.
   * @returns {string} JSON string
   */
  getDndDetail(): string {
    const model: DoNotDisturbModel = this.sceneService.getDoNotDisturbModel();
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
   * Gets the localized text for the enabled status.
   * @param {boolean} enabled - Whether enabled
   * @returns {string} Localized status text
   */
  private enabledText(enabled: boolean): string {
    return this.fmt(enabled ? $r('app.string.value_enabled') : $r('app.string.value_disabled'));
  }

  /**
   * Gets the localized text for the notification-allowed status.
   * @param {boolean} allowed - Whether allowed
   * @returns {string} Localized status text
   */
  private allowedText(allowed: boolean): string {
    return this.fmt(allowed ? $r('app.string.value_allowed') : $r('app.string.value_not_allowed'));
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
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel addLog: %{public}s', message);
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
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel clearLogs');
    this.pageLogs = [];
  }

  // ========================================
  // Destroy methods
  // ========================================

  /**
   * Destroys the view model and releases all service resources.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneViewModel destroy: releasing');
    this.sceneService.destroy();
    this.traceService.destroy();
    this.eventService.destroy();
    this.pageLogs = [];
  }
}
