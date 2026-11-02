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

import { RecordingResultInfo } from '../../controller/RecordingSessionController';
import { LocalizedText } from '../../common/LocalizedText';
import { RecordingMetadataReader } from '../../controller/RecordingMetadataReader';

@Entry
@Component
struct RecordingResult {
  @State private result: RecordingResultInfo | undefined = undefined;
  @State private fileMetadata: string = '';
  private alive: boolean = true;

  aboutToAppear(): void { void this.load(); }
  aboutToDisappear(): void { this.alive = false; }

  private async load(): Promise<void> {
    const params = this.getUIContext().getRouter().getParams() as RecordingResultInfo;
    const context = this.getUIContext().getHostContext();
    this.result = params;
    if (context === undefined) { return; }
    const metadata: string[] = await Promise.all([
      RecordingMetadataReader.read(params.primaryUri, LocalizedText.get($r('app.string.recorder_primary'))),
      RecordingMetadataReader.read(params.secondaryUri, LocalizedText.get($r('app.string.recorder_secondary')))
    ]);
    if (this.alive) {
      this.fileMetadata = metadata.filter((line: string): boolean => line.length > 0).join(String.fromCharCode(10));
    }
  }

  private play(uri: string): void {
    if (uri.length === 0) { return; }
    AppStorage.setOrCreate('recordingResultPlayback', uri);
    this.getUIContext().getRouter().back({ url: 'pages/Index' });
  }

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.rec_result_title')).fontSize(24).fontWeight(FontWeight.Bold).width('100%')
      Scroll() {
        Column({ space: 12 }) {
          if (this.result !== undefined) {
            Text(this.result.title).fontSize(17).width('100%')
            Text(new Date(this.result.recordedAt).toLocaleString() + ' · ' + this.result.durationSeconds.toFixed(1) + ' s')
              .fontSize(12).width('100%')
            Text(this.result.complete === false ? $r('app.string.rec_result_partial') :
              $r('app.string.rec_result_complete')).width('100%')
            Text(this.fileMetadata || LocalizedText.get($r('app.string.rec_result_metadata_unavailable')))
              .fontSize(13).width('100%')
            Text($r('app.string.rec_result_metadata_note')).fontSize(12).fontColor('#667085').width('100%')
            Flex({ wrap: FlexWrap.Wrap }) {
              Button($r('app.string.rec_result_primary')).margin(4).fontSize(13)
                .enabled(this.result.primaryUri.length > 0).onClick((): void => this.play(this.result?.primaryUri ?? ''))
              if (this.result.secondaryUri.length > 0) {
                Button($r('app.string.rec_result_secondary')).margin(4).fontSize(13)
                  .onClick((): void => this.play(this.result?.secondaryUri ?? ''))
              }
            }.width('100%')
          }
        }.width('100%').alignItems(HorizontalAlign.Start)
      }.layoutWeight(1).width('100%')
      Button($r('app.string.rec_result_back')).onClick((): void => { this.getUIContext().getRouter().back(); })
    }.width('100%').height('100%').padding(20).backgroundColor('#F5F7FA')
  }
}
