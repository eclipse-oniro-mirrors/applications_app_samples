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
 * @tc.number EXP_PLAY_REMOVE_025
 * @tc.name EXP_PLAY_REMOVE_025
 * @tc.desc 删除相对当前位置全矩阵; {"setup":{"fixture":"makePlaylist(count)","count":4,"jumpTo":2,"freshConstructor":false},"operation":{"method":"removeSong","id":"song-2"},"expected":{"playlistIds":["song-0","song-1","song-3"],"currentIndex":2,"currentSongId":"song-3"},"caseId":"PLAY_REMOVE_025"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(4);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(2)).assertTrue();
    const before: Song[] = state.playlist;
    state.removeSong('song-2');
    expect(state.playlist === before).assertEqual(true);
    expect(state.playlist.length).assertEqual(3);
    expect(state.currentIndex).assertEqual(2);
    expect(state.currentSong?.id).assertEqual('song-3');
    expect(state.currentSong === state.playlist[2]).assertTrue();
    expect(state.playlist[0].id).assertEqual('song-0');
    expect(state.playlist[0] === input[0]).assertTrue();
    expect(state.playlist[0].title).assertEqual('Track 0');
    expect(state.playlist[0].artist).assertEqual('Artist 0');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[0].duration).assertEqual(60);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual(undefined);
    expect(state.playlist[0].trackNumber).assertEqual(undefined);
    expect(state.playlist[1].id).assertEqual('song-1');
    expect(state.playlist[1] === input[1]).assertTrue();
    expect(state.playlist[1].title).assertEqual('Track 1');
    expect(state.playlist[1].artist).assertEqual('Artist 1');
    expect(state.playlist[1].album).assertEqual('Expansion Album');
    expect(state.playlist[1].coverUrl).assertEqual('test-cover-1');
    expect(state.playlist[1].duration).assertEqual(61);
    expect(state.playlist[1].filePath).assertEqual('/test-only/track-1.mp3');
    expect(state.playlist[1].isLiked).assertEqual(false);
    expect(state.playlist[1].genre).assertEqual(undefined);
    expect(state.playlist[1].trackNumber).assertEqual(undefined);
    expect(state.playlist[2].id).assertEqual('song-3');
    expect(state.playlist[2] === input[3]).assertTrue();
    expect(state.playlist[2].title).assertEqual('Track 3');
    expect(state.playlist[2].artist).assertEqual('Artist 3');
    expect(state.playlist[2].album).assertEqual('Expansion Album');
    expect(state.playlist[2].coverUrl).assertEqual('test-cover-3');
    expect(state.playlist[2].duration).assertEqual(63);
    expect(state.playlist[2].filePath).assertEqual('/test-only/track-3.mp3');
    expect(state.playlist[2].isLiked).assertEqual(false);
    expect(state.playlist[2].genre).assertEqual(undefined);
    expect(state.playlist[2].trackNumber).assertEqual(undefined);
  };

export default runExpansionCase;
