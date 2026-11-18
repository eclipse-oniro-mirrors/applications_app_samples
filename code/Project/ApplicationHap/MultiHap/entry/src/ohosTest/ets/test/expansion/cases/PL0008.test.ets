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
import { makePlaylist } from '../fixtures/PlaylistFixture';
import { PlaylistState } from '../../../../../../../audioFeature/src/main/ets/util/SongModel';

/**
 * @tc.number EXP_PL0008
 * @tc.name EXP_PL0008
 * @tc.desc Toggling song-1 twice restores its like state without changing other songs, index or length.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const state: PlaylistState = makePlaylist(3);

    expect(state.playlist.length).assertEqual(3);
    expect(state.currentIndex).assertEqual(0);
    expect(state.playlist[0].isLiked).assertFalse();
    expect(state.playlist[1].isLiked).assertFalse();
    expect(state.playlist[2].isLiked).assertFalse();
    expect(state.playlist[1].id).assertEqual('song-1');

    state.toggleLike('song-1');

    expect(state.playlist[1].isLiked).assertTrue();
    expect(state.playlist[0].isLiked).assertFalse();
    expect(state.playlist[2].isLiked).assertFalse();
    expect(state.currentIndex).assertEqual(0);
    expect(state.playlist.length).assertEqual(3);

    state.toggleLike('song-1');

    expect(state.playlist[1].isLiked).assertFalse();
    expect(state.playlist[0].isLiked).assertFalse();
    expect(state.playlist[2].isLiked).assertFalse();
    expect(state.currentIndex).assertEqual(0);
    expect(state.playlist.length).assertEqual(3);
  };

export default runExpansionCase;
