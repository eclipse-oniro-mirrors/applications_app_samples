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

import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default class EntryAbility extends UIAbility {
  private sampleWindow: window.Window | undefined = undefined;

  private configureWindow(windowStage: window.WindowStage): void {
    try {
      this.sampleWindow = windowStage.getMainWindowSync();
      AppStorage.setOrCreate('sampleKeyboardVisible', false);
      this.sampleWindow.on('keyboardHeightChange', (height: number): void => {
        AppStorage.setOrCreate('sampleKeyboardVisible', height > 0);
      });
    } catch (error) {
      hilog.warn(0xF811, 'PreviewStyleJS', 'Keyboard visibility listener is unavailable.');
    }
  }

  onWindowStageDestroy(): void {
    if (this.sampleWindow !== undefined) {
      this.sampleWindow.off('keyboardHeightChange');
      this.sampleWindow = undefined;
    }
    AppStorage.setOrCreate('sampleKeyboardVisible', false);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    this.configureWindow(windowStage);
    windowStage.loadContent('pages/Index', (error): void => {
      if (error.code) {
        hilog.error(0xF811, 'PreviewStyleJS', 'Failed to load page: %{public}d', error.code);
      }
    });
  }
}
