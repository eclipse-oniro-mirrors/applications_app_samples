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
export struct RecorderControlBar {
  @Prop buttonEnabled: boolean = true;
  onOpenSettings: () => void = (): void => {};
  onStartRecording: () => void = (): void => {};

  build() {
    Row({ space: '8vp' }) {
      Button($r('app.string.setting'))
        .enabled(this.buttonEnabled)
        .layoutWeight(1)
        .height('52vp')
        .backgroundColor('#E67E22')
        .fontColor(Color.White)
        .onClick(this.onOpenSettings)
      Button($r('app.string.record'))
        .enabled(this.buttonEnabled)
        .layoutWeight(1)
        .height('52vp')
        .backgroundColor('#C93535')
        .fontColor(Color.White)
        .onClick(this.onStartRecording)
    }
    .width('100%')
  }
}
