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

import { formatResource, localText } from '../autostart/text/LocalizedText';

import { apiResultLabel } from './QueryPresentation';

@Component
export struct ApiCallDetails {
  @Prop supportResult: string = localText('startup_text_0198');
  @Prop statusResult: string = localText('startup_text_0198');
  @Prop errorCode: string = '';
  @Prop errorMessage: string = '';

  build() {
    Column({ space: 12 }) {
      Column({ space: 4 }) {
        Text('isAutoStartupSupported()')
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
        Text(apiResultLabel(this.supportResult))
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      Column({ space: 4 }) {
        Text('getAutoStartupStatusForSelf()')
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
        Text(apiResultLabel(this.statusResult))
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      Text(formatResource('startup_format_aba600cee97e', [String(this.errorCode.length > 0 ? this.errorCode : localText('startup_text_0524'))]))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .wordBreak(WordBreak.BREAK_ALL)
        .width('100%')
      if (this.errorMessage.length > 0) {
        Text(formatResource('startup_format_4e2bb6c8a095', [String(this.errorMessage)]))
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .wordBreak(WordBreak.BREAK_ALL)
          .width('100%')
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}
