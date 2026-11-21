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

export default function registerInteractionPolicy02(): void {
  describe('InteractionPolicy02', (): void => {
    it('InteractionPolicy02_001', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("prepared");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("prepared");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, -1, true);
      expect(mayPlay).assertEqual(true);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(4, -1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('InteractionPolicy02_002', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("paused");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("paused");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 1, false);
      expect(mayPlay).assertEqual(true);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(6, 1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('InteractionPolicy02_003', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("prepared");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("prepared");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 2, true);
      expect(mayPlay).assertEqual(true);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(3, 2)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('InteractionPolicy02_004', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("initialized");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("initialized");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, -1, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(6, -1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('InteractionPolicy02_005', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("playing");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("playing");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 4, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(0, 4)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('InteractionPolicy02_006', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("buffering");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("buffering");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 1, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(0, 1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('InteractionPolicy02_007', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("completed");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("completed");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 3, true);
      expect(mayPlay).assertEqual(true);
      expect(maySeekOrStop).assertEqual(true);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(4, 3)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

    it('InteractionPolicy02_008', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("error");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("error");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 3, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(1, 3)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

  });
}
