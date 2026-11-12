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

export interface SubtitleCue {
  startUs: number;
  endUs: number;
  text: string;
}

function parseSubtitleTime(value: string): number {
  const parts = value.trim().replace(',', '.').split(':');
  if (parts.length !== 2 && parts.length !== 3) {
    return -1;
  }
  const hours: number = parts.length === 3 ? Number(parts[0]) : 0;
  const minutes: number = parts.length === 3 ? Number(parts[1]) : Number(parts[0]);
  const seconds: number = Number(parts[parts.length - 1]);
  if (!Number.isFinite(hours) || !Number.isFinite(minutes) || !Number.isFinite(seconds)) {
    return -1;
  }
  return Math.round((hours * 3600 + minutes * 60 + seconds) * 1000000);
}

function normalizeCueText(value: string): string {
  return value.replace(/<br\s*\/?\s*>/gi, '\n')
    .replace(/<[^>]*>/g, '')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&nbsp;/g, ' ');
}

function parseSubtitleBlocks(content: string): SubtitleCue[] {
  const cues: SubtitleCue[] = [];
  const normalizedContent = content.replace(/^\uFEFF/, '').replace(/\r/g, '');
  const blocks = normalizedContent.split(/\n\s*\n/);
  for (const block of blocks) {
    const lines = block.split('\n');
    const timeLine = lines.find((line: string) => line.includes('-->') &&
      !line.trim().startsWith('WEBVTT'));
    if (timeLine === undefined) {
      continue;
    }
    const times = timeLine.split('-->');
    if (times.length !== 2) {
      continue;
    }
    const startTime = times[0].trim().split(/\s+/)[0];
    const endTime = times[1].trim().split(/\s+/)[0];
    const startUs = parseSubtitleTime(startTime);
    const endUs = parseSubtitleTime(endTime);
    const text = normalizeCueText(lines.slice(lines.indexOf(timeLine) + 1).join('\n').trim());
    if (startUs >= 0 && endUs > startUs && text.length > 0) {
      cues.push({ startUs, endUs, text });
    }
  }
  return cues.sort((left: SubtitleCue, right: SubtitleCue) => left.startUs - right.startUs);
}

export function parseSrt(content: string): SubtitleCue[] {
  return parseSubtitleBlocks(content);
}

export function parseWebVtt(content: string): SubtitleCue[] {
  if (!content.replace(/^\uFEFF/, '').trimStart().startsWith('WEBVTT')) {
    return [];
  }
  return parseSubtitleBlocks(content);
}

export function parseSubtitle(content: string, fileName: string): SubtitleCue[] {
  const normalizedName = fileName.toLowerCase().split('?')[0];
  if (normalizedName.endsWith('.vtt')) {
    return parseWebVtt(content);
  }
  if (normalizedName.endsWith('.srt')) {
    return parseSrt(content);
  }
  return [];
}

export function findSubtitleText(cues: SubtitleCue[], positionUs: number): string {
  return cues.filter((item: SubtitleCue): boolean => positionUs >= item.startUs && positionUs < item.endUs)
    .map((item: SubtitleCue): string => item.text).join('\n');
}

export class SubtitleTimeline {
  private static readonly REPOSITION_GAP_US: number = 1000000;
  private cues: SubtitleCue[] = [];
  private endBounds: number[] = [];
  private active: SubtitleCue[] = [];
  private cursor: number = 0;
  private lastPosition: number = -1;

  setCues(cues: SubtitleCue[]): void {
    this.cues = cues.slice().sort((left: SubtitleCue, right: SubtitleCue): number => left.startUs - right.startUs);
    this.endBounds = [];
    let end: number = 0;
    for (const cue of this.cues) { end = Math.max(end, cue.endUs); this.endBounds.push(end); }
    this.active = []; this.cursor = 0; this.lastPosition = -1;
  }

  textAt(positionUs: number): string {
    if (!Number.isFinite(positionUs) || positionUs < 0) { return ''; }
    if (this.lastPosition < 0 || positionUs < this.lastPosition ||
      positionUs - this.lastPosition > SubtitleTimeline.REPOSITION_GAP_US) {
      let left: number = 0;
      let right: number = this.cues.length;
      // 前缀最大结束时间保留跨越Seek位置的长字幕，不能只查最近一条开始时间。
      while (left < right) {
        const middle: number = Math.floor((left + right) / 2);
        if (this.endBounds[middle] <= positionUs) { left = middle + 1; } else { right = middle; }
      }
      this.cursor = left; this.active = [];
    }
    this.active = this.active.filter((cue: SubtitleCue): boolean => cue.endUs > positionUs);
    while (this.cursor < this.cues.length && this.cues[this.cursor].startUs <= positionUs) {
      const cue: SubtitleCue = this.cues[this.cursor++];
      if (cue.endUs > positionUs) { this.active.push(cue); }
    }
    this.lastPosition = positionUs;
    return this.active.map((cue: SubtitleCue): string => cue.text).join('\n');
  }
}
