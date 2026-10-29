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

import { AudioMediaInfo, DecoderInfo, MediaInfo, MediaTrackInfo, VideoMediaInfo } from 'libplayer.so';
import { resourceManager } from '@kit.LocalizationKit';
import { formatMediaTime } from './PlaybackInfoModel';
import Logger from '../common/utils/Logger';

const BITS_PER_KILOBIT: number = 1000;
const BYTES_PER_KILOBYTE: number = 1024;
const BYTES_PER_MEGABYTE: number = BYTES_PER_KILOBYTE * BYTES_PER_KILOBYTE;

export interface MediaInfoRow {
  label: string;
  value: string;
}

export interface MediaInfoSection {
  title: string;
  rows: MediaInfoRow[];
  rawText: string;
}

export function buildMediaInfoSections(info: MediaInfo, resources: resourceManager.ResourceManager,
  sourceTitle: string = ''): MediaInfoSection[] {
  if (!info.available) {
    return [];
  }
  return new MediaInfoFormatter(resources).buildSections(info, sourceTitle);
}

// 使用页面传入的资源管理器，避免模型依赖全局 Context，也让导出的文字与界面语言一致。
class MediaInfoFormatter {
  private resources: resourceManager.ResourceManager;

  constructor(resources: resourceManager.ResourceManager) {
    this.resources = resources;
  }

  buildSections(info: MediaInfo, sourceTitle: string): MediaInfoSection[] {
    const sections: MediaInfoSection[] = [this.buildSourceSection(info, sourceTitle)];
    if (info.video.codecMime.length > 0) {
      sections.push(this.buildVideoSection(info.video));
    }
    if (info.audio.codecMime.length > 0) {
      sections.push(this.buildAudioSection(info.audio));
    }
    sections.push(this.buildDecoderSection(info.decoder));
    sections.push(this.createRawSection(this.text($r('app.string.media_info_source_raw')), info.sourceFormatDump));
    info.tracks.forEach((track: MediaTrackInfo) => {
      const title: string = this.formattedText($r('app.string.media_info_track_raw'),
        track.index.toString(), this.formatTrackType(track.type));
      sections.push(this.createRawSection(title, track.formatDump));
    });
    return sections;
  }

  private buildSourceSection(info: MediaInfo, sourceTitle: string): MediaInfoSection {
    return this.createRowsSection($r('app.string.media_info_source'), [
      this.createRow($r('app.string.media_info_file_name'), sourceTitle.length > 0 ? sourceTitle : this.notProvided()),
      this.createRow($r('app.string.media_info_file_size'), this.formatFileSize(info.fileSize)),
      this.createRow($r('app.string.media_info_duration'), this.formattedText(
        $r('app.string.media_info_duration_value'), formatMediaTime(info.durationUs), info.durationUs.toString())),
      this.createRow($r('app.string.media_info_track_count'), info.trackCount.toString())
    ]);
  }

  private buildVideoSection(info: VideoMediaInfo): MediaInfoSection {
    return this.createRowsSection($r('app.string.media_info_video_track'), [
      this.createRow($r('app.string.media_info_codec'), info.codecMime),
      this.createRow($r('app.string.media_info_resolution'), info.width + ' × ' + info.height),
      this.createRow($r('app.string.media_info_frame_rate'), this.formatFrameRate(info.frameRate)),
      this.createRow($r('app.string.media_info_bitrate'), this.formatBitrate(info.bitrate)),
      this.createRow($r('app.string.media_info_profile'), info.profile.toString()),
      this.createRow($r('app.string.media_info_rotation'), info.rotation + '°'),
      this.createRow($r('app.string.media_info_hdr_container'), this.formatDetected(info.isHdrVividContainerSignaled)),
      this.createRow($r('app.string.media_info_hdr_confirmed'), this.text(info.isHdrVividConfirmed ?
        $r('app.string.playback_diagnostics_confirmed') : $r('app.string.playback_diagnostics_unconfirmed')))
    ]);
  }

  private buildAudioSection(info: AudioMediaInfo): MediaInfoSection {
    return this.createRowsSection($r('app.string.media_info_audio_track'), [
      this.createRow($r('app.string.media_info_codec'), info.codecMime),
      this.createRow($r('app.string.media_info_sample_rate'), info.sampleRate + ' Hz'),
      this.createRow($r('app.string.media_info_channel_count'), info.channelCount.toString()),
      this.createRow($r('app.string.media_info_channel_layout'), info.channelLayout.toString()),
      this.createRow($r('app.string.media_info_sample_format'), info.sampleFormat.toString()),
      this.createRow($r('app.string.media_info_bitrate'), this.formatBitrate(info.bitrate)),
      this.createRow($r('app.string.media_info_aac_adts'),
        info.aacAdts < 0 ? this.notProvided() : this.formatEnabled(info.aacAdts === 1)),
      this.createRow($r('app.string.media_info_codec_config'), info.codecConfigLength + ' bytes')
    ]);
  }

  private buildDecoderSection(info: DecoderInfo): MediaInfoSection {
    const decoderTypes: string[] = [this.text($r('app.string.setting_decoder_auto')),
      this.text($r('app.string.setting_decoder_hardware')), this.text($r('app.string.setting_decoder_software'))];
    return this.createRowsSection($r('app.string.media_info_decoder_output'), [
      this.createRow($r('app.string.media_info_video_decoder'), this.getOptionName(decoderTypes, info.type)),
      this.createRow($r('app.string.media_info_run_mode'), this.getRunModeName(info.runMode)),
      this.createRow($r('app.string.media_info_codec_mode'), info.syncMode === 1 ? 'SYNC' : 'ASYNC'),
      this.createRow($r('app.string.media_info_video_dump'), this.formatEnabled(info.videoDumpEnabled))
    ]);
  }

  private getRunModeName(runMode: number): string {
    const runModes: string[] = ['SurfaceMode', 'BufferMode', 'OpenGLMode', 'VulkanMode'];
    return this.getOptionName(runModes, runMode);
  }

  private createRowsSection(title: Resource, rows: MediaInfoRow[]): MediaInfoSection {
    return { title: this.text(title), rows: rows, rawText: '' };
  }

  private createRawSection(title: string, rawText: string): MediaInfoSection {
    return { title: title, rows: [], rawText: rawText.length > 0 ? rawText :
      this.text($r('app.string.media_info_no_data')) };
  }

  private createRow(label: Resource, value: string): MediaInfoRow {
    return { label: this.text(label), value: value };
  }

  private getOptionName(options: string[], index: number): string {
    return index >= 0 && index < options.length ? options[index] :
      this.formattedText($r('app.string.media_info_unknown_value'), index.toString());
  }

  private formatTrackType(trackType: number): string {
    if (trackType === 0) {
      return this.text($r('app.string.media_info_track_audio'));
    }
    if (trackType === 1) {
      return this.text($r('app.string.media_info_track_video'));
    }
    return this.formattedText($r('app.string.media_info_track_other'), trackType.toString());
  }

  private formatFileSize(size: number): string {
    if (size >= BYTES_PER_MEGABYTE) {
      return this.formattedText($r('app.string.media_info_file_size_value'),
        (size / BYTES_PER_MEGABYTE).toFixed(2), 'MiB', size.toString());
    }
    if (size >= BYTES_PER_KILOBYTE) {
      return this.formattedText($r('app.string.media_info_file_size_value'),
        (size / BYTES_PER_KILOBYTE).toFixed(2), 'KiB', size.toString());
    }
    return size + ' bytes';
  }

  private formatBitrate(bitrate: number): string {
    return bitrate > 0 ? (bitrate / BITS_PER_KILOBIT).toFixed(2) + ' kbps' : this.notProvided();
  }

  private formatFrameRate(frameRate: number): string {
    return frameRate > 0 ? frameRate.toFixed(3) + ' fps' : this.notProvided();
  }

  private formatEnabled(enabled: boolean): string {
    return this.text(enabled ? $r('app.string.media_info_enabled') : $r('app.string.media_info_disabled'));
  }

  private formatDetected(detected: boolean): string {
    return this.text(detected ? $r('app.string.media_info_yes') : $r('app.string.media_info_no'));
  }

  private notProvided(): string {
    return this.text($r('app.string.media_info_not_provided'));
  }

  private text(resource: Resource): string {
    try {
      return this.resources.getStringSync(resource.id);
    } catch (error) {
      Logger.error('MediaInfoFormatter', 'Read string resource failed: ' + JSON.stringify(error));
      return '';
    }
  }

  private formattedText(resource: Resource, first: string, second: string = '', third: string = ''): string {
    try {
      return this.resources.getStringSync(resource.id, first, second, third);
    } catch (error) {
      Logger.error('MediaInfoFormatter', 'Format string resource failed: ' + JSON.stringify(error));
      return '';
    }
  }
}
