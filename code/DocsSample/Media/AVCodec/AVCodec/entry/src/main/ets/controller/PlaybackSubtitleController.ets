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
import { parseSubtitle, SubtitleTimeline } from '../model/SubtitleModel';

export class PlaybackSubtitleController {
  private static readonly MAX_FILE_BYTES: number = 4 * 1024 * 1024;
  private static readonly MAX_CUES: number = 100000;
  private timeline: SubtitleTimeline = new SubtitleTimeline();
  private revision: number = 0;

  async selectAndLoad(): Promise<string> {
    const request: number = ++this.revision;
    let result: string[] = [];
    try {
      const options = new picker.DocumentSelectOptions();
      options.fileSuffixFilters = ['SRT|.srt', 'WebVTT|.vtt'];
      result = await new picker.DocumentViewPicker().select(options);
    } catch (error) {
      if (request !== this.revision) { return ''; }
      throw new Error('Unable to select subtitle: ' + JSON.stringify(error));
    }
    if (request !== this.revision || result.length === 0) { return ''; }
    return this.load(result[0]);
  }

  async load(uri: string): Promise<string> {
    const request: number = ++this.revision;
    let content: string = '';
    try {
      const stat: fileIo.Stat = await fileIo.stat(uri);
      if (stat.size > PlaybackSubtitleController.MAX_FILE_BYTES) { throw new Error('Subtitle exceeds 4 MiB'); }
      content = await fileIo.readText(uri, { encoding: 'UTF-8' });
    } catch (error) {
      if (request !== this.revision) { return ''; }
      throw new Error('Unable to read subtitle: ' + JSON.stringify(error));
    }
    const name: string = uri.substring(uri.lastIndexOf('/') + 1);
    const cues = parseSubtitle(content, name);
    if (request !== this.revision) { return ''; }
    if (cues.length === 0 || cues.length > PlaybackSubtitleController.MAX_CUES) {
      throw new Error('Invalid subtitle cue count');
    }
    this.timeline.setCues(cues);
    return name;
  }

  textAt(positionUs: number, delayMs: number): string {
    return this.timeline.textAt(positionUs - delayMs * 1000);
  }

  clear(): void { ++this.revision; this.timeline.setCues([]); }
}
