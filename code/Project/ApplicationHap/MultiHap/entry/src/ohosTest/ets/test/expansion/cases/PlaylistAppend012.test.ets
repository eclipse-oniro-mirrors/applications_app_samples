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
 * @tc.number EXP_PLAY_ADD_012
 * @tc.name EXP_PLAY_ADD_012
 * @tc.desc 追加列表与空列表恢复; {"setup":{"fixture":"makePlaylist(count)","count":3,"jumpTo":0,"freshConstructor":false},"operation":{"method":"addSongs","songIds":["extra-0","extra-1"]},"expected":{"playlistIds":["song-0","song-1","song-2","extra-0","extra-1"],"currentIndex":0,"currentSongId":"song-0"},"caseId":"PLAY_ADD_012"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(3);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(0)).assertTrue();
    const before: Song[] = state.playlist;
    const added: Song[] = makeSongs(2);
    added[0].id = 'extra-0';
    added[1].id = 'extra-1';
    state.addSongs(added);
    expect(state.playlist === before).assertEqual(false);
    expect(state.playlist === added).assertFalse();
    expect(added[0].id).assertEqual('extra-0');
    expect(added[0].title).assertEqual('Track 0');
    expect(added[0].artist).assertEqual('Artist 0');
    expect(added[0].album).assertEqual('Expansion Album');
    expect(added[0].coverUrl).assertEqual('test-cover-0');
    expect(added[0].duration).assertEqual(60);
    expect(added[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(added[0].isLiked).assertEqual(false);
    expect(added[0].genre).assertEqual(undefined);
    expect(added[0].trackNumber).assertEqual(undefined);
    expect(added[1].id).assertEqual('extra-1');
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
    expect(state.playlist.length).assertEqual(5);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-0');
    expect(state.currentSong === state.playlist[0]).assertTrue();
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
    expect(state.playlist[2].id).assertEqual('song-2');
    expect(state.playlist[2] === input[2]).assertTrue();
    expect(state.playlist[2].title).assertEqual('Track 2');
    expect(state.playlist[2].artist).assertEqual('Artist 2');
    expect(state.playlist[2].album).assertEqual('Expansion Album');
    expect(state.playlist[2].coverUrl).assertEqual('test-cover-2');
    expect(state.playlist[2].duration).assertEqual(62);
    expect(state.playlist[2].filePath).assertEqual('/test-only/track-2.mp3');
    expect(state.playlist[2].isLiked).assertEqual(false);
    expect(state.playlist[2].genre).assertEqual(undefined);
    expect(state.playlist[2].trackNumber).assertEqual(undefined);
    expect(state.playlist[3].id).assertEqual('extra-0');
    expect(state.playlist[3] === added[0]).assertTrue();
    expect(state.playlist[3].title).assertEqual('Track 0');
    expect(state.playlist[3].artist).assertEqual('Artist 0');
    expect(state.playlist[3].album).assertEqual('Expansion Album');
    expect(state.playlist[3].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[3].duration).assertEqual(60);
    expect(state.playlist[3].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[3].isLiked).assertEqual(false);
    expect(state.playlist[3].genre).assertEqual(undefined);
    expect(state.playlist[3].trackNumber).assertEqual(undefined);
    expect(state.playlist[4].id).assertEqual('extra-1');
    expect(state.playlist[4] === added[1]).assertTrue();
    expect(state.playlist[4].title).assertEqual('Track 1');
    expect(state.playlist[4].artist).assertEqual('Artist 1');
    expect(state.playlist[4].album).assertEqual('Expansion Album');
    expect(state.playlist[4].coverUrl).assertEqual('test-cover-1');
    expect(state.playlist[4].duration).assertEqual(61);
    expect(state.playlist[4].filePath).assertEqual('/test-only/track-1.mp3');
    expect(state.playlist[4].isLiked).assertEqual(false);
    expect(state.playlist[4].genre).assertEqual(undefined);
    expect(state.playlist[4].trackNumber).assertEqual(undefined);
  };

export default runExpansionCase;
