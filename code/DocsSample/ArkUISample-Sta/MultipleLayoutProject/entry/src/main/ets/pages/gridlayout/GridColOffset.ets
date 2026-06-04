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

import {
  Entry,
  Component,
  GridRow,
  GridRowOptions,
  GridCol,
  GridColOptions,
  GridColColumnOption
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

//[Start GridColOffset_start]
let gOffset:GridColColumnOption = { 'xs': 1, 'sm': 2, 'md': 3, 'lg': 4 } as GridColColumnOption
//[End GridColOffset_start]
@Entry
@Component
struct GridColOffset {

  build() {
    GridRow({ gutter: { x: 20, y: 50 } }) {
      //[Start GridColOffset1_start]
      GridCol({ offset: 2, span: 1 }){}
      GridCol({ offset: { xs: 2, sm: 2, md: 2, lg: 2 }, span: 1 }){}
      GridCol({ span: 1, offset: gOffset }){}
      //[End GridColOffset1_start]
    }
    .height(200)
    .border({ color: 'rgb(39,135,217)', width: 2 })
  }
}