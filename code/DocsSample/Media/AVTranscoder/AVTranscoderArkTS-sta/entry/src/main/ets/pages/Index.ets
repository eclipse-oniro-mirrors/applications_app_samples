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
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, RelativeContainer, Progress, ProgressType } from '@ohos.arkui.component'
import { Context, UIContext } from '@ohos.arkui.UIContext'
import { State} from '@ohos.arkui.stateManagement'
import {AVTranscoderDemo} from '../transcoder/AVTranscoderManager'

@Entry
@Component
struct Index {
  private context:Context | undefined = this.getUIContext().getHostContext();
  @State avTranscoder: AVTranscoderDemo = new AVTranscoderDemo(this.context);

  async handleStartTranscoder(): Promise<void> {
    console.info('handleStartTranscoder called');
    try {
      await this.avTranscoder.avTranscoderDemo();
      console.info('avTranscoderDemo completed');
    } catch (error) {
      console.error('avTranscoderDemo error: ' + error);
    }
  }

  build() {
    console.info('Index build method called');
    RelativeContainer() {
      Column() {
        Button('启动转码')
          .onClick((e: ClickEvent) => {
            console.info(`Button put`);
            this.handleStartTranscoder();
          })
          .id('AVTranscoderButton')
        Progress({ value: 0, total: 100, type: ProgressType.Linear }).value(this.avTranscoder.getCurrentProgress())
          .height(50)
          .width('80%')
      }
    }
    .height('100%')
    .width('100%')
  }
}