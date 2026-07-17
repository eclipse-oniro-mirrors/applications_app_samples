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

// [Start ComponentActiveRecycle]
import { ComponentActive, ComponentInactive, ComponentReuse, ComponentRecycle } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State changeChild: boolean = false;

  build() {
    Column() {
      Button('change')
        .margin(10)
        .onClick(() => {
          // 切换Child组件的显示状态，触发组件的回收或复用
          this.changeChild = !this.changeChild;
        })
      if (this.changeChild) {
        Child()
      }
    }
    .width('100%')
  }
}

@Reusable
@Component
struct Child {

  @ComponentReuse
  myReuse() {
    // 组件复用时触发
    console.info(`Child myReuse`);
  }

  aboutToReuse() {
    // 组件复用时触发
    console.info(`Child aboutToReuse`);
  }

  @ComponentActive
  myActive() {
    // 组件从非激活状态变为激活状态时触发
    console.info(`Child myActive`);
  }

  @ComponentRecycle
  myRecycle() {
    // 组件进入复用池时触发
    console.info(`Child myRecycle`);
  }

  aboutToRecycle() {
    // 组件进入复用池时触发
    console.info(`Child aboutToRecycle`);
  }

  @ComponentInactive
  myInactive() {
    // 组件从激活状态变为非激活状态时触发
    console.info(`Child myInactive`);
  }

  build() {
    Text('Child')
  }
}
// [End ComponentActiveRecycle]

@Builder
export function componentActiveRecycle() {
  NavDestination() {
    Index()
  }
}
