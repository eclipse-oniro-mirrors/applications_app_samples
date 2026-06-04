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

//[Start GridLayoutColumnOption_start]
import {
  Entry,
  Component,
  Row,
  RowOptions,
  Text,
  GridRow,
  GridRowOptions,
  GridCol,
  GridColOptions,
  ForEach
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct GridRowColumnOptionLayout {
  @State bgColors: string[] =
    ['rgb(213,213,213)', 'rgb(150,150,150)', 'rgb(0,74,175)', 'rgb(39,135,217)', 'rgb(61,157,180)', 'rgb(23,169,141)',
      'rgb(255,192,0)', 'rgb(170,10,33)'];

  build() {
    GridRow({
      columns: { sm: 4, md: 8 },
      breakpoints: {
        value: ['320vp', '600vp', '840vp', '1440vp', '1600vp'] // 表示在保留默认断点['320vp', '600vp', '840vp']的同时自定义增加'1440vp', '1600vp'的断点，实际开发中需要根据实际使用场景，合理设置断点值实现一次开发多端适配。
      }
    }) {
      ForEach(this.bgColors, (item: string, index: Int) => {
        GridCol({ span: 1 }) {
          Row() {
            Text(index.toString())
          }.width('100%').height('50')
        }.backgroundColor(item)
      })
    }
    .height(200)
    .border({ color: 'rgb(39,135,217)', width: 2 })
  }
}
// [End GridLayoutColumnOption_start]