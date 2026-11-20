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
 * @tc.number EXP_PL0001
 * @tc.name EXP_PL0001_SetterCopiesInputArrayContainer
 * @tc.desc Clearing the input array after assignment preserves the three-song playlist and current selection.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(3);
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;

    input.length = 0;

    expect(input.length).assertEqual(0);
    expect(state.playlist === input).assertFalse();
    expect(state.playlist.length).assertEqual(3);
    expect(state.playlist[0].id).assertEqual('song-0');
    expect(state.playlist[1].id).assertEqual('song-1');
    expect(state.playlist[2].id).assertEqual('song-2');
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-0');
  };

export default runExpansionCase;
