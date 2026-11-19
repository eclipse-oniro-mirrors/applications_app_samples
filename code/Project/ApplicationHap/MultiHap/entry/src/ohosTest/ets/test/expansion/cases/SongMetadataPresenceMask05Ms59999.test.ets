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
import { Song, SongUtils } from '../../../../../../../audioFeature/src/main/ets/util/SongModel';
import { MediaInput } from '../fixtures/MediaFixture';

/**
 * @tc.number EXP_V2_SONG_MEDIA_MASK05_MS59999
 * @tc.name EXP_V2_SONG_MEDIA_MASK05_MS59999
 * @tc.desc Metadata mask 5, duration 59999ms: verify both independent returned Songs, all mapped fields and input/return mutation isolation.
 * @tc.size SmallTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const item: MediaInput = {
      id: 'v2-media-5-59999',
      title: '',
      artist: 'Artist Ω',
      album: '',
      thumbnailUri: 'thumb://v2',
      duration: 59999,
      uri: 'file://test-only/v2/5/59999.mp3',
      genre: 'Classical',
      trackNumber: 5,
    };
    const first: Song = SongUtils.fromMediaLibraryItem(item);
    const second: Song = SongUtils.fromMediaLibraryItem(item);
    expect(first === second).assertFalse();
    expect(first.id).assertEqual('v2-media-5-59999');
    expect(first.title).assertEqual('Unknown');
    expect(first.artist).assertEqual('Artist Ω');
    expect(first.album).assertEqual('Unknown Album');
    expect(first.duration).assertEqual(59);
    expect(first.filePath).assertEqual('file://test-only/v2/5/59999.mp3');
    expect(first.isLiked).assertEqual(false);
    expect(first.genre).assertEqual('Classical');
    expect(first.trackNumber).assertEqual(5);
    expect(first.coverUrl).assertEqual('thumb://v2');
    expect(second.id).assertEqual('v2-media-5-59999');
    expect(second.title).assertEqual('Unknown');
    expect(second.artist).assertEqual('Artist Ω');
    expect(second.album).assertEqual('Unknown Album');
    expect(second.duration).assertEqual(59);
    expect(second.filePath).assertEqual('file://test-only/v2/5/59999.mp3');
    expect(second.isLiked).assertEqual(false);
    expect(second.genre).assertEqual('Classical');
    expect(second.trackNumber).assertEqual(5);
    expect(second.coverUrl).assertEqual('thumb://v2');
    first.title = 'mutated first';
    first.isLiked = true;
    item.title = 'mutated input';
    item.duration = 999999;
    expect(second.title).assertEqual('Unknown');
    expect(second.duration).assertEqual(59);
    expect(second.isLiked).assertEqual(false);
    expect(first.title).assertEqual('mutated first');
    expect(first.duration).assertEqual(59);
    expect(first.isLiked).assertEqual(true);
    expect(item.id).assertEqual('v2-media-5-59999');
    expect(item.title).assertEqual('mutated input');
    expect(item.artist).assertEqual('Artist Ω');
    expect(item.album).assertEqual('');
    expect(item.thumbnailUri).assertEqual('thumb://v2');
    expect(item.duration).assertEqual(999999);
    expect(item.uri).assertEqual('file://test-only/v2/5/59999.mp3');
    expect(item.genre).assertEqual('Classical');
    expect(item.trackNumber).assertEqual(5);
  };

export default runExpansionCase;
