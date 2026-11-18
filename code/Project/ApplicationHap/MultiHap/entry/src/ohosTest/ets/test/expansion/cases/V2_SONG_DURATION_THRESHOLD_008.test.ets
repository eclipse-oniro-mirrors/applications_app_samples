/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { expect } from '@ohos/hypium';
import { SongUtils } from '../../../../../../../audioFeature/src/main/ets/util/SongModel';

/**
 * @tc.number EXP_V2_SONG_DURATION_THRESHOLD_008
 * @tc.name EXP_V2_SONG_DURATION_THRESHOLD_008
 * @tc.desc Exact fractional duration 120.001 seconds; assert floor behavior without rounding or clamping.
 * @tc.size SmallTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const seconds: number = 120.001;
    expect(SongUtils.formatDuration(seconds)).assertEqual('02:00');
    expect(seconds).assertEqual(120.001);
  };

export default runExpansionCase;
