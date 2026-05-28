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
// [Start ObjectLinkReadOnly]
import { Button, Column, Component, Entry, ObjectLink, Observed, State, Text } from '@kit.ArkUI';

@Observed
class Info {
  count: int;

  constructor(count: int) {
    this.count = count;
  }
}

@Component
struct Child {
  @ObjectLink num: Info;

  build() {
    Column() {
      Text(`num的值: ${this.num.count}`)
        .onClick((e) => {
          // 正确写法，可以更改@ObjectLink装饰变量的成员属性
          this.num.count = 20;
        })
    }
  }
}

@Entry
@Component
struct Parent {
  @State num: Info = new Info(10);

  build() {
    Column() {
      Text(`count的值: ${this.num.count}`)
      Button('click')
        .onClick((e) => {
          // 可以在父组件做整体替换
          this.num = new Info(30);
        })
      Child({num: this.num})
    }
  }
}
// [End ObjectLinkReadOnly]

@Builder
export function objectLinkReadOnly(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.object_link_read_only_title'))
}