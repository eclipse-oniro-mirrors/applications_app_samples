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
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';
import { inputMethod } from '@kit.IMEKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_Assessment]';

export class ExamHardeningUtil {
  // 进入评估页面时启用全部加固措施
  public static async applyHardening(context: common.UIAbilityContext): Promise<void> {
    await ExamHardeningUtil.setWindowHardening(context, true);
    ExamHardeningUtil.setSimpleKeyboard(true);
    await ExamHardeningUtil.clearPasteboard();
  }

  // 退出评估页面时恢复窗口形态与输入法，并再次清空剪贴板
  public static async releaseHardening(context: common.UIAbilityContext): Promise<void> {
    await ExamHardeningUtil.setWindowHardening(context, false);
    ExamHardeningUtil.setSimpleKeyboard(false);
    await ExamHardeningUtil.clearPasteboard();
  }

  // 两项窗口措施分别捕获异常，单项失败不影响另一项生效
  private static async setWindowHardening(context: common.UIAbilityContext, enable: boolean): Promise<void> {
    let currentWindow: window.Window | undefined = undefined;
    try {
      currentWindow = await window.getLastWindow(context);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, '%{public}s', `getLastWindow failed, code: ${err.code}, message: ${err.message}`);
    }
    if (currentWindow === undefined) {
      return;
    }
    try {
      await currentWindow.setWindowLayoutFullScreen(enable);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, '%{public}s',
        `setWindowLayoutFullScreen failed, code: ${err.code}, message: ${err.message}`);
    }
    try {
      await currentWindow.setWindowPrivacyMode(enable);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, '%{public}s',
        `setWindowPrivacyMode failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  // 输入法面板切换为简单键盘，仅保留基础按键，收起候选栏与扩展功能入口
  private static setSimpleKeyboard(enable: boolean): void {
    try {
      inputMethod.setSimpleKeyboardEnabled(enable);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, '%{public}s',
        `setSimpleKeyboardEnabled failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  // 清空剪贴板，避免残留数据被粘贴进评估页面
  private static async clearPasteboard(): Promise<void> {
    try {
      await pasteboard.getSystemPasteboard().clearData();
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, '%{public}s', `clearData failed, code: ${err.code}, message: ${err.message}`);
    }
  }
}
// [End assessment_hardening]
