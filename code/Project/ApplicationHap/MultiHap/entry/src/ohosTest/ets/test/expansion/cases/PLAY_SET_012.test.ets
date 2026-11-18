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
 * @tc.number EXP_PLAY_SET_012
 * @tc.name EXP_PLAY_SET_012
 * @tc.desc setter替换与重置当前索引; {"setup":{"fixture":"makePlaylist(count)","count":3,"jumpTo":1,"freshConstructor":false},"operation":{"method":"playlist=","newSongIds":["new-0","new-1"]},"expected":{"playlistIds":["new-0","new-1"],"currentIndex":0,"currentSongId":"new-0"},"caseId":"PLAY_SET_012"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(3);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(1)).assertTrue();
    const before: Song[] = state.playlist;
    const added: Song[] = makeSongs(2);
    added[0].id = 'new-0';
    added[1].id = 'new-1';
    state.playlist = added;
    expect(state.playlist === before).assertEqual(false);
    expect(state.playlist === added).assertFalse();
    expect(added[0].id).assertEqual('new-0');
    expect(added[0].title).assertEqual('Track 0');
    expect(added[0].artist).assertEqual('Artist 0');
    expect(added[0].album).assertEqual('Expansion Album');
    expect(added[0].coverUrl).assertEqual('test-cover-0');
    expect(added[0].duration).assertEqual(60);
    expect(added[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(added[0].isLiked).assertEqual(false);
    expect(added[0].genre).assertEqual(undefined);
    expect(added[0].trackNumber).assertEqual(undefined);
    expect(added[1].id).assertEqual('new-1');
    expect(added[1].title).assertEqual('Track 1');
    expect(added[1].artist).assertEqual('Artist 1');
    expect(added[1].album).assertEqual('Expansion Album');
    expect(added[1].coverUrl).assertEqual('test-cover-1');
    expect(added[1].duration).assertEqual(61);
    expect(added[1].filePath).assertEqual('/test-only/track-1.mp3');
    expect(added[1].isLiked).assertEqual(false);
    expect(added[1].genre).assertEqual(undefined);
    expect(added[1].trackNumber).assertEqual(undefined);
    expect(added.length).assertEqual(2);
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('new-0');
    expect(state.currentSong === state.playlist[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('new-0');
    expect(state.playlist[0] === added[0]).assertTrue();
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
    expect(state.playlist[1] === added[1]).assertTrue();
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
