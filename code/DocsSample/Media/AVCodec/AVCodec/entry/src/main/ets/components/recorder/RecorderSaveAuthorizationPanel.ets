/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Component
export struct RecorderSaveAuthorizationPanel {
  onCancel: () => void = (): void => {};
  onSave: () => Promise<void> = async (): Promise<void> => {};

  build() {
    Column() {
      Text($r('app.string.saveButtonNote'))
        .width('100%')
        .fontSize('16vp')
        .margin({ bottom: '12vp' })
      Row() {
        Button($r('app.string.saveButtonCancel'))
          .width('48%')
          .onClick(this.onCancel)
        Blank()
        SaveButton({ text: SaveDescription.SAVE })
          .width('48%')
          .height('40vp')
          .onClick(async (): Promise<void> => { await this.onSave(); })
      }
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Bottom)
      .margin({ bottom: '44vp' })
      .width('100%')
      .height('52vp')
    }
    .justifyContent(FlexAlign.End)
    .padding({ left: '16vp', right: '16vp' })
    .width('100%')
    .height('100%')
  }
}
