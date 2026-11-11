/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { SongItem } from '../../../main/ets/viewmodel/SongData';
import { LrcEntry, Word } from '../../../main/ets/viewmodel/LrcEntry';

/**
 * 构造歌曲数据。只填充被测逻辑关心的字段，未指定时使用与 main 默认值一致的空值，
 * 避免测试数据本身引用了某个资源从而导致用例依赖资源变化。
 */
export function makeSong(id: number, index: number, src: string = `t_${id}.pcm`): SongItem {
  let song: SongItem = new SongItem();
  song.id = id;
  song.index = index;
  song.src = src;
  song.lyric = '';
  return song;
}

export function makeSongs(count: number): SongItem[] {
  let list: SongItem[] = [];
  for (let i = 0; i < count; i++) {
    list.push(makeSong(i + 1, i));
  }
  return list;
}

export function makeEntry(start: number, duration: number, text: string, words: Word[] = []): LrcEntry {
  return {
    lineStartTime: start,
    lineDuration: duration,
    lineWords: text,
    words: words
  };
}

export function makeWord(text: string, start: number, duration: number): Word {
  return {
    text: text,
    wordStartTime: start,
    duration: duration
  };
}

/**
 * 监听器记录器：把 DataChangeListener 的每次回调按顺序记录成字符串，
 * 用于交叉验证“一次数据操作只产生一次且正确的事件”。
 */
export class RecordingListener implements DataChangeListener {
  public events: string[] = [];

  onDataReloaded(): void {
    this.events.push('reload');
  }

  onDataAdd(index: number): void {
    this.events.push(`add:${index}`);
  }

  onDataMove(from: number, to: number): void {
    this.events.push(`move:${from}->${to}`);
  }

  onDataDelete(index: number): void {
    this.events.push(`delete:${index}`);
  }

  onDataChange(index: number): void {
    this.events.push(`change:${index}`);
  }

  onDataAdded(index: number): void {
    this.events.push(`added:${index}`);
  }

  onDataMoved(from: number, to: number): void {
    this.events.push(`moved:${from}->${to}`);
  }

  onDataDeleted(index: number): void {
    this.events.push(`deleted:${index}`);
  }

  onDataChanged(index: number): void {
    this.events.push(`changed:${index}`);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.events.push(`batch:${dataOperations.length}`);
  }
}

export function joinEvents(listener: RecordingListener): string {
  return listener.events.join('|');
}

/**
 * 把毫秒时间按“时:分:秒”拆开，作为 msToCountdownTime 的独立换算基准。
 * 与 main 实现无关：只使用整数除法和取模。
 */
export function splitClock(ms: number): number[] {
  let totalSeconds: number = Math.floor(ms / 1000);
  return [Math.floor(totalSeconds / 3600), Math.floor((totalSeconds % 3600) / 60), totalSeconds % 60];
}

export function pad2(value: number): string {
  return value.toString().padStart(2, '0');
}

/**
 * 生成一段 PCM 字节。正弦波按 int16 小端采样，便于用独立公式（正弦相位）核对
 * “字节内容确实随时间变化”而不是随机噪声。
 */
export function sinePcm16(frames: number, sampleRate: number, frequency: number, channels: number): Uint8Array {
  let bytes: Uint8Array = new Uint8Array(frames * channels * 2);
  let view: DataView = new DataView(bytes.buffer);
  let offset: number = 0;
  for (let i = 0; i < frames; i++) {
    let value: number = Math.round(Math.sin(2 * Math.PI * frequency * i / sampleRate) * 16000);
    for (let c = 0; c < channels; c++) {
      view.setInt16(offset, value, true);
      offset += 2;
    }
  }
  return bytes;
}

/**
 * 构造最小合法 WAV（RIFF + fmt + data），布局与 native 解析顺序一致：
 * 12 字节基础头 -> fmt 块 -> data 块。所有长度为小端序。
 */
export function buildWavHeader(sampleRate: number, channels: number, bits: number, dataSize: number): Uint8Array {
  let size: number = 44;
  let bytes: Uint8Array = new Uint8Array(size);
  let view: DataView = new DataView(bytes.buffer);
  let writeAscii = (offset: number, text: string): void => {
    for (let i = 0; i < text.length; i++) {
      bytes[offset + i] = text.charCodeAt(i);
    }
  };
  writeAscii(0, 'RIFF');
  view.setUint32(4, 36 + dataSize, true);
  writeAscii(8, 'WAVE');
  writeAscii(12, 'fmt ');
  view.setUint32(16, 16, true);
  view.setUint16(20, 1, true);
  view.setUint16(22, channels, true);
  view.setUint32(24, sampleRate, true);
  view.setUint32(28, sampleRate * channels * (bits / 8), true);
  view.setUint16(32, channels * (bits / 8), true);
  view.setUint16(34, bits, true);
  writeAscii(36, 'data');
  view.setUint32(40, dataSize, true);
  return bytes;
}

/**
 * 按 native CalculateSongDuration 的物理公式计算时长（毫秒，向下取整）：
 * 字节数 / (采样率 × 声道数 × 位深/8) × 1000。
 */
export function expectedDurationMs(dataSize: number, sampleRate: number, channels: number, bits: number): number {
  let bytesPerSecond: number = sampleRate * channels * (bits / 8);
  return Math.floor(dataSize / bytesPerSecond * 1000);
}

/**
 * 把 LRC 标签换算成毫秒的独立基准：(分 × 60 + 秒) × 1000。
 * 传入 2 位小数的秒值时，直接按整数毫秒运算，避免浮点误差。
 */
export function tagToMs(minutes: number, seconds: number, hundredths: number): number {
  return minutes * 60000 + seconds * 1000 + hundredths * 10;
}

/**
 * 从文本中按出现顺序取出所有 [mm:ss.xx] 风格时间标签及其后的行文本，
 * 解析规则独立于 main：仅使用单行正则，不依赖全局 g 标记的可复用状态。
 */
export class LrcLineScanner {
  public times: number[] = [];
  public texts: string[] = [];

  scan(text: string): LrcLineScanner {
    this.times = [];
    this.texts = [];
    let tagRegex: RegExp = new RegExp('\\[(\\d{2,}):(\\d{2})(?:\\.(\\d{2,}))?\\]');
    for (let line of text.split('\n')) {
      let remaining: string = line;
      let match: RegExpMatchArray | null = remaining.match(tagRegex);
      while (match !== null) {
        let minutes: number = Number(match[1]);
        let seconds: number = Number(match[2]);
        let hundredths: number = match[3] === undefined ? 0 : Number(match[3].substring(0, 2));
        this.times.push(tagToMs(minutes, seconds, hundredths));
        remaining = remaining.substring((match.index as number) + match[0].length);
        match = remaining.match(tagRegex);
      }
      this.texts.push(line.replace(new RegExp('\\[\\d{2,}:\\d{2}(?:\\.\\d{2,})?\\]', 'g'), ''));
    }
    return this;
  }

  sortedTimes(): number[] {
    return this.times.slice().sort((a: number, b: number) => a - b);
  }
}
