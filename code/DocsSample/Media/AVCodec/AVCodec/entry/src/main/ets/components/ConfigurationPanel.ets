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

import { LocalizedText } from '../common/LocalizedText';
@Component
export struct ConfigurationPanel {
  @Prop ready: boolean = false;
  @Prop notice: string = '';
  onPreset: (index: number) => void = (_index: number): void => {};
  onSave: () => void = (): void => {};
  onLoad: () => void = (): void => {};

  build() {
    Column({ space: 8 }) {
      Text(LocalizedText.get($r('app.string.configuration_title'))).fontSize(16).fontWeight(FontWeight.Medium).width('100%')
      Text(LocalizedText.get($r('app.string.configuration_description')))
        .fontSize(12).fontColor('#667085').width('100%')
      Row({ space: 8 }) {
        Button(LocalizedText.get($r('app.string.configuration_default'))).fontSize(12).layoutWeight(1).onClick((): void => this.onPreset(0))
        Button(LocalizedText.get($r('app.string.configuration_buffer'))).fontSize(12).layoutWeight(1).onClick((): void => this.onPreset(1))
      }.width('100%').enabled(this.ready)
      Row({ space: 8 }) {
        Button(LocalizedText.get($r('app.string.configuration_720p'))).fontSize(12).layoutWeight(1).onClick((): void => this.onPreset(2))
        Button('1080P / 60').fontSize(12).layoutWeight(1).onClick((): void => this.onPreset(3))
      }.width('100%').enabled(this.ready)
      Row({ space: 8 }) {
        Button(LocalizedText.get($r('app.string.configuration_save_custom'))).fontSize(12).layoutWeight(1).onClick(this.onSave)
        Button(LocalizedText.get($r('app.string.configuration_load_custom'))).fontSize(12).layoutWeight(1).onClick(this.onLoad)
      }.width('100%').enabled(this.ready)
      if (this.notice.length > 0) {
        Text(this.notice).fontSize(12).fontColor('#175CD3').width('100%')
      }
    }.width('100%').padding(14).backgroundColor('#F8FAFC').borderRadius(16)
  }
}
