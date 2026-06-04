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
  Builder,
  Column,
  ColumnOptions,
  Component,
  Entry,
  ForEach,
  NavDestination,
  Scroll,
  TextInput
} from '@kit.ArkUI';
import { ComponentCard } from '../../common/Card';

@Entry
@Component
export struct KeyboardAvoid {
  placeHolderArr: string[] = ['1', '2', '3', '4', '5', '6', '7'];

  build(): void {
    Scroll() {
      Column() {
        ForEach(this.placeHolderArr, (placeholder: string) => {
          TextInput({ placeholder: 'TextInput ' + placeholder })
            .margin(30)
            // [StartExclude keyboard_avoid]
            .id(placeholder)
          // [EndExclude keyboard_avoid]
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}

// [End keyboard_avoid]

@Builder
export function KeyboardAvoidance(): void {
  NavDestination() {
    Column({ space: 12 } as ColumnOptions) {
      ComponentCard({ title: $r('app.string.KeyboardAvoidance_title') }) {
        Column({ space: 12 } as ColumnOptions) {
          KeyboardAvoid()
        }
      }
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12 })
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.KeyboardAvoidance_title'))
}
