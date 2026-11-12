/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';

const DOMAIN = 0x0000;

@Entry
@Component
struct Index {
  @State message: string | Resource = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('text_message')
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)

        Button($r('app.string.button_start_target_app'))
          .id('button_start_target_app')
          .margin({ top: 20 })
          .onClick(() => {
            const ret = testNapi.forkAndExecute('com.example.agentExtension', 'EntryAbility');
            hilog.info(DOMAIN, 'testTag', 'forkAndExecute ret = %{public}d', ret);
            this.message = ret === 0 ? $r('app.string.message_start_success') : $r('app.string.message_start_failed', ret);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
