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
import { bundleManager, common } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError, deviceInfo, pasteboard, systemParameterEnhance } from '@kit.BasicServicesKit';
import { inputMethod } from '@kit.IMEKit';
import SettingModel from '../../model/SettingModel';
import Logger from './Logger';

export class ExamHardeningUtil {
  public static async applyHardening(context: common.UIAbilityContext, setting: SettingModel): Promise<void> {
    if (setting.privacyMode) {
      await ExamHardeningUtil.setWindowHardening(context, true);
    }
    if (setting.simpleKeyboard) {
      ExamHardeningUtil.setSimpleKeyboard(true);
    }
    if (setting.clearClipboard) {
      await ExamHardeningUtil.clearPasteboard();
    }
    await ExamHardeningUtil.setWindowMaximize(context, true);
  }

  public static async releaseHardening(context: common.UIAbilityContext, setting: SettingModel): Promise<void> {
    if (setting.privacyMode) {
      await ExamHardeningUtil.setWindowHardening(context, false);
    }
    if (setting.simpleKeyboard) {
      ExamHardeningUtil.setSimpleKeyboard(false);
    }
    await ExamHardeningUtil.setWindowMaximize(context, false);
  }

  private static async setWindowMaximize(context: common.UIAbilityContext, enable: boolean): Promise<void> {
    let currentWindow: window.Window | undefined = undefined;
    try {
      currentWindow = await window.getLastWindow(context);
      if (enable) {
        currentWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER)
      } else {
        currentWindow.maximize(window.MaximizePresentation.EXIT_IMMERSIVE)
      }
      Logger.info('setupImmersiveWindow: setSupportedWindowModes done');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.info(`setupImmersiveWindow: setSupportedWindowModes not supported on this device, code: ${err.code}`);
    }
  }

  // Sets the immersive layout and the privacy mode of the current window, every measure is
  // guarded separately so that one failure does not block the other one.
  private static async setWindowHardening(context: common.UIAbilityContext, enable: boolean): Promise<void> {
    let currentWindow: window.Window | undefined = undefined;
    try {
      currentWindow = await window.getLastWindow(context);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`getLastWindow failed, code: ${err.code}, message: ${err.message}`);
    }
    if (currentWindow === undefined) {
      return;
    }
    try {
      await currentWindow.setWindowPrivacyMode(enable);
      Logger.info(`setWindowPrivacyMode done, enable: ${enable}`);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`setWindowPrivacyMode failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  // Restricts the input method panel to the simple keyboard.
  private static setSimpleKeyboard(enable: boolean): void {
    try {
      inputMethod.setSimpleKeyboardEnabled(enable);
      Logger.info(`setSimpleKeyboardEnabled done, enable: ${enable}`);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`setSimpleKeyboardEnabled failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  // Clears the pasteboard so that no residual data can be pasted into the exam page.
  private static async clearPasteboard(): Promise<void> {
    try {
      await pasteboard.getSystemPasteboard().clearData();
      Logger.info('clearData done, the pasteboard is cleared');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`clearData failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  // Determine whether it is currently in developer mode
  public static isDeveloperModeEnabled(): boolean {
    try {
      let status = systemParameterEnhance.getSync('const.security.developermode.state', '0');
      return status === '1' || status === 'true';
    } catch (err) {
      return false;
    }
  }

  // Determine whether the current environment is a simulator or not
  public static isEmulator(): boolean {
    return deviceInfo.productModel === 'emulator';
  }
}
