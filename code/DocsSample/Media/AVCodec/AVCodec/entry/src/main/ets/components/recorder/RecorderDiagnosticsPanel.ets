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
export struct RecorderDiagnosticsPanel {
  @Prop compactText: string = '';
  @Prop detailText: string = '';
  @Prop detailHeight: number = 160;
  @State private expanded: boolean = false;

  build() {
    Column({ space: 6 }) {
      Text(this.compactText)
        .width('100%').fontSize(12).fontColor(Color.White)
        .hitTestBehavior(HitTestMode.None)
      Button(this.expanded ? $r('app.string.rec_diag_collapse') : $r('app.string.rec_diag_expand'))
        .width('100%').height(30).fontSize(12)
        .backgroundColor('#334155').fontColor(Color.White)
        .onClick((): void => { this.expanded = !this.expanded; })
      if (this.expanded) {
        Scroll() {
          Text(this.detailText)
            .width('100%').fontSize(12).fontColor(Color.White)
            .copyOption(CopyOptions.InApp)
        }
        .width('100%').height(this.detailHeight).scrollBar(BarState.Auto)
      }
    }
    .width('100%').padding(8).backgroundColor('#CC101828').borderRadius(8)
    .hitTestBehavior(HitTestMode.Transparent)
  }
}
