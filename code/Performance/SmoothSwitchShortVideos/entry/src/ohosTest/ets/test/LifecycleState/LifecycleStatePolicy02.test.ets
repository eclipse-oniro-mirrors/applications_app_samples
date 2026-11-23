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

export default function registerLifecycleStatePolicy02(): void {
  describe('LifecycleStatePolicy02', (): void => {
    it('LifecycleStatePolicy02_001', 0, (): void => {
      const mayPlay = PlaybackPolicy.canPlay("stopped");
      const maySeekOrStop = PlaybackPolicy.canSeekOrStop("stopped");
      const autoplay = PlaybackPolicy.shouldStartFirst(false, 1, false);
      expect(mayPlay).assertEqual(false);
      expect(maySeekOrStop).assertEqual(false);
      expect(autoplay).assertEqual(false);
      expect(PlaybackPolicy.isSelected(1, 1)).assertEqual(true);
      expect(PlaybackPolicy.cacheCount(false)).assertEqual(2);
    });

  });
}
