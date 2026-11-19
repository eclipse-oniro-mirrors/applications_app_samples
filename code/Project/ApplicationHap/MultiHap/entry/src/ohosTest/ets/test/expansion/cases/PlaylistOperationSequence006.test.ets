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
 * @tc.number EXP_PLAY_SEQUENCE_006
 * @tc.name EXP_PLAY_SEQUENCE_006
 * @tc.desc 复合状态转换的逐步快照; {"setup":{"fixture":"makePlaylist(count)","count":3,"jumpTo":2,"freshConstructor":false},"operations":[{"method":"playlist=","songIds":["new-0","new-1"],"after":{"playlistIds":["new-0","new-1"],"currentIndex":0,"currentSongId":"new-0"}},{"method":"prev","expectedReturn":true}],"expected":{"playlistIds":["new-0","new-1"],"currentIndex":1,"currentSongId":"new-1"},"caseId":"PLAY_SEQUENCE_006"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(3);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(2)).assertTrue();
    // Matrix step 1: playlist=
    const added0: Song[] = makeSongs(2);
    added0[0].id = 'new-0';
    added0[1].id = 'new-1';
    state.playlist = added0;
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('new-0');
    expect(state.currentSong === state.playlist[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('new-0');
    expect(state.playlist[0] === added0[0]).assertTrue();
    expect(state.playlist[0].title).assertEqual('Track 0');
    expect(state.playlist[0].artist).assertEqual('Artist 0');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[0].duration).assertEqual(60);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual(undefined);
    expect(state.playlist[0].trackNumber).assertEqual(undefined);
    expect(state.playlist[1].id).assertEqual('new-1');
    expect(state.playlist[1] === added0[1]).assertTrue();
    expect(state.playlist[1].title).assertEqual('Track 1');
    expect(state.playlist[1].artist).assertEqual('Artist 1');
    expect(state.playlist[1].album).assertEqual('Expansion Album');
    expect(state.playlist[1].coverUrl).assertEqual('test-cover-1');
    expect(state.playlist[1].duration).assertEqual(61);
    expect(state.playlist[1].filePath).assertEqual('/test-only/track-1.mp3');
    expect(state.playlist[1].isLiked).assertEqual(false);
    expect(state.playlist[1].genre).assertEqual(undefined);
    expect(state.playlist[1].trackNumber).assertEqual(undefined);
    // Matrix step 2: prev
    expect(state.prev()).assertEqual(true);
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(1);
    expect(state.currentSong?.id).assertEqual('new-1');
    expect(state.currentSong === state.playlist[1]).assertTrue();
    expect(state.playlist[0].id).assertEqual('new-0');
    expect(state.playlist[0] === added0[0]).assertTrue();
    expect(state.playlist[0].title).assertEqual('Track 0');
    expect(state.playlist[0].artist).assertEqual('Artist 0');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[0].duration).assertEqual(60);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual(undefined);
    expect(state.playlist[0].trackNumber).assertEqual(undefined);
    expect(state.playlist[1].id).assertEqual('new-1');
    expect(state.playlist[1] === added0[1]).assertTrue();
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
