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

import { BusinessError, intelligentScene } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from '../constants/SystemConfigConstants';
import { DoNotDisturbModel, DoNotDisturbStatus } from '../model/DoNotDisturbModel';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 情景模式服务。
 * 封装 @ohos.intelligentScene 模块的免打扰相关接口调用，
 * 提供免打扰状态查询和通知允许状态查询能力，
 * 集成日志、追踪和事件上报。
 * 需要权限：ohos.permission.GET_DONOTDISTURB_STATE
 */
export class IntelligentSceneService {
  /** 免打扰数据模型（单例持有状态） */
  private dndModel: DoNotDisturbModel = new DoNotDisturbModel();
  /** 服务是否已初始化 */
  private isInitialized: boolean = false;

  /**
   * 初始化情景模式服务。
   * 在首次使用前调用，完成内部状态准备。
   */
  initialize(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService initialize: starting initialization');
    this.dndModel = new DoNotDisturbModel();
    this.isInitialized = true;
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService initialize: initialization complete');
  }

  /**
   * 查询免打扰功能是否启用。
   * 调用 intelligentScene.isDoNotDisturbEnabled() 异步接口。
   * @returns {Promise<boolean>} 免打扰是否启用
   */
  async isDoNotDisturbEnabled(): Promise<boolean> {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService isDoNotDisturbEnabled: querying DND state');
    this.dndModel.markQuerying();

    try {
      const enabled: boolean = await intelligentScene.isDoNotDisturbEnabled();
      hilog.info(DOMAIN, TAG, 'IntelligentSceneService isDoNotDisturbEnabled: result=%{public}s',
        enabled.toString());
      this.dndModel.updateDndState(enabled);
      if (this.dndModel.status !== DoNotDisturbStatus.SUCCESS) {
        this.dndModel.markSuccess(enabled, this.dndModel.isNotifyAllowed);
      }
      return enabled;
    } catch (err) {
      const businessErr = err as BusinessError;
      const errMsg: string = businessErr.message ?? 'Unknown error';
      const errCode: number = businessErr.code ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'IntelligentSceneService isDoNotDisturbEnabled: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.dndModel.markFailed(errMsg, errCode);
      return false;
    }
  }

  /**
   * 查询免打扰模式下是否允许通知。
   * 调用 intelligentScene.isNotifyAllowedInDoNotDisturb() 异步接口。
   * @returns {Promise<boolean>} 免打扰时是否允许通知
   */
  async isNotifyAllowedInDoNotDisturb(): Promise<boolean> {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService isNotifyAllowedInDoNotDisturb: querying notify state');
    this.dndModel.markQuerying();

    try {
      const allowed: boolean = await intelligentScene.isNotifyAllowedInDoNotDisturb();
      hilog.info(DOMAIN, TAG, 'IntelligentSceneService isNotifyAllowedInDoNotDisturb: result=%{public}s',
        allowed.toString());
      this.dndModel.updateNotifyState(allowed);
      if (this.dndModel.status !== DoNotDisturbStatus.SUCCESS) {
        this.dndModel.markSuccess(this.dndModel.isDoNotDisturbEnabled, allowed);
      }
      return allowed;
    } catch (err) {
      const businessErr = err as BusinessError;
      const errMsg: string = businessErr.message ?? 'Unknown error';
      const errCode: number = businessErr.code ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'IntelligentSceneService isNotifyAllowedInDoNotDisturb: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.dndModel.markFailed(errMsg, errCode);
      return false;
    }
  }

  /**
   * 同时查询免打扰状态和通知允许状态。
   * 并发调用两个异步接口，一次性获取完整的免打扰信息。
   * @returns {Promise<DoNotDisturbModel>} 更新后的免打扰模型
   */
  async queryAllDndStates(): Promise<DoNotDisturbModel> {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService queryAllDndStates: querying all states');
    this.dndModel.markQuerying();

    try {
      const results: [boolean, boolean] = await Promise.all([
        intelligentScene.isDoNotDisturbEnabled(),
        intelligentScene.isNotifyAllowedInDoNotDisturb()
      ]);
      hilog.info(DOMAIN, TAG, 'IntelligentSceneService queryAllDndStates: dnd=%{public}s, notify=%{public}s',
        results[0].toString(), results[1].toString());
      this.dndModel.markSuccess(results[0], results[1]);
      return this.dndModel;
    } catch (err) {
      const businessErr = err as BusinessError;
      const errMsg: string = businessErr.message ?? 'Unknown error';
      const errCode: number = businessErr.code ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'IntelligentSceneService queryAllDndStates: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.dndModel.markFailed(errMsg, errCode);
      return this.dndModel;
    }
  }

  /**
   * 获取免打扰数据模型。
   * 返回当前服务持有的 DoNotDisturbModel 引用。
   * @returns {DoNotDisturbModel} 免打扰模型
   */
  getDoNotDisturbModel(): DoNotDisturbModel {
    hilog.debug(DOMAIN, TAG, 'IntelligentSceneService getDoNotDisturbModel: returning model');
    return this.dndModel;
  }

  /**
   * 获取当前查询状态。
   * @returns {DoNotDisturbStatus} 当前状态枚举值
   */
  getCurrentStatus(): DoNotDisturbStatus {
    const status: DoNotDisturbStatus = this.dndModel.status;
    hilog.debug(DOMAIN, TAG, 'IntelligentSceneService getCurrentStatus: %{public}s', status);
    return status;
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
   * 清除已查询的免打扰信息和统计数据。
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService reset: clearing state');
    this.dndModel.reset();
    this.isInitialized = false;
  }

  /**
   * 销毁服务实例。
   * 释放内部资源并重置所有状态。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService destroy: releasing resources');
    this.reset();
    this.dndModel = new DoNotDisturbModel();
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService destroy: resources released');
  }
}
