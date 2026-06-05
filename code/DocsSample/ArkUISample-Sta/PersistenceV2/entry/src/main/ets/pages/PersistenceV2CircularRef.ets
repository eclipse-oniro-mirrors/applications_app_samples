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
// [Start persistence_v2_circular_ref]
import { PersistenceV2, ObservedV2, Trace, Entry, ComponentV2, Local, Column, Text, Button, StorageDefaultCreator } from '@kit.ArkUI';
import { contextConstant } from '@kit.AbilityKit';

// 定义包含循环引用的Node类，parent可指向自身
@ObservedV2
export class Node {
  @Trace name: string = '';
  @Trace value: int = 0;
  @Trace parent: Node | undefined = undefined;
}

// 为Node类型注册构造器
const creators = new Map<Class, StorageDefaultCreator<object>>([
  [Class.from<Node>(), () => new Node()]
]);

@Entry
@ComponentV2
struct PersistenceV2CircularRefExample {
  // 通过globalConnect持久化包含循环引用的Node对象
  @Local stateVar: Node = PersistenceV2.globalConnect<Node>({
    type: Class.from<Node>(),
    key: 'NodeCircular',
    defaultCreator: () => {
      let root = new Node();
      root.name = 'root';
      root.value = 1;
      root.parent = root; // 设置自引用，演示循环引用的持久化
      return root;
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
      Text(`value: ${this.stateVar.value}`)
        .fontSize(20)
        .margin(10)
      if (this.stateVar.parent !== undefined) {
        Text(`parent.name: ${this.stateVar.parent!.name}`)
          .fontSize(20)
          .margin(10)
        Text(`parent === self: ${this.stateVar.parent === this.stateVar}`)
          .fontSize(20)
          .margin(10)
      } else {
        Text(`parent: undefined`)
          .fontSize(20)
          .margin(10)
      }
      // 点击按钮将parent设为自身引用并修改name和value
      Button('set self-ref')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.stateVar.parent = this.stateVar;
          this.stateVar.name = 'root_' + Date.now().toString();
          this.stateVar.value += 1;
        })
      // 点击按钮清除循环引用
      Button('clear ref')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.stateVar.parent = undefined;
        })
    }
    .width('100%')
  }
}
// [End persistence_v2_circular_ref]

@Builder
export function persistenceV2CircularRef(): void {
  NavDestination() {
    PersistenceV2CircularRefExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistence_v2_circular_ref_title'))
}
