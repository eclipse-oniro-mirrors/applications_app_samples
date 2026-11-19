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
 * @tc.number EXP_PLAY_JUMP_012
 * @tc.name EXP_PLAY_JUMP_012
 * @tc.desc 跳转边界与无效数值保留原状态; {"setup":{"fixture":"makePlaylist(count)","count":1,"jumpTo":0,"freshConstructor":false},"operation":{"method":"jumpTo","index":2},"expectedReturn":false,"expected":{"playlistIds":["song-0"],"currentIndex":0,"currentSongId":"song-0"},"caseId":"PLAY_JUMP_012"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(1);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(0)).assertTrue();
    const before: Song[] = state.playlist;
    expect(state.jumpTo(2)).assertEqual(false);
    expect(state.playlist === before).assertEqual(true);
    expect(state.playlist.length).assertEqual(1);
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
  };

export default runExpansionCase;
