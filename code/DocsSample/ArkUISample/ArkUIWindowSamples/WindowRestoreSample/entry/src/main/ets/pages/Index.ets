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
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

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
      console.error('Main window is not available.');
      return;
    }
    try {
      // 调用minimize()接口，使主窗最小化
      this.mainWindow.minimize();
      // 设置延时函数，延时5秒钟后对主窗进行恢复
      setTimeout(() => {
        // 调用restore()接口，将主窗口从最小化状态恢复到前台显示
        this.mainWindow?.restore().then(() => {
          console.info('Succeeded in restoring the window.');
        }).catch((err: BusinessError) => {
          console.error(`Failed to restore the window. Code is ${err.code}, message is ${err.message}`);
        });
      }, 5000);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      console.error(`Failed to minimize and restore the window. Code is ${err.code}, message is ${err.message}`);
    }
  }

  build() {
    Column() {
      Text('Minimize and auto restore')
        .fontSize(17)
      Button('Minimize and restore')
        .onClick(() => {
          console.info('Click: Minimize and restore');
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
