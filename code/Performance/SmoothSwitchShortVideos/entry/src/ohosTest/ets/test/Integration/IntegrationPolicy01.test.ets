/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { PlaybackPolicy } from '../../../../main/ets/model/PlaybackPolicy';

export default function registerIntegrationPolicy01(): void {
  describe('IntegrationPolicy01', (): void => {
    it('IntegrationPolicy01_001', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("idle");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("idle");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, -1, false);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(-1, -1)).assertEqual(true);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('IntegrationPolicy01_002', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay(" playing ");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop(" playing ");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 6, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(0, 6)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('IntegrationPolicy01_003', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("prepared");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("prepared");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 3, false);
      expect(mayPlay).assertEqual(true);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(2, 3)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('IntegrationPolicy01_004', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("initialized");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("initialized");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 2, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(1, 2)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('IntegrationPolicy01_005', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("error");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("error");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 1, false);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(2, 1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('IntegrationPolicy01_006', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("paused");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("paused");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 0, true);
      expect(mayPlay).assertEqual(true);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(5, 0)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('IntegrationPolicy01_007', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("playing");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("playing");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, -1, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(3, -1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('IntegrationPolicy01_008', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("completed");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("completed");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 5, true);
      expect(mayPlay).assertEqual(true);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(0, 5)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('IntegrationPolicy01_009', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("stopped");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("stopped");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 2, false);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(4, 2)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('IntegrationPolicy01_010', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("stopped");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("stopped");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 1, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(-1, 1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('IntegrationPolicy01_011', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 5, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(0, 5)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('IntegrationPolicy01_012', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("buffering");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("buffering");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, -1, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(2, -1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('IntegrationPolicy01_013', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("Playing");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("Playing");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 2, false);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(0, 2)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('IntegrationPolicy01_014', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("paused");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("paused");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 0, false);
      expect(mayPlay).assertEqual(true);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(5, 0)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('IntegrationPolicy01_015', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("idle");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("idle");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 1, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(5, 1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('IntegrationPolicy01_016', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("prepared");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("prepared");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 5, false);
      expect(mayPlay).assertEqual(true);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(-1, 5)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

  });
}
