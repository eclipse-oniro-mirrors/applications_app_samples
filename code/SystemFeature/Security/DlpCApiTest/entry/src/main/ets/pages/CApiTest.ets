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
import testNapi from 'libentry.so';

@Builder
export function CApiTestBuilder() {
  CApiTest();
}

@Entry
@Component
struct CApiTest {
  pageInfos: NavPathStack = new NavPathStack();
  @State message: string = '点击按钮开始测试';

  @Builder
  buttonBuilder() {
    Button('GetDlpPermissionInfo')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.GetDlpPermissionInfo();
        this.message = result.toString();
      })

    Button('GetOriginalFileName')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.GetOriginalFileName();
        this.message = result.toString();
      })

    Button('IsInSandbox')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.IsInSandbox();
        this.message = result.toString();
      })

    Button('SetSandboxAppConfig')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.SetSandboxAppConfig();
        this.message = result.toString();
      })

    Button('GetSandboxAppConfig')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.GetSandboxAppConfig();
        this.message = result.toString();
      })

    Button('CleanSandboxAppConfig')
      .height(40)
      .margin(20)
      .onClick(() => {
        const result = testNapi.CleanSandboxAppConfig();
        this.message = result.toString();
      })
  }

  build() {
    NavDestination() {
      Column() {
        Button('clear').onClick(() => {
          this.message = '';
        })
        Scroll() {
          Text(this.message)
            .margin(20)
        }
        .height(100)

        Scroll() {
          Flex({
            direction: FlexDirection.Column,
            justifyContent: FlexAlign.Start
          }) {
            this.buttonBuilder()
          }
        }.layoutWeight(1)
      }
      .width('100%')
      .height('100%')
    }
    .title('C Api Test')
    .onBackPressed(() => {
      this.pageInfos.pop();
      return true;
    })
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
  }
}