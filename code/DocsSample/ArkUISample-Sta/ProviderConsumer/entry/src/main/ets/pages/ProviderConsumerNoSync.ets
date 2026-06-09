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
// [Start ProviderConsumerNoSync]
import { Button, ClickEvent, Column, ComponentV2, Consumer, Entry, Provider } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Parent {
  @Provider() str1: string = 'hello';

  build() {
    Column() {
      Button(this.str1)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.str1 += '0';
        })
      Child()
    }
    .width('100%')
  }
}

@ComponentV2
struct Child {
  // @Consumer装饰的属性str和Parent组件中@Provider装饰的属性str1名称不同，无法建立双向绑定关系
  @Consumer() str: string = 'world';

  build() {
    Column() {
      Button(this.str)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.str += '0';
        })
    }
    .width('100%')
  }
}
// [End ProviderConsumerNoSync]

@Builder
export function providerConsumerNoSync(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.provider_consumer_no_sync_title'))
}