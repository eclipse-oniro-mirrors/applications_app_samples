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
import { PlaybackViewModel } from '../../../main/ets/viewmodel/PlaybackViewModel';
import { runTestCase } from './TestCaseLogger';

export default function playbackViewModelTest(): void {
  describe('PlaybackViewModelTest', () => {
    it('AVCodec_PlaybackViewModel_ResetState_001', 0, () => {
      runTestCase('AVCodec_PlaybackViewModel_ResetState_001', () => {
        const model = new PlaybackViewModel();
        expect(model.infoText).assertEqual('');
        expect(model.positionUs).assertEqual(0);
        expect(model.durationUs).assertEqual(0);
        expect(model.isSeeking).assertFalse();
        model.infoText = 'PLAYING';
        model.positionUs = 1000000;
        model.durationUs = 2000000;
        model.isSeeking = true;
        model.reset();
        expect(model.infoText).assertEqual('');
        expect(model.positionUs).assertEqual(0);
        expect(model.durationUs).assertEqual(0);
        expect(model.isSeeking).assertFalse();
      });
    });
  });
}
