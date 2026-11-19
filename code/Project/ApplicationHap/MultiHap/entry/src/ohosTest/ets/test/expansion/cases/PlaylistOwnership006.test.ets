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
 * @tc.number EXP_PLAY_OWNERSHIP_006
 * @tc.name EXP_PLAY_OWNERSHIP_006
 * @tc.desc 容器复制与对象浅共享; {"setup":{"fixture":"makePlaylist(count)","count":2,"jumpTo":1,"freshConstructor":false},"operations":["读取old=playlist","playlist=新[replacement]"],"expected":{"playlistIds":["replacement"],"currentIndex":0,"currentSongId":"replacement","oldReferenceIds":["song-0","song-1"]},"identityExpectation":"setter替换容器，旧容器仍保留旧列表","caseId":"PLAY_OWNERSHIP_006"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const state: PlaylistState = makePlaylist(2);
    expect(state.jumpTo(1)).assertTrue();
    const old: Song[] = state.playlist;
    const added: Song[] = makeSongs(1);
    added[0].id = 'replacement';
    state.playlist = added;
    expect(state.playlist === old).assertFalse();
    expect(state.playlist === added).assertFalse();
    expect(old.length).assertEqual(2);
    expect(old[0].id).assertEqual('song-0');
    expect(old[1].id).assertEqual('song-1');
    expect(old[0].title).assertEqual('Track 0');
    expect(old[0].artist).assertEqual('Artist 0');
    expect(old[0].album).assertEqual('Expansion Album');
    expect(old[0].coverUrl).assertEqual('test-cover-0');
    expect(old[0].duration).assertEqual(60);
    expect(old[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(old[0].isLiked).assertEqual(false);
    expect(old[0].genre).assertEqual(undefined);
    expect(old[0].trackNumber).assertEqual(undefined);
    expect(old[1].title).assertEqual('Track 1');
    expect(old[1].artist).assertEqual('Artist 1');
    expect(old[1].album).assertEqual('Expansion Album');
    expect(old[1].coverUrl).assertEqual('test-cover-1');
    expect(old[1].duration).assertEqual(61);
    expect(old[1].filePath).assertEqual('/test-only/track-1.mp3');
    expect(old[1].isLiked).assertEqual(false);
    expect(old[1].genre).assertEqual(undefined);
    expect(old[1].trackNumber).assertEqual(undefined);
    expect(state.playlist.length).assertEqual(1);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('replacement');
    expect(state.currentSong === state.playlist[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('replacement');
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
  };

export default runExpansionCase;
