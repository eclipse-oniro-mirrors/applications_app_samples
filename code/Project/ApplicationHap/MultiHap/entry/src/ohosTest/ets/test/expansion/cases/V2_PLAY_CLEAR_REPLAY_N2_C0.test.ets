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
 * @tc.number EXP_V2_PLAY_CLEAR_REPLAY_N2_C0
 * @tc.name EXP_V2_PLAY_CLEAR_REPLAY_N2_C0
 * @tc.desc Clear length 2 from index 0, reject empty navigation, replay reversed original objects and verify both wrap directions and preserved likes.
 * @tc.size SmallTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const input: Song[] = makeSongs(2);
    input[0].genre = 'Genre 0';
    input[0].trackNumber = 1;
    input[1].genre = 'Genre 1';
    input[1].trackNumber = 2;
    const state: PlaylistState = new PlaylistState();
    state.playlist = input;
    expect(state.jumpTo(0)).assertTrue();
    const initialContainer: Song[] = state.playlist;
    expect(initialContainer === input).assertFalse();
    state.toggleLike('song-0');
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-0');
    expect(state.currentSong === input[0]).assertTrue();
    expect(state.playlist[0] === input[0]).assertTrue();
    expect(state.playlist[0].id).assertEqual('song-0');
    expect(state.playlist[0].title).assertEqual('Track 0');
    expect(state.playlist[0].artist).assertEqual('Artist 0');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[0].duration).assertEqual(60);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[0].isLiked).assertEqual(true);
    expect(state.playlist[0].genre).assertEqual('Genre 0');
    expect(state.playlist[0].trackNumber).assertEqual(1);
    expect(state.playlist[1] === input[1]).assertTrue();
    expect(state.playlist[1].id).assertEqual('song-1');
    expect(state.playlist[1].title).assertEqual('Track 1');
    expect(state.playlist[1].artist).assertEqual('Artist 1');
    expect(state.playlist[1].album).assertEqual('Expansion Album');
    expect(state.playlist[1].coverUrl).assertEqual('test-cover-1');
    expect(state.playlist[1].duration).assertEqual(61);
    expect(state.playlist[1].filePath).assertEqual('/test-only/track-1.mp3');
    expect(state.playlist[1].isLiked).assertEqual(false);
    expect(state.playlist[1].genre).assertEqual('Genre 1');
    expect(state.playlist[1].trackNumber).assertEqual(2);
    state.clear();
    expect(state.playlist === initialContainer).assertFalse();
    expect(state.playlist.length).assertEqual(0);
    expect(state.currentIndex).assertEqual(-1);
    expect(state.currentSong).assertEqual(null);
    expect(initialContainer.length).assertEqual(2);
    expect(initialContainer[0] === input[0]).assertTrue();
    expect(initialContainer[0].id).assertEqual('song-0');
    expect(initialContainer[0].title).assertEqual('Track 0');
    expect(initialContainer[0].artist).assertEqual('Artist 0');
    expect(initialContainer[0].album).assertEqual('Expansion Album');
    expect(initialContainer[0].coverUrl).assertEqual('test-cover-0');
    expect(initialContainer[0].duration).assertEqual(60);
    expect(initialContainer[0].filePath).assertEqual('/test-only/track-0.mp3');
    expect(initialContainer[0].isLiked).assertEqual(true);
    expect(initialContainer[0].genre).assertEqual('Genre 0');
    expect(initialContainer[0].trackNumber).assertEqual(1);
    expect(initialContainer[1] === input[1]).assertTrue();
    expect(initialContainer[1].id).assertEqual('song-1');
    expect(initialContainer[1].title).assertEqual('Track 1');
    expect(initialContainer[1].artist).assertEqual('Artist 1');
    expect(initialContainer[1].album).assertEqual('Expansion Album');
    expect(initialContainer[1].coverUrl).assertEqual('test-cover-1');
    expect(initialContainer[1].duration).assertEqual(61);
    expect(initialContainer[1].filePath).assertEqual('/test-only/track-1.mp3');
    expect(initialContainer[1].isLiked).assertEqual(false);
    expect(initialContainer[1].genre).assertEqual('Genre 1');
    expect(initialContainer[1].trackNumber).assertEqual(2);
    expect(state.next()).assertFalse();
    expect(state.prev()).assertFalse();
    expect(state.jumpTo(0)).assertFalse();
    expect(state.playlist.length).assertEqual(0);
    expect(state.currentIndex).assertEqual(-1);
    expect(state.currentSong).assertEqual(null);
    const replay: Song[] = [input[1], input[0]];
    state.addSongs(replay);
    expect(state.playlist === replay).assertFalse();
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-1');
    expect(state.currentSong === input[1]).assertTrue();
    expect(state.playlist[0] === input[1]).assertTrue();
    expect(state.playlist[0].id).assertEqual('song-1');
    expect(state.playlist[0].title).assertEqual('Track 1');
    expect(state.playlist[0].artist).assertEqual('Artist 1');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-1');
    expect(state.playlist[0].duration).assertEqual(61);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-1.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual('Genre 1');
    expect(state.playlist[0].trackNumber).assertEqual(2);
    expect(state.playlist[1] === input[0]).assertTrue();
    expect(state.playlist[1].id).assertEqual('song-0');
    expect(state.playlist[1].title).assertEqual('Track 0');
    expect(state.playlist[1].artist).assertEqual('Artist 0');
    expect(state.playlist[1].album).assertEqual('Expansion Album');
    expect(state.playlist[1].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[1].duration).assertEqual(60);
    expect(state.playlist[1].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[1].isLiked).assertEqual(true);
    expect(state.playlist[1].genre).assertEqual('Genre 0');
    expect(state.playlist[1].trackNumber).assertEqual(1);
    const replayContainer: Song[] = state.playlist;
    replay.length = 0;
    expect(replay.length).assertEqual(0);
    expect(state.prev()).assertTrue();
    expect(state.playlist === replayContainer).assertTrue();
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(1);
    expect(state.currentSong?.id).assertEqual('song-0');
    expect(state.currentSong === input[0]).assertTrue();
    expect(state.playlist[0] === input[1]).assertTrue();
    expect(state.playlist[0].id).assertEqual('song-1');
    expect(state.playlist[0].title).assertEqual('Track 1');
    expect(state.playlist[0].artist).assertEqual('Artist 1');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-1');
    expect(state.playlist[0].duration).assertEqual(61);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-1.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual('Genre 1');
    expect(state.playlist[0].trackNumber).assertEqual(2);
    expect(state.playlist[1] === input[0]).assertTrue();
    expect(state.playlist[1].id).assertEqual('song-0');
    expect(state.playlist[1].title).assertEqual('Track 0');
    expect(state.playlist[1].artist).assertEqual('Artist 0');
    expect(state.playlist[1].album).assertEqual('Expansion Album');
    expect(state.playlist[1].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[1].duration).assertEqual(60);
    expect(state.playlist[1].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[1].isLiked).assertEqual(true);
    expect(state.playlist[1].genre).assertEqual('Genre 0');
    expect(state.playlist[1].trackNumber).assertEqual(1);
    expect(state.next()).assertTrue();
    expect(state.playlist.length).assertEqual(2);
    expect(state.currentIndex).assertEqual(0);
    expect(state.currentSong?.id).assertEqual('song-1');
    expect(state.currentSong === input[1]).assertTrue();
    expect(state.playlist[0] === input[1]).assertTrue();
    expect(state.playlist[0].id).assertEqual('song-1');
    expect(state.playlist[0].title).assertEqual('Track 1');
    expect(state.playlist[0].artist).assertEqual('Artist 1');
    expect(state.playlist[0].album).assertEqual('Expansion Album');
    expect(state.playlist[0].coverUrl).assertEqual('test-cover-1');
    expect(state.playlist[0].duration).assertEqual(61);
    expect(state.playlist[0].filePath).assertEqual('/test-only/track-1.mp3');
    expect(state.playlist[0].isLiked).assertEqual(false);
    expect(state.playlist[0].genre).assertEqual('Genre 1');
    expect(state.playlist[0].trackNumber).assertEqual(2);
    expect(state.playlist[1] === input[0]).assertTrue();
    expect(state.playlist[1].id).assertEqual('song-0');
    expect(state.playlist[1].title).assertEqual('Track 0');
    expect(state.playlist[1].artist).assertEqual('Artist 0');
    expect(state.playlist[1].album).assertEqual('Expansion Album');
    expect(state.playlist[1].coverUrl).assertEqual('test-cover-0');
    expect(state.playlist[1].duration).assertEqual(60);
    expect(state.playlist[1].filePath).assertEqual('/test-only/track-0.mp3');
    expect(state.playlist[1].isLiked).assertEqual(true);
    expect(state.playlist[1].genre).assertEqual('Genre 0');
    expect(state.playlist[1].trackNumber).assertEqual(1);
  };

export default runExpansionCase;
