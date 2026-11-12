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

import { BusinessError, intelligentScene } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from '../constants/SystemConfigConstants';
import { DoNotDisturbModel, DoNotDisturbStatus } from '../model/DoNotDisturbModel';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * Intelligent scene service.
 * Encapsulates the Do Not Disturb related API calls of the @ohos.intelligentScene module,
 * providing DND state and notification-allowed state queries,
 * with integrated logging, tracing and event reporting.
 * Required permission: ohos.permission.GET_DONOTDISTURB_STATE
 */
export class IntelligentSceneService {
  /** Do Not Disturb data model (state held by the singleton) */
  private dndModel: DoNotDisturbModel = new DoNotDisturbModel();
  /** Whether the service has been initialized */
  private isInitialized: boolean = false;

  /**
   * Initializes the intelligent scene service.
   * Called before first use to prepare internal state.
   */
  initialize(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService initialize: starting initialization');
    this.dndModel = new DoNotDisturbModel();
    this.isInitialized = true;
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService initialize: initialization complete');
  }

  /**
   * Queries whether the Do Not Disturb feature is enabled.
   * Calls the intelligentScene.isDoNotDisturbEnabled() asynchronous API.
   * @returns {Promise<boolean>} Whether DND is enabled
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
   * Queries whether notifications are allowed in Do Not Disturb mode.
   * Calls the intelligentScene.isNotifyAllowedInDoNotDisturb() asynchronous API.
   * @returns {Promise<boolean>} Whether notifications are allowed during DND
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
   * Queries both the DND state and the notification-allowed state.
   * Calls the two asynchronous APIs concurrently to fetch complete DND info at once.
   * @returns {Promise<DoNotDisturbModel>} The updated Do Not Disturb model
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
   * Gets the Do Not Disturb data model.
   * Returns the DoNotDisturbModel reference held by this service.
   * @returns {DoNotDisturbModel} Do Not Disturb model
   */
  getDoNotDisturbModel(): DoNotDisturbModel {
    hilog.debug(DOMAIN, TAG, 'IntelligentSceneService getDoNotDisturbModel: returning model');
    return this.dndModel;
  }

  /**
   * Gets the current query status.
   * @returns {DoNotDisturbStatus} Current status enum value
   */
  getCurrentStatus(): DoNotDisturbStatus {
    const status: DoNotDisturbStatus = this.dndModel.status;
    hilog.debug(DOMAIN, TAG, 'IntelligentSceneService getCurrentStatus: %{public}s', status);
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
   * Clears the queried DND info and statistics.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService reset: clearing state');
    this.dndModel.reset();
    this.isInitialized = false;
  }

  /**
   * Destroys the service instance.
   * Releases internal resources and resets all state.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService destroy: releasing resources');
    this.reset();
    this.dndModel = new DoNotDisturbModel();
    hilog.info(DOMAIN, TAG, 'IntelligentSceneService destroy: resources released');
  }
}
