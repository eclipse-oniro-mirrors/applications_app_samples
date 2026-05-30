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

// [Start StaBuilderV2Param]
// entry/src/main/ets/pages/StaBuilderV2Param.ets
import { Entry, ComponentV2, Builder, Column, Text, ClickEvent, Color } from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import { CustomContainer } from 'dynamic_module';

@Entry
@ComponentV2
struct CustomContainerUser {
  @Local text: string = 'header';

  @Builder
  localBuilder() {
    Text(this.text)
      .onClick((value: ClickEvent) => {
        this.text = 'changeHeader';
      })
  }

  build() {
    Column() {
      // 创建CustomContainer，在创建CustomContainer时，通过其后紧跟一个大括号"{}"形成尾随闭包
      // 作为传递给子组件CustomContainer的@BuilderParam 参数 closer: () => void
      CustomContainer() {
        Column() {
          Text(this.text)
        }
        .backgroundColor(Color.Yellow)
        .onClick((value: ClickEvent) => {
          this.text = 'changeHeader';
        })
      }

      // 通过参数初始化 @BuilderParam 成员。
      CustomContainer({ closer: this.localBuilder })
    }
  }
}
// [End StaBuilderV2Param]
