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

@ComponentV2
export struct FormField {
  @Param idValue: string = 'id_field';
  @Param label: ResourceStr = '';
  @Param value: string = '';
  @Param placeholder: ResourceStr = '';
  @Param inputType: InputType = InputType.Normal;
  @Event onValueChange: (value: string) => void = () => {
  };

  build() {
    Column({ space: 6 }) {
      Text(this.label)
        .id(`${this.idValue}_label`)
        .fontSize(13)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
      TextInput({ text: this.value, placeholder: this.placeholder })
        .id(this.idValue)
        .type(this.inputType)
        .height(44)
        .fontSize(15)
        .backgroundColor($r('app.color.fill_subtle'))
        .borderRadius(8)
        .padding({ left: 12, right: 12 })
        .onChange((value: string) => {
          this.onValueChange(value);
        })
    }
    .id(`${this.idValue}_field`)
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}
