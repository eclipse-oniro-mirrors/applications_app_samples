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

// [Start DynInteropStaBuilderParamByRef]
// entry/src/main/ets/pages/BuilderParamByRef.ets
import { IPerson, Child } from 'static_module'; // 引入ArkTS-Sta侧的IPerson接口与自定义组件

@Entry
@Component
struct Parent { // ArkTS-Dyn侧的自定义组件
  @Builder
  personInfo(person: IPerson) {
    Column() {
      Text(`Name: ${person.name}`)
        .fontSize(20) 
        .margin(10)
      Text(`Age: ${person.age}`)
        .fontSize(20) 
        .margin(10)
    }
  }

  build() {
    Column() {
      // 传递@Builder函数引用
      Child({ customBuilderParam: this.personInfo })
    }
    .width('100%')
  }
}
// [End DynInteropStaBuilderParamByRef]
