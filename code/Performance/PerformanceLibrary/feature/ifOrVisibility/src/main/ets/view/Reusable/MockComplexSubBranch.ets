/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { AlignContentFlex } from './AlignContentFlex';

@Component
export struct MockComplexSubBranch {
  @State alignStyle: FlexAlign = FlexAlign.Center;

  build() {
    Column() {
      Column({ space: 5 }) {
        Text('ComplexSubBranch not reusable')
          .fontSize($r('app.integer.font_size_9'))
          .fontColor($r('app.color.hint_txt_color'))
          .width($r('app.string.layout_90_percent'))
        AlignContentFlex({ alignStyle: this.alignStyle });
        AlignContentFlex({ alignStyle: this.alignStyle });
        AlignContentFlex({ alignStyle: this.alignStyle });
      }
    }
  }
}
