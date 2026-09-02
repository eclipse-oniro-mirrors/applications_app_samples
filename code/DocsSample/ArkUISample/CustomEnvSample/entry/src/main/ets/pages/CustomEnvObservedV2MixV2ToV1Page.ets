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

// [Start V2ToV1Mix]
@ObservedV2
class CustomDefaultvalue {
  @Trace public defaultVal: string = 'hello';
}

const customOne = CustomEnvKey.create<string>();
const customTwo = CustomEnvKey.create<CustomDefaultvalue>();

@Entry
@ComponentV2
struct PageTwo {
  @CustomEnv(customOne) defaultMessage: string = 'parent Value';
  @CustomEnv(customTwo) defaultMessage1: CustomDefaultvalue = new CustomDefaultvalue();

  build() {
    Column() {
      Text(`Parent Value is :${this.defaultMessage}`)
      PageTwoChild({ message: this.defaultMessage }) // 正确用法
      // Child({ customMessage: this.defaultMessage1 }) // 错误用法，编译报错。
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct PageTwoChild {
  @Require @Prop message: string;
  // @Prop customMessage: CustomValue; //  错误用法，V1状态变量装饰器装饰的类型不能是ObservedV2装饰的class。

  build() {
    Column() {
      Text(`Child value is :${this.message}`)
    }
    .height('100%')
    .width('100%')
  }
}
// [End V2ToV1Mix]