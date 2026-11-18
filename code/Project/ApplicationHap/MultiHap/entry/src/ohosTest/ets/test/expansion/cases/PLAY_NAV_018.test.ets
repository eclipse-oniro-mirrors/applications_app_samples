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
 * @tc.number EXP_PLAY_NAV_018
 * @tc.name EXP_PLAY_NAV_018
 * @tc.desc next/prev全部位置与两类空状态; {"setup":{"fixture":"new PlaylistState()","count":0,"jumpTo":null,"freshConstructor":true},"operation":{"method":"prev"},"expectedReturn":false,"expected":{"playlistIds":[],"currentIndex":0,"currentSongId":null},"caseId":"PLAY_NAV_018"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(0);
    const state: PlaylistState = new PlaylistState();
    const before: Song[] = state.playlist;
    expect(state.prev()).assertEqual(false);
    expect(state.playlist === before).assertEqual(true);
    expect(state.playlist.length).assertEqual(0);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong).assertEqual(null);
  };

export default runExpansionCase;
