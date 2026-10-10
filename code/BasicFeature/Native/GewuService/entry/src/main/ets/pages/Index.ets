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

import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';

const DOMAIN = 0xFF00;
const TAG = 'Sample_GewuService';
const DEFAULT_MODEL_PATH = '/data/storage/el2/base/files/qwen2-awq';

@Entry
@Component
struct Index {
  @State modelPath: string = DEFAULT_MODEL_PATH;
  @State message: string = 'What is LLM?';
  @State result: string = 'Click a button to start.';

  private createSession(): void {
    let code: number = testNapi.createSession(this.modelPath);
    this.result = 'createSession error=' + code.toString();
    hilog.info(DOMAIN, TAG, 'createSession error=%{public}d', code);
  }

  private destroySession(): void {
    let code: number = testNapi.destroySession();
    this.result = 'destroySession error=' + code.toString();
    hilog.info(DOMAIN, TAG, 'destroySession error=%{public}d', code);
  }

  private submitRequest(): void {
    let code: number = testNapi.submitRequest(this.message);
    let response: string = testNapi.getResponse();
    this.result = 'submitRequest error=' + code.toString() + '\nresponse=' + response;
    hilog.info(DOMAIN, TAG, 'submitRequest error=%{public}d response=%{public}s', code, response);
  }

  private abortRequest(): void {
    let code: number = testNapi.abortRequest();
    this.result = 'abortRequest error=' + code.toString();
    hilog.info(DOMAIN, TAG, 'abortRequest error=%{public}d', code);
  }

  build() {
    Column() {
      Text('Gewu Service Sample')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 24, bottom: 4 })
      Text('QoS-aware on-device inference acceleration')
        .fontSize(13)
        .fontColor('#666666')
        .margin({ bottom: 16 })

      Scroll() {
        Column({ space: 12 }) {
          Text('Model path')
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
          TextInput({ text: this.modelPath })
            .height(40)
            .onChange((value: string) => {
              this.modelPath = value;
            })

          Text('Request message')
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
          TextInput({ text: this.message })
            .height(40)
            .onChange((value: string) => {
              this.message = value;
            })

          Row({ space: 12 }) {
            Button('Create Session', { type: ButtonType.Capsule })
              .layoutWeight(1)
              .height(40)
              .onClick(() => {
                this.createSession();
              })
            Button('Destroy Session', { type: ButtonType.Capsule })
              .layoutWeight(1)
              .height(40)
              .onClick(() => {
                this.destroySession();
              })
          }
          .width('100%')

          Row({ space: 12 }) {
            Button('Submit Request', { type: ButtonType.Capsule })
              .layoutWeight(1)
              .height(40)
              .onClick(() => {
                this.submitRequest();
              })
            Button('Abort Request', { type: ButtonType.Capsule })
              .layoutWeight(1)
              .height(40)
              .onClick(() => {
                this.abortRequest();
              })
          }
          .width('100%')

          Text('Result')
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
          Text(this.result)
            .fontSize(13)
            .width('100%')
            .padding(10)
            .backgroundColor('#F1F3F5')
            .borderRadius(8)

          Text('Tip: filter hilog with tag "Sample_GewuService" or "DEMO" to view native logs.')
            .fontSize(12)
            .fontColor('#999999')
        }
        .alignItems(HorizontalAlign.Start)
        .padding(16)
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
}
