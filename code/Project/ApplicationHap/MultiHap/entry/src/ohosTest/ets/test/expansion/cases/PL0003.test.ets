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
 * @tc.number EXP_PL0003
 * @tc.name EXP_PL0003
 * @tc.desc A four-song playlist wraps prev from index zero to song-3, then next returns to song-0 without changing its contents.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const state: PlaylistState = makePlaylist(4);
    const originalPlaylist: Song[] = state.playlist;
    const originalSongs: Song[] = originalPlaylist.slice();
    const expectedIds: string[] = ['song-0', 'song-1', 'song-2', 'song-3'];

    expect(state.playlist.length).assertEqual(4);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong).assertEqual(originalSongs[0]);
    expect(state.currentSong?.id).assertEqual('song-0');

    const previousResult: boolean = state.prev();
    expect(previousResult).assertTrue();
    expect(state.currentIndex).assertEqual(3);
    expect(state.currentSong).assertEqual(originalSongs[3]);
    expect(state.currentSong?.id).assertEqual('song-3');
    expect(state.playlist).assertEqual(originalPlaylist);
    expect(state.playlist.length).assertEqual(4);
    for (let index: number = 0; index < 4; index++) {
      expect(state.playlist[index]).assertEqual(originalSongs[index]);
      expect(state.playlist[index].id).assertEqual(expectedIds[index]);
      expect(state.playlist[index].isLiked).assertFalse();
    }

    const nextResult: boolean = state.next();
    expect(nextResult).assertTrue();
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong).assertEqual(originalSongs[0]);
    expect(state.currentSong?.id).assertEqual('song-0');
    expect(state.playlist).assertEqual(originalPlaylist);
    expect(state.playlist.length).assertEqual(4);
    for (let index: number = 0; index < 4; index++) {
      expect(state.playlist[index]).assertEqual(originalSongs[index]);
      expect(state.playlist[index].id).assertEqual(expectedIds[index]);
      expect(state.playlist[index].isLiked).assertFalse();
    }
  };

export default runExpansionCase;
