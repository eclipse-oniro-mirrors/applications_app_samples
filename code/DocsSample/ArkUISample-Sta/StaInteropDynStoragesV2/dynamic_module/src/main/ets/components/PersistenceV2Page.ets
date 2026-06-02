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

// [Start StaDynStorageV2PersistenceMainPage]
// dynamic_module/src/main/ets/components/PersistenceV2Page.ets
import { PersistenceV2, Type } from '@kit.ArkUI';

// 接受序列化失败的回调
PersistenceV2.notifyOnError((key: string, reason: string, msg: string) => {
  console.error(`error key: ${key}, reason: ${reason}, message: ${msg}`);
});

// PersistenceV2存储的数据模型
@ObservedV2
export class DynDataModelChild {
  @Trace canTraceProp: number = 0;
  normalProp: number = 10;

  constructor(canTraceProp?: number, normalProp?: number) {
    this.canTraceProp = canTraceProp ?? 0;
    this.normalProp = normalProp ?? 10;
  }
}

@ObservedV2
export class DynDataModel {
  // 对于复杂对象需要@Type修饰，确保序列化成功
  @Type(DynDataModelChild)
  @Trace dynDataModelChild: DynDataModelChild = new DynDataModelChild();
}

// 对外接口，对ArkTS-Dyn模块canTraceProp的值进行累加
// 如果ArkTS-Dyn模块的PersistenceV2中无key为DynDataModel的DynDataModel对象，则创建该对象
// 反之则获取该对象并与sample关联，返回sample的canTraceProp给调用者
export function canTracePropPlusInDynamic(): number {
  const sample = PersistenceV2.connect(DynDataModel, 'DynDataModel', () => new DynDataModel())!;
  sample.dynDataModelChild.canTraceProp++;
  return sample.dynDataModelChild.canTraceProp;
}

// 对外接口，对ArkTS-Dyn模块normalProp的值进行累加
// 如果ArkTS-Dyn模块的PersistenceV2中无key为DynDataModel的DynDataModel对象，则创建该对象
// 反之则获取该对象并与sample关联，返回sample的normalProp给调用者
// ArkTS-Dyn模块页面不刷新，但是normalProp值改变了
export function normalPropPlusInDynamic(): number {
  const sample = PersistenceV2.connect(DynDataModel, 'DynDataModel', () => new DynDataModel())!;
  sample.dynDataModelChild.normalProp++;
  return sample.dynDataModelChild.normalProp;
}

// 对外接口，实现调用ArkTS-Dyn模块的PersistenceV2.connect接口
export function connectInDynamic(): DynDataModel {
  return PersistenceV2.connect(DynDataModel, 'DynDataModel', () => new DynDataModel())!;
}

// 对外接口，实现调用ArkTS-Dyn模块的PersistenceV2.save接口
export function saveInDynamic(): void {
  PersistenceV2.save(DynDataModel);
}

// 对外接口，实现调用ArkTS-Dyn模块的PersistenceV2.remove接口
export function removeInDynamic(): void {
  PersistenceV2.remove(DynDataModel);
}

// 对外接口，实现调用ArkTS-Dyn模块的PersistenceV2.keys接口
export function keysInDynamic(): string[] {
  const result = PersistenceV2.keys();
  return result;
}

@ComponentV2
export struct PersistenceV2Page {
  // 在PersistenceV2中创建一个key为DynDataModel的键值对（如果存在，则返回PersistenceV2中的数据），并且和localVar关联
  // 对于需要换connect对象的localVar属性，需要加@Local修饰（不建议对属性换connect的对象）
  @Local localVar: DynDataModel = PersistenceV2.connect(DynDataModel, 'DynDataModel', () => new DynDataModel())!;
  @Local keys: string[] = PersistenceV2.keys();

  build() {
    Column() {
      Divider()
        .margin(10)

      Text('This is ArkTS-Dyn part')
        .fontSize(20)
        .margin(10)

      // 在ArkTS-Sta模块调用connect接口重连后，重新与localVar关联，页面数据刷新
      Button('refresh data')
        .margin(10)
        .onClick(() => {
          this.localVar = connectInDynamic();
        })

      // 页面刷新，canTraceProp的值改变了
      Text(`add 1 to canTraceProp: ${this.localVar.dynDataModelChild.canTraceProp}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.localVar.dynDataModelChild.canTraceProp++;
        })

      // 页面不刷新，但是normalProp的值改变了
      Text(`add 1 to normalProp: ${this.localVar.dynDataModelChild.normalProp}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.localVar.dynDataModelChild.normalProp++;
        })

      // 获取当前PersistenceV2里面的所有key
      Text(`get all keys: ${this.keys}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          // 刷新页面中的所有key
          this.keys = PersistenceV2.keys();
        })
    }
  }
}
// [End StaDynStorageV2PersistenceMainPage]