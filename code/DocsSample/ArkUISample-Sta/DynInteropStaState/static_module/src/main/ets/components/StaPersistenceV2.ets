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

// [Start DynInteropStaStatemgmtV2StaPersistenceV2]
// static_module/src/main/ets/components/StaPersistenceV2.ets
import { Text, Column, ComponentV2, Button, ClickEvent, Divider } from '@ohos.arkui.component';
import { ObservedV2, Local, Trace, PersistenceV2 } from '@ohos.arkui.stateManagement';

// 接受序列化失败的回调
PersistenceV2.notifyOnError((key: string, reason: string, msg: string) => {
  console.error(`error key: ${key}, reason: ${reason}, message: ${msg}`);
});

// PersistenceV2存储的数据模型
@ObservedV2
export class StaDataModel {
  @Trace canTraceProp: int = 0;
  normalProp: int = 10;

  constructor(canTraceProp?: int, normalProp?: int) {
    this.canTraceProp = canTraceProp ?? 0;
    this.normalProp = normalProp ?? 10;
  }
}

function getStaDataModelObject(): StaDataModel {
  return PersistenceV2.connect(
    Class.from<StaDataModel>(),
    'StaDataModel',
    (): StaDataModel => {
      return new StaDataModel();
    })!;
}

// 对外接口，对ArkTS-Sta模块canTraceProp的值进行累加
// 如果ArkTS-Sta模块的PersistenceV2中无key为StaDataModel的StaDataModel对象，则创建该对象
// 反之则获取该对象并与staDataModel关联，返回staDataModel的canTraceProp给调用者
export function canTracePropPlusInStatic(): int {
  const staDataModel = getStaDataModelObject();
  staDataModel.canTraceProp++;
  return staDataModel.canTraceProp;
}

// 对外接口，对ArkTS-Sta模块normalProp的值进行累加
// 如果ArkTS-Sta模块的PersistenceV2中无key为StaDataModel的StaDataModel对象，则创建该对象
// 反之则获取该对象并与staDataModel关联，返回staDataModel的normalProp给调用者
export function normalPropPlusInStatic(): int {
  const staDataModel = getStaDataModelObject();
  staDataModel.normalProp++;
  return staDataModel.normalProp;
}

// 对外接口，实现调用ArkTS-Sta模块的PersistenceV2.connect接口
export function connectInStatic(): StaDataModel {
  return PersistenceV2.connect(
    Class.from<StaDataModel>(),
    'StaDataModel',
    (): StaDataModel => {
      return new StaDataModel();
    })!;
}

// 对外接口，实现调用ArkTS-Sta模块的PersistenceV2.save接口
export function saveInStatic(): void {
  PersistenceV2.save(Class.from<StaDataModel>());
}

// 对外接口，实现调用ArkTS-Sta模块的PersistenceV2.remove接口
export function removeInStatic(): void {
  PersistenceV2.remove(Class.from<StaDataModel>());
}

// 对外接口，实现调用ArkTS-Sta模块的PersistenceV2.keys接口
export function keysInStatic(): Array<string> {
  const result = PersistenceV2.keys();
  return result;
}

@ComponentV2
export struct PersistenceV2Page {
  // 在PersistenceV2中创建一个key为StaDataModel的键值对（如果存在，则返回PersistenceV2中的数据），并且和prop关联
  // 对于需要换connect对象的localVar属性，需要加@Local修饰（不建议对属性换connect的对象）
  @Local localVar: StaDataModel = PersistenceV2.connect<StaDataModel>(
    Class.from<StaDataModel>(),
    (): StaDataModel => {
      return new StaDataModel();
    })!;
  @Local keys: Array<string> = PersistenceV2.keys();

  build(): void {
    Column() {
      Divider()
        .margin(10)

      Text('This is ArkTS-Sta part')
        .fontSize(20)
        .margin(10)

      // 在ArkTS-Dyn模块调用connect接口重连后，重新与localVar关联，页面数据刷新
      Button('refresh data')
        .margin(10)
        .onClick((event: ClickEvent): void => {
          this.localVar = connectInStatic();
        })

      // 页面刷新，canTraceProp的值改变
      Text(`add 1 to canTraceProp: ${this.localVar.canTraceProp}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.localVar.canTraceProp++;
        })

      // 页面不刷新，但是normalProp的值改变了
      Text(`add 1 to normalProp: ${this.localVar.normalProp}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.localVar.normalProp++;
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
// [End DynInteropStaStatemgmtV2StaPersistenceV2]
