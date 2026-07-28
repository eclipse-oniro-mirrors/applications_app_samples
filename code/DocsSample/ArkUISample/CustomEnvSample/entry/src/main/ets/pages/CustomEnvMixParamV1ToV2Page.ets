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

// [Start V1ToV2MixParam]
@ObservedV2
class CustomValueM {
  @Trace public defaultVal: string = 'hello';
}

const customMix = CustomEnvKey.create<CustomValueM>();

@Entry
@Component
struct PageOne {
  @CustomEnv(customMix) defaultMessage: CustomValueM = new CustomValueM();

  build() {
    Column() {
      Text(this.defaultMessage.defaultVal)
      Button('update')
        .onClick(() => {
          this.defaultMessage.defaultVal = 'hello world';
        })
      PageOneChild({ message: this.defaultMessage })
    }
    .height('100%')
    .width('100%')
  }
}

@ComponentV2
struct PageOneChild {
  @Require @Param message: CustomValueM;

  build() {
    Column() {
      Text(`Child Value is : ${this.message.defaultVal}`)
    }
    .height('100%')
    .width('100%')
  }
}
// [End V1ToV2MixParam]