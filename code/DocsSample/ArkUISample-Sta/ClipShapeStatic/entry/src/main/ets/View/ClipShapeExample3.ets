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

// [Start ClipShapeExampleC]
// xxx.ets
import { Entry, Component, Column, ColumnOptions, Image, Margin, $r } from '@ohos.arkui.component';
import { RectShape, RectShapeOptions } from '@ohos.arkui.shape';

@Entry
@Component
struct ClipShapeExample {
  build() {
    Column({ space: 15 } as ColumnOptions) {
      // 请将$r('app.media.background')替换为实际资源文件
      Image($r('app.media.background'))
        .clipShape(new RectShape({ width: '200px', height: '200px' } as RectShapeOptions))
        .width('500px').height('400px')

      // 请将$r('app.media.background')替换为实际资源文件
      Image($r('app.media.background'))
        .clipShape(new RectShape({ width: '380px', height: '280px' } as RectShapeOptions))
        .width('500px').height('400px')
    }
    .width('100%')
    .margin({ top: 15 } as Margin)
  }
}
// [End ClipShapeExampleC]