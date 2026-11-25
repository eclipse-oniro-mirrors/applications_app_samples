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
// [Start assessment_hardening]
import { common } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError, deviceInfo, pasteboard, settings } from '@kit.BasicServicesKit';
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
    try {
      let currentWindow = await window.getLastWindow(context);
      let systemBarName: Array<'status' | 'navigation'> = [];
      if (enable) {
        currentWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
      } else {
        systemBarName = ['status', 'navigation'];
        currentWindow.maximize(window.MaximizePresentation.EXIT_IMMERSIVE)
      }
      currentWindow.setWindowSystemBarEnable(systemBarName);
      Logger.info('setupImmersiveWindow: setSupportedWindowModes done');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.info(`setupImmersiveWindow: setSupportedWindowModes not supported on this device, code: ${err.code}`);
    }
  }

  // Sets the immersive layout and the privacy mode of the current window, every measure is
  // guarded separately so that one failure does not block the other one.
  private static async setWindowHardening(context: common.UIAbilityContext, enable: boolean): Promise<void> {
    try {
      let currentWindow = await window.getLastWindow(context);
      await currentWindow.setWindowPrivacyMode(enable);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`setWindowHardening failed, code: ${err.code}, message: ${err.message}`);
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
  public static isDeveloperModeEnabled(context: common.UIAbilityContext): boolean {
    try {
      const hdcStatus =
        settings.getValueSync(context, 'HDC_STATUS', 'unknown', settings.domainName.DEVICE_SHARED);
      return hdcStatus === 'true';
    } catch (error) {
      return false;
    }
  }

  // Determine whether the current environment is a simulator or not
  public static isEmulator(): boolean {
    return deviceInfo.productModel === 'emulator';
  }
}
// [End assessment_hardening]