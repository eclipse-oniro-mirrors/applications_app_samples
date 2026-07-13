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

// [Start toast_showDefaultAndTop]
import {
  Entry,
  Component,
  Column,
  Button,
  TextInput,
  NavDestination,
  FontWeight,
  FlexAlign,
  ColumnOptions,
  $r
} from '@kit.ArkUI';
import promptAction from '@ohos.promptAction';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_dialogproject]';
const DOMAIN: int = 0xFF00;

@Entry
@Component
export struct DefaultAndTopToastExample {
  build(): void {
    // [StartExclude toast_showDefaultAndTop]
    NavDestination() {
      // [EndExclude toast_showDefaultAndTop]
      Column({ space: 10 } as ColumnOptions) {
        TextInput()
        Button('Toast of the DEFAULT type')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick((): void => {
          try {
            this.getUIContext().getPromptAction().showToast({
              message: 'ok, I am DEFAULT toast',
              duration: 2000,
              showMode: promptAction.ToastShowMode.DEFAULT,
              bottom: 80
            });
          } catch (error) {
            hilog.error(DOMAIN, TAG, '%{public}s', 'showToast args error: %{public}s', error);
          }
        })

        Button('Toast of the TOPMOST type')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick((): void => {
          try {
            this.getUIContext().getPromptAction().showToast({
              message: 'ok, I am TOP_MOST toast',
              duration: 2000,
              showMode: promptAction.ToastShowMode.TOP_MOST,
              bottom: 85
            });
          } catch (error) {
            hilog.error(DOMAIN, TAG, '%{public}s', 'showToast args error: %{public}s', error);
          }
        })
      }
      // [StartExclude toast_showDefaultAndTop]
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.DefaultAndTopToast_title')替换为实际资源文件，在本示例中该资源文件的value值为"即时反馈模式对比"
    .title($r('app.string.DefaultAndTopToast_title'))
    // [EndExclude toast_showDefaultAndTop]
  }
}
// [End toast_showDefaultAndTop]