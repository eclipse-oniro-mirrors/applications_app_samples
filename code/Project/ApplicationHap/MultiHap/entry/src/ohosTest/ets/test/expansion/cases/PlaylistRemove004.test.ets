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
 * @tc.number EXP_PLAY_REMOVE_004
 * @tc.name EXP_PLAY_REMOVE_004
 * @tc.desc 删除相对当前位置全矩阵; {"setup":{"fixture":"makePlaylist(count)","count":2,"jumpTo":1,"freshConstructor":false},"operation":{"method":"removeSong","id":"song-0"},"expected":{"playlistIds":["song-1"],"currentIndex":0,"currentSongId":"song-1"},"caseId":"PLAY_REMOVE_004"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(2);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(1)).assertTrue();
    const before: Song[] = state.playlist;
    state.removeSong('song-0');
    expect(state.playlist === before).assertEqual(true);
    expect(state.playlist.length).assertEqual(1);
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
  };

export default runExpansionCase;
