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
 * Custom config service.
 * Encapsulates the API calls of the @ohos.customization.customConfig module,
 * providing channel id retrieval with integrated logging, tracing and event reporting.
 */
export class CustomConfigService {
  /** Channel config data model (state held by the singleton) */
  private channelConfig: ChannelConfigModel = new ChannelConfigModel();
  /** Whether the service has been initialized */
  private isInitialized: boolean = false;

  /**
   * Initializes the custom config service.
   * Called before first use to prepare internal state.
   */
  initialize(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigService initialize: starting initialization');
    this.channelConfig = new ChannelConfigModel();
    this.isInitialized = true;
    hilog.info(DOMAIN, TAG, 'CustomConfigService initialize: initialization complete');
  }

  /**
   * Gets the current channel identifier.
   * Calls the customConfig.getChannelId() synchronous API to fetch the channel id.
   * The result updates the internal ChannelConfigModel state.
   * @returns {string} Channel identifier, or the default value on failure
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
   * Gets the channel config data model.
   * Returns the ChannelConfigModel reference held by this service,
   * which can be used to query fetch status and error info.
   * @returns {ChannelConfigModel} Channel config model
   */
  getChannelConfigModel(): ChannelConfigModel {
    hilog.debug(DOMAIN, TAG, 'CustomConfigService getChannelConfigModel: returning model');
    return this.channelConfig;
  }

  /**
   * Gets the current channel config status.
   * @returns {ChannelConfigStatus} Current status enum value
   */
  getCurrentStatus(): ChannelConfigStatus {
    const status: ChannelConfigStatus = this.channelConfig.status;
    hilog.debug(DOMAIN, TAG, 'CustomConfigService getCurrentStatus: %{public}s', status);
    return status;
  }

  /**
   * Determines whether the service has been initialized.
   * @returns {boolean} Whether it is initialized
   */
  isServiceInitialized(): boolean {
    return this.isInitialized;
  }

  /**
   * Resets the service state.
   * Clears the fetched channel info and statistics.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigService reset: clearing state');
    this.channelConfig.reset();
    this.isInitialized = false;
  }

  /**
   * Destroys the service instance.
   * Releases internal resources and resets all state.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'CustomConfigService destroy: releasing resources');
    this.reset();
    this.channelConfig = new ChannelConfigModel();
    hilog.info(DOMAIN, TAG, 'CustomConfigService destroy: resources released');
  }
}
