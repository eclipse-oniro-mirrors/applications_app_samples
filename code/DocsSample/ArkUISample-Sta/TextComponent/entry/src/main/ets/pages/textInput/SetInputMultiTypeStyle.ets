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

import {
  $r,
  Column,
  ColumnOptions,
  Component,
  Entry,
  NavDestination,
  TextArea,
  TextContentStyle
} from '@kit.ArkUI';
import { ComponentCard } from '../../common/Card';

@Entry
@Component
export struct SetInputMultiTypeStyle {
  build(): void {
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {
        ComponentCard({ title: $r('app.string.SetInputBoxMultiTypeStyle_title_1') }) {
          // [Start textArea_style_default]
          TextArea()
            .style(TextContentStyle.DEFAULT)
          // [End textArea_style_default]
        }

        ComponentCard({ title: $r('app.string.SetInputBoxMultiTypeStyle_title_2') }) {
          // [Start textArea_style_inline]
          TextArea()
            .style(TextContentStyle.INLINE)
          // [End textArea_style_inline]
        }
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.CustomTextInputStyle_title'))
  }
}
