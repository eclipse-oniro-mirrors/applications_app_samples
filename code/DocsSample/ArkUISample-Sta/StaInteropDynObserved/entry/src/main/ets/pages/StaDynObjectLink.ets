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

// [Start StaDynObjectLink]
// entry/src/main/ets/pages/StaDynObjectLink.ets
import { Entry, Component, Row, Column, Button, ClickEvent, Text } from '@ohos.arkui.component';
import { State, ObjectLink} from '@ohos.arkui.stateManagement';

// 引用ArkTS-Dyn中@Observed装饰的数据
import { MyClassA } from 'dynamic_module';

@Component
struct Index { // ArkTS-Sta组件
  @ObjectLink objectLink: MyClassA;

  build() {
    Column() {
      // 在ArkTS-Sta中使用动态@Observed装饰的数据
      Text(this.objectLink.name)
        .height('10%')
      // 单独为动态@Observed装饰的类中的某一个成员赋值
      Button('Member Assignment')
        .onClick((event: ClickEvent)=> {
          this.objectLink.name = 'objectLink: x';
        })
    }
  }
}

@Entry
@Component
struct objectLinkSample {
  @State state: MyClassA = new MyClassA();

  build() {
    Column() {
      Index({ objectLink: this.state })
    }
  }
}
// [End StaDynObjectLink]