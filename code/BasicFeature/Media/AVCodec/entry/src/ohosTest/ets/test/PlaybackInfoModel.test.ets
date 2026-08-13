/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { formatMediaTime, formatPlaybackInfo } from '../../../main/ets/model/PlaybackInfoModel';

export default function playbackInfoModelTest(): void {
  describe('PlaybackInfoModelTest', () => {
    it('shouldFormatMediaTime', 0, () => {
      expect(formatMediaTime(0)).assertEqual('00:00');
      expect(formatMediaTime(65000000)).assertEqual('01:05');
    });

    it('shouldFormatPlaybackSnapshot', 0, () => {
      const text = formatPlaybackInfo(3, 2, 125000000, 65000000, true, true, true);
      expect(text).assertEqual('PLAYING  X2.0  01:05 / 02:05  A+V  SF');
    });
  });
}
