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
 * @tc.number EXP_PLAY_SEQUENCE_003
 * @tc.name EXP_PLAY_SEQUENCE_003
 * @tc.desc 复合状态转换的逐步快照; {"setup":{"fixture":"makePlaylist(count)","count":3,"jumpTo":1,"freshConstructor":false},"operations":[{"method":"clear","after":{"playlistIds":[],"currentIndex":-1,"currentSongId":null}},{"method":"addSongs","songIds":["song-0","song-1"]}],"expected":{"playlistIds":["song-0","song-1"],"currentIndex":0,"currentSongId":"song-0"},"caseId":"PLAY_SEQUENCE_003"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(3);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(1)).assertTrue();
    // Matrix step 1: clear
    state.clear();
    expect(state.playlist.length).assertEqual(0);
    expect(state.currentIndex).assertEqual(-1);
    expect(state.currentSong).assertEqual(null);
    // Matrix step 2: addSongs
    const added1: Song[] = makeSongs(2);
    added1[0].id = 'song-0';
    added1[1].id = 'song-1';
    state.addSongs(added1);
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-0');
    expect(state.currentSong === state.playlist[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('song-0');
    expect(state.playlist[0] === added1[0]).assertTrue();
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
    expect(state.playlist[1] === added1[1]).assertTrue();
    expect(state.playlist[1].title).assertEqual('Track 1');
    expect(state.playlist[1].artist).assertEqual('Artist 1');
    expect(state.playlist[1].album).assertEqual('Expansion Album');
    expect(state.playlist[1].coverUrl).assertEqual('test-cover-1');
    expect(state.playlist[1].duration).assertEqual(61);
    expect(state.playlist[1].filePath).assertEqual('/test-only/track-1.mp3');
    expect(state.playlist[1].isLiked).assertEqual(false);
    expect(state.playlist[1].genre).assertEqual(undefined);
    expect(state.playlist[1].trackNumber).assertEqual(undefined);
  };

export default runExpansionCase;
