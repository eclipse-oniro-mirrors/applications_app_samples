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

// [Start styledStringTextShadowStyle_start]
import {
  Color,
  Column,
  Component,
  Entry,
  MutableStyledString,
  StyledStringKey,
  Text,
  TextController,
  TextShadowStyle,
  ShadowOptions,
  ShadowType
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
export struct styled_string_demo3 {
  @State str: string =
    this.getUIContext().getHostContext()?.resourceManager.getStringByNameSync('CreateApply_Text_Third_Five') as string;
  mutableStyledString: MutableStyledString = new MutableStyledString(this.str, [
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.TEXT_SHADOW,
      styledValue: new TextShadowStyle({
        radius: 5,
        type: ShadowType.COLOR,
        color: Color.Red,
        offsetX: 10,
        offsetY: 10
      } as ShadowOptions)
    }
  ]);
  controller: TextController = new TextController();

  onPageShow(): void {
    this.controller.setStyledString(this.mutableStyledString);
  }

  build(): void {
    Column() {
      // 显示属性字符串
      Text(undefined, { controller: this.controller })
    }
    .width('100%')
  }
}
// [End styledStringTextShadowStyle_start]
