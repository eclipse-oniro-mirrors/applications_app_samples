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
// [Start persistence_v2_connect_global_connect]
import { PersistenceV2, ObservedV2, Trace, Local, Entry, 
  Button, Column, ClickEvent, ComponentV2, Text, ConnectOptions } from '@kit.ArkUI';

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

@Entry
@ComponentV2
struct PersistenceV2ConnectGlobalConnectExample {
  // 调用globalConnect存储key为Person的对象，并返回。
  @Local cp1: Person = PersistenceV2.globalConnect<Person>({
    type: Class.from<Person>(),
    key: 'Person',
    defaultCreator: (): Person => {
      return new Person();
    },
    areaMode: contextConstant.AreaMode.EL1, // EL1-EL5代表5种加密等级。
    enableAutoSave: false  // 不自动持久化存储，需要开发者使用save接口手动持久化存储。
  })!;

  @Local cp2: Person = PersistenceV2.connect<Person>(
    Class.from<Person>(),
    'Person1',
    (): Person => {
      return new Person();
    }, {
      enableAutoSave: true, // 持久化存储
    }
  )!;

  options: ConnectOptions<Person> =
    { type: Class.from<Person>(), key: 'Person2', defaultCreator: () => new Person(), areaMode: contextConstant.AreaMode.EL1, enableAutoSave: true} as ConnectOptions<Person>;
  @Local refresh: number = 0;

  build() {
    Column() {
      Button('Change cp1 userId userName userInfo')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.cp1.userId++;
          this.cp1.userName += 'A';
          this.cp1.info.userInfo += 100;
          console.info(`cp1 userId ${this.cp1.userId}`);
        })
      Text(`userName: ${this.cp1.userName}`) // Person类由@ObservedV2装饰，且该属性由@Trace装饰，所以可观测刷新。
        .fontSize(20)
        .margin(10)
      Text(`userId: ${this.cp1.userId}`) // Person类由@ObservedV2装饰，但该属性非@Trace装饰，所以刷新不可观测。
        .fontSize(20)
        .margin(10)
      Text(`userInfo: ${this.cp1.info.userInfo}`) // Info类由@ObservedV2装饰，且userInfo属性由@Track装饰，所以可观测刷新。
        .fontSize(20)
        .margin(10)

      Button('Change cp2 userId userName userInfo')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.cp2.userId++;
          this.cp2.userName += 'A';
          this.cp2.info.userInfo += 100;
          console.info(`cp2 userId ${this.cp2.userId}`);
        })
      Text(`userName: ${this.cp2.userName}`) // Person类由@ObservedV2装饰，且该属性由@Trace装饰，所以可观测刷新。
        .fontSize(20)
        .margin(10)
      Text(`userId: ${this.cp2.userId}`) // Person类由@ObservedV2装饰，但该属性非@Trace装饰，所以刷新不可观测。
        .fontSize(20)
        .margin(10)
      Text(`userInfo: ${this.cp2.info.userInfo}`) // Info类由@ObservedV2装饰，且userInfo属性由@Track装饰，所以可观测刷新。
        .fontSize(20)
        .margin(10)

      Button(`save key Person userId: ${this.cp1.userId} refresh: ${this.refresh}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 点击Button组件后，由于refresh改变，所以引起Button组件刷新，进而使得此处userId刷新。
          this.cp1.userId++;
          PersistenceV2.save('Person'); // 调用save存储该对象。
          this.refresh += 1;
        })

      Button(`All keys: ${PersistenceV2.keys()} refresh: ${this.refresh}`)
        .width(300)
        .margin(10)
        .onClick(() => {
          this.refresh += 1;
        })

      Button('Remove key Person: ' + 'refresh: ' + this.refresh)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          // 在PersistenceV2中删除keyorType为Person的对象。
          PersistenceV2.remove('Person');
          this.refresh += 1;
        })

      Button('globalConnect key Person2: ' + 'refresh: ' + this.refresh)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.cp1 = PersistenceV2.globalConnect<Person>(this.options)!;
          this.refresh += 1;
        })
    }
    .width('100%')
    .height('100%')
  }
}
// [End persistence_v2_connect_global_connect]

@Builder
export function persistenceV2ConnectGlobalConnect(): void {
  NavDestination() {
    PersistenceV2ConnectGlobalConnectExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_connect_global_title'))
}
