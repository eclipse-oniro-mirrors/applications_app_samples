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
// [Start PropRefDataSourceRef]
import { 
  Entry, 
  Text, 
  Column, 
  Component, 
  Button, 
  ClickEvent,
  State,
  PropRef,
  Observed,
  Track
} from '@kit.ArkUI';

@Observed
class Data {
  @Track code: number;

  constructor(code: number) {
    this.code = code;
  }
}

@Entry
@Component
struct Index {
  @State data: Data = new Data(100);

  build() {
    Column() {
      Text(`data property code is ${this.data.code}`)
      Child({
        childData: this.data
      })
    }
  }
}

@Component
struct Child {
  @PropRef childData: Data;

  build() {
    Column() {
      Text(`childData property code is ${this.childData.code}`)
      Button('modify childData property code')
        .onClick((e: ClickEvent) => {
          // 如果只点击该Button，由于childData是父组件中数据源的引用，则父组件中数据源的属性也会修改。
          this.childData.code += 10;
        })

      Button('replace childData')
        .onClick((e: ClickEvent) => {
          // 如果点击该Button，本地的childData变量会引用新的对象，所以不会影响父组件中的数据源。
          this.childData = new Data(200);
        })
    }
  }
}
// [End PropRefDataSourceRef]

@Builder
export function propRefDataSourceRef(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.prop_ref_data_source_ref_title'))
}