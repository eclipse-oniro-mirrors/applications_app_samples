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

export default function registerInteractionPolicy08(): void {
  describe('InteractionPolicy08', (): void => {
    it('InteractionPolicy08_001', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("Playing");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("Playing");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 5, false);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(5, 5)).assertEqual(true);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('InteractionPolicy08_002', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("released");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("released");
      const autoplay = PlaybackPolicy.shouldStartFirst(true, 5, true);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(2, 5)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(true)).assertEqual(0);
    });

    it('InteractionPolicy08_003', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay(" playing ");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop(" playing ");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, -1, false);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(0, -1)).assertEqual(false);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

  });
}
