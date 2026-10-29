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

import { TranscodeModel } from '../model/TranscodeModel';
import { LocalizedText } from '../common/LocalizedText';
import { TranscodeMeasurement } from 'libtranscoder.so';
import { TranscodeHistoryEntry } from '../model/TranscodeFilesModel';
import { fileUri } from '@kit.CoreFileKit';
import { TranscodeQueuePanel } from '../components/transcode/TranscodeQueuePanel';
import { TranscodePreprocessPanel } from '../components/transcode/TranscodePreprocessPanel';

@Component
export struct TranscodePage {
  @ObjectLink model: TranscodeModel;
  onPlayResult: (uri: string) => void = (): void => {};

  aboutToAppear(): void {
    void this.model.loadHistory(this.getUIContext());
    void this.model.restoreQueue(this.getUIContext());
  }

  private categoryOptions(): SelectOption[] {
    return [{ value: $r('app.string.setting_decoder_auto') }, { value: $r('app.string.setting_decoder_hardware') },
      { value: $r('app.string.setting_decoder_software') }];
  }

  private audioOptions(): SelectOption[] {
    return [{ value: $r('app.string.transcode_audio_copy') }, { value: $r('app.string.transcode_audio_aac') },
      { value: $r('app.string.transcode_audio_none') }];
  }

  private trackOptions(): SelectOption[] {
    const options: SelectOption[] = [{ value: $r('app.string.transcode_first_audio') }];
    this.model.analysis.audioTracks.forEach((title: string): void => { options.push({ value: title }); });
    return options;
  }

  private trackIndex(): number {
    return this.model.audioTrack === 0 ? 0 : this.model.analysis.audioTrackIds.indexOf(this.model.audioTrack) + 1;
  }

  private codecOptions(): SelectOption[] {
    return [{ value: 'H.264 / AVC' }, { value: 'H.265 / HEVC' }];
  }

  private modeOptions(): SelectOption[] {
    return [{ value: 'Buffer' }, { value: $r('app.string.transcode_window_mode') }];
  }

  private sizeOptions(): SelectOption[] {
    return [{ value: $r('app.string.transcode_original_size') }, { value: $r('app.string.transcode_size_1920') },
      { value: $r('app.string.transcode_size_1080') }, { value: $r('app.string.transcode_size_720') }];
  }

  private bitrateOptions(): SelectOption[] {
    return [{ value: '2 Mbps' }, { value: '4 Mbps' }, { value: '8 Mbps' }, { value: '16 Mbps' }];
  }

  @Builder
  private sourceCard() {
    Column({ space: 12 }) {
      Text($r('app.string.transcode_source'))
        .fontSize(17).fontWeight(FontWeight.Medium)
      Text(this.model.sourceTitle.length > 0 ? this.model.sourceTitle : $r('app.string.transcode_no_source'))
        .fontSize(14).fontColor('#667085').width('100%').maxLines(3)
      Row({ space: 8 }) {
        Button($r('app.string.transcode_from_files'))
          .layoutWeight(1).fontSize(14)
          .onClick((): void => { void this.model.chooseSource(this.getUIContext(), false); })
        Button($r('app.string.transcode_from_gallery'))
          .layoutWeight(1).fontSize(14)
          .onClick((): void => { void this.model.chooseSource(this.getUIContext(), true); })
      }
      .enabled(!this.model.busy && !this.model.queueRunning && !this.model.picking && !this.model.exporting)
    }
    .width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White).borderRadius(16)
  }

  @Builder
  private optionsCard() {
    Column({ space: 12 }) {
      Text($r('app.string.transcode_output'))
        .fontSize(17).fontWeight(FontWeight.Medium)
      Row() {
        Text($r('app.string.transcode_codec')).layoutWeight(1)
        Select(this.codecOptions()).selected(this.model.codecIndex)
          .value(this.codecOptions()[this.model.codecIndex].value)
          .onSelect((index: number): void => {
            this.model.codecIndex = index; void this.model.inspect(this.getUIContext());
          })
      }
      Row() {
        Text($r('app.string.transcode_mode')).layoutWeight(1)
        Select(this.modeOptions()).selected(this.model.modeIndex)
          .value(this.modeOptions()[this.model.modeIndex].value)
          .onSelect((index: number): void => {
            this.model.setMode(index); void this.model.inspect(this.getUIContext());
          })
      }
      Row() {
        Text($r('app.string.transcode_size')).layoutWeight(1)
        Select(this.sizeOptions()).selected(this.model.sizeIndex)
          .value(this.sizeOptions()[this.model.sizeIndex].value)
          .enabled(this.model.modeIndex === 0)
          .onSelect((index: number): void => {
            this.model.sizeIndex = index; void this.model.inspect(this.getUIContext());
          })
      }
      Row() {
        Text($r('app.string.transcode_bitrate')).layoutWeight(1)
        Select(this.bitrateOptions()).selected(this.model.bitrateIndex)
          .value(this.bitrateOptions()[this.model.bitrateIndex].value)
          .onSelect((index: number): void => {
            this.model.bitrateIndex = index; void this.model.inspect(this.getUIContext());
          })
      }
      Row() {
        Text($r('app.string.transcode_encoder_category')).layoutWeight(1)
        Select(this.categoryOptions()).selected(this.model.encoderCategory)
          .value(this.categoryOptions()[this.model.encoderCategory].value)
          .onSelect((index: number): void => {
            this.model.encoderCategory = index; void this.model.inspect(this.getUIContext());
          })
      }
      Row() {
        Text($r('app.string.transcode_grayscale')).layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.model.grayscale })
          .enabled(this.model.modeIndex === 0)
          .onChange((checked: boolean): void => { this.model.grayscale = checked; })
      }
      Row() {
        Text($r('app.string.transcode_audio')).layoutWeight(1)
        Select(this.audioOptions()).selected(this.model.audioMode)
          .value(this.audioOptions()[this.model.audioMode].value)
          .onSelect((index: number): void => {
            this.model.audioMode = index; void this.model.inspect(this.getUIContext());
          })
      }
      if (this.model.analysis.audioTracks.length > 0) {
        Row() {
          Text($r('app.string.transcode_audio_track')).layoutWeight(1)
          Select(this.trackOptions()).selected(this.trackIndex())
            .value(this.trackOptions()[this.trackIndex()].value)
            .enabled(this.model.audioMode !== 2)
            .onSelect((index: number): void => {
              this.model.audioTrack = index === 0 ? 0 : this.model.analysis.audioTrackIds[index - 1];
              void this.model.inspect(this.getUIContext());
            })
        }
      }
      Text(this.model.modeIndex === 0 ? $r('app.string.transcode_buffer_hint') :
        $r('app.string.transcode_window_hint'))
        .fontSize(12).fontColor('#667085')
    }
    .enabled(!this.model.busy && !this.model.queueRunning && !this.model.exporting && !this.model.picking)
    .width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White).borderRadius(16)
  }

  @Builder
  private rangeCard() {
    Column({ space: 10 }) {
      Row() {
        Text($r('app.string.transcode_range')).layoutWeight(1).fontSize(16).fontWeight(FontWeight.Medium)
        Toggle({ type: ToggleType.Switch, isOn: this.model.rangeEnabled })
          .enabled(this.model.modeIndex === 0 && (this.model.rangeEnabled || this.model.analysis.durationUs > 0) &&
            !this.model.inspecting)
          .onChange((checked: boolean): void => { this.model.setRangeEnabled(checked); })
      }
      if (this.model.rangeEnabled) {
        Row({ space: 10 }) {
          Column({ space: 4 }) {
            Text($r('app.string.transcode_range_start')).fontSize(12).fontColor('#667085')
            TextInput({ text: this.model.rangeStart, placeholder: '0' })
              .enabled(!this.model.busy && !this.model.queueRunning)
              .onChange((value: string): void => this.model.setRangeStart(value))
          }.layoutWeight(1)
          Column({ space: 4 }) {
            Text($r('app.string.transcode_range_end')).fontSize(12).fontColor('#667085')
            TextInput({ text: this.model.rangeEnd, placeholder: $r('app.string.transcode_range_to_end') })
              .enabled(!this.model.busy && !this.model.queueRunning)
              .onChange((value: string): void => this.model.setRangeEnd(value))
          }.layoutWeight(1)
        }.width('100%')
        Text($r('app.string.transcode_range_hint')).fontSize(12).fontColor('#667085')
        if (!this.model.isRangeValid()) {
          Text($r('app.string.transcode_range_invalid')).fontSize(12).fontColor('#C00000')
        }
      }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start).backgroundColor(Color.White).borderRadius(16)
    .enabled(!this.model.busy && !this.model.queueRunning && !this.model.exporting && !this.model.picking)
  }

  @Builder
  private resultCard() {
    Column({ space: 12 }) {
      if (this.model.busy || this.model.status.state > 0) {
        Text(this.model.busy ? $r('app.string.transcode_running') : $r('app.string.transcode_result'))
          .fontSize(17).fontWeight(FontWeight.Medium)
        Progress({ value: this.model.status.progress, total: 100, type: ProgressType.Linear })
          .width('100%')
        Text(LocalizedText.format($r('app.string.transcode_progress'), this.model.status.progress.toFixed(1),
          this.model.status.frames.toString(), (this.model.status.bytes / 1048576).toFixed(1)))
          .fontSize(13).fontColor('#667085')
        if (this.model.status.outputWidth > 0) {
          Text(this.model.status.outputWidth + ' × ' + this.model.status.outputHeight)
            .fontSize(13).fontColor('#667085')
        }
        Text(this.model.status.fps.toFixed(1) + ' fps · ' + this.model.status.speed.toFixed(2) + 'x · ' +
          (this.model.status.elapsedMs / 1000).toFixed(1) + ' s')
          .fontSize(13).fontColor('#667085')
        Text(LocalizedText.format($r('app.string.transcode_eta'), this.model.status.remainingSeconds < 0 ?
          '—' : this.model.status.remainingSeconds.toFixed(0)))
          .fontSize(13).fontColor('#667085')
        Text(this.model.status.decoderName + ' → ' + this.model.status.encoderName)
          .fontSize(12).fontColor('#667085').width('100%')
        ForEach(this.model.status.diagnostics, (metric: TranscodeMeasurement) => {
          Text(metric.name + ' · avg ' + metric.averageMs.toFixed(2) + ' ms · P95 ' +
            metric.p95Ms.toFixed(2) + ' ms · max ' + metric.maxMs.toFixed(2) + ' ms')
            .fontSize(12).fontColor('#667085').width('100%')
        }, (metric: TranscodeMeasurement): string => metric.name + ':' + metric.calls)
        Text($r('app.string.transcode_metrics_hint')).fontSize(12).fontColor('#667085')
        Text(LocalizedText.format($r('app.string.transcode_wait'),
          this.model.status.decoderWaitMs.toFixed(0), this.model.status.encoderInputWaitMs.toFixed(0),
          this.model.status.encoderOutputWaitMs.toFixed(0)))
          .fontSize(12).fontColor('#667085')
      }
      if (this.model.status.outputValidation === 'passed') {
        Text(LocalizedText.format($r('app.string.transcode_output_verified'),
          ((this.model.status.outputDurationUs ?? 0) / 1000000).toFixed(2)))
          .fontSize(12).fontColor('#16794B')
      }
      if (this.model.notice.length > 0) {
        Text(this.model.notice).fontSize(14).fontColor('#344054').width('100%')
      }
      if (this.model.busy) {
        Button(this.model.cancelRequested ? $r('app.string.transcode_cancelling') : $r('app.string.transcode_cancel'))
          .width('100%').enabled(!this.model.cancelRequested)
          .onClick((): void => this.model.cancel())
      } else {
        Button($r('app.string.transcode_start')).width('100%')
          .enabled(this.model.sourceUri.length > 0 && !this.model.picking && !this.model.exporting &&
            !this.model.inspecting && !this.model.queueRunning && this.model.analysis.state === 2 &&
            this.model.isRangeValid())
          .onClick((): void => { void this.model.start(this.getUIContext()); })
      }
      if (this.model.resultPath.length > 0) {
        Button($r('app.string.transcode_play_result')).width('100%')
          .enabled(!this.model.exporting && !this.model.busy && !this.model.queueRunning)
          .onClick((): void => this.onPlayResult(fileUri.getUriFromPath(this.model.resultPath)))
        Row({ space: 8 }) {
          Button($r('app.string.transcode_save_files')).layoutWeight(1).fontSize(14)
            .onClick((): void => { void this.model.save(this.getUIContext(), false); })
          Button($r('app.string.transcode_save_gallery')).layoutWeight(1).fontSize(14)
            .onClick((): void => { void this.model.save(this.getUIContext(), true); })
        }
        .enabled(!this.model.exporting && !this.model.busy && !this.model.queueRunning && !this.model.picking)
        Text($r('app.string.transcode_private_result')).fontSize(12).fontColor('#667085')
      }
      if (this.model.status.state >= 2) {
        Button($r('app.string.transcode_export_report')).width('100%')
          .enabled(!this.model.busy && !this.model.queueRunning && !this.model.exporting)
          .onClick((): void => { void this.model.exportReport(this.getUIContext()); })
      }
    }
    .width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White).borderRadius(16)
  }

  @Builder
  private analysisCard() {
    Column({ space: 8 }) {
      Text($r('app.string.transcode_preflight')).fontSize(17).fontWeight(FontWeight.Medium)
      if (this.model.inspecting) {
        Text($r('app.string.transcode_inspecting')).fontSize(13)
      } else if (this.model.analysis.state > 0) {
        Text(this.model.analysis.sourceMime + ' · ' + this.model.analysis.sourceWidth + ' × ' +
          this.model.analysis.sourceHeight + ' · ' + this.model.analysis.sourceFrameRate.toFixed(2) + ' fps · ' +
          (this.model.analysis.durationUs / 1000000).toFixed(1) + ' s').fontSize(13)
        Text(this.model.analysis.decoderName + ' → ' + this.model.analysis.encoderName).fontSize(13)
        Text(LocalizedText.format($r('app.string.transcode_space_estimate'),
          this.model.analysisSizeEstimate < 0 ? '—' : (this.model.analysisSizeEstimate / 1048576).toFixed(1),
          this.model.availableBytes < 0 ? '—' : (this.model.availableBytes / 1048576).toFixed(1)))
          .fontSize(12).fontColor('#667085')
        if (this.model.analysis.detail.length > 0) {
          Text(this.model.analysis.detail).fontSize(13).fontColor('#B42318')
        } else {
          Text(this.model.analysis.outputWidth + ' × ' + this.model.analysis.outputHeight + ' · ' +
            (this.model.analysis.minBitrate / 1000000).toFixed(2) + '–' +
            (this.model.analysis.maxBitrate / 1000000).toFixed(2) + ' Mbps').fontSize(13)
        }
      }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start).backgroundColor(Color.White).borderRadius(16)
  }

  @Builder
  private historyCard() {
    Column({ space: 8 }) {
      Text($r('app.string.transcode_history')).fontSize(17).fontWeight(FontWeight.Medium)
      ForEach(this.model.history, (entry: TranscodeHistoryEntry) => {
        Column({ space: 4 }) {
          Text(entry.title).fontSize(14).maxLines(2)
          Text(new Date(entry.createdAt).toLocaleString() + ' · ' + entry.configuration).fontSize(12)
          Text((entry.status.elapsedMs / 1000).toFixed(1) + ' s · ' +
            (entry.status.fileBytes / 1048576).toFixed(1) + ' MiB · ' + entry.status.stage).fontSize(12)
        }.width('100%').alignItems(HorizontalAlign.Start).padding(12).backgroundColor('#F2F4F7').borderRadius(10)
        .onClick((): void => { void this.model.openHistory(this.getUIContext(), entry); })
      }, (entry: TranscodeHistoryEntry): string => entry.id)
      Button($r('app.string.transcode_cleanup')).width('100%').fontSize(13)
        .enabled(!this.model.busy && !this.model.queueRunning && !this.model.exporting &&
          !this.model.picking && !this.model.inspecting)
        .onClick((): void => { void this.model.clearHistory(this.getUIContext()); })
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start).backgroundColor(Color.White).borderRadius(16)
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Text($r('app.string.tab_transcode')).fontSize(26).fontWeight(FontWeight.Bold)
        Text($r('app.string.transcode_description')).fontSize(14).fontColor('#667085')
        this.sourceCard()
        this.optionsCard()
        TranscodePreprocessPanel({ model: this.model })
        this.rangeCard()
        this.analysisCard()
        TranscodeQueuePanel({
          queue: this.model.queue,
          running: this.model.queueRunning,
          canAdd: !this.model.busy && !this.model.queueRunning && !this.model.picking && !this.model.exporting &&
            !this.model.inspecting && this.model.analysis.state === 2 && this.model.isRangeValid(),
          onAdd: (): void => { void this.model.enqueue(this.getUIContext()); },
          onRun: (): void => { void this.model.runQueue(this.getUIContext()); },
          onChanged: (): void => { void this.model.persistQueue(this.getUIContext()); },
          onRelink: (id: string): void => { void this.model.reassociateQueueItem(id, this.getUIContext()); }
        })
        this.resultCard()
        this.historyCard()
        Text($r('app.string.transcode_limits')).fontSize(12).fontColor('#667085')
      }
      .width('100%').padding(16).alignItems(HorizontalAlign.Start)
    }
    .width('100%').height('100%').backgroundColor('#F8F9FA')
    .align(Alignment.Top).scrollBar(BarState.Auto)
  }
}
