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
 * @tc.number EXP_PLAY_OWNERSHIP_005
 * @tc.name EXP_PLAY_OWNERSHIP_005
 * @tc.desc 容器复制与对象浅共享; {"setup":{"fixture":"makePlaylist(count)","count":1,"jumpTo":0,"freshConstructor":false},"operations":["addSongs传入独立[extra-0]数组","修改追加Song对象.title=changed","jumpTo(1)"],"expected":{"playlistIds":["song-0","extra-0"],"currentIndex":1,"currentSongId":"extra-0","currentTitle":"changed"},"caseId":"PLAY_OWNERSHIP_005"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const state: PlaylistState = makePlaylist(1);
    const input: Song[] = state.playlist.slice();
    const added: Song[] = makeSongs(1);
    added[0].id = 'extra-0';
    state.addSongs(added);
    added[0].title = 'changed';
    expect(state.jumpTo(1)).assertTrue();
    expect(state.currentSong === added[0]).assertTrue();
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(1);
    expect(state.currentSong?.id).assertEqual('extra-0');
    expect(state.currentSong === state.playlist[1]).assertTrue();
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
    expect(state.playlist[1].id).assertEqual('extra-0');
    expect(state.playlist[1] === added[0]).assertTrue();
    expect(state.playlist[1].title).assertEqual('changed');
    expect(state.playlist[1].artist).assertEqual('Artist 0');
    expect(state.playlist[1].album).assertEqual('Expansion Album');
    expect(state.playlist[1].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[1].duration).assertEqual(60);
    expect(state.playlist[1].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[1].isLiked).assertEqual(false);
    expect(state.playlist[1].genre).assertEqual(undefined);
    expect(state.playlist[1].trackNumber).assertEqual(undefined);
  };

export default runExpansionCase;
