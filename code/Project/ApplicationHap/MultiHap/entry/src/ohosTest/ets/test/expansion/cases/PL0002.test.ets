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
 * @tc.number EXP_PL0002
 * @tc.name EXP_PL0002
 */
const runExpansionCase: () => void = () => {
    const state: PlaylistState = makePlaylist(1);
    const originalPlaylist: Song[] = state.playlist;
    const originalSong: Song = state.playlist[0];
    const originalLength: number = state.playlist.length;

    const result: boolean = state.next();

    expect(result).assertTrue();
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-0');
    expect(state.currentSong === originalSong).assertTrue();
    expect(state.playlist.length).assertEqual(1);
    expect(state.playlist.length).assertEqual(originalLength);
    expect(state.playlist === originalPlaylist).assertTrue();
    expect(state.playlist[0] === originalSong).assertTrue();
    expect(state.playlist[0].isLiked).assertFalse();
    expect(state.playlist[0].title).assertEqual('Track 0');
  };

export default runExpansionCase;
