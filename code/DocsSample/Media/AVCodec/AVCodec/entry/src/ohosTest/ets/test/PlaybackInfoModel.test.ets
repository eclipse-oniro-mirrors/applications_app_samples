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
import {
  formatMediaTime, formatPlaybackInfo, normalizeSeekPosition
} from '../../../main/ets/model/PlaybackInfoModel';
import { runTestCase } from './TestCaseLogger';

export default function playbackInfoModelTest(): void {
  describe('PlaybackInfoModelTest', () => {
    it('AVCodec_PlaybackInfo_MediaTime_001', 0, () => {
      runTestCase('AVCodec_PlaybackInfo_MediaTime_001', () => {
        expect(formatMediaTime(0)).assertEqual('00:00');
        expect(formatMediaTime(65000000)).assertEqual('01:05');
      });
    });

    it('AVCodec_PlaybackInfo_PlayingSnapshot_002', 0, () => {
      runTestCase('AVCodec_PlaybackInfo_PlayingSnapshot_002', () => {
        const text = formatPlaybackInfo(3, 2, 125000000, 65000000, true, true, true);
        expect(text).assertEqual('PLAYING  X2.0  01:05 / 02:05  A+V  SF');
      });
    });

    it('AVCodec_PlaybackInfo_SeekingSnapshot_003', 0, () => {
      runTestCase('AVCodec_PlaybackInfo_SeekingSnapshot_003', () => {
        const text = formatPlaybackInfo(5, 1, 125000000, 65000000, true, false, false);
        expect(text).assertEqual('SEEKING  X1.0  01:05 / 02:05  V');
      });
    });

    it('AVCodec_PlaybackInfo_SeekPositionNormalization_004', 0, () => {
      runTestCase('AVCodec_PlaybackInfo_SeekPositionNormalization_004', () => {
        expect(normalizeSeekPosition(-1, 1000000)).assertEqual(0);
        expect(normalizeSeekPosition(500000, 1000000)).assertEqual(500000);
        expect(normalizeSeekPosition(2000000, 1000000)).assertEqual(1000000);
        expect(normalizeSeekPosition(100, 0)).assertEqual(0);
      });
    });
  });
}
