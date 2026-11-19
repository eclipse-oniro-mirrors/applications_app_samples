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
 * @tc.number EXP_PLAY_SEQUENCE_008
 * @tc.name EXP_PLAY_SEQUENCE_008
 * @tc.desc 复合状态转换的逐步快照; {"setup":{"fixture":"makePlaylist(count)","count":3,"jumpTo":0,"freshConstructor":false},"operations":[{"method":"removeSong","id":"song-0","after":{"playlistIds":["song-1","song-2"],"currentIndex":0,"currentSongId":"song-1"}},{"method":"removeSong","id":"song-1","after":{"playlistIds":["song-2"],"currentIndex":0,"currentSongId":"song-2"}},{"method":"removeSong","id":"song-2","after":{"playlistIds":[],"currentIndex":-1,"currentSongId":null}},{"method":"addSongs","songIds":["extra-0"]},{"method":"prev","expectedReturn":true}],"expected":{"playlistIds":["extra-0"],"currentIndex":0,"currentSongId":"extra-0"},"caseId":"PLAY_SEQUENCE_008"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(3);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(0)).assertTrue();
    // Matrix step 1: removeSong
    state.removeSong('song-0');
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-1');
    expect(state.currentSong === state.playlist[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('song-1');
    expect(state.playlist[0] === input[1]).assertTrue();
    expect(state.playlist[0].title).assertEqual('Track 1');
    expect(state.playlist[0].artist).assertEqual('Artist 1');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-1');
    expect(state.playlist[0].duration).assertEqual(61);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-1.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual(undefined);
    expect(state.playlist[0].trackNumber).assertEqual(undefined);
    expect(state.playlist[1].id).assertEqual('song-2');
    expect(state.playlist[1] === input[2]).assertTrue();
    expect(state.playlist[1].title).assertEqual('Track 2');
    expect(state.playlist[1].artist).assertEqual('Artist 2');
    expect(state.playlist[1].album).assertEqual('Expansion Album');
    expect(state.playlist[1].coverUrl).assertEqual('test-cover-2');
    expect(state.playlist[1].duration).assertEqual(62);
    expect(state.playlist[1].filePath).assertEqual('/test-only/track-2.mp3');
    expect(state.playlist[1].isLiked).assertEqual(false);
    expect(state.playlist[1].genre).assertEqual(undefined);
    expect(state.playlist[1].trackNumber).assertEqual(undefined);
    // Matrix step 2: removeSong
    state.removeSong('song-1');
    expect(state.playlist.length).assertEqual(1);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-2');
    expect(state.currentSong === state.playlist[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('song-2');
    expect(state.playlist[0] === input[2]).assertTrue();
    expect(state.playlist[0].title).assertEqual('Track 2');
    expect(state.playlist[0].artist).assertEqual('Artist 2');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-2');
    expect(state.playlist[0].duration).assertEqual(62);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-2.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual(undefined);
    expect(state.playlist[0].trackNumber).assertEqual(undefined);
    // Matrix step 3: removeSong
    state.removeSong('song-2');
    expect(state.playlist.length).assertEqual(0);
    expect(state.currentIndex).assertEqual(-1);
    expect(state.currentSong).assertEqual(null);
    // Matrix step 4: addSongs
    const added3: Song[] = makeSongs(1);
    added3[0].id = 'extra-0';
    state.addSongs(added3);
    expect(state.playlist.length).assertEqual(1);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('extra-0');
    expect(state.currentSong === state.playlist[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('extra-0');
    expect(state.playlist[0] === added3[0]).assertTrue();
    expect(state.playlist[0].title).assertEqual('Track 0');
    expect(state.playlist[0].artist).assertEqual('Artist 0');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[0].duration).assertEqual(60);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual(undefined);
    expect(state.playlist[0].trackNumber).assertEqual(undefined);
    // Matrix step 5: prev
    expect(state.prev()).assertEqual(true);
    expect(state.playlist.length).assertEqual(1);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('extra-0');
    expect(state.currentSong === state.playlist[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('extra-0');
    expect(state.playlist[0] === added3[0]).assertTrue();
    expect(state.playlist[0].title).assertEqual('Track 0');
    expect(state.playlist[0].artist).assertEqual('Artist 0');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[0].duration).assertEqual(60);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual(undefined);
    expect(state.playlist[0].trackNumber).assertEqual(undefined);
  };

export default runExpansionCase;
