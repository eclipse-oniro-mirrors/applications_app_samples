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
 * @tc.number EXP_SONG_DURATION_020
 * @tc.name EXP_SONG_DURATION_020
 * @tc.desc 秒格式化阈值与现有负数/非有限语义; {"duration":-1,"expected":"-1:-1","caseId":"SONG_DURATION_020"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    expect(SongUtils.formatDuration(-1)).assertEqual('-1:-1');
  };

export default runExpansionCase;
