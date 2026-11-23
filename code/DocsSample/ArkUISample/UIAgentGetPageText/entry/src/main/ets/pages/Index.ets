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

import type { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { collectPageText } from '@sample/uiagentgetpagetext';
import type { PageTextSnapshot } from '@sample/uiagentgetpagetext';
import { PageTextResultView } from '../components/PageTextResultView';

@Entry
@Component
struct Index {
  @State private changed: boolean = false;
  @State private inputText: string = '';
  @State private errorText: string = '';
  @State private showingResult: boolean = false;
  @State private json: string = '';
  @State private textCount: number = 0;

  private collect(): void {
    try {
      // 保持同步调用：getUIContext() 属于当前页面，且该调用要求在 UI 线程执行。
      const snapshot: PageTextSnapshot = collectPageText(this.getUIContext());
      this.errorText = '';
      this.json = snapshot.json;
      this.textCount = snapshot.textCount;
      // 仅在采集完成后替换示例视图，避免将结果 JSON 纳入快照。
      this.showingResult = true;
    } catch (error) {
      const businessError: BusinessError = error as BusinessError;
      this.errorText = businessError.code === undefined ? businessError.message :
        `${businessError.code}: ${businessError.message}`;
      hilog.error(0xFF00, 'Sample_UIAgentGetPageText', '%{public}s', this.errorText);
    }
  }

  private closeResult(): void {
    this.showingResult = false;
    this.json = '';
    this.textCount = 0;
  }

  onBackPress(): boolean {
    if (this.showingResult) {
      this.closeResult();
      return true;
    }
    return false;
  }

  @Builder
  sampleContent() {
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
          .onChange((value: string): void => { this.inputText = value; })
        Text($r('app.string.unicode_text'))
          .id('unicodeText')
          .fontSize(18)
        Button($r('app.string.update'))
          .id('updateText')
          .width('100%')
          .onClick((): void => { this.changed = !this.changed; })
        Button($r('app.string.collect'))
          .id('collectText')
          .width('100%')
          .onClick((): void => { this.collect(); })
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

  build() {
    if (this.showingResult) {
      PageTextResultView({
        json: this.json,
        count: this.textCount,
        onClose: (): void => { this.closeResult(); }
      })
    } else {
      this.sampleContent()
    }
  }
}
