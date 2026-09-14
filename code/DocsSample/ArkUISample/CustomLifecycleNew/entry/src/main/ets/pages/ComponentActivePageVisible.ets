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

// [Start ComponentActivePageVisible]
import { ComponentActive, ComponentInactive } from '@kit.ArkUI';

@Entry
@Component
struct MyActiveSample {
  @State stateVar: string = 'Hello World';

  @ComponentActive
  myActive() {
    // 组件从非激活状态变为激活状态时触发
    console.info(`myActive`);
  }

  @ComponentInactive
  myInactive() {
    // 组件从激活状态变为非激活状态时触发
    console.info(`myInactive`);
  }

  build() {
    Column() {
      Text(this.stateVar)
    }
    .width(`100%`)
    .height(`100%`)
  }
}
// [End ComponentActivePageVisible]

@Builder
export function componentActivePageVisible() {
  NavDestination() {
    MyActiveSample()
  }
}
