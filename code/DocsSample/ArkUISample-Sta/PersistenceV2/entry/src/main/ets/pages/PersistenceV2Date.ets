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
// [Start persistence_v2_date]
import { PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local, Column, Text, Button, StorageDefaultCreator } from '@kit.ArkUI';
import { contextConstant } from '@kit.AbilityKit';

// 定义包含Date字段的嵌套数据类
@ObservedV2
export class Inner {
  @Trace tag: string = 'inner';
  @Trace nextDate: Date = new Date(0);
}

@ObservedV2
export class Event {
  @Trace name: string = 'event';
  @Trace createdAt: Date = new Date(0);
  @Trace lastLogin: Date = new Date(0);
  @Trace inner: Inner = new Inner();
}

// 为所有嵌套类型注册构造器
const creators = new Map<Class, StorageDefaultCreator<object>>([
  [Class.from<Event>(), () => new Event()],
  [Class.from<Inner>(), () => new Inner()]
]);

@Entry
@ComponentV2
struct PersistenceV2DateExample {
  // 通过globalConnect持久化包含Date字段的Event对象
  @Local stateVar: Event = PersistenceV2.globalConnect<Event>({
    type: Class.from<Event>(),
    key: 'EventDate',
    defaultCreator: () => {
      return new Event();
    },
    areaMode: contextConstant.AreaMode.EL1,
    enableAutoSave: true,
    defaultSubCreators: creators
  })!;

  build() {
    Column(undefined) {
      Text(`name: ${this.stateVar.name}`)
        .fontSize(20)
        .margin(10)
      Text(`createdAt: ${this.stateVar.createdAt.toISOString()}`)
        .fontSize(20)
        .margin(10)
      Text(`lastLogin: ${this.stateVar.lastLogin.toISOString()}`)
        .fontSize(20)
        .margin(10)
      Text(`inner.tag: ${this.stateVar.inner.tag}`)
        .fontSize(20)
        .margin(10)
      Text(`inner.nextDate: ${this.stateVar.inner.nextDate.toISOString()}`)
        .fontSize(20)
        .margin(10)
      // 点击按钮更新所有Date字段和name字段
      Button('update')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.stateVar.createdAt = new Date();
          this.stateVar.lastLogin = new Date();
          this.stateVar.name = 'updated_' + Date.now().toString();
          this.stateVar.inner.nextDate = new Date();
          this.stateVar.inner.tag = 'tag_' + Date.now().toString();
        })
    }
    .width('100%')
  }
}
// [End persistence_v2_date]

@Builder
export function persistenceV2Date(): void {
  NavDestination() {
    PersistenceV2DateExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_date_title'))
}
