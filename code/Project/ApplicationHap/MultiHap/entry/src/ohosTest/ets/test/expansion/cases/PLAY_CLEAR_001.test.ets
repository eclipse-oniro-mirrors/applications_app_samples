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
import { Song, PlaylistState } from '../../../../../../../audioFeature/src/main/ets/util/SongModel';
import { makeSongs } from '../fixtures/PlaylistFixture';

/**
 * @tc.number EXP_PLAY_CLEAR_001
 * @tc.name EXP_PLAY_CLEAR_001
 * @tc.desc 清空各状态; {"setup":{"fixture":"new PlaylistState()","count":0,"jumpTo":null,"freshConstructor":true},"operation":{"method":"clear"},"expected":{"playlistIds":[],"currentIndex":-1,"currentSongId":null},"caseId":"PLAY_CLEAR_001"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(0);
    const state: PlaylistState = new PlaylistState();
    const before: Song[] = state.playlist;
    state.clear();
    expect(state.playlist === before).assertEqual(false);
    expect(state.playlist.length).assertEqual(0);
    expect(state.currentIndex).assertEqual(-1);
    expect(state.currentSong).assertEqual(null);
    expect(before.length).assertEqual(0);
  };

export default runExpansionCase;
