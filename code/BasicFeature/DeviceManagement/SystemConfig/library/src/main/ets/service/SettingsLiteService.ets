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
import { BusinessError } from '@kit.BasicServicesKit';
import { SystemConfigConstants } from '../constants/SystemConfigConstants';
import {
  SettingsItemModel,
  SettingsItemType,
  ClickResult,
  ClickCallback
} from '../model/SettingsItemModel';
import { common } from '@kit.AbilityKit';
import { Want } from '@kit.AbilityKit';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 设置信息服务。
 * 通过 Want + startAbility 方式打开系统 PIN / NFC / 双击设置页面
 * （@ohos.settingsLite 为 FA 模型专用接口，Stage 模型下不可直接调用）。
 * 双击应用归属查询依赖 settingsLite，Stage 运行环境下如实返回不支持错误。
 * 集成日志、追踪和事件上报。
 */
export class SettingsLiteService {
  /** PIN 设置项模型 */
  private pinModel: SettingsItemModel = new SettingsItemModel(
    SettingsItemType.PIN_SETTING, 'PIN 码设置', '打开 PIN 码设置页面'
  );
  /** NFC 设置项模型 */
  private nfcModel: SettingsItemModel = new SettingsItemModel(
    SettingsItemType.NFC_SETTING, 'NFC 设置', '打开 NFC 设置页面'
  );
  /** 双击设置项模型 */
  private doubleClickModel: SettingsItemModel = new SettingsItemModel(
    SettingsItemType.DOUBLE_CLICK_SETTING, '双击设置', '打开双击设置页面'
  );
  /** 服务是否已初始化 */
  private isInitialized: boolean = false;

  /**
   * 初始化设置信息服务。
   * 在首次使用前调用，完成内部状态准备。
   */
  initialize(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService initialize: starting initialization');
    this.pinModel = new SettingsItemModel(
      SettingsItemType.PIN_SETTING, 'PIN 码设置', '打开 PIN 码设置页面'
    );
    this.nfcModel = new SettingsItemModel(
      SettingsItemType.NFC_SETTING, 'NFC 设置', '打开 NFC 设置页面'
    );
    this.doubleClickModel = new SettingsItemModel(
      SettingsItemType.DOUBLE_CLICK_SETTING, '双击设置', '打开双击设置页面'
    );
    this.isInitialized = true;
    hilog.info(DOMAIN, TAG, 'SettingsLiteService initialize: initialization complete');
  }

  // ========================================
  // PIN 设置相关方法
  // ========================================

  /**
   * 打开 PIN 码设置页面。
   * 使用 startAbility 打开系统设置页面，await 启动结果后再更新状态。
   * @param {common.UIAbilityContext} context - UIAbility 上下文
   * @returns {Promise<boolean>} 是否成功打开
   */
  async openPinSettingPage(context: common.UIAbilityContext): Promise<boolean> {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService openPinSettingPage: opening PIN settings');
    this.pinModel.markOpening();

    try {
      const want: Want = {
        action: 'action.settings.security',
        uri: 'systemui://security/pin'
      };
      await context.startAbility(want);
      hilog.info(DOMAIN, TAG, 'SettingsLiteService openPinSettingPage: page opened successfully');
      this.pinModel.markSuccess('PIN 设置页面已打开');
      return true;
    } catch (err) {
      const businessErr = err as BusinessError;
      const errMsg: string = businessErr.message ?? 'Unknown error';
      const errCode: number = businessErr.code ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'SettingsLiteService openPinSettingPage: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.pinModel.markFailed(errMsg, errCode);
      return false;
    }
  }

  // ========================================
  // NFC 设置相关方法
  // ========================================

  /**
   * 打开 NFC 设置页面。
   * 使用 startAbility 打开系统 NFC 设置页面，await 启动结果后再更新状态。
   * @param {common.UIAbilityContext} context - UIAbility 上下文
   * @returns {Promise<boolean>} 是否成功打开
   */
  async openNfcSettingsPage(context: common.UIAbilityContext): Promise<boolean> {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService openNfcSettingsPage: opening NFC settings');
    this.nfcModel.markOpening();

    try {
      const want: Want = {
        action: 'action.settings.nfc',
        uri: 'systemui://settings/nfc'
      };
      await context.startAbility(want);
      hilog.info(DOMAIN, TAG, 'SettingsLiteService openNfcSettingsPage: page opened successfully');
      this.nfcModel.markSuccess('NFC 设置页面已打开');
      return true;
    } catch (err) {
      const businessErr = err as BusinessError;
      const errMsg: string = businessErr.message ?? 'Unknown error';
      const errCode: number = businessErr.code ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'SettingsLiteService openNfcSettingsPage: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.nfcModel.markFailed(errMsg, errCode);
      return false;
    }
  }

  // ========================================
  // 双击设置相关方法
  // ========================================

  /**
   * 打开双击设置页面。
   * 使用 startAbility 打开系统手势设置页面，await 启动结果后再更新状态。
   * @param {common.UIAbilityContext} context - UIAbility 上下文
   * @returns {Promise<boolean>} 是否成功打开
   */
  async openDoubleClickSettingsPage(context: common.UIAbilityContext): Promise<boolean> {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService openDoubleClickSettingsPage: opening double click settings');
    this.doubleClickModel.markOpening();

    try {
      const want: Want = {
        action: 'action.settings.gesture',
        uri: 'systemui://settings/gesture'
      };
      await context.startAbility(want);
      hilog.info(DOMAIN, TAG, 'SettingsLiteService openDoubleClickSettingsPage: page opened successfully');
      this.doubleClickModel.markSuccess('双击设置页面已打开');
      return true;
    } catch (err) {
      const businessErr = err as BusinessError;
      const errMsg: string = businessErr.message ?? 'Unknown error';
      const errCode: number = businessErr.code ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'SettingsLiteService openDoubleClickSettingsPage: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.doubleClickModel.markFailed(errMsg, errCode);
      return false;
    }
  }

  /**
   * 查询双击应用是否为自身。
   * settingsLite.isDoubleClickAppForSelf 为 FA 模型专用接口，
   * Stage 运行环境下不可调用，此处如实回调不支持错误，不返回模拟结果。
   * @param {common.UIAbilityContext} context - UIAbility 上下文（保留以保持接口一致）
   * @param {function(err: Object | null, cb: ClickCallback): void} callback - 查询结果回调
   */
  isDoubleClickAppForSelf(
    context: common.UIAbilityContext,
    callback: (err: Object | null, cb: ClickCallback) => void): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService isDoubleClickAppForSelf: not available in Stage model');
    this.doubleClickModel.markQuerying();

    const errMsg: string = 'settingsLite.isDoubleClickAppForSelf is only available in FA model';
    const err: BusinessError = {
      name: 'SettingsLiteUnsupportedError',
      message: errMsg,
      code: SystemConfigConstants.ERROR_INTERNAL
    };
    const result: ClickCallback = {
      result: ClickResult.ERROR,
      errorMessage: errMsg,
      errorCode: SystemConfigConstants.ERROR_INTERNAL
    };

    this.doubleClickModel.updateClickResult(ClickResult.ERROR);
    this.doubleClickModel.markFailed(errMsg, SystemConfigConstants.ERROR_INTERNAL);
    callback(err, result);
  }

  // ========================================
  // 模型访问方法
  // ========================================

  /**
   * 获取 PIN 设置项模型。
   * @returns {SettingsItemModel} PIN 设置模型
   */
  getPinModel(): SettingsItemModel {
    return this.pinModel;
  }

  /**
   * 获取 NFC 设置项模型。
   * @returns {SettingsItemModel} NFC 设置模型
   */
  getNfcModel(): SettingsItemModel {
    return this.nfcModel;
  }

  /**
   * 获取双击设置项模型。
   * @returns {SettingsItemModel} 双击设置模型
   */
  getDoubleClickModel(): SettingsItemModel {
    return this.doubleClickModel;
  }

  /**
   * 获取所有设置项模型列表。
   * @returns {SettingsItemModel[]} 设置项模型数组
   */
  getAllModels(): SettingsItemModel[] {
    hilog.debug(DOMAIN, TAG, 'SettingsLiteService getAllModels: returning 3 models');
    return [this.pinModel, this.nfcModel, this.doubleClickModel];
  }

  /**
   * 判断服务是否已初始化。
   * @returns {boolean} 是否已初始化
   */
  isServiceInitialized(): boolean {
    return this.isInitialized;
  }

  /**
   * 重置服务状态。
   * 清除所有设置项的操作记录和统计信息。
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService reset: clearing state');
    this.pinModel.reset();
    this.nfcModel.reset();
    this.doubleClickModel.reset();
    this.isInitialized = false;
  }

  /**
   * 销毁服务实例。
   * 释放内部资源并重置所有状态。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService destroy: releasing resources');
    this.reset();
    hilog.info(DOMAIN, TAG, 'SettingsLiteService destroy: resources released');
  }
}
