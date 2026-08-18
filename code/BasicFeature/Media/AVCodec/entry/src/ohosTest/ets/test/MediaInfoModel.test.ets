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

import { describe, expect, it } from '@ohos/hypium';
import { MediaInfo } from 'libplayer.so';
import { buildMediaInfoSections, MediaInfoSection } from '../../../main/ets/model/MediaInfoModel';

function createMediaInfo(): MediaInfo {
  return {
    available: true,
    fileSize: 2097152,
    durationUs: 65000000,
    trackCount: 2,
    sourceFormatDump: 'track_count = 2',
    video: {
      codecMime: 'video/avc', width: 1920, height: 1080, frameRate: 59.94,
      bitrate: 8000000, profile: 100, rotation: 0,
      isHdrVividContainerSignaled: true, isHdrVividConfirmed: false
    },
    audio: {
      codecMime: 'audio/mp4a-latm', sampleFormat: 1, sampleRate: 48000, channelCount: 2,
      channelLayout: 3, bitrate: 192000, aacAdts: 0, codecConfigLength: 2
    },
    decoder: { type: 1, runMode: 0, syncMode: 0, videoDumpEnabled: false },
    tracks: [
      { index: 0, type: 1, formatDump: 'codec_mime = video/avc' },
      { index: 1, type: 0, formatDump: 'codec_mime = audio/mp4a-latm' }
    ]
  };
}

export default function mediaInfoModelTest(): void {
  describe('MediaInfoModelTest', () => {
    it('shouldBuildStructuredAndRawSections', 0, () => {
      const sections = buildMediaInfoSections(createMediaInfo());
      expect(sections.length).assertEqual(7);
      expect(sections[0].rows[0].value).assertEqual('2.00 MiB（2097152 bytes）');
      expect(sections[1].rows[1].value).assertEqual('1920 × 1080');
      expect(sections[1].rows[6].value).assertEqual('是');
      expect(sections[1].rows[7].value).assertEqual('尚未确认');
      expect(sections[2].rows[1].value).assertEqual('48000 Hz');
      expect(sections[5].rawText).assertContain('video/avc');
      expect(sections[6].rawText).assertContain('audio/mp4a-latm');
    });

    it('shouldHideMissingTrackAndHandleEmptyDump', 0, () => {
      const info = createMediaInfo();
      info.audio.codecMime = '';
      info.tracks = [{ index: 0, type: 1, formatDump: '' }];
      const sections: MediaInfoSection[] = buildMediaInfoSections(info);
      expect(sections.length).assertEqual(5);
      expect(sections[2].title).assertEqual('解码与输出');
      expect(sections[4].rawText).assertEqual('无可用信息');
    });

    it('shouldReturnEmptySectionsWhenUnavailable', 0, () => {
      const info = createMediaInfo();
      info.available = false;
      expect(buildMediaInfoSections(info).length).assertEqual(0);
    });
  });
}
