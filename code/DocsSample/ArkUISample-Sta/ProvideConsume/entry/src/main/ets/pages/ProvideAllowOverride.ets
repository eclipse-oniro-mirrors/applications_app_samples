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
// [Start ProvideAllowOverride]
import { Button, ClickEvent, Column, Component, Consume, Entry, Provide, Row, Text } from '@kit.ArkUI';
@Component
struct GrandSon {
  // @Consume装饰的变量通过相同的属性名绑定其祖先内的@Provide装饰的变量
  @Consume('reviewVotes') reviewVotes: number;

  build() {
    Column() {
      Text(`reviewVotes(${this.reviewVotes})`) // Text显示10
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick((e: ClickEvent) => {
          this.reviewVotes += 1;
        })
    }
    .width('50%')
  }
}

@Component
struct Child {
  @Provide({ allowOverride: true }) reviewVotes: number = 10;

  build() {
    Row() {
      GrandSon()
    }
  }
}

@Component
struct Parent {
  @Provide({ allowOverride: true }) reviewVotes: number = 20;

  build() {
    Child()
  }
}

@Entry
@Component
struct GrandParent {
  @Provide({ alias: 'reviewVotes' }) reviewVotes: number = 40;

  build() {
    Column() {
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick((e: ClickEvent) => {
          this.reviewVotes += 1;
        })
      Parent()
    }
  }
}
// [End ProvideAllowOverride]

@Builder
export function provideAllowOverride(): void {
  NavDestination() {
    GrandParent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provide_allow_override_title'))
}