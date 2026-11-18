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

import { preferences as dataPreferences } from '@kit.ArkData';
import { Logger } from '@ohos/common';
import PreferenceConstants from '../constants/PreferenceConstants';
import { common } from '@kit.AbilityKit';
import { IpBean, IpDeviceInfo } from './IpDeviceModel';

const TAG = 'PreferenceModel';

let preference: dataPreferences.Preferences;

export default class PreferenceModel {
  private static instance: PreferenceModel = new PreferenceModel();
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  public static getInstance(): PreferenceModel {
    return PreferenceModel.instance;
  }

  /**
   * Read the specified Preferences persistence file and load the data into the Preferences instance.
   */
  public async getPreferencesFromStorage() {
    try {
      preference = await dataPreferences.getPreferences(this.context, PreferenceConstants.PREFERENCES_NAME);
    } catch (err) {
      Logger.error(TAG, `===>Failed to get preferences, Cause: ${err}`);
    }
  }

  /**
   * Save the data to the Preferences.
   */
  public async putPreference(keyName: string, info: string) {
    Logger.info(TAG, `===>keyName: ${keyName}, ${info}`);
    if (!preference) {
      await this.getPreferencesFromStorage();
    }
    // The name and data entered by the user are saved to the cached Preference instance.
    try {
      await preference.put(keyName, info);
    } catch (err) {
      Logger.error(TAG, `===>Failed to put value, Cause: ${err}`);
    }
    // Store the Preference instance in the preference persistence file
    await preference.flush();
  }

  /**
   * Get preference data.
   */
  public async getPreference<T>(keyName: string): Promise<T> {
    let value = '';
    if (!preference) {
      await this.getPreferencesFromStorage();
    }
    try {
      value = (await preference.get(keyName, '')).toString();
      Logger.info(TAG, `===>getPreference keyName: ${keyName}, ${value}`);
    } catch (err) {
      Logger.error(TAG, `===>getPreference Failed to get value, Cause: ${err}`);
    }
    return JSON.parse(value);
  }

  public async deletePreferences(keyName: string) {
    if (!preference) {
      await this.getPreferencesFromStorage();
    }
    try {
      await preference.delete(keyName);
      await preference.flush();
      let ipArray: IpBean[] = await this.getPreference(PreferenceConstants.PREFERENCE_IP_ARRAY_KEY);
      let newIpArray = ipArray.filter(item => item.ip !== keyName);
      await this.putPreference(PreferenceConstants.PREFERENCE_IP_ARRAY_KEY, JSON.stringify(newIpArray));
    } catch (err) {
      Logger.error(TAG, `Failed to delete preference, Cause: ${err}`);
    }
    ;
  }

  public async getAllIpDevices(): Promise<IpDeviceInfo[]> {
    let allIpDevices: IpDeviceInfo[] = [];
    if (!preference) {
      await this.getPreferencesFromStorage();
    }
    let storeIds: IpBean[] = await this.getPreference(PreferenceConstants.PREFERENCE_IP_ARRAY_KEY);
    Logger.info(TAG, `===>getAllIpDevices storeIds: ${JSON.stringify(storeIds)}`);
    if (!Array.isArray(storeIds) || storeIds.length === 0) {
      return [];
    }
    const promises = storeIds.map(async (item: IpBean) => {
      try {
        const ipDeviceInfo: IpDeviceInfo = await this.getPreference(item.ip);
        return ipDeviceInfo;
      } catch (err) {
        Logger.error(TAG, 'Failed to load IP device preference');
        return null;
      }
    });
    const results = await Promise.all(promises);
    allIpDevices = results.filter(device => device !== null) as IpDeviceInfo[];
    return allIpDevices;
  }
};
