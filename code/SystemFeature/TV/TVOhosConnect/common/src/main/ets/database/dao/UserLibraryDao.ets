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

import { preferences } from '@kit.ArkData';
import { CommonConstants } from '../../constants/CommonConstants';
import { Logger } from '../../utils/Logger';
import { UserDataEvent } from '../../utils/UserDataEvent';
import { UserData } from '../entity/UserDate';
import { fileIo } from '@kit.CoreFileKit';

const TAG = 'UserLibraryDao';

// 用户信息持久化
export class UserLibraryDao {
  // 设置数据
  public static async setUserData(userData: UserData) {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      if (userData.userName != null) {
        dataPreferences.putSync('userName', userData.userName);
      }
      if (userData.userAccount != null) {
        dataPreferences.putSync('userAccount', userData.userAccount);
      }
      if (userData.userPassword != null) {
        dataPreferences.putSync('userPassword', userData.userPassword);
      }
      if (userData.userAvatar != null) {
        let historyUriName = dataPreferences.getSync('userAvatar', '') as string;
        if (historyUriName) {
          let filesDir = context.filesDir;
          let historyUri = filesDir + historyUriName;
          let isFileRight = await fileIo.access(historyUri);
          if (isFileRight) {
            await fileIo.unlink(historyUri);
          }
        }
        dataPreferences.putSync('userAvatar', userData.userAvatar);
      }
      if (userData.userPhoneNumber != null) {
        dataPreferences.putSync('userPhoneNumber', userData.userPhoneNumber);
      }
      if (userData.userEmail != null) {
        dataPreferences.putSync('userEmail', userData.userEmail);
      }
      if (userData.userToken != null) {
        dataPreferences.putSync('userToken', userData.userToken);
      }
      if (userData.userMqttUrl != null) {
        dataPreferences.putSync('userMqttUrl', userData.userMqttUrl);
      }
      if (userData.userClientId != null) {
        dataPreferences.putSync('userClientId', userData.userClientId);
      }
      if (userData.mqttPassword != null) {
        dataPreferences.putSync('mqttPassword', userData.mqttPassword);
      }
      if (userData.mqttUserName != null) {
        dataPreferences.putSync('mqttUserName', userData.mqttUserName);
      }
      if (userData.isLogin != null) {
        dataPreferences.putSync('userIsLogin', userData.isLogin);
      }
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'setUserData successful');
    } catch (e) {
      Logger.error(TAG, `setUserData failed, error code: ${e}.`);
    }
  }

  // 获取数据
  public static getUserName(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let userName = dataPreferences.getSync('userName', '') as string;
      Logger.debug(TAG, 'getUserName successful');
      return userName;
    } catch (e) {
      Logger.error(TAG, `getUserName failed, error code: ${e}.`);
      return '';
    }
  }

  public static getUserAccount(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let userAccount = dataPreferences.getSync('userAccount', '') as string;
      Logger.debug(TAG, 'getUserAccount successful');
      return userAccount;
    } catch (e) {
      Logger.error(TAG, `getUserAccount failed, error code: ${e}.`);
      return '';
    }
  }

  public static getUserPassword(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let userPassword = dataPreferences.getSync('userPassword', '') as string;
      Logger.debug(TAG, 'getUserPassword successful');
      return userPassword;
    } catch (e) {
      Logger.error(TAG, `getUserPassword failed, error code: ${e}.`);
      return '';
    }
  }

  public static getUserAvatar(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let userAvatar = dataPreferences.getSync('userAvatar', '') as string;
      Logger.debug(TAG, 'getUserAvatar successful');
      return userAvatar;
    } catch (e) {
      Logger.error(TAG, `getUserAvatar failed, error code: ${e}.`);
      return '';
    }
  }

  public static getPhoneNumber(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let phoneNumber = dataPreferences.getSync('userPhoneNumber', '') as string;
      Logger.debug(TAG, 'getPhoneNumber successful');
      return phoneNumber;
    } catch (e) {
      Logger.error(TAG, `getPhoneNumber failed, error code: ${e}.`);
      return '';
    }
  }

  public static getEmail(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let email = dataPreferences.getSync('userEmail', '') as string;
      Logger.debug(TAG, 'getEmail successful');
      return email;
    } catch (e) {
      Logger.error(TAG, `getEmail failed, error code: ${e}.`);
      return '';
    }
  }

  public static getToken(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let token = dataPreferences.getSync('userToken', '') as string;
      Logger.debug(TAG, 'getToken successful');
      return token;
    } catch (e) {
      Logger.error(TAG, `getToken failed, error code: ${e}.`);
      return '';
    }
  }

  public static getUserMqttUrl(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let userMqttUrl = dataPreferences.getSync('userMqttUrl', '') as string;
      Logger.debug(TAG, 'getUserMqttUrl successful');
      return userMqttUrl;
    } catch (e) {
      Logger.error(TAG, `getUserMqttUrl failed, error code: ${e}.`);
      return '';
    }
  }

  public static getUserClientId(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let userClientId = dataPreferences.getSync('userClientId', '') as string;
      Logger.debug(TAG, 'getUserClientId successful');
      return userClientId;
    } catch (e) {
      Logger.error(TAG, `getUserClientId failed, error code: ${e}.`);
      return '';
    }
  }

  public static getMqttPassword(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let mqttPassword = dataPreferences.getSync('mqttPassword', '') as string;
      Logger.debug(TAG, 'getMqttPassword successful');
      return mqttPassword;
    } catch (e) {
      Logger.error(TAG, `getMqttPassword failed, error code: ${e}.`);
      return '';
    }
  }

  public static getMqttUserName(): string {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let mqttUserName = dataPreferences.getSync('mqttUserName', '') as string;
      Logger.debug(TAG, 'getMqttUserName successful');
      return mqttUserName;
    } catch (e) {
      Logger.error(TAG, `getMqttUserName failed, error code: ${e}.`);
      return '';
    }
  }

  public static getIsLogin(): boolean {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let isLogin = dataPreferences.getSync('userIsLogin', false) as boolean;
      Logger.debug(TAG, 'getIsLogin successful');
      return isLogin;
    } catch (e) {
      Logger.error(TAG, `getIsLogin failed, error code: ${e}.`);
      return false;
    }
  }

  // 数据置空
  public static async deleteUserData() {
    try {
      Logger.debug(TAG, 'deleteUserData start');
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userName', '');
      dataPreferences.putSync('userAccount', '');
      dataPreferences.putSync('userPassword', '');
      let historyUriName = dataPreferences.getSync('userAvatar', '') as string;
      if (historyUriName) {
        let filesDir = context.filesDir;
        let historyUri = filesDir + historyUriName;
        let isFileRight = await fileIo.access(historyUri);
        if (isFileRight) {
          await fileIo.unlink(historyUri);
        }
      }
      dataPreferences.putSync('userAvatar', '');
      dataPreferences.putSync('userPhoneNumber', '');
      dataPreferences.putSync('userEmail', '');
      dataPreferences.putSync('userToken', '');
      dataPreferences.putSync('userMqttUrl', '');
      dataPreferences.putSync('userClientId', '');
      dataPreferences.putSync('mqttPassword', '');
      dataPreferences.putSync('mqttUserName', '');
      dataPreferences.putSync('userIsLogin', false);
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteUserData successful');
    } catch (e) {
      Logger.error(TAG, `deleteUserData failed, error code: ${e}.`);
    }
  }

  public static async deleteUserName() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userName', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteUserName successful');
    } catch (e) {
      Logger.error(TAG, `deleteUserName failed, error code: ${e}.`);
    }
  }

  public static async deleteUserAccount() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userAccount', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteUserAccount successful');
    } catch (e) {
      Logger.error(TAG, `deleteUserAccount failed, error code: ${e}.`);
    }
  }

  public static async deleteUserPassword() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userPassword', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteUserPassword successful');
    } catch (e) {
      Logger.error(TAG, `deleteUserPassword failed, error code: ${e}.`);
    }
  }

  public static async deleteUserAvatar() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      let historyUriName = dataPreferences.getSync('userAvatar', '') as string;
      if (historyUriName) {
        let filesDir = context.filesDir;
        let historyUri = filesDir + historyUriName;
        let isFileRight = await fileIo.access(historyUri);
        if (isFileRight) {
          await fileIo.unlink(historyUri);
        }
      }
      dataPreferences.putSync('userAvatar', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteUserAvatar successful');
    } catch (e) {
      Logger.error(TAG, `deleteUserAvatar failed, error code: ${e}.`);
    }
  }

  public static async deleteUserEmail() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userEmail', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteUserEmail successful');
    } catch (e) {
      Logger.error(TAG, `deleteUserEmail failed, error code: ${e}.`);
    }
  }

  public static async deletePhoneNumber() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userPhoneNumber', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deletePhoneNumber successful');
    } catch (e) {
      Logger.error(TAG, `deletePhoneNumber failed, error code: ${e}.`);
    }
  }

  public static async deleteToken() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userToken', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteToken successful');
    } catch (e) {
      Logger.error(TAG, `deleteToken failed, error code: ${e}.`);
    }
  }

  public static async deleteUserMqttUrl() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userMqttUrl', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteUserMqttUrl successful');
    } catch (e) {
      Logger.error(TAG, `deleteUserMqttUrl failed, error code: ${e}.`);
    }
  }

  public static async deleteMqttPassword() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('mqttPassword', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteMqttPassword successful');
    } catch (e) {
      Logger.error(TAG, `deleteMqttPassword failed, error code: ${e}.`);
    }
  }

  public static async deleteMqttUserName() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('mqttUserName', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteMqttUserName successful');
    } catch (e) {
      Logger.error(TAG, `deleteMqttUserName failed, error code: ${e}.`);
    }
  }

  public static async deleteUserClientId() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userClientId', '');
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteUserClientId successful');
    } catch (e) {
      Logger.error(TAG, `deleteUserClientId failed, error code: ${e}.`);
    }
  }

  public static async deleteIsLogin() {
    try {
      let context = getContext();
      let dataPreferences: preferences.Preferences | null = null;
      let options: preferences.Options = { name: CommonConstants.USERDATA };
      dataPreferences = preferences.getPreferencesSync(context, options);
      dataPreferences.putSync('userIsLogin', false);
      await dataPreferences.flush();
      UserDataEvent.UserDataIsChangeEvent();
      Logger.debug(TAG, 'deleteIsLogin successful');
    } catch (e) {
      Logger.error(TAG, `deleteIsLogin failed, error code: ${e}.`);
    }
  }
}