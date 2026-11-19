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

import { Song, PlaylistState } from '../../../../../../../audioFeature/src/main/ets/util/SongModel';

/** Constructs deterministic inputs only; all state transitions use PlaylistState. */
export function makeSongs(count: number): Song[] {
  let songs: Song[] = [];
  for (let index: number = 0; index < count; index++) {
    songs.push({
      id: 'song-' + index,
      title: 'Track ' + index,
      artist: 'Artist ' + index,
      album: 'Expansion Album',
      coverUrl: 'test-cover-' + index,
      duration: 60 + index,
      filePath: '/test-only/track-' + index + '.mp3',
      isLiked: false
    });
  }
  return songs;
}

/** Applies the production setter to establish a documented initial state. */
export function makePlaylist(count: number): PlaylistState {
  let state: PlaylistState = new PlaylistState();
  state.playlist = makeSongs(count);
  return state;
}
