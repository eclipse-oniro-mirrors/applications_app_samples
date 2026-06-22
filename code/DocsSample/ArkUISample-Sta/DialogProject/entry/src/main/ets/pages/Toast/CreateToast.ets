'use static'

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

// [Start toast_create]
import {
  Entry,
  Component,
  Column,
  Button,
  NavDestination,
  FlexAlign,
  UIContext,
  $r
} from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PromptAction } from '@ohos.arkui.UIContext'

const TAG: string = '[Sample_dialogproject]';
const DOMAIN: int = 0xFF00;

@Entry
@Component
export struct CreateToastExample {
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();

  build(): void {
    // [StartExclude toast_create]
    NavDestination() {
      // [EndExclude toast_create]
      Column() {
        Button('Show toast').fontSize(20)
          .onClick((): void => {
            try {
              this.promptAction.showToast({
                message: 'Hello World',
                duration: 2000
              });
            } catch (error) {
              hilog.error(DOMAIN, TAG, '%{public}s', 'showToast args error: %{public}s', error);
            }
          })
      }.height('100%').width('100%').justifyContent(FlexAlign.Center)
      // [StartExclude toast_create]
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.CreateToast_title')替换为实际资源文件，在本示例中该资源文件的value值为"创建即时反馈"
    .title($r('app.string.CreateToast_title'))
    // [EndExclude toast_create]
  }
}
// [End toast_create]