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

// [Start rotation]
import {
  Entry,
  Component,
  Stack,
  Color,
  Image,
  $r,
  Position
} from '@kit.ArkUI';

@Entry
@Component
struct rotation {
  build() {
    Stack() {
      // 请将$r('app.media.tree')替换为实际资源文件
      Image($r('app.media.tree'))
        .position({ x: 0, y: 0 } as Position)
        .size({ width: 100, height: 100 })
        .id('image1')
    }
    .backgroundColor(Color.White)
    .size({ width: '100%', height: '100%' })
  }
}

// [End rotation]
