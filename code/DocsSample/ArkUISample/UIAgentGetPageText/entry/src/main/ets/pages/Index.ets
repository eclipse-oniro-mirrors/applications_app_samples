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

import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getPageText } from 'libpagetext.so';
import { parsePageText } from '../common/PageText';

@Entry
@Component
struct Index {
  @State private changed: boolean = false;
  @State private inputText: string = '';
  @State private errorText: string = '';

  private collect(): void {
    try {
      // Keep this synchronous: getUIContext() belongs to this page and the call requires the UI thread.
      const json = getPageText(this.getUIContext());
      parsePageText(json);
      this.errorText = '';
      // Navigate only AFTER collection, so the result view is not included in the captured page text.
      this.getUIContext().getRouter().pushUrl({ url: 'pages/Result', params: { json: json } })
        .catch((error: BusinessError) => {
          this.errorText = `${error.code}: ${error.message}`;
        });
    } catch (error) {
      const businessError = error as BusinessError;
      this.errorText = businessError.code === undefined ? businessError.message :
        `${businessError.code}: ${businessError.message}`;
      hilog.error(0xFF00, 'Sample_UIAgentGetPageText', '%{public}s', this.errorText);
    }
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text($r('app.string.title'))
          .fontSize(26)
          .fontWeight(FontWeight.Bold)
        Text($r('app.string.description'))
          .fontSize(16)
        Text(this.changed ? $r('app.string.updated_text') : $r('app.string.original_text'))
          .id('sampleText')
          .fontSize(22)
          .width('100%')
          .padding(16)
          .backgroundColor('#E8F0FE')
          .borderRadius(12)
        TextInput({ text: this.inputText, placeholder: $r('app.string.input_hint') })
          .id('sampleInput')
          .onChange((value: string) => { this.inputText = value; })
        Text($r('app.string.unicode_text'))
          .id('unicodeText')
          .fontSize(18)
        Button($r('app.string.update'))
          .id('updateText')
          .width('100%')
          .onClick(() => { this.changed = !this.changed; })
        Button($r('app.string.collect'))
          .id('collectText')
          .width('100%')
          .onClick(() => { this.collect(); })
        if (this.errorText.length > 0) {
          Text(this.errorText)
            .id('collectionError')
            .fontColor('#B3261E')
        }
      }
      .width('100%')
      .padding(24)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.TopStart)
  }
}
