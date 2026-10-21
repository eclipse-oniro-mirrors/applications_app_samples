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

import { deviceInfo, pasteboard } from '@kit.BasicServicesKit';
import { fileIo, picker } from '@kit.CoreFileKit';
import player, { DeviceCodecCapability, DeviceCodecCapabilityRange, DeviceCodecProfileLevels, MediaInfo, PlaybackInfo } from 'libplayer.so';
import { PlaybackViewModel } from '../viewmodel/PlaybackViewModel';

const CAPABILITY_API_VERSION: number = 24;
const VIDEO_DECODER_TYPE: number = 1;
const VIDEO_ENCODER_TYPE: number = 0;
const AUDIO_DECODER_TYPE: number = 3;
const AUDIO_ENCODER_TYPE: number = 2;

@Component
export struct DeviceDiagnosticsPage {
  @ObjectLink model: PlaybackViewModel;
  @State private capabilities: DeviceCodecCapability[] = [];
  @State private expandedCodecType: number = -1;
  @State private expandedCodecKey: string = '';
  @State private reportText: string = '';
  @State private loading: boolean = false;
  @State private reportGenerated: boolean = false;

  aboutToAppear(): void {
    this.refreshCapabilities();
  }

  private refreshCapabilities(): void {
    this.loading = true;
    try {
      if (deviceInfo.sdkApiVersion >= CAPABILITY_API_VERSION) {
        this.capabilities = player.getDeviceCodecCapabilities();
      } else {
        this.capabilities = [];
      }
    } catch (_error) {
      this.capabilities = [];
    }
    this.loading = false;
  }

  private capabilitiesForType(codecType: number): DeviceCodecCapability[] {
    return this.capabilities.filter((item: DeviceCodecCapability): boolean => item.codecType === codecType);
  }

  private capabilityKey(item: DeviceCodecCapability): string {
    return item.codecType + ':' + item.codecName + ':' + item.mimeType;
  }

  private toggleCodecType(codecType: number): void {
    this.expandedCodecType = this.expandedCodecType === codecType ? -1 : codecType;
    this.expandedCodecKey = '';
  }

  private toggleCodecDetails(item: DeviceCodecCapability): void {
    const key: string = this.capabilityKey(item);
    this.expandedCodecKey = this.expandedCodecKey === key ? '' : key;
  }

  private rangeText(range: DeviceCodecCapabilityRange): string {
    return range.min + ' – ' + range.max;
  }

  private profileLevelsText(levels: DeviceCodecProfileLevels[]): string {
    const lines: string[] = [];
    for (let index = 0; index < levels.length; index++) {
      const item: DeviceCodecProfileLevels = levels[index];
      lines.push(item.profile + ': ' + item.levels.join(', '));
    }
    return lines.length > 0 ? lines.join('  |  ') : '--';
  }

  private appendCapabilityDetails(reportLines: string[], item: DeviceCodecCapability): void {
    reportLines.push('  ' + this.text($r('app.string.device_codec_details')) + ':');
    if (item.codecType === VIDEO_DECODER_TYPE || item.codecType === VIDEO_ENCODER_TYPE) {
      if (item.videoWidthRange !== undefined) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_video_width_range')) + ': ' +
          this.rangeText(item.videoWidthRange));
      }
      if (item.videoHeightRange !== undefined) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_video_height_range')) + ': ' +
          this.rangeText(item.videoHeightRange));
      }
      if (item.videoFrameRateRange !== undefined) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_video_frame_rate_range')) + ': ' +
          this.rangeText(item.videoFrameRateRange) + ' fps');
      }
      if (item.videoWidthAlignment !== undefined) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_video_width_alignment')) + ': ' +
          item.videoWidthAlignment);
      }
      if (item.videoHeightAlignment !== undefined) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_video_height_alignment')) + ': ' +
          item.videoHeightAlignment);
      }
      if (item.videoPixelFormats.length > 0) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_video_pixel_formats')) + ': ' +
          item.videoPixelFormats.join(', '));
      }
      if (item.profiles.length > 0) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_profiles')) + ': ' +
          item.profiles.join(', '));
        reportLines.push('    ' + this.text($r('app.string.device_codec_profile_levels')) + ': ' +
          this.profileLevelsText(item.profileLevels));
      }
    } else {
      if (item.audioSampleRates.length > 0) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_audio_sample_rates')) + ': ' +
          item.audioSampleRates.join(', '));
      }
      if (item.audioSampleRateRanges.length > 0) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_audio_sample_rate_ranges')) + ': ' +
          item.audioSampleRateRanges.map((range: DeviceCodecCapabilityRange): string =>
            this.rangeText(range)).join(', '));
      }
      if (item.audioChannelCountRange !== undefined) {
        reportLines.push('    ' + this.text($r('app.string.device_codec_audio_channel_count_range')) + ': ' +
          this.rangeText(item.audioChannelCountRange));
      }
    }
    if (item.encoderBitrateRange !== undefined) {
      reportLines.push('    ' + this.text($r('app.string.device_codec_encoder_bitrate_range')) + ': ' +
        this.rangeText(item.encoderBitrateRange));
    }
  }

  private playbackStateText(state: number): string {
    if (state === player.PlayerState.PLAYING) {
      return this.text($r('app.string.device_report_state_playing'));
    }
    if (state === player.PlayerState.PAUSED) {
      return this.text($r('app.string.device_report_state_paused'));
    }
    if (state === player.PlayerState.SEEKING) {
      return this.text($r('app.string.device_report_state_seeking'));
    }
    if (state === player.PlayerState.READY) {
      return this.text($r('app.string.device_report_state_ready'));
    }
    return this.text($r('app.string.device_report_state_idle'));
  }

  private decoderTypeText(decoderType: number): string {
    if (decoderType === 1) {
      return this.text($r('app.string.device_report_decoder_hardware'));
    }
    if (decoderType === 2) {
      return this.text($r('app.string.device_report_decoder_software'));
    }
    return this.text($r('app.string.device_report_decoder_auto'));
  }

  private runModeText(runMode: number): string {
    if (runMode === 1) {
      return this.text($r('app.string.setting_render_buffer'));
    }
    if (runMode === 2) {
      return this.text($r('app.string.setting_render_opengl'));
    }
    if (runMode === 3) {
      return this.text($r('app.string.setting_render_vulkan'));
    }
    return this.text($r('app.string.setting_render_direct'));
  }

  private mediaSummary(mediaInfo: MediaInfo): string {
    if (!mediaInfo.available) {
      return this.text($r('app.string.device_report_no_media'));
    }
    const lines: string[] = [];
    if (mediaInfo.video.codecMime.length > 0) {
      lines.push(this.text($r('app.string.device_report_video')) + ': ' + mediaInfo.video.codecMime + ', ' +
        mediaInfo.video.width + 'x' + mediaInfo.video.height + ', ' + mediaInfo.video.frameRate + ' fps, ' +
        this.text(mediaInfo.video.isHdrVividConfirmed ? $r('app.string.device_report_hdr_confirmed') :
          $r('app.string.device_report_hdr_unconfirmed')));
    }
    if (mediaInfo.audio.codecMime.length > 0) {
      lines.push(this.text($r('app.string.device_report_audio')) + ': ' + mediaInfo.audio.codecMime + ', ' +
        mediaInfo.audio.sampleRate + ' Hz, ' + mediaInfo.audio.channelCount + ' ch');
    }
    return lines.length > 0 ? lines.join('\n') : this.text($r('app.string.device_report_no_media'));
  }

  private playbackStatsAvailable(playback: PlaybackInfo, mediaInfo: MediaInfo): boolean {
    return mediaInfo.available && playback.state !== player.PlayerState.IDLE &&
      playback.state !== player.PlayerState.READY;
  }

  private buildReport(playback: PlaybackInfo, mediaInfo: MediaInfo): string {
    const reportLines: string[] = [
      this.text($r('app.string.device_report_title')),
      this.text($r('app.string.device_report_time')) + ': ' + new Date().toISOString(),
      this.text($r('app.string.device_report_device')) + ': ' + deviceInfo.productModel,
      this.text($r('app.string.device_report_system')) + ': ' + deviceInfo.osFullName,
      this.text($r('app.string.device_report_api')) + ': ' + deviceInfo.sdkApiVersion,
      '',
      this.text($r('app.string.device_report_playback')) + ': ' + this.playbackStateText(playback.state),
      this.text($r('app.string.device_report_speed')) + ': ' + playback.speed.toFixed(2) + 'x',
      this.text($r('app.string.device_report_decoder')) + ': ' + this.decoderTypeText(mediaInfo.decoder.type),
      this.text($r('app.string.device_report_render_mode')) + ': ' + this.runModeText(mediaInfo.decoder.runMode),
      this.text($r('app.string.device_report_fallback')) + ': ' +
        (playback.isSoftwareDecoderFallbackUsed ? this.text($r('app.string.device_report_yes')) :
          this.text($r('app.string.device_report_no'))),
      this.text($r('app.string.device_report_media')) + ':',
      this.mediaSummary(mediaInfo),
      '',
      this.text($r('app.string.device_report_frames')) + ': ' +
        (this.playbackStatsAvailable(playback, mediaInfo) ? playback.videoOutputFrames.toString() : '--'),
      this.text($r('app.string.device_report_rendered')) + ': ' +
        (this.playbackStatsAvailable(playback, mediaInfo) ? playback.videoRenderedFrames.toString() : '--'),
      this.text($r('app.string.device_report_dropped')) + ': ' +
        (this.playbackStatsAvailable(playback, mediaInfo) ? playback.videoDroppedFrames.toString() : '--'),
      this.text($r('app.string.device_report_output_fps')) + ': ' +
        (this.model.hasVideoOutputFpsSample && this.playbackStatsAvailable(playback, mediaInfo) ?
          this.model.videoOutputFps.toFixed(1) : '--'),
      this.text($r('app.string.device_report_seek_rebuild')) + ': ' +
        (playback.diagnostics.seekRebuildUs >= 0 ? (playback.diagnostics.seekRebuildUs / 1000).toFixed(1) + ' ms' : '--'),
      this.text($r('app.string.device_report_seek_first_frame')) + ': ' +
        (playback.diagnostics.seekFirstOutputUs >= 0 ? (playback.diagnostics.seekFirstOutputUs / 1000).toFixed(1) + ' ms' : '--'),
      this.text($r('app.string.device_report_av_offset')) + ': ' +
        (playback.diagnostics.syncAvailable ? (playback.diagnostics.avOffsetUs / 1000).toFixed(1) + ' ms' : '--')
    ];
    if (playback.diagnostics.syncAvailable) {
      reportLines.push('', this.text($r('app.string.device_report_audio_sync')));
      reportLines.push(this.text($r('app.string.device_report_av_offset')) + ': ' +
        (playback.diagnostics.avOffsetUs / 1000).toFixed(1) + ' ms');
      reportLines.push(this.text($r('app.string.device_report_audio_queue')) + ': ' +
        (playback.diagnostics.audioQueueDurationUs / 1000).toFixed(1) + ' ms');
      reportLines.push(this.text($r('app.string.device_report_audio_pending')) + ': ' +
        (playback.diagnostics.audioDevicePendingUs / 1000).toFixed(1) + ' ms');
      reportLines.push(this.text($r('app.string.device_report_underruns')) + ': ' +
        playback.diagnostics.audioUnderruns);
      reportLines.push(this.text($r('app.string.device_report_sync_drops')) + ': ' +
        playback.diagnostics.syncDrops);
    }
    if (playback.videoSinkDiagnostics.available) {
      reportLines.push('', this.text($r('app.string.device_report_sink_performance')));
      reportLines.push(this.text($r('app.string.device_report_sink_frames')) + ': ' +
        playback.videoSinkDiagnostics.frames);
      reportLines.push(this.text($r('app.string.device_report_sink_import')) + ': ' +
        playback.videoSinkDiagnostics.averageImportUs.toFixed(1) + ' us');
      reportLines.push(this.text($r('app.string.device_report_sink_submit')) + ': ' +
        playback.videoSinkDiagnostics.averageSubmitUs.toFixed(1) + ' us');
      reportLines.push(this.text($r('app.string.device_report_sink_fence')) + ': ' +
        playback.videoSinkDiagnostics.averageAcquireFenceWaitUs.toFixed(1) + ' us');
      reportLines.push(this.text($r('app.string.device_report_sink_gpu')) + ': ' +
        playback.videoSinkDiagnostics.averageGpuWaitUs.toFixed(1) + ' us');
      reportLines.push(this.text($r('app.string.device_report_sink_cache')) + ': ' +
        playback.videoSinkDiagnostics.cacheHits + ' / ' + playback.videoSinkDiagnostics.cacheMisses);
      reportLines.push(this.text($r('app.string.device_report_sink_failures')) + ': ' +
        playback.videoSinkDiagnostics.failures);
    }
    if (this.capabilities.length > 0) {
      reportLines.push('', this.text($r('app.string.device_report_codec_capabilities')));
      for (let index = 0; index < this.capabilities.length; index++) {
        const item: DeviceCodecCapability = this.capabilities[index];
        const category: string = item.hardware ? this.text($r('app.string.device_codec_hardware')) :
          this.text($r('app.string.device_codec_software'));
        reportLines.push(item.codecName + ' | ' + item.mimeType + ' | ' + category + ' | ' +
          this.text($r('app.string.device_codec_max_instances')) + ': ' + item.maxInstances);
        this.appendCapabilityDetails(reportLines, item);
      }
    }
    reportLines.push('', this.text($r('app.string.device_report_privacy')));
    reportLines.push(this.text($r('app.string.device_report_measurement_note')));
    return reportLines.join('\n');
  }

  private text(resource: Resource): string {
    const hostContext = this.getUIContext().getHostContext();
    if (hostContext === undefined) {
      return '';
    }
    try {
      return hostContext.resourceManager.getStringSync(resource.id);
    } catch (_error) {
      return '';
    }
  }

  private generateReport(): void {
    try {
      const playback: PlaybackInfo = player.getPlaybackInfo();
      const mediaInfo: MediaInfo = player.getMediaInfo();
      this.reportText = this.buildReport(playback, mediaInfo);
      this.reportGenerated = true;
    } catch (_error) {
      this.reportText = this.text($r('app.string.device_report_generation_failed'));
      this.reportGenerated = false;
    }
  }

  private async copyReport(): Promise<void> {
    this.generateReport();
    if (!this.reportGenerated) {
      return;
    }
    try {
      const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, this.reportText);
      await pasteboard.getSystemPasteboard().setData(data);
      this.getUIContext().getPromptAction().showToast({ message: this.text($r('app.string.device_report_copied')) });
    } catch (_error) {
      this.getUIContext().getPromptAction().showToast({ message: this.text($r('app.string.device_report_copy_failed')) });
    }
  }

  private async saveReport(): Promise<void> {
    this.generateReport();
    if (!this.reportGenerated) {
      return;
    }
    let outputFile: fileIo.File | undefined = undefined;
    try {
      const options = new picker.DocumentSaveOptions();
      // 文件名自带扩展名，不再设置 suffix，避免 Picker 再拼接一次。
      options.newFileNames = ['avcodec-diagnostic-report.txt'];
      const hostContext = this.getUIContext().getHostContext();
      if (hostContext === undefined) {
        return;
      }
      const result: string[] = await new picker.DocumentViewPicker(hostContext).save(options);
      if (result.length === 0) {
        return;
      }
      outputFile = fileIo.openSync(result[0], fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
      fileIo.writeSync(outputFile.fd, this.reportText);
      this.getUIContext().getPromptAction().showToast({ message: this.text($r('app.string.device_report_saved')) });
    } catch (_error) {
      this.getUIContext().getPromptAction().showToast({ message: this.text($r('app.string.device_report_save_failed')) });
    } finally {
      if (outputFile !== undefined) {
        fileIo.closeSync(outputFile);
      }
    }
  }

  @Builder
  private capabilityGroup(title: Resource, codecType: number) {
    Column({ space: '8vp' }) {
      Row() {
        Text(title).fontSize('16fp').fontWeight(FontWeight.Medium).fontColor('#1D2939')
        Blank()
        Text(this.capabilitiesForType(codecType).length.toString())
          .fontSize('12fp').fontColor('#667085')
        Text(this.expandedCodecType === codecType ? '⌃' : '⌄')
          .fontSize('16fp').fontColor('#667085').margin({ left: 8 })
      }.width('100%').onClick(() => this.toggleCodecType(codecType))
      if (this.expandedCodecType === codecType && this.capabilitiesForType(codecType).length === 0) {
        Text(this.text($r('app.string.device_codec_empty')))
          .fontSize('13fp').fontColor('#667085').width('100%').padding(12)
      } else if (this.expandedCodecType === codecType) {
        ForEach(this.capabilitiesForType(codecType), (item: DeviceCodecCapability): void => {
          Column({ space: '4vp' }) {
            Row() {
              Column({ space: '4vp' }) {
                Text(item.codecName).fontSize('14fp').fontWeight(FontWeight.Medium).fontColor('#344054')
                Text(item.mimeType).fontSize('12fp').fontColor('#667085')
                Text(this.text($r('app.string.device_codec_max_instances')) + ': ' + item.maxInstances)
                  .fontSize('11fp').fontColor('#667085')
              }.alignItems(HorizontalAlign.Start).layoutWeight(1)
              Column({ space: '4vp' }) {
                Text(item.hardware ? this.text($r('app.string.device_codec_hardware')) :
                  this.text($r('app.string.device_codec_software')))
                  .fontSize('11fp')
                  .fontColor(item.hardware ? '#175CD3' : '#027A48')
                  .backgroundColor(item.hardware ? '#EAF1FF' : '#ECFDF3')
                  .padding({ left: 8, right: 8, top: 3, bottom: 3 }).borderRadius(8)
                Text(this.expandedCodecKey === this.capabilityKey(item) ? '⌃' : '⌄')
                  .fontSize('15fp').fontColor('#667085')
              }.alignItems(HorizontalAlign.Center)
            }.width('100%')
            if (this.expandedCodecKey === this.capabilityKey(item)) {
              Column({ space: '6vp' }) {
                Text($r('app.string.device_codec_details')).fontSize('12fp')
                  .fontWeight(FontWeight.Medium).fontColor('#344054').width('100%')
                if (item.codecType === VIDEO_DECODER_TYPE || item.codecType === VIDEO_ENCODER_TYPE) {
                  if (item.videoWidthRange !== undefined) {
                    Text(this.text($r('app.string.device_codec_video_width_range')) + ': ' +
                      this.rangeText(item.videoWidthRange)).fontSize('11fp').fontColor('#475467').width('100%')
                  }
                  if (item.videoHeightRange !== undefined) {
                    Text(this.text($r('app.string.device_codec_video_height_range')) + ': ' +
                      this.rangeText(item.videoHeightRange)).fontSize('11fp').fontColor('#475467').width('100%')
                  }
                  if (item.videoFrameRateRange !== undefined) {
                    Text(this.text($r('app.string.device_codec_video_frame_rate_range')) + ': ' +
                      this.rangeText(item.videoFrameRateRange) + ' fps').fontSize('11fp').fontColor('#475467').width('100%')
                  }
                  if (item.videoWidthAlignment !== undefined) {
                    Text(this.text($r('app.string.device_codec_video_width_alignment')) + ': ' +
                      item.videoWidthAlignment).fontSize('11fp').fontColor('#475467').width('100%')
                  }
                  if (item.videoHeightAlignment !== undefined) {
                    Text(this.text($r('app.string.device_codec_video_height_alignment')) + ': ' +
                      item.videoHeightAlignment).fontSize('11fp').fontColor('#475467').width('100%')
                  }
                  if (item.videoPixelFormats.length > 0) {
                    Text(this.text($r('app.string.device_codec_video_pixel_formats')) + ': ' +
                      item.videoPixelFormats.join(', ')).fontSize('11fp').fontColor('#475467').width('100%')
                  }
                  if (item.profiles.length > 0) {
                    Text(this.text($r('app.string.device_codec_profiles')) + ': ' + item.profiles.join(', '))
                      .fontSize('11fp').fontColor('#475467').width('100%')
                    Text(this.text($r('app.string.device_codec_profile_levels')) + ': ' +
                      this.profileLevelsText(item.profileLevels)).fontSize('11fp').fontColor('#475467').width('100%')
                  }
                } else {
                  if (item.audioSampleRates.length > 0) {
                    Text(this.text($r('app.string.device_codec_audio_sample_rates')) + ': ' +
                      item.audioSampleRates.join(', ')).fontSize('11fp').fontColor('#475467').width('100%')
                  }
                  if (item.audioSampleRateRanges.length > 0) {
                    Text(this.text($r('app.string.device_codec_audio_sample_rate_ranges')) + ': ' +
                      item.audioSampleRateRanges.map((range: DeviceCodecCapabilityRange): string =>
                        this.rangeText(range)).join(', ')).fontSize('11fp').fontColor('#475467').width('100%')
                  }
                  if (item.audioChannelCountRange !== undefined) {
                    Text(this.text($r('app.string.device_codec_audio_channel_count_range')) + ': ' +
                      this.rangeText(item.audioChannelCountRange)).fontSize('11fp').fontColor('#475467').width('100%')
                  }
                }
                if (item.encoderBitrateRange !== undefined) {
                  Text(this.text($r('app.string.device_codec_encoder_bitrate_range')) + ': ' +
                    this.rangeText(item.encoderBitrateRange)).fontSize('11fp').fontColor('#475467').width('100%')
                }
              }
              .width('100%').margin({ top: 4 }).padding(10).backgroundColor('#F8FAFC').borderRadius(8)
            }
          }
          .width('100%')
          .padding(12)
          .backgroundColor(Color.White)
          .borderRadius(12)
          .onClick(() => this.toggleCodecDetails(item))
        }, (item: DeviceCodecCapability): string =>
          this.capabilityKey(item))
      }
    }
    .width('100%')
    .padding(14)
    .backgroundColor('#F8FAFC')
    .borderRadius(16)
  }

  build() {
    Column({ space: '12vp' }) {
      Row() {
        Column({ space: '4vp' }) {
          Text($r('app.string.device_page_title')).fontSize('22fp').fontWeight(FontWeight.Bold)
            .fontColor('#101828')
          Text(deviceInfo.productModel + ' · ' + deviceInfo.osFullName + ' · API ' + deviceInfo.sdkApiVersion)
            .fontSize('12fp').fontColor('#667085')
        }.alignItems(HorizontalAlign.Start).layoutWeight(1)
        Button($r('app.string.device_codec_refresh'))
          .fontSize('12fp').onClick(() => this.refreshCapabilities())
      }.width('100%')

      if (deviceInfo.sdkApiVersion < CAPABILITY_API_VERSION) {
        Text($r('app.string.device_codec_api_unsupported')).fontSize('13fp').fontColor('#B54708')
          .width('100%').padding(12).backgroundColor('#FFF7ED').borderRadius(12)
      } else if (this.loading) {
        Text($r('app.string.device_codec_loading')).fontSize('13fp').fontColor('#667085').width('100%')
      } else {
        Text($r('app.string.device_codec_description')).fontSize('12fp').fontColor('#667085').width('100%')
        Text($r('app.string.device_codec_expand_hint')).fontSize('11fp').fontColor('#667085').width('100%')
        Scroll() {
          Column({ space: '12vp' }) {
            this.capabilityGroup($r('app.string.device_codec_video_decoder'), VIDEO_DECODER_TYPE)
            this.capabilityGroup($r('app.string.device_codec_video_encoder'), VIDEO_ENCODER_TYPE)
            this.capabilityGroup($r('app.string.device_codec_audio_decoder'), AUDIO_DECODER_TYPE)
            this.capabilityGroup($r('app.string.device_codec_audio_encoder'), AUDIO_ENCODER_TYPE)
            Column({ space: '8vp' }) {
              Text($r('app.string.device_report_section_title')).fontSize('16fp').fontWeight(FontWeight.Medium)
                .fontColor('#1D2939').width('100%')
              Text($r('app.string.device_report_description')).fontSize('12fp').fontColor('#667085')
                .width('100%')
              Row({ space: '8vp' }) {
                Button($r('app.string.device_report_copy'))
                  .layoutWeight(1).onClick(async () => await this.copyReport())
                Button($r('app.string.device_report_save'))
                  .layoutWeight(1).onClick(async () => await this.saveReport())
              }.width('100%')
              if (this.reportGenerated) {
                Text($r('app.string.device_report_ready')).fontSize('11fp').fontColor('#667085').width('100%')
              }
            }
            .width('100%').padding(14).backgroundColor('#F8FAFC').borderRadius(16)
          }.width('100%')
        }
        .layoutWeight(1)
        .width('100%')
      }
    }
    .width('100%')
    .height('100%')
    .padding({ left: 16, right: 16, top: 18, bottom: 8 })
    .backgroundColor('#FFFFFF')
  }
}
