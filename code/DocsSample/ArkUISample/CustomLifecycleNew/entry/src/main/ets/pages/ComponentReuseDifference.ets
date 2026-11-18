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

// [Start ComponentReuseDifference]
import { ComponentAppear, ComponentBuilt, ComponentReuse } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct ReusableTest {
  @State flag1: boolean = true;
  @State flag2: boolean = false;
  build() {
    Column() {
      // 点击Button切换flag1，触发ReusableComp1和ReusableComp2的回收/复用
      Button('change flag 1')
        .margin(10)
        .onClick(() => {
          this.flag1 = !this.flag1;
        })
      // 点击Button切换flag2，触发ReusableComp1和ReusableComp3的回收/复用
      Button('change flag 2')
        .margin(10)
        .onClick(() => {
          this.flag2 = !this.flag2;
        })
      if (this.flag1) {
        ReusableComp1({ flag: true })
      }
      if (this.flag2) {
        ReusableComp1({ flag: false })
      }
    }
    .width('100%')
  }
}

@Reusable
@Component
struct ReusableComp1 {
  @Require @Prop flag: boolean = true;
  build() {
    if (this.flag) {
      ReusableComp2()
    } else {
      ReusableComp3()
    }
  }
}

@Reusable
@Component
struct ReusableComp2 {
  build() {
    Text('ReusableComp2')
      .margin(10)
  }
}

@Reusable
@Component
struct ReusableComp3 {
  aboutToAppear(): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 aboutToAppear');
  }
  aboutToReuse(params: Record<string, Object | undefined | null>): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 aboutToReuse');
  }
  @ComponentReuse
  myReuse(params: Record<string, Object | undefined | null>): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 myReuse');
  }
  @ComponentAppear
  myAppear(): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 myAppear');
  }
  @ComponentBuilt
  myBuilt(): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 myBuilt');
  }

  build() {
    Text('ReusableComp3')
      .margin(10)
  }
}
// [End ComponentReuseDifference]

@Builder
export function componentReuseDifference() {
  NavDestination() {
    ReusableTest()
  }
}
