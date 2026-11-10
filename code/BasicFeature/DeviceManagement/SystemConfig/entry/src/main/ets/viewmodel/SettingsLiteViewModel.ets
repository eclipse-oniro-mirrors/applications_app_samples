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
import { SettingsLiteService } from 'library';
import { TraceService, TraceName } from 'library';
import { EventService } from 'library';
import {
  SettingsItemModel,
  SettingsItemType,
  SettingsOperationStatus,
  ClickResult,
  ClickCallback
} from 'library';
import { common } from '@kit.AbilityKit';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 设置信息视图模型。
 * 负责管理 SettingsLitePage 页面的数据和业务逻辑，
 * 协调 SettingsLiteService、TraceService 和 EventService 的调用。
 */
export class SettingsLiteViewModel {
  /** 设置信息服务实例 */
  private settingsService: SettingsLiteService = new SettingsLiteService();
  /** 追踪服务实例 */
  private traceService: TraceService = new TraceService();
  /** 事件服务实例 */
  private eventService: EventService = new EventService();
  /** UIAbility 上下文 */
  private context: common.UIAbilityContext | null = null;
  /** 页面操作日志 */
  pageLogs: string[] = [];
  /** PIN 设置项模型 */
  pinModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.PIN_SETTING, 'PIN 码设置', '打开 PIN 码设置页面');
  /** NFC 设置项模型 */
  nfcModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.NFC_SETTING, 'NFC 设置', '打开 NFC 设置页面');
  /** 双击设置项模型 */
  doubleClickModel: SettingsItemModel = new SettingsItemModel(SettingsItemType.DOUBLE_CLICK_SETTING, '双击设置', '打开双击设置页面');
  /** 双击查询结果 */
  clickResultText: string = '';
  /** 是否正在加载 */
  isLoading: boolean = false;

  /**
   * 初始化视图模型。
   * 创建并初始化所有依赖服务。
   * @param {common.UIAbilityContext} context - UIAbility 上下文
   */
  initialize(context: common.UIAbilityContext): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel initialize: starting');
    this.context = context;
    this.traceService.initialize(true);
    this.eventService.initialize();
    this.settingsService.initialize();
    this.syncModels();
    this.addLog('视图模型初始化完成');
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel initialize: complete');
  }

  // ========================================
  // 业务操作方法
  // ========================================

  /**
   * 打开 PIN 码设置页面。
   * 调用 SettingsLiteService.openPinSettingPage() 接口。
   */
  openPinSettings(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel openPinSettings: opening');
    this.addLog('正在打开 PIN 设置页面...');

    this.traceService.startTrace(TraceName.SETTINGS_OPEN_PIN, 'openPin');

    if (!this.context) {
      this.addLog('错误: 上下文未初始化');
      return;
    }

    const success: boolean = this.settingsService.openPinSettingPage(this.context);
    this.syncModels();

    if (success) {
      this.addLog('PIN 设置页面已打开');
      this.eventService.reportSettingsPageOpened('pin', true);
    } else {
      this.addLog(`打开 PIN 设置页面失败: ${this.pinModel.errorMessage}`);
      this.eventService.reportSettingsPageOpened('pin', false);
      this.eventService.reportError('openPinSettings', this.pinModel.errorMessage, this.pinModel.errorCode);
    }

    this.traceService.finishTrace(TraceName.SETTINGS_OPEN_PIN);
  }

  /**
   * 打开 NFC 设置页面。
   * 调用 SettingsLiteService.openNfcSettingsPage() 接口。
   */
  openNfcSettings(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel openNfcSettings: opening');
    this.addLog('正在打开 NFC 设置页面...');

    this.traceService.startTrace(TraceName.SETTINGS_OPEN_NFC, 'openNfc');

    if (!this.context) {
      this.addLog('错误: 上下文未初始化');
      return;
    }

    const success: boolean = this.settingsService.openNfcSettingsPage(this.context);
    this.syncModels();

    if (success) {
      this.addLog('NFC 设置页面已打开');
      this.eventService.reportSettingsPageOpened('nfc', true);
    } else {
      this.addLog(`打开 NFC 设置页面失败: ${this.nfcModel.errorMessage}`);
      this.eventService.reportSettingsPageOpened('nfc', false);
      this.eventService.reportError('openNfcSettings', this.nfcModel.errorMessage, this.nfcModel.errorCode);
    }

    this.traceService.finishTrace(TraceName.SETTINGS_OPEN_NFC);
  }

  /**
   * 打开双击设置页面。
   * 调用 SettingsLiteService.openDoubleClickSettingsPage() 接口。
   */
  openDoubleClickSettings(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel openDoubleClickSettings: opening');
    this.addLog('正在打开双击设置页面...');

    this.traceService.startTrace(TraceName.SETTINGS_OPEN_DOUBLE_CLICK, 'openDoubleClick');

    if (!this.context) {
      this.addLog('错误: 上下文未初始化');
      return;
    }

    const success: boolean = this.settingsService.openDoubleClickSettingsPage(this.context);
    this.syncModels();

    if (success) {
      this.addLog('双击设置页面已打开');
      this.eventService.reportSettingsPageOpened('doubleClick', true);
    } else {
      this.addLog(`打开双击设置页面失败: ${this.doubleClickModel.errorMessage}`);
      this.eventService.reportSettingsPageOpened('doubleClick', false);
      this.eventService.reportError('openDoubleClickSettings', this.doubleClickModel.errorMessage, this.doubleClickModel.errorCode);
    }

    this.traceService.finishTrace(TraceName.SETTINGS_OPEN_DOUBLE_CLICK);
  }

  /**
   * 查询双击应用是否为自身。
   * 调用 SettingsLiteService.isDoubleClickAppForSelf() 接口。
   */
  queryDoubleClickApp(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel queryDoubleClickApp: querying');
    this.addLog('正在查询双击应用信息...');

    this.traceService.startTrace(TraceName.SETTINGS_QUERY_DOUBLE_CLICK, 'queryDoubleClick');

    if (!this.context) {
      this.addLog('错误: 上下文未初始化');
      return;
    }

    this.settingsService.isDoubleClickAppForSelf(this.context, (err: Object | null, cb: ClickCallback) => {
      this.syncModels();
      this.clickResultText = this.getClickResultDescription(cb.result);

      if (cb.result === ClickResult.ERROR) {
        this.addLog(`双击查询失败: ${cb.errorMessage}`);
        this.eventService.reportError('queryDoubleClickApp', cb.errorMessage, cb.errorCode);
      } else {
        this.addLog(`双击查询结果: ${this.clickResultText}`);
        this.eventService.reportDoubleClickQueried(this.clickResultText);
      }

      this.traceService.finishTrace(TraceName.SETTINGS_QUERY_DOUBLE_CLICK);
    });
  }

  /**
   * 重置视图模型状态。
   * 清除所有设置项的操作记录和日志。
   */
  resetState(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel resetState: clearing');
    this.settingsService.reset();
    this.syncModels();
    this.clickResultText = '';
    this.isLoading = false;
    this.pageLogs = [];
    this.addLog('状态已重置');
  }

  // ========================================
  // 辅助方法
  // ========================================

  /**
   * 从服务同步模型数据到视图模型。
   */
  private syncModels(): void {
    this.pinModel = this.settingsService.getPinModel();
    this.nfcModel = this.settingsService.getNfcModel();
    this.doubleClickModel = this.settingsService.getDoubleClickModel();
  }

  /**
   * 获取双击结果的中文描述。
   * @param {ClickResult} result - 查询结果
   * @returns {string} 中文描述
   */
  private getClickResultDescription(result: ClickResult): string {
    switch (result) {
      case ClickResult.IS_SELF:
        return '是双击应用自身';
      case ClickResult.NOT_SELF:
        return '不是双击应用自身';
      case ClickResult.ERROR:
        return '查询出错';
      default:
        return '未知结果';
    }
  }

  /**
   * 获取设置项的状态描述。
   * @param {SettingsItemModel} model - 设置项模型
   * @returns {string} 状态描述
   */
  getItemStatusText(model: SettingsItemModel): string {
    return model.getStatusDescription();
  }

  /**
   * 获取所有设置项的 JSON 表示。
   * @returns {string} JSON 字符串
   */
  getAllSettingsDetail(): string {
    const models: SettingsItemModel[] = this.settingsService.getAllModels();
    const details: object[] = models.map(m => m.toJSON());
    return JSON.stringify(details, null, 2);
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
    hilog.debug(DOMAIN, TAG, 'SettingsLiteViewModel addLog: %{public}s', message);
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
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel clearLogs');
    this.pageLogs = [];
  }

  // ========================================
  // 销毁方法
  // ========================================

  /**
   * 销毁视图模型，释放所有服务资源。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteViewModel destroy: releasing');
    this.settingsService.destroy();
    this.traceService.destroy();
    this.eventService.destroy();
    this.pageLogs = [];
  }
}
