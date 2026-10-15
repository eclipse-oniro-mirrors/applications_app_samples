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

// [Start quick_start]
import hilog from '@ohos.hilog';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_WindowRestore]';

@Entry
@Component
struct Index {
  mainWindow: window.Window | undefined;

  aboutToAppear() {
    // 在 EntryAbility.ets 中通过 windowStage.getMainWindowSync() 保存主窗
    this.mainWindow = AppStorage.get('mainWindow_Restore') as window.Window;
  }

  minimizeAndRestore() {
    if (!this.mainWindow) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'Main window is not available.');
      return;
    }
    try {
      // 调用minimize()接口，使主窗进入后台状态
      this.mainWindow.minimize();
      // 设置延时函数，延时5秒钟后对主窗进行恢复
      setTimeout(() => {
        // 调用restore()接口，将主窗口恢复到前台显示
        this.mainWindow?.restore().then(() => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in restoring the window.');
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, TAG, 'Failed to restore the window. Code: %{public}s, message: %{public}s',
            `${err.code}`, `${err.message}`);
        });
      }, 5000);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Failed to minimize and restore the window. Code: %{public}s, message: %{public}s',
        `${err.code}`, `${err.message}`);
    }
  }

  build() {
    Column() {
      Text($r('app.string.minimize_text'))
        .id('minimizeText')
        .fontSize(17)
      Button($r('app.string.minimize_button'))
        .id('minimizeButton')
        .onClick(() => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'Click: Minimize and restore');
          this.minimizeAndRestore();
        })
        .margin({ top: 20 })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}

// [End quick_start]
