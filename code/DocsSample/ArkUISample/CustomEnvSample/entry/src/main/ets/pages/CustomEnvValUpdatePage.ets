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

// [Start CustomEnvUpdateValue]
import { WithEnv, WithEnvAttribute } from '@kit.ArkUI';

const customMsge = CustomEnvKey.create<string>();

@Entry
@ComponentV2
struct UpdateIndex {
  @Local customMsg: string = 'Hello';

  build() {
    Column() {
      Button('update')
        .onClick(() => {
          this.customMsg = 'Hello World';
        })

      WithEnv() {
        // 有WithEnv组件，Child的customMessage显示WithEnv提供的值'Hello'，点击Button后值更新为'Hello World'。
        UpdateChild()
      }.customEnv(customMsge, this.customMsg)

    }
  }
}

@ComponentV2
struct UpdateChild {
  @CustomEnv(customMsge) customMessage: string = 'default content';

  build() {
    Column() {
      Text(`Child: ${this.customMessage}`);
    }
  }
}
// [End CustomEnvUpdateValue]