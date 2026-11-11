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

import { customConfig } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from '../constants/SystemConfigConstants';
import { ChannelConfigModel, ChannelConfigStatus } from '../model/ChannelConfigModel';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * 定制配置服务。
 * 封装 @ohos.customization.customConfig 模块的接口调用，
 * 提供渠道号获取能力，并集成日志、追踪和事件上报。
 */
export class CustomConfigService {
  /** 渠道配置数据模型（单例持有状态） */
  private channelConfig: ChannelConfigModel = new ChannelConfigModel();
  /** 服务是否已初始化 */
  private isInitialized: boolean = false;

  /**
   * 初始化定制配置服务。
   * 在首次使用前调用，完成内部状态准备。
   */
  initialize(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigService initialize: starting initialization');
    this.channelConfig = new ChannelConfigModel();
    this.isInitialized = true;
    hilog.info(DOMAIN, TAG, 'CustomConfigService initialize: initialization complete');
  }

  /**
   * 获取当前渠道标识符。
   * 调用 customConfig.getChannelId() 同步接口获取渠道号。
   * 获取结果会更新内部 ChannelConfigModel 状态。
   * @returns {string} 渠道标识符，失败时返回默认值
   */
  getChannelId(): string {
    hilog.info(DOMAIN, TAG, 'CustomConfigService getChannelId: requesting channel ID');
    this.channelConfig.markLoading();

    try {
      const channelId: string = customConfig.getChannelId();
      hilog.info(DOMAIN, TAG, 'CustomConfigService getChannelId: result=%{public}s', channelId);
      this.channelConfig.markSuccess(channelId);
      return channelId;
    } catch (err) {
      const errObj = err as Record<string, Object>;
      const errMsg: string = (errObj['message'] as string) ?? 'Unknown error';
      const errCode: number = (errObj['code'] as number) ?? SystemConfigConstants.ERROR_INTERNAL;
      hilog.error(DOMAIN, TAG, 'CustomConfigService getChannelId: failed, error=%{public}s, code=%{public}d',
        errMsg, errCode);
      this.channelConfig.markFailed(errMsg, errCode);
      return SystemConfigConstants.DEFAULT_CHANNEL_ID;
    }
  }

  /**
   * 获取渠道配置数据模型。
   * 返回当前服务持有的 ChannelConfigModel 引用，
   * 可用于查询获取状态、错误信息等。
   * @returns {ChannelConfigModel} 渠道配置模型
   */
  getChannelConfigModel(): ChannelConfigModel {
    hilog.debug(DOMAIN, TAG, 'CustomConfigService getChannelConfigModel: returning model');
    return this.channelConfig;
  }

  /**
   * 获取当前渠道配置状态。
   * @returns {ChannelConfigStatus} 当前状态枚举值
   */
  getCurrentStatus(): ChannelConfigStatus {
    const status: ChannelConfigStatus = this.channelConfig.status;
    hilog.debug(DOMAIN, TAG, 'CustomConfigService getCurrentStatus: %{public}s', status);
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
   * 清除已获取的渠道信息和统计数据。
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigService reset: clearing state');
    this.channelConfig.reset();
    this.isInitialized = false;
  }

  /**
   * 销毁服务实例。
   * 释放内部资源并重置所有状态。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigService destroy: releasing resources');
    this.reset();
    this.channelConfig = new ChannelConfigModel();
    hilog.info(DOMAIN, TAG, 'CustomConfigService destroy: resources released');
  }
}
