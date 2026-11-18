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
 * @tc.number EXP_PL0004
 * @tc.name EXP_PL0004
 * @tc.desc Removing a song before the current song shifts its index while preserving playback and survivors.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const state: PlaylistState = makePlaylist(5);
    const firstSong: Song = state.playlist[0];
    const thirdSong: Song = state.playlist[2];
    const selectedSong: Song = state.playlist[3];
    const lastSong: Song = state.playlist[4];

    expect(state.playlist.length).assertEqual(5);
    expect(state.jumpTo(3)).assertTrue();
    expect(state.currentIndex).assertEqual(3);
    expect(state.currentSong?.id).assertEqual('song-3');

    state.removeSong('song-1');

    expect(state.currentIndex).assertEqual(2);
    expect(state.currentSong?.id).assertEqual('song-3');
    expect(state.currentSong === selectedSong).assertTrue();
    expect(state.playlist.length).assertEqual(4);
    expect(state.playlist.some((song: Song) => song.id === 'song-1')).assertFalse();
    expect(state.playlist[0].id).assertEqual('song-0');
    expect(state.playlist[1].id).assertEqual('song-2');
    expect(state.playlist[2].id).assertEqual('song-3');
    expect(state.playlist[3].id).assertEqual('song-4');
    expect(state.playlist[0] === firstSong).assertTrue();
    expect(state.playlist[1] === thirdSong).assertTrue();
    expect(state.playlist[2] === selectedSong).assertTrue();
    expect(state.playlist[3] === lastSong).assertTrue();
    expect(state.currentSong?.title).assertEqual('Track 3');
    expect(state.currentSong?.artist).assertEqual('Artist 3');
    expect(state.currentSong?.album).assertEqual('Expansion Album');
    expect(state.currentSong?.coverUrl).assertEqual('test-cover-3');
    expect(state.currentSong?.duration).assertEqual(63);
    expect(state.currentSong?.filePath).assertEqual('/test-only/track-3.mp3');
    expect(state.currentSong?.isLiked).assertFalse();
  };

export default runExpansionCase;
