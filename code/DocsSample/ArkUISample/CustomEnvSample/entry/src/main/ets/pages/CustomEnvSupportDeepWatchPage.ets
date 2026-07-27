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

// [Start CustomEnvDeepWatch]
import { WithEnv } from '@ohos.arkui.WithEnv';

const customDeepWatch = CustomEnvKey.create<number[][]>()

@Entry
@Component
struct BuildIn_Watch {
  @State message: number[][] = [[1, 2]];

  build() {
    Column() {
      Button('ss').onClick(() => {
        this.message[0][0]++
      })
      WithEnv() {
        Child()
      }.customEnv(customDeepWatch, this.message)
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct Child {
  @Watch('update') @CustomEnv(customDeepWatch) msg: number[][] = [[3, 4]]

  update() {
    console.info(`TabContent message callback func ${this.msg}`)
  }

  build() {
    Column() {
      Text(this.msg[0][0] + '')
    }
  }
}
// [End CustomEnvDeepWatch]