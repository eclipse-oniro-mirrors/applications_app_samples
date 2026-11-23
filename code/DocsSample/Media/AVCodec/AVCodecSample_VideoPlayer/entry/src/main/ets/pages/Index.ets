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
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

import player from 'libentry.so';

const LOG_DOMAIN: number = 0xD000;
const LOG_TAG: string = '[Sample_AVCodecVideoPlayer]';

@Entry
@Component
struct Index {
  @State private surfaceId: string = '';
  @State private busy: boolean = false;
  @State private modeLabel: Resource = $r('app.string.async_surface');
  @State private modeSheetOpen: boolean = false;
  @State private sourceSheetOpen: boolean = false;
  private readonly controller: XComponentController = new XComponentController();
  private synchronous: boolean = false;
  private surface: boolean = true;

  build() {
    Column() {
      this.playerContent()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.player_page'))
  }

  @Builder
  private playerContent(): void {
    Column({ space: 12 }) {
      XComponent({ id: 'video', type: XComponentType.SURFACE, controller: this.controller })
        .width('100%')
        .aspectRatio(16 / 9)
        .backgroundColor(Color.Black)
        .borderRadius(24)
        .clip(true)
        .margin({ bottom: 8 })
        .onLoad((): void => {
          this.surfaceId = this.controller.getXComponentSurfaceId();
        })
        .onDestroy((): void => {
          this.surfaceId = '';
          player.stop();
        })

      Button() {
        Column({ space: 4 }) {
          Text($r('app.string.choose_playback_mode'))
            .fontSize(14)
            .fontColor($r('app.color.player_secondary_text'))
          Text(this.modeLabel)
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.player_text'))
            .textAlign(TextAlign.Center)
        }
      }
        .id('playbackMode')
        .buttonStyle(ButtonStyleMode.NORMAL)
        .enabled(!this.busy)
        .onClick((): void => { this.modeSheetOpen = true; })
        .bindSheet($$this.modeSheetOpen, this.modeSheet, {
          height: SheetSize.FIT_CONTENT,
          preferType: SheetType.CENTER,
          width: '92%',
          backgroundColor: $r('app.color.player_page'),
          dragBar: false,
          showClose: false
        })
        .backgroundColor($r('app.color.player_button'))
        .actionAppearance()

      Button($r('app.string.play'))
        .id('play')
        .buttonStyle(ButtonStyleMode.NORMAL)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.player_text'))
        .enabled(!this.busy && this.surfaceId.length > 0)
        .onClick((): void => { this.sourceSheetOpen = true; })
        .bindSheet($$this.sourceSheetOpen, this.sourceSheet, {
          height: SheetSize.FIT_CONTENT,
          preferType: SheetType.CENTER,
          width: '92%',
          backgroundColor: $r('app.color.player_page'),
          dragBar: false,
          showClose: false
        })
        .backgroundColor($r('app.color.player_button'))
        .actionAppearance()
    }
    .width('100%')
    .constraintSize({ maxWidth: 560 })
    .padding(24)
  }

  @Styles
  private actionAppearance(): void {
    .width('100%')
    .constraintSize({ minHeight: 72 })
    .padding({ left: 16, right: 16, top: 12, bottom: 12 })
    .border({ width: 1, color: $r('app.color.player_outline'), radius: 20 })
  }

  @Builder
  private modeSheet(): void {
    Column({ space: 12 }) {
      Text($r('app.string.playback_mode'))
        .fontSize(22)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.player_text'))
        .margin({ bottom: 4 })

      this.modeOption($r('app.string.async_surface'), false, true)
      this.modeOption($r('app.string.async_buffer'), false, false)
      this.modeOption($r('app.string.sync_surface'), true, true)
      this.modeOption($r('app.string.sync_buffer'), true, false)
    }
    .padding(24)
    .width('100%')
  }

  @Builder
  private modeOption(label: Resource, synchronous: boolean, surface: boolean): void {
    Button(label)
      .fontSize(18)
      .fontColor($r('app.color.player_text'))
      .buttonStyle(ButtonStyleMode.NORMAL)
      .backgroundColor(this.synchronous === synchronous && this.surface === surface ?
        $r('app.color.player_selected') : $r('app.color.player_button'))
      .onClick((): void => {
        this.modeLabel = label;
        this.synchronous = synchronous;
        this.surface = surface;
        this.modeSheetOpen = false;
      })
      .actionAppearance()
  }

  @Builder
  private sourceSheet(): void {
    Column({ space: 12 }) {
      Text($r('app.string.choose_video_source'))
        .fontSize(22)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.player_text'))
        .margin({ bottom: 4 })

      this.sourceOption($r('app.string.gallery'), true)
      this.sourceOption($r('app.string.files'), false)
    }
    .padding(24)
    .width('100%')
  }

  @Builder
  private sourceOption(label: Resource, gallery: boolean): void {
    Button(label)
      .buttonStyle(ButtonStyleMode.NORMAL)
      .fontSize(18)
      .fontColor($r('app.color.player_text'))
      .backgroundColor($r('app.color.player_button'))
      .onClick((): void => {
        this.sourceSheetOpen = false;
        void this.playFile(gallery);
      })
      .actionAppearance()
  }

  private async pickFile(gallery: boolean): Promise<string> {
    if (gallery) {
      const result: photoAccessHelper.PhotoSelectResult = await new photoAccessHelper.PhotoViewPicker().select({
        MIMEType: photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE,
        maxSelectNumber: 1
      });
      return result.photoUris[0] ?? '';
    }
    const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
    options.maxSelectNumber = 1;
    const paths: string[] = await new picker.DocumentViewPicker().select(options);
    return paths[0] ?? '';
  }

  private async playFile(gallery: boolean): Promise<void> {
    if (this.busy) {
      return;
    }
    this.busy = true;
    let file: fileIo.File | undefined;
    try {
      const uri: string = await this.pickFile(gallery);
      if (uri.length === 0 || this.surfaceId.length === 0) {
        return;
      }
      file = fileIo.openSync(uri, fileIo.OpenMode.READ_ONLY);
      const size: number = fileIo.statSync(file.fd).size;
      if (this.surfaceId.length === 0) {
        return;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'Playback file is open');
      const finished: boolean = await player.play(file.fd, size, this.synchronous, this.surface, this.surfaceId);
      if (!finished) {
        this.showFailure();
      }
    } catch (_error) {
      hilog.error(LOG_DOMAIN, LOG_TAG, 'Could not open or play selected video');
      this.showFailure();
    } finally {
      try {
        if (file !== undefined) {
          fileIo.closeSync(file);
        }
      } catch (_error) {
        this.showFailure();
      } finally {
        this.busy = false;
      }
    }
  }

  private showFailure(): void {
    if (this.surfaceId.length > 0) {
      this.getUIContext().getPromptAction().showToast({ message: $r('app.string.play_failed') });
    }
  }
}
