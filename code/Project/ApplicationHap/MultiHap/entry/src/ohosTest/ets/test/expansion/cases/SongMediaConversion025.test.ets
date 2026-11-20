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
 * @tc.number EXP_SONG_MEDIA_025
 * @tc.name EXP_SONG_MEDIA_025
 * @tc.desc 媒体项完整映射与16种空元数据组合; {"item":{"id":"media-7","title":"Known Title","artist":"Known Artist","album":"Known Album","thumbnailUri":"thumb://7","duration":225999,"uri":"file://media/7","genre":"Jazz","trackNumber":7},"operations":["调用两次fromMediaLibraryItem","修改第一次返回Song.title与isLiked"],"expected":{"secondTitle":"Known Title","secondIsLiked":false,"inputTitle":"Known Title","distinctResultObjects":true},"caseId":"SONG_MEDIA_025"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const item: MediaInput = {
      id: 'media-7',
      title: 'Known Title',
      artist: 'Known Artist',
      album: 'Known Album',
      thumbnailUri: 'thumb://7',
      duration: 225999,
      uri: 'file://media/7',
      genre: 'Jazz',
      trackNumber: 7,
    };
    const song: Song = SongUtils.fromMediaLibraryItem(item);
    const second: Song = SongUtils.fromMediaLibraryItem(item);
    song.title = 'changed';
    song.isLiked = true;
    expect(song === second).assertFalse();
    expect(song.title).assertEqual('changed');
    expect(song.isLiked).assertEqual(true);
    expect(second.id).assertEqual('media-7');
    expect(second.title).assertEqual('Known Title');
    expect(second.artist).assertEqual('Known Artist');
    expect(second.album).assertEqual('Known Album');
    expect(second.coverUrl).assertEqual('thumb://7');
    expect(second.duration).assertEqual(225);
    expect(second.filePath).assertEqual('file://media/7');
    expect(second.isLiked).assertEqual(false);
    expect(second.genre).assertEqual('Jazz');
    expect(second.trackNumber).assertEqual(7);
    expect(item.id).assertEqual('media-7');
    expect(item.title).assertEqual('Known Title');
    expect(item.artist).assertEqual('Known Artist');
    expect(item.album).assertEqual('Known Album');
    expect(item.thumbnailUri).assertEqual('thumb://7');
    expect(item.duration).assertEqual(225999);
    expect(item.uri).assertEqual('file://media/7');
    expect(item.genre).assertEqual('Jazz');
    expect(item.trackNumber).assertEqual(7);
  };

export default runExpansionCase;
