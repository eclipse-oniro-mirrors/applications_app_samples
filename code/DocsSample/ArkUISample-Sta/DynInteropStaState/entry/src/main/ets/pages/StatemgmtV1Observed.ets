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

// [Start DynInteropStaStatemgmtV1Observed]
// entry/src/main/ets/pages/StatemgmtV1Observed.ets

// 引用ArkTS-Dyn动态@Observed装饰的数据
import { MyClassA } from 'static_module';

@Entry
@Component
export struct Index {
  @State state: MyClassA = new MyClassA();

  build() {
    Row() {
      Column() {
        // 在ArkTS-Dyn中使用动态@Observed装饰的数据
        Text(this.state.name)
          .fontSize(20) 
          .margin(10)
        // 单独为静态@Observed装饰的类中的某一个成员赋值
        Button('Member Assignment')
          .onClick(() => {
            this.state.name = 'state: x';
          })
          .width(300)
          .margin(10)
        // 创建新对象整体为静态@Observed装饰的类中的成员赋值
        Button('Overall Assignment')
          .onClick(() => {
            let data = new MyClassA();
            data.name = 'state: Hello';
            this.state = data;
          })
          .width(300)
          .margin(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End DynInteropStaStatemgmtV1Observed]
