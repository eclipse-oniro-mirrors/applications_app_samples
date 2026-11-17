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

import { parsePageText } from '../common/PageText';

interface ResultParams {
  json: string;
}

@Entry
@Component
struct Result {
  @State private json: string = '';
  @State private count: number = 0;

  aboutToAppear(): void {
    const params = this.getUIContext().getRouter().getParams() as ResultParams;
    this.json = params.json;
    this.count = parsePageText(this.json).texts.length;
  }

  build() {
    Column({ space: 16 }) {
      Text($r('app.string.result_title'))
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
      Text($r('app.string.result_description'))
        .fontSize(16)
      Text($r('app.string.result_count', this.count))
        .id('textCount')
        .fontSize(16)
      Scroll() {
        Text(this.json)
          .id('pageTextJson')
          .fontSize(16)
          .copyOption(CopyOptions.InApp)
          .width('100%')
      }
      .layoutWeight(1)
      .width('100%')
      .align(Alignment.TopStart)
      Button($r('app.string.back'))
        .id('backToSample')
        .width('100%')
        .onClick(() => { this.getUIContext().getRouter().back(); })
    }
    .padding(24)
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
}
