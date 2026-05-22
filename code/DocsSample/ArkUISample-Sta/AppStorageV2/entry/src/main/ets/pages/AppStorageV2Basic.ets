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
// [Start AppStorageV2Basic]
import { AppStorageV2, Button, ClickEvent, Column, Component, ComponentV2, Divider, Entry, Link, Local, LocalStorage, LocalStorageLink, ObservedV2, PersistentStorage, Row, State, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class Message {
  @Trace userID: number;
  userName: string;

  constructor(userID?: number, userName?: string) {
    this.userID = userID ?? 1;
    this.userName = userName ?? 'Jack';
  }
}

const IMessageType = Class.from<Message>();

@Entry
@ComponentV2
struct Index {
  // 使用connect在AppStorageV2中创建一个ttype为Message的Class的对象
  // 修改connect的返回值即可同步回AppStorageV2
  @Local message: Message = AppStorageV2.connect<Message>(IMessageType, () => new Message())!;

  build() {
    Column() {
      // 修改@Trace装饰的类属性，UI能同步刷新
      Button(`Index userID: ${this.message.userID}`)
        .onClick((e: ClickEvent) => {
          this.message.userID += 1;
        })
      // 修改非@Trace装饰的类属性，UI不会同步刷新，但修改的类属性已同步回AppStorageV2
      Button(`Index userName: ${this.message.userName}`)
        .onClick((e: ClickEvent) => {
          this.message.userName += 'suf';
        })
      // remove keyOrType IMessageType, 会从AppStorageV2中删除keyOrType为Message的Class的对象
      // remove之后，修改父组件的userId，子组件能同步变化，因为remove只是从AppStorageV2删除，不会影响组件中已存在的数据
      Button('remove keyOrType: IMessageType')
        .onClick((e: ClickEvent) => {
          AppStorageV2.remove(IMessageType);
        })
      // connect ttype IMessageType, 会从AppStorageV2中添加ttype为Message的Class的对象
      // remove之后，重新添加，修改父子组件的userID，可以发现数据已经不同步，子组件重新connect之后，数据一致
      Button('connect ttype: IMessageType')
        .onClick((e: ClickEvent) => {
          this.message = AppStorageV2.connect<Message>(IMessageType, () => new Message(5, 'Rose'))!;
        })
      Divider()
      Child()
    }
    .width('100%')
    .height('100%')
  }
}

@ComponentV2
struct Child {
  // 使用connect在AppStorageV2中取出一个ttype为Message的Class的对象，该对象已在父组件中创建
  @Local message: Message = AppStorageV2.connect<Message>(IMessageType, () => new Message())!;
  @Local name: string = this.message.userName;

  build() {
    Column() {
      // 修改@Trace装饰的类属性，UI同步刷新，父组件能感知该变化
      Button(`Child userID: ${this.message.userID}`)
        .onClick((e: ClickEvent) => {
          this.message.userID += 5;
        })
      // 修改父组件中的userName属性，点击name可以同步父组件的类属性修改
      Button(`Child name: ${this.name}`)
        .onClick((e: ClickEvent) => {
          this.name = this.message.userName;
        })
      // remove keyOrType IMessageType，会从AppStorageV2中删除keyOrType为Message的Class的对象
      Button('remove keyOrType: IMessageType')
        .onClick((e: ClickEvent) => {
          AppStorageV2.remove(IMessageType);
        })
      // connect ttype IMessageType，会从AppStorageV2中添加ttype为Message的Class的对象
      Button('connect ttype: IMessageType')
        .onClick((e: ClickEvent) => {
          this.message = AppStorageV2.connect<Message>(IMessageType, () => new Message(10, 'Lucy'))!;
        })
    }
    .width('100%')
    .height('100%')
  }
}

// [End AppStorageV2Basic]

@Builder
export function appStorageV2Basic(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.app_storage_v2_basic_title'))
}