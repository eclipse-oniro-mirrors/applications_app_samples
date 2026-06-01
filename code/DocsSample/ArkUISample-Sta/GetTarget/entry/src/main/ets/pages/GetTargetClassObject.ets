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
// [Start getTarget_class_object]
import { Column, Component, Entry, Observed, State, Text, UIUtils } from '@kit.ArkUI';

@Observed
class Info {
  name: string = 'Tom';
}

@Entry
@Component
struct GetTargetClassObjectExample {
  @State info: Info = new Info();
  build() {
    Column() {
      // 传入非Date、Map、Set、Array、interface字面量之外的对象时，不做处理，直接返回传入内容
      Text(`${UIUtils.getTarget(this.info) === this.info}`) // true
    }
  }
}
// [End getTarget_class_object]

@Builder
export function getTargetClassObject(): void {
  NavDestination() {
    GetTargetClassObjectExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.get_target_class_object_title'))
}