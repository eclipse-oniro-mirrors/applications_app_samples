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
import {
  SettingsItemModel,
  SettingsItemType,
  SettingsOperationStatus,
  ClickResult,
  ClickCallback
} from '../model/SettingsItemModel';
import { common } from '@kit.AbilityKit';
import { Want } from '@kit.AbilityKit';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 设置信息服务。
 * 封装 @ohos.settingsLite 模块的接口调用，
 * 提供打开 PIN 设置页、NFC 设置页、双击设置页以及查询双击应用回调的能力，
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
   * 使用 startAbility 打开系统设置页面。
   * @param {common.UIAbilityContext} context - UIAbility 上下文
   * @returns {boolean} 是否成功发起打开操作
   */
  openPinSettingPage(context: common.UIAbilityContext): boolean {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService openPinSettingPage: opening PIN settings');
    this.pinModel.markOpening();

    try {
      const want: Want = {
        action: 'action.settings.security',
        uri: 'systemui://security/pin'
      };
      context.startAbility(want);
      hilog.info(DOMAIN, TAG, 'SettingsLiteService openPinSettingPage: page opened successfully');
      this.pinModel.markSuccess('PIN 设置页面已打开');
      return true;
    } catch (err) {
      const errObj = err as Record<string, Object>;
      const errMsg: string = (errObj['message'] as string) ?? 'Unknown error';
      const errCode: number = (errObj['code'] as number) ?? SystemConfigConstants.ERROR_INTERNAL;
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
   * 使用 startAbility 打开系统 NFC 设置页面。
   * @param {common.UIAbilityContext} context - UIAbility 上下文
   * @returns {boolean} 是否成功发起打开操作
   */
  openNfcSettingsPage(context: common.UIAbilityContext): boolean {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService openNfcSettingsPage: opening NFC settings');
    this.nfcModel.markOpening();

    try {
      const want: Want = {
        action: 'action.settings.nfc',
        uri: 'systemui://settings/nfc'
      };
      context.startAbility(want);
      hilog.info(DOMAIN, TAG, 'SettingsLiteService openNfcSettingsPage: page opened successfully');
      this.nfcModel.markSuccess('NFC 设置页面已打开');
      return true;
    } catch (err) {
      const errObj = err as Record<string, Object>;
      const errMsg: string = (errObj['message'] as string) ?? 'Unknown error';
      const errCode: number = (errObj['code'] as number) ?? SystemConfigConstants.ERROR_INTERNAL;
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
   * 使用 startAbility 打开系统手势设置页面。
   * @param {common.UIAbilityContext} context - UIAbility 上下文
   * @returns {boolean} 是否成功发起打开操作
   */
  openDoubleClickSettingsPage(context: common.UIAbilityContext): boolean {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService openDoubleClickSettingsPage: opening double click settings');
    this.doubleClickModel.markOpening();

    try {
      const want: Want = {
        action: 'action.settings.gesture',
        uri: 'systemui://settings/gesture'
      };
      context.startAbility(want);
      hilog.info(DOMAIN, TAG, 'SettingsLiteService openDoubleClickSettingsPage: page opened successfully');
      this.doubleClickModel.markSuccess('双击设置页面已打开');
      return true;
    } catch (err) {
      const errObj = err as Record<string, Object>;
      const errMsg: string = (errObj['message'] as string) ?? 'Unknown error';
      const errCode: number = (errObj['code'] as number) ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'SettingsLiteService openDoubleClickSettingsPage: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.doubleClickModel.markFailed(errMsg, errCode);
      return false;
    }
  }

  /**
   * 查询双击应用是否为自身。
   * Stage 模型下此功能不可用，返回模拟结果。
   * @param {common.UIAbilityContext} context - UIAbility 上下文
   * @param {function(err: Object | null, cb: ClickCallback): void} callback - 查询结果回调
   */
  isDoubleClickAppForSelf(context: common.UIAbilityContext, callback: (err: Object | null, cb: ClickCallback) => void): void {
    hilog.info(DOMAIN, TAG, 'SettingsLiteService isDoubleClickAppForSelf: querying');
    this.doubleClickModel.markQuerying();

    // Stage 模型下 settingsLite.isDoubleClickAppForSelf 不可用
    // 返回模拟结果用于演示
    const mockCallback: ClickCallback = {
      result: ClickResult.NOT_SELF,
      errorMessage: 'Stage 模型下此功能不可用，返回模拟结果',
      errorCode: 0
    };

    this.doubleClickModel.updateClickResult(mockCallback.result);
    this.doubleClickModel.markSuccess(`双击查询结果 (模拟): ${mockCallback.result}`);
    
    hilog.info(DOMAIN, TAG, 'SettingsLiteService isDoubleClickAppForSelf: returning mock result');
    callback(null, mockCallback);
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
