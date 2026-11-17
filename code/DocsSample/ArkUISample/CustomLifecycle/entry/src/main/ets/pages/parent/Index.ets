/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start nested_custom_components]
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct Parent {
  @State showChild: boolean = true;
  @State btnColor: string = '#FF007DFF';

  // Parent即将出现时，回调该方法
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'Parent aboutToAppear');
  }

  // Parent首次渲染触发的build函数执行完成之后，回调该方法
  onDidBuild() {
    hilog.info(0x0000, 'testTag', 'Parent onDidBuild');
  }

  // Parent销毁之前，回调该方法
  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'Parent aboutToDisappear');
  }

  build() {
    Column() {
      // this.showChild为true，创建Child子组件，执行Child aboutToAppear和Child onDidBuild。
      if (this.showChild) {
        Child()
      }
      Button(this.showChild ? 'delete Child' : 'add Child')
        .width(300)
        .margin(20)
        .backgroundColor(this.btnColor)
        .onClick(() => {
          // 更改this.showChild为false，删除Child子组件，执行Child aboutToDisappear。
          // 更改this.showChild为true，添加Child子组件，执行Child aboutToAppear和Child onDidBuild。
          this.showChild = !this.showChild;
        })
    }
    .width('100%')
  }
}

@Component
struct Child {
  @State title: string = 'Hello World';

  // Child销毁之前，回调该方法
  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'Child aboutToDisappear');
  }

  // Child首次渲染触发的build函数执行完成之后，回调该方法
  onDidBuild() {
    hilog.info(0x0000, 'testTag', 'Child onDidBuild');
  }

  // Child即将出现时，回调该方法
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'Child aboutToAppear');
  }

  build() {
    Text(this.title)
      .fontSize(50)
      .margin(20)
      .onClick(() => {
        this.title = 'Hello ArkUI';
      })
  }
}
// [End nested_custom_components]