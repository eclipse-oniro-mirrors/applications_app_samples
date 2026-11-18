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
import { common } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';
import { inputMethod } from '@kit.IMEKit';
import Logger from '../../common/utils/Logger';

/**
 * Application side hardening of the assessment scenario.
 *
 * The assessment service restricts part of the system capabilities, while the window form,
 * the capture of the application window, the pasteboard and the input method panel are not
 * covered by the service. The exam application hardens them by itself when the exam page
 * appears, and restores them when the exam page disappears.
 */
export class ExamHardeningUtil {
  /**
   * Applies every hardening measure, it is called when the exam page appears.
   *
   * @param context context of the UIAbility that enters assessment mode.
   * @returns the promise that is resolved after every measure has been attempted.
   */
  public static async applyHardening(context: common.UIAbilityContext): Promise<void> {
    await ExamHardeningUtil.setWindowHardening(context, true);
    ExamHardeningUtil.setSimpleKeyboard(true);
    await ExamHardeningUtil.clearPasteboard();
  }

  /**
   * Restores the window form and the input method, it is called when the exam page disappears.
   *
   * @param context context of the UIAbility that exits assessment mode.
   * @returns the promise that is resolved after every measure has been attempted.
   */
  public static async releaseHardening(context: common.UIAbilityContext): Promise<void> {
    await ExamHardeningUtil.setWindowHardening(context, false);
    ExamHardeningUtil.setSimpleKeyboard(false);
    await ExamHardeningUtil.clearPasteboard();
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
      await currentWindow.setWindowLayoutFullScreen(enable);
      Logger.info(`setWindowLayoutFullScreen done, enable: ${enable}`);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`setWindowLayoutFullScreen failed, code: ${err.code}, message: ${err.message}`);
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
}
