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
import { makePlaylist, makeSongs } from '../fixtures/PlaylistFixture';
import { PlaylistState, Song } from '../../../../../../../audioFeature/src/main/ets/util/SongModel';

/**
 * @tc.number EXP_PL0007
 * @tc.name EXP_PL0007
 * @tc.desc Clearing a nonempty playlist resets selection; adding songs restores the first song without mutating inputs.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const state: PlaylistState = makePlaylist(3);
    const originalSongs: Song[] = state.playlist;
    expect(state.jumpTo(2)).assertEqual(true);
    expect(state.currentIndex).assertEqual(2);
    expect(state.currentSong?.id).assertEqual('song-2');
    expect(state.playlist.length).assertEqual(3);

    state.clear();

    expect(state.currentIndex).assertEqual(-1);
    expect(state.currentSong).assertEqual(null);
    expect(state.playlist.length).assertEqual(0);
    expect(originalSongs.length).assertEqual(3);
    expect(originalSongs[0].id).assertEqual('song-0');
    expect(originalSongs[2].id).assertEqual('song-2');
    expect(originalSongs[2].isLiked).assertEqual(false);

    const addedSongs: Song[] = makeSongs(2);
    state.addSongs(addedSongs);

    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-0');
    expect(state.playlist.length).assertEqual(2);
    expect(state.playlist[0]).assertEqual(addedSongs[0]);
    expect(state.playlist[1]).assertEqual(addedSongs[1]);
    expect(state.playlist[1].id).assertEqual('song-1');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[1].isLiked).assertEqual(false);
    expect(addedSongs.length).assertEqual(2);
    expect(addedSongs[0].id).assertEqual('song-0');
    expect(addedSongs[1].id).assertEqual('song-1');
    expect(originalSongs.length).assertEqual(3);
  };

export default runExpansionCase;
