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

// [Start DynInteropStaStatemgmtV2PersistenceV2]
// entry/src/main/ets/pages/StatemgmtV2PersistenceV2.ets
import { PersistenceV2 } from '@kit.ArkUI';
import {
  PersistenceV2Page, canTracePropPlusInStatic, normalPropPlusInStatic, connectInStatic, saveInStatic, removeInStatic,
  keysInStatic, StaDataModel
} from 'static_module';

@Entry
@ComponentV2
struct Index {
  // 承接ArkTS-Sta模块的数据
  @Local canTraceProp: number = 0;
  @Local normalProp: number = 10;
  @Local keys: Array<string> = [];

  build() {
    Column() {
      Text('This is ArkTS-Dyn part')
        .fontSize(20)
        .margin(10)

      // 在ArkTS-DynSta模块调用ArkTS-Sta模块的connect接口，返回一个key为StaDataModel的StaDataModel对象
      Button('connect key StaDataModel by Sta')
        .margin(10)
        .onClick(() => {
          const staModel: StaDataModel = connectInStatic();
          this.canTraceProp = staModel.canTraceProp;
          this.normalProp = staModel.normalProp;
        })

      // 在ArkTS-Dyn模块调用ArkTS-Sta模块的remove接口
      Button('remove key StaDataModel by Sta')
        .margin(10)
        .onClick(() => {
          removeInStatic();
        })

      // 在ArkTS-Dyn模块调用ArkTS-Sta模块的save接口
      Button('save key StaDataModel by Sta')
        .margin(10)
        .onClick(() => {
          saveInStatic();
        })

      // 在ArkTS-Sta模块调用ArkTS-Dyn模块的canTraceProp累加接口
      // this.canTraceProp被重新赋值，页面刷新
      Text(`add 1 to canTraceProp by Sta: ${this.canTraceProp}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.canTraceProp = canTracePropPlusInStatic();
        })

      // 在ArkTS-Dyn模块调用ArkTS-Sta模块的normalProp累加接口
      // this.normalProp被重新赋值，页面刷新
      Text(`add 1 to normalProp by Sta: ${this.normalProp}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.normalProp = normalPropPlusInStatic();
        })

      Text(`get all keys by Sta: ${this.keys}`)
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          for (let key of keysInStatic()) {
            this.keys.push(key);
          }
        })

      // 调用ArkTS-Sta模块组件，初始化一个ArkTS-Sta对象
      PersistenceV2Page()
    }
    .width('100%')
    .height('100%')
  }
}
// [End DynInteropStaStatemgmtV2PersistenceV2]
