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
 * @tc.number EXP_PLAY_CLEAR_003
 * @tc.name EXP_PLAY_CLEAR_003
 * @tc.desc 清空各状态; {"setup":{"fixture":"makePlaylist(count)","count":1,"jumpTo":0,"freshConstructor":false},"operation":{"method":"clear"},"expected":{"playlistIds":[],"currentIndex":-1,"currentSongId":null},"caseId":"PLAY_CLEAR_003"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(1);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(0)).assertTrue();
    const before: Song[] = state.playlist;
    state.clear();
    expect(state.playlist === before).assertEqual(false);
    expect(state.playlist.length).assertEqual(0);
    expect(state.currentIndex).assertEqual(-1);
    expect(state.currentSong).assertEqual(null);
    expect(before.length).assertEqual(1);
    expect(before[0].id).assertEqual('song-0');
    expect(before[0].title).assertEqual('Track 0');
    expect(before[0].artist).assertEqual('Artist 0');
    expect(before[0].album).assertEqual('Expansion Album');
    expect(before[0].coverUrl).assertEqual('test-cover-0');
    expect(before[0].duration).assertEqual(60);
    expect(before[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(before[0].isLiked).assertEqual(false);
    expect(before[0].genre).assertEqual(undefined);
    expect(before[0].trackNumber).assertEqual(undefined);
  };

export default runExpansionCase;
