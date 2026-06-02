'use static'

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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start LifecycleReuseDiff]
import { ComponentAppear, ComponentBuilt, ComponentReuse, Entry, Component, State, Column, Button, Reusable, Require, PropRef, ReuseObject, Text } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

// 可复用的自定义组件ReusableComp3
@Reusable
@Component
struct ReusableComp3 {
  // ReusableComp3创建实例后，执行build函数之前回调aboutToAppear
  aboutToAppear(): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 aboutToAppear');
  }
  // ReusableComp3触发复用时回调aboutToReuse
  aboutToReuse(params: ReuseObject): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 aboutToReuse');
  }
  // 组件生命周期ComponentReuse，在ReusableComp3触发复用时回调myReuse
  @ComponentReuse
  myReuse(params: ReuseObject): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 myReuse');
  }
  // 组件生命周期ComponentAppear，在ReusableComp3创建实例后，执行build函数之前回调myAppear
  @ComponentAppear
  myAppear(): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 myAppear');
  }
  // 组件生命周期ComponentBuilt，在ReusableComp3首次渲染触发的build函数执行完成之后回调myBuilt
  @ComponentBuilt
  myBuilt(): void {
    hilog.info(0x0000, 'testTag', 'ReusableComp3 myBuilt');
  }

  build() {
    Text('B')
  }
}

// 可复用的自定义组件ReusableComp2
@Reusable
@Component
struct ReusableComp2 {
  build() {
    Text('A')
  }
}

@Reusable
@Component
struct ReusableComp1 {
  @Require @PropRef flag: boolean = true;
  build() {
    // flag为true时，创建ReusableComp2
    // flag为false时，创建ReusableComp3
    if (this.flag) {
      ReusableComp2()
    } else {
      ReusableComp3()
    }
  }
}

@Entry
@Component
struct LifecycleReuseDiffIndex {
  // 程序开始时，ReusableComp1和ReusableComp2已创建，ReusableComp3并未创建
  @State flag1: boolean = true;
  @State flag2: boolean = false;
  build() {
    Column() {
      // this.flag1为true时，创建ReusableComp1和ReusableComp2
      // this.flag1为false时，删除已创建的ReusableComp1和ReusableComp2
      Button('a')
        .onClick(() => {
          this.flag1 = !this.flag1;
        })
      // this.flag2为true时，创建ReusableComp1和ReusableComp3
      // this.flag2为false时，删除已创建的ReusableComp1和ReusableComp3
      Button('b')
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
  }
}
// [End LifecycleReuseDiff]

@Builder
export function lifecycleReuseDiff(): void {
  NavDestination() {
    LifecycleReuseDiffIndex();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.lifecycle_reuse_diff_title'))
}
