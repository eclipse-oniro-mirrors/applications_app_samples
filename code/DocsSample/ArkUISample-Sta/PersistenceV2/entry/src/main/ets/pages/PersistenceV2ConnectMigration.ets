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
// [Start persistence_v2_connect_migration]
import { PersistenceV2, ObservedV2, Trace, Local, Entry, 
  Button, Column, ClickEvent, ComponentV2, Text } from '@kit.ArkUI';

import contextConstant from '@ohos.app.ability.contextConstant';

// 接受序列化失败的回调
PersistenceV2.notifyOnError((key: string, reason: string, msg: string, oldValue?: string) => {
  console.error(`error key: ${key}, reason: ${reason}, message: ${msg}`);
});

@ObservedV2
class Info {
  @Trace userInfo: int = 1;
}

@ObservedV2
class Person {
  @Trace userName: string = 'John';
  userId: int = 1;
  @Trace info: Info = new Info();
}

// 用于判断是否完成数据迁移的辅助数据
@ObservedV2
class StorageState {
  @Trace isCompleteMoving: boolean = false;
}

function move() {
  let movingState =
    PersistenceV2.globalConnect<StorageState>({ type: Class.from<StorageState>(), defaultCreator: () => new StorageState() })!;
  if (!movingState.isCompleteMoving) {
    let p: Person = PersistenceV2.connect<Person>(
      Class.from<Person>(),
      'Person',
      (): Person => {
        return new Person();
      })!;
    PersistenceV2.remove('Person');

    let p1 = PersistenceV2.globalConnect<Person>({
      type: Class.from<Person>(),
      key: 'Person',
      defaultCreator: (): Person => p,
      areaMode: contextConstant.AreaMode.EL1 // EL1-EL5代表5种加密等级。
    })!;
    // 将迁移标志设置为true
    movingState.isCompleteMoving = true;
  }
}

@Entry
@ComponentV2
struct PersistenceV2ConnectMigrationExample {
  // 调用globalConnect存储key为Person的对象，并返回。
  @Local cp1: Person = PersistenceV2.globalConnect<Person>({
    type: Class.from<Person>(),
    key: 'Person',
    defaultCreator: (): Person => {
      return new Person();
    },
    areaMode: contextConstant.AreaMode.EL1 // EL1-EL5代表5种加密等级。
  })!;
  @Local refresh: number = 0;
  // 在ArkTS-Sta中，全局的逻辑代码不会默认执行。开发者可将需要执行的逻辑代码移至static代码块中，以达到与ArkTS-Dyn一样的效果。
  static {
    move();
  }

  build() {
    Column() {
      Button('Change userId userName userInfo')
        .onClick((e: ClickEvent) => {
          this.cp1.userId++;
          this.cp1.userName += 'A';
          this.cp1.info.userInfo += 100;
          console.info(`cp1 userId ${this.cp1.userId}`);
        })
      Text(`userName: ${this.cp1.userName}`) // Person类由@ObservedV2装饰，且该属性由@Trace装饰，所以可观测刷新。
      Text(`userId: ${this.cp1.userId}`) // Person类由@ObservedV2装饰，但该属性非@Trace装饰，所以刷新不可观测。
      Text(`userInfo: ${this.cp1.info.userInfo}`) // Info类由@ObservedV2装饰，且userInfo属性由@Track装饰，所以可观测刷新。

      Text(`save key Person userId: ${this.cp1.userId} refresh: ${this.refresh}`)
      // 点击Text组件后，由于refresh改变，所以引起Text组件刷新，进而使得此处userId刷新。
        .onClick((e: ClickEvent) => {
          this.cp1.userId++;
          PersistenceV2.save('Person'); // 调用save存储该对象。
          this.refresh += 1;
        })
        .fontSize(25)
    }
    .width('100%')
    .height('100%')
  }
}
// [End persistence_v2_connect_migration]

@Builder
export function persistenceV2ConnectMigration(): void {
  NavDestination() {
    PersistenceV2ConnectMigrationExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_connect_migration_title'))
}
