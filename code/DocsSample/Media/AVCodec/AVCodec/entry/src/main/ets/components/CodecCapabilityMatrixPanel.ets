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

import { fileIo, picker } from '@kit.CoreFileKit';
import player, { DeviceCodecCapability, MediaInfo } from 'libplayer.so';
import { CodecCapabilityMatrix, CodecMatrixSnapshot } from '../model/CodecCapabilityMatrix';
import { MediaStateFiles } from '../model/MediaStateFiles';
import { MediaFileWriter } from '../model/MediaFileWriter';
import { LocalizedText } from '../common/LocalizedText';

@Component
export struct CodecCapabilityMatrixPanel {
  @Prop codecs: DeviceCodecCapability[] = [];
  @State private comparison: string = '';
  @State private recommendation: string = '';
  @State private working: boolean = false;

  private async snapshot(save: boolean, importing: boolean): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || this.working) { return; }
    this.working = true;
    try {
      const current: CodecMatrixSnapshot = CodecCapabilityMatrix.capture(this.codecs);
      if (save) {
        const previous: string = await MediaStateFiles.read(context, 'capability_snapshot.json', '');
        this.comparison = previous.length > 0 ? CodecCapabilityMatrix.compare(current, CodecCapabilityMatrix.parse(previous)).join('\n') :
          LocalizedText.get($r('app.string.task_capability_save'));
        await MediaStateFiles.write(context, 'capability_snapshot.json', JSON.stringify(current));
      } else if (importing) {
        const paths: string[] = await new picker.DocumentViewPicker(context).select({ maxSelectNumber: 1,
          fileSuffixFilters: ['JSON|.json'] });
        if (paths.length === 0) { return; }
        const file: fileIo.File = await fileIo.open(paths[0], fileIo.OpenMode.READ_ONLY);
        try {
          if ((await fileIo.stat(file.fd)).size > 2 * 1024 * 1024) { throw new Error('Capability snapshot too large'); }
          const previous: CodecMatrixSnapshot = CodecCapabilityMatrix.parse(
            await fileIo.readText(paths[0], { length: 2 * 1024 * 1024 + 1 }));
          const diff: string[] = CodecCapabilityMatrix.compare(current, previous);
          this.comparison = diff.join('\n') + (diff.length === 1 ? '\n' +
            LocalizedText.get($r('app.string.task_capability_same')) : '');
        } finally { await fileIo.close(file); }
      } else {
        const paths: string[] = await new picker.DocumentViewPicker(context).save({
          newFileNames: ['avcodec-capabilities-' + Date.now() + '.json'] });
        if (paths.length === 0) { return; }
        const file: fileIo.File = await fileIo.open(paths[0], fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
        try { await MediaFileWriter.writeAll(file.fd, JSON.stringify(current, null, 2)); }
        finally { await fileIo.close(file); }
      }
    } catch (error) { this.comparison = JSON.stringify(error); }
    finally { this.working = false; }
  }

  private recommend(): void {
    try {
      const media: MediaInfo = player.getMediaInfo();
      if (media.video.width <= 0 || media.video.height <= 0 || media.video.frameRate <= 0) {
        this.recommendation = LocalizedText.get($r('app.string.task_recommend_empty')); return;
      }
      const lines: string[] = [LocalizedText.get($r('app.string.task_recommend_hint'))];
      this.codecs.filter((codec: DeviceCodecCapability): boolean => codec.codecType === 1 &&
        codec.mimeType === media.video.codecMime).forEach((codec: DeviceCodecCapability): void => {
        const result = player.checkVideoCapability({ codecName: codec.codecName, mimeType: codec.mimeType,
          codecType: codec.codecType, width: media.video.width, height: media.video.height, frameRate: media.video.frameRate });
        lines.push((result.supported ? '✓ ' : '× ') + codec.codecName + ' [' + (codec.hardware ? 'HW' : 'SW') + '] ' + result.reason);
      });
      this.recommendation = lines.join('\n');
    } catch (error) { this.recommendation = JSON.stringify(error); }
  }

  build() {
    Column({ space: 10 }) {
      Text($r('app.string.task_capability_matrix')).fontSize(17).fontWeight(FontWeight.Medium)
      Text($r('app.string.task_capability_hint')).fontSize(12).fontColor('#667085')
      Button($r('app.string.task_capability_save')).width('100%').fontSize(13).enabled(!this.working && this.codecs.length > 0)
        .onClick((): void => { void this.snapshot(true, false); })
      Row({ space: 6 }) {
        Button($r('app.string.task_capability_import')).layoutWeight(1).fontSize(12).enabled(!this.working)
          .onClick((): void => { void this.snapshot(false, true); })
        Button($r('app.string.task_capability_export')).layoutWeight(1).fontSize(12).enabled(!this.working && this.codecs.length > 0)
          .onClick((): void => { void this.snapshot(false, false); })
      }.width('100%')
      if (this.comparison.length > 0) { Text(this.comparison).fontSize(11).copyOption(CopyOptions.InApp) }
      Button($r('app.string.task_recommend')).fontSize(13).enabled(!this.working)
        .onClick((): void => this.recommend())
      if (this.recommendation.length > 0) { Text(this.recommendation).fontSize(12).copyOption(CopyOptions.InApp) }
    }.width('100%').padding(14).alignItems(HorizontalAlign.Start).backgroundColor('#F8FAFC').borderRadius(16)
  }
}
