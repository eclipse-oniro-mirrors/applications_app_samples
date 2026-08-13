/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { formatMediaTime } from './PlaybackInfoModel';

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

export function buildMediaInfoSections(info: MediaInfo): MediaInfoSection[] {
  if (!info.available) {
    return [];
  }
  const sections: MediaInfoSection[] = [buildSourceSection(info)];
  if (info.video.codecMime.length > 0) {
    sections.push(buildVideoSection(info.video));
  }
  if (info.audio.codecMime.length > 0) {
    sections.push(buildAudioSection(info.audio));
  }
  sections.push(buildDecoderSection(info.decoder));
  sections.push(createRawSection('Source Format 原始信息', info.sourceFormatDump));
  info.tracks.forEach((track: MediaTrackInfo) => {
    const title = 'Track ' + track.index + '（' + formatTrackType(track.type) + '）原始信息';
    sections.push(createRawSection(title, track.formatDump));
  });
  return sections;
}

function buildSourceSection(info: MediaInfo): MediaInfoSection {
  return createRowsSection('媒体源', [
    createRow('文件大小', formatFileSize(info.fileSize)),
    createRow('总时长', formatMediaTime(info.durationUs) + '（' + info.durationUs + ' us）'),
    createRow('轨道数量', info.trackCount.toString())
  ]);
}

function buildVideoSection(info: VideoMediaInfo): MediaInfoSection {
  return createRowsSection('视频轨', [
    createRow('编码格式', info.codecMime),
    createRow('分辨率', info.width + ' × ' + info.height),
    createRow('帧率', formatFrameRate(info.frameRate)),
    createRow('码率', formatBitrate(info.bitrate)),
    createRow('Profile', info.profile.toString()),
    createRow('旋转角度', info.rotation + '°'),
    createRow('HDR Vivid 封装声明', formatDetected(info.isHdrVividContainerSignaled)),
    createRow('HDR Vivid 码流确认', info.isHdrVividConfirmed ? '已确认' : '尚未确认')
  ]);
}

function buildAudioSection(info: AudioMediaInfo): MediaInfoSection {
  return createRowsSection('音频轨', [
    createRow('编码格式', info.codecMime),
    createRow('采样率', info.sampleRate + ' Hz'),
    createRow('声道数', info.channelCount.toString()),
    createRow('声道布局', info.channelLayout.toString()),
    createRow('采样格式', info.sampleFormat.toString()),
    createRow('码率', formatBitrate(info.bitrate)),
    createRow('AAC ADTS', info.aacAdts < 0 ? '未提供' : formatEnabled(info.aacAdts === 1)),
    createRow('Codec Config', info.codecConfigLength + ' bytes')
  ]);
}

function buildDecoderSection(info: DecoderInfo): MediaInfoSection {
  const decoderTypes: string[] = ['自动选择', '硬件解码器', '软件解码器'];
  return createRowsSection('解码与输出', [
    createRow('视频解码器', getOptionName(decoderTypes, info.type)),
    createRow('运行模式', info.runMode === 1 ? 'BufferMode' : 'SurfaceMode'),
    createRow('Codec 模式', info.syncMode === 1 ? 'SYNC' : 'ASYNC'),
    createRow('视频 Dump', formatEnabled(info.videoDumpEnabled))
  ]);
}

function createRowsSection(title: string, rows: MediaInfoRow[]): MediaInfoSection {
  return { title: title, rows: rows, rawText: '' };
}

function createRawSection(title: string, rawText: string): MediaInfoSection {
  return { title: title, rows: [], rawText: rawText.length > 0 ? rawText : '无可用信息' };
}

function createRow(label: string, value: string): MediaInfoRow {
  return { label: label, value: value };
}

function getOptionName(options: string[], index: number): string {
  return index >= 0 && index < options.length ? options[index] : '未知（' + index + '）';
}

function formatTrackType(trackType: number): string {
  if (trackType === 0) {
    return '音频';
  }
  if (trackType === 1) {
    return '视频';
  }
  return '其他类型 ' + trackType;
}

function formatFileSize(size: number): string {
  if (size >= BYTES_PER_MEGABYTE) {
    return (size / BYTES_PER_MEGABYTE).toFixed(2) + ' MiB（' + size + ' bytes）';
  }
  if (size >= BYTES_PER_KILOBYTE) {
    return (size / BYTES_PER_KILOBYTE).toFixed(2) + ' KiB（' + size + ' bytes）';
  }
  return size + ' bytes';
}

function formatBitrate(bitrate: number): string {
  return bitrate > 0 ? (bitrate / BITS_PER_KILOBIT).toFixed(2) + ' kbps' : '未提供';
}

function formatFrameRate(frameRate: number): string {
  return frameRate > 0 ? frameRate.toFixed(3) + ' fps' : '未提供';
}

function formatEnabled(enabled: boolean): string {
  return enabled ? '开启' : '关闭';
}

function formatDetected(detected: boolean): string {
  return detected ? '是' : '否';
}
