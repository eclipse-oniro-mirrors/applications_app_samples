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
import { PlaylistState, Song } from '../../../../../../../audioFeature/src/main/ets/util/SongModel';

/**
 * @tc.number EXP_PL0005
 * @tc.name EXP_PL0005
 * @tc.desc Removing the current last song wraps to the first and preserves remaining songs.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const state: PlaylistState = makePlaylist(4);
    const firstSong: Song = state.playlist[0];
    const secondSong: Song = state.playlist[1];
    const thirdSong: Song = state.playlist[2];

    expect(state.playlist.length).assertEqual(4);
    expect(state.jumpTo(3)).assertTrue();
    expect(state.currentIndex).assertEqual(3);
    expect(state.currentSong?.id).assertEqual('song-3');

    state.removeSong('song-3');

    expect(state.playlist.length).assertEqual(3);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-0');
    expect(state.playlist[0].id).assertEqual('song-0');
    expect(state.playlist[1].id).assertEqual('song-1');
    expect(state.playlist[2].id).assertEqual('song-2');
    expect(state.playlist[0] === firstSong).assertTrue();
    expect(state.playlist[1] === secondSong).assertTrue();
    expect(state.playlist[2] === thirdSong).assertTrue();
    expect(state.playlist[0].title).assertEqual('Track 0');
    expect(state.playlist[1].title).assertEqual('Track 1');
    expect(state.playlist[2].title).assertEqual('Track 2');
    expect(state.playlist[0].duration).assertEqual(60);
    expect(state.playlist[1].duration).assertEqual(61);
    expect(state.playlist[2].duration).assertEqual(62);
    expect(state.playlist[0].isLiked).assertFalse();
    expect(state.playlist[1].isLiked).assertFalse();
    expect(state.playlist[2].isLiked).assertFalse();
  };

export default runExpansionCase;
