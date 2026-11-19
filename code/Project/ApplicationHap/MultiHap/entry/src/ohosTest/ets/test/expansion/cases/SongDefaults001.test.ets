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
import { PlayMode } from '../../../../../../../audioFeature/src/main/ets/util/SongModel';

/**
 * @tc.number EXP_SONG_CONSTANTS_001
 * @tc.name EXP_SONG_CONSTANTS_001
 * @tc.desc 播放枚举与默认资源快照; {"target":"PlayMode","expected":{"SEQUENCE":0,"SINGLE_CYCLE":1,"RANDOM":2,"LIST_CYCLE":3},"caseId":"SONG_CONSTANTS_001"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    expect(PlayMode.SEQUENCE).assertEqual(0);
    expect(PlayMode.SINGLE_CYCLE).assertEqual(1);
    expect(PlayMode.RANDOM).assertEqual(2);
    expect(PlayMode.LIST_CYCLE).assertEqual(3);
  };

export default runExpansionCase;
