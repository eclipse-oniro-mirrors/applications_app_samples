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
export struct RecorderPreview {
  @Prop cameraWidth: number = 0;
  @Prop cameraHeight: number = 0;
  @Prop frameRate: number = 0;

  build() {
    Column({ space: '12vp' }) {
      Text($r('app.string.recorder_home_ready'))
        .fontSize('16fp')
        .fontWeight(FontWeight.Medium)
        .fontColor('#101820')
      Text(`${this.cameraWidth} × ${this.cameraHeight}`)
        .fontSize('20fp')
        .fontWeight(FontWeight.Bold)
        .fontColor('#0A59F7')
      Text(`${this.frameRate} fps`)
        .fontSize('14fp')
        .fontColor('#667085')
      Text($r('app.string.recorder_home_settings_hint'))
        .fontSize('13fp')
        .fontColor('#667085')
        .width('100%')
    }
    .width('100%')
    .padding('16vp')
    .backgroundColor('#F2F4F7')
    .borderRadius('16vp')
  }
}
