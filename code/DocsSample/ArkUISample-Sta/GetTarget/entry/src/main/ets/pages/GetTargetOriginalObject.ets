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

import { NavDestination, $r } from '@kit.ArkUI';
// [Start getTarget_original_object]
import { Button, ClickEvent, Column, Component, Entry, State, Text, UIUtils } from '@kit.ArkUI';

interface Info {
  name: string;
}

@Entry
@Component
struct GetTargetOriginalObjectExample {
  @State info: Info = { name: 'Tom' } as Info;

  build() {
    Column() {
      Text(`info.name: ${this.info.name}`)
      Button(`更改包装后对象的属性`)
        .onClick((e: ClickEvent) => {
          this.info.name = 'Alice'; // Text组件能够刷新
        })
      Button(`更改原始对象的属性`)
        .onClick((e: ClickEvent) => {
          let rawInfo: Info = UIUtils.getTarget(this.info);
          rawInfo.name = 'Bob'; // Text组件不能刷新
        })
    }
  }
}
// [End getTarget_original_object]

@Builder
export function getTargetOriginalObject(): void {
  NavDestination() {
    GetTargetOriginalObjectExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.get_target_original_object_title'))
}