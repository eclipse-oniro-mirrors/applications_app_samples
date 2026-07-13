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
// [Start ConsumeDefaultValue]
import { Button, ClickEvent, Column, Component, Consume, Entry, Observed, Provide, Text, Track, Watch } from '@kit.ArkUI';

interface View {
  num: number;
}

@Observed
class Person {
  @Track info: int = 100;
}

@Entry
@Component
struct Index {
  build() {
    Column() {
      Child()
    }
    .width('100%')
  }
}

@Component
struct Child {
  // @Consume装饰的变量在本地初始化。
  @Consume @Watch('onCountUpdated') count: number = 15;
  @Consume @Watch('onCountUpdated') v: View = { num: 10 } as View;
  @Consume @Watch('onCountUpdated') p: Person = new Person();
  @Consume('a') @Watch('onCountUpdated') message: string = 'Hello, World!';

  onCountUpdated(propName: string): void {
    console.info(`${propName} has changed!`);
  }

  build() {
    Column() {
      Button('Child change count')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.count += 1;
        })
      Text(`Child count ${this.count}`)
        .fontSize(20)
        .margin(10)

      Button('Child change v.num')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.v.num += 2;
        })
      Text(`Child v ${this.v.num}`)
        .fontSize(20)
        .margin(10)

      Button('Child change p.info')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.p.info += 100;
        })
      Text(`Child p.info.userInfo ${this.p.info}`)
        .fontSize(20)
        .margin(10)

      Button('Child change message')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.message += '!';
        })
      Text(`Child count ${this.message}`)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
  }
}
// [End ConsumeDefaultValue]

@Builder
export function consumeDefaultValue(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.consume_default_value_title'))
}