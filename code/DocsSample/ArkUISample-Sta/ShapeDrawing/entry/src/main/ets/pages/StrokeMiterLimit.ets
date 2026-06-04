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
  Entry,
  Row,
  RowOptions,
  Component,
  Polyline,
  Color,
  LineJoinStyle
} from '@ohos.arkui.component';

@Entry
@Component
export struct StrokeMiterLimit {
  build(): void {
    Row() {
      // [Start stroke_miter_limit]
      Polyline()
        .width(100)
        .height(100)
        .fillOpacity(0)
        .stroke(Color.Red)
        .strokeWidth(10)
        .points([[20, 0], [20, 100], [100, 100]])
        .strokeLineJoin(LineJoinStyle.Miter)
        .strokeMiterLimit(1/Math.sin(45))
      Polyline()
        .width(100)
        .height(100)
        .fillOpacity(0)
        .stroke(Color.Red)
        .strokeWidth(10)
        .points([[20, 0], [20, 100], [100, 100]])
        .strokeLineJoin(LineJoinStyle.Miter)
        .strokeMiterLimit(1.42)
      // [End stroke_miter_limit]
    }
  }
}