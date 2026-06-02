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

// [Start StaDynStorageV2Persistence]
// entry/src/main/ets/pages/StaDynStorageV2Persistence.ets
import { Entry, Text, Column, ComponentV2, Button, Divider } from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import {
  PersistenceV2Page, canTracePropPlusInDynamic, normalPropPlusInDynamic, connectInDynamic, saveInDynamic,
  removeInDynamic, keysInDynamic, DynDataModel
} from 'dynamic_module';
import es from '@ohos.lang.interop';

@Entry
@ComponentV2
struct PersistenceV2Index {
  // 承接ArkTS-Dyn模块的数据
  @Local canTraceProp: number = 0;
  @Local normalProp: number = 10;
  @Local keys: es.Array<string> = keysInDynamic();

  build() {
    Column() {
      Text('This is ArkTS-Sta part')
        .fontSize(20)
        .margin(10)

      // 在ArkTS-Sta模块调用ArkTS-Dyn模块的connect接口，返回一个key为DynDataModel的DynDataModel对象
      Button('connect key DynDataModel by Dyn')
        .margin(10)
        .onClick(() => {
          const dynDataModel: DynDataModel = connectInDynamic();
          this.canTraceProp = dynDataModel.dynDataModelChild.canTraceProp;
          this.normalProp = dynDataModel.dynDataModelChild.normalProp;
        })

      // 在ArkTS-Sta模块调用ArkTS-Dyn模块的remove接口
      Button('remove key DynDataModel by Dyn')
        .margin(10)
        .onClick(() => {
          removeInDynamic();
        })

      // 在ArkTS-Sta模块调用ArkTS-Dyn模块的save接口
      Button('save key DynDataModel by Dyn')
        .margin(10)
        .onClick(() => {
          saveInDynamic();
        })

      // 在ArkTS-Sta模块调用ArkTS-Dyn模块的canTraceProp累加接口
      // this.canTraceProp被重新赋值，页面刷新
      Text(`add 1 to canTraceProp by Dyn: ${this.canTraceProp}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.canTraceProp = canTracePropPlusInDynamic();
        })

      // 在ArkTS-Sta模块调用ArkTS-Dyn模块的normalProp累加接口
      // this.normalProp被重新赋值，页面刷新
      Text(`add 1 to normalProp by Dyn: ${this.normalProp}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.normalProp = normalPropPlusInDynamic();
        })

      Text(`get all keys by Dyn: ${this.keys}`)
        .fontSize(20)
        .margin(10)
        .onClick(() => {
          this.keys = keysInDynamic();
        })

      // 调用ArkTS-Dyn模块组件，初始化一个ArkTS-Dyn对象
      PersistenceV2Page()
    }
    .width('100%')
    .height('100%')
  }
}
// [End StaDynStorageV2Persistence]