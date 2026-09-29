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
  if (parts.length !== 3) {
    return -1;
  }
  const hours = Number(parts[0]);
  const minutes = Number(parts[1]);
  const seconds = Number(parts[2]);
  if (!Number.isFinite(hours) || !Number.isFinite(minutes) || !Number.isFinite(seconds)) {
    return -1;
  }
  return Math.round((hours * 3600 + minutes * 60 + seconds) * 1000000);
}

export function parseSrt(content: string): SubtitleCue[] {
  const cues: SubtitleCue[] = [];
  const blocks = content.replace(/\r/g, '').split(/\n\s*\n/);
  for (const block of blocks) {
    const lines = block.split('\n');
    const timeLine = lines.find((line: string) => line.includes('-->'));
    if (timeLine === undefined) {
      continue;
    }
    const times = timeLine.split('-->');
    if (times.length !== 2) {
      continue;
    }
    const startUs = parseSubtitleTime(times[0]);
    const endUs = parseSubtitleTime(times[1]);
    const text = lines.slice(lines.indexOf(timeLine) + 1).join('\n').trim();
    if (startUs >= 0 && endUs > startUs && text.length > 0) {
      cues.push({ startUs, endUs, text });
    }
  }
  return cues.sort((left: SubtitleCue, right: SubtitleCue) => left.startUs - right.startUs);
}

export function findSubtitleText(cues: SubtitleCue[], positionUs: number): string {
  const cue = cues.find((item: SubtitleCue) => positionUs >= item.startUs && positionUs < item.endUs);
  return cue === undefined ? '' : cue.text;
}
