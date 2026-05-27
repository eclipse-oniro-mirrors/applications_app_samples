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
// [Start ObjectLinkUnionType]
import { Button, Column, Component, Entry, ObjectLink, Observed, State, Text } from '@kit.ArkUI';

@Observed
class Source {
  public source: int;

  constructor(source: int) {
    this.source = source;
  }
}

@Observed
class Data {
  public data: int;

  constructor(data: int) {
    this.data = data;
  }
}

@Entry
@Component
struct Parent {
  @State count: Source | Data | undefined = new Source(10);

  build() {
    Column() {
      Child({ count: this.count })

      Button('change count property')
        .margin(10)
        .onClick((e) => {
          // 判断count的类型，做属性的更新
          if (this.count instanceof Source) {
            (this.count as Source).source += 1;
          } else if (this.count instanceof Data) {
            (this.count as Data).data += 1;
          } else {
            console.info('count is undefined, cannot change property');
          }
        })

      Button('change count to Source')
        .margin(10)
        .onClick((e) => {
          // 赋值为Source的实例
          this.count = new Source(100);
        })

      Button('change count to Data')
        .margin(10)
        .onClick((e) => {
          // 赋值为Data的实例
          this.count = new Data(100);
        })

      Button('change count to undefined')
        .margin(10)
        .onClick((e) => {
          // 赋值为undefined
          this.count = undefined;
        })
    }.width('100%')
  }
}

@Component
struct Child {
  @ObjectLink count: Source | Data | undefined;

  build() {
    Column() {
      Text(`count is instanceof ${this.count instanceof Source ? 'Source' :
        this.count instanceof Data ? 'Data' : 'undefined'}`)
        .fontSize(30)
        .margin(10)

      Text(`count's property is  ${this.count instanceof Source ? (this.count as Source).source :
        (this.count as Data | undefined)?.data}`).fontSize(15)

    }.width('100%')
  }
}
// [End ObjectLinkUnionType]

@Builder
export function objectLinkUnionType(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.object_link_union_type_title'))
}