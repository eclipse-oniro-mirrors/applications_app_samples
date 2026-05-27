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
// [Start ObjectLinkLiteralThis]
import { Column, Component, Entry, ObjectLink, Observed, State, Text } from '@kit.ArkUI';
@Observed
class Info {
  count: int = 99;
}

@Component
struct Child {
  @ObjectLink count: Info;

  build() {
    Text(`${this.count.count}`)
  }
}

@Entry
@Component
struct Parent {
  @State propInfo: Info = { count: 0 } as Info;

  build() {
    Column() {
      // 特例：当且仅当字面量为this.xxx结构时，可正常编译通过
      Child({ count: this.propInfo })
    }
  }
}
// [End ObjectLinkLiteralThis]

@Builder
export function objectLinkLiteralThis(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.object_link_literal_this_title'))
}