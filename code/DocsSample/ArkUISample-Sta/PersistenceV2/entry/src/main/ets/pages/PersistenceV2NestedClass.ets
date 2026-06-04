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
// [Start persistence_v2_nested_class]
import { PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local, Column, Text, Button, StorageDefaultCreator } from '@kit.ArkUI';
import { contextConstant } from '@kit.AbilityKit';

// 定义4层嵌套的数据类
@ObservedV2
export class Inner {
  @Trace age: int = 0;
}

@ObservedV2
export class Person {
  @Trace userName: string = '';
  @Trace inner: Inner = new Inner();
}

@ObservedV2
export class Dept {
  @Trace deptName: string = '';
  @Trace person: Person = new Person();
}

@ObservedV2
export class Company {
  @Trace companyName: string = '';
  @Trace dept: Dept = new Dept();
}

// 为所有层级的嵌套类型注册构造器
const creators = new Map<Class, StorageDefaultCreator<object>>([
  [Class.from<Company>(), () => new Company()],
  [Class.from<Dept>(), () => new Dept()],
  [Class.from<Person>(), () => new Person()],
  [Class.from<Inner>(), () => new Inner()]
]);

@Entry
@ComponentV2
struct PersistenceV2NestedClassExample {
  // 通过globalConnect持久化多层嵌套的Company对象
  @Local stateVar: Company = PersistenceV2.globalConnect<Company>({
    type: Class.from<Company>(),
    key: 'Company',
    defaultCreator: () => {
      return new Company();
    },
    areaMode: contextConstant.AreaMode.EL1,
    enableAutoSave: true,
    defaultSubCreators: creators
  })!;

  build() {
    Column(undefined) {
      Text(`company: ${this.stateVar.companyName}`)
        .fontSize(20)
        .margin(10)
      Text(`dept: ${this.stateVar.dept.deptName}`)
        .fontSize(20)
        .margin(10)
      Text(`person: ${this.stateVar.dept.person.userName}`)
        .fontSize(20)
        .margin(10)
      Text(`inner.age: ${this.stateVar.dept.person.inner.age}`)
        .fontSize(20)
        .margin(10)
      // 点击按钮初始化所有层级的嵌套数据
      Button('init')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.stateVar.companyName = 'MyCompany';
          this.stateVar.dept.deptName = 'Engineering';
          this.stateVar.dept.person.userName = 'Alice';
          this.stateVar.dept.person.inner.age = 30;
        })
      // 点击按钮逐级修改嵌套数据
      Button('modify')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.stateVar.companyName += '_v2';
          this.stateVar.dept.deptName += '_upd';
          this.stateVar.dept.person.userName += '!';
          this.stateVar.dept.person.inner.age += 1;
        })
    }
    .width('100%')
  }
}
// [End persistence_v2_nested_class]

@Builder
export function persistenceV2NestedClass(): void {
  NavDestination() {
    PersistenceV2NestedClassExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_nested_class_title'))
}
