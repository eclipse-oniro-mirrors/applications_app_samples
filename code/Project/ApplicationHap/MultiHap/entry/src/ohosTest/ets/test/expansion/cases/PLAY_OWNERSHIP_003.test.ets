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
import { makeSongs } from '../fixtures/PlaylistFixture';

/**
 * @tc.number EXP_PLAY_OWNERSHIP_003
 * @tc.name EXP_PLAY_OWNERSHIP_003
 * @tc.desc 容器复制与对象浅共享; {"setup":{"fixture":"makeSongs(1)后赋值playlist"},"operations":["修改原Song对象.title=changed"],"expected":{"playlistIds":["song-0"],"currentIndex":0,"currentSongId":"song-0","currentTitle":"changed"},"identityExpectation":"setter只复制数组，不深拷贝Song","caseId":"PLAY_OWNERSHIP_003"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(1);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    input[0].title = 'changed';
    expect(state.currentSong === input[0]).assertTrue();
    expect(state.playlist === input).assertFalse();
    expect(state.playlist.length).assertEqual(1);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-0');
    expect(state.currentSong === state.playlist[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('song-0');
    expect(state.playlist[0] === input[0]).assertTrue();
    expect(state.playlist[0].title).assertEqual('changed');
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
