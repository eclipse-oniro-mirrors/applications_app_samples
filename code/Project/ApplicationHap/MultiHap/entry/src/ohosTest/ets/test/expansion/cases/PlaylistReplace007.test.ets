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
import { makeSongs, makePlaylist } from '../fixtures/PlaylistFixture';

/**
 * @tc.number EXP_PLAY_SET_007
 * @tc.name EXP_PLAY_SET_007
 * @tc.desc setter替换与重置当前索引; {"setup":{"fixture":"makePlaylist(count)","count":3,"jumpTo":0,"freshConstructor":false},"operation":{"method":"playlist=","newSongIds":[]},"expected":{"playlistIds":[],"currentIndex":-1,"currentSongId":null},"caseId":"PLAY_SET_007"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(3);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(0)).assertTrue();
    const before: Song[] = state.playlist;
    const added: Song[] = makeSongs(0);
    state.playlist = added;
    expect(state.playlist === before).assertEqual(false);
    expect(state.playlist === added).assertFalse();
    expect(added.length).assertEqual(0);
    expect(state.playlist.length).assertEqual(0);
    expect(state.currentIndex).assertEqual(-1);
    expect(state.currentSong).assertEqual(null);
  };

export default runExpansionCase;
