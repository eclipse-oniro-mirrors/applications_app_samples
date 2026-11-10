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
//[Start save the UIContext]
import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { fileIo } from '@kit.CoreFileKit';

export default class EntryAbility extends UIAbility {
  onWindowStageCreate(windowStage: window.WindowStage): void {
    try {
      fileIo.rmdirSync(this.context.cacheDir + '/web/Cache');
    } catch (err) {
      console.error(`Failed to remove web cache: ${err}`);
    }

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err && err.code) {
        return;
      }

      let mainWindow = windowStage.getMainWindowSync();
      if (mainWindow) {
        // 保存UIContext， 在后续的同层渲染绘制中使用。
        AppStorage.setOrCreate<UIContext>('UIContext', mainWindow.getUIContext());
      } else {
        console.error('Failed to get the main window');
      }
    });
  }

  // ... 其他需要重写的方法 ...
}
//[End save the UIContext]