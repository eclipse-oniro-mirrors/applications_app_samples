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
 * @tc.number EXP_SONG_MEDIA_012
 * @tc.name EXP_SONG_MEDIA_012
 * @tc.desc 媒体项完整映射与16种空元数据组合; {"item":{"id":"media-7","title":"","artist":"Known Artist","album":"","thumbnailUri":"","duration":225999,"uri":"file://media/7","genre":"Jazz","trackNumber":7},"expected":{"id":"media-7","title":"Unknown","artist":"Known Artist","album":"Unknown Album","coverUrl":{"resource":"app.media.app_icon"},"duration":225,"filePath":"file://media/7","isLiked":false,"genre":"Jazz","trackNumber":7},"caseId":"SONG_MEDIA_012"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const item: MediaInput = {
      id: 'media-7',
      title: '',
      artist: 'Known Artist',
      album: '',
      thumbnailUri: '',
      duration: 225999,
      uri: 'file://media/7',
      genre: 'Jazz',
      trackNumber: 7,
    };
    const song: Song = SongUtils.fromMediaLibraryItem(item);
    expect(song.id).assertEqual('media-7');
    expect(song.title).assertEqual('Unknown');
    expect(song.artist).assertEqual('Known Artist');
    expect(song.album).assertEqual('Unknown Album');
    const cover: Resource | string = song.coverUrl;
    expect(typeof cover).assertEqual('object');
    const descriptor: Resource = cover as Resource;
    const icon: Resource = $r('app.media.app_icon');
    expect(descriptor.id).assertEqual(icon.id);
    expect(descriptor.type).assertEqual(icon.type);
    expect(descriptor.bundleName).assertEqual(icon.bundleName);
    expect(descriptor.moduleName).assertEqual(icon.moduleName);
    expect(descriptor.params).assertDeepEquals(icon.params);
    expect(song.duration).assertEqual(225);
    expect(song.filePath).assertEqual('file://media/7');
    expect(song.isLiked).assertEqual(false);
    expect(song.genre).assertEqual('Jazz');
    expect(song.trackNumber).assertEqual(7);
    expect(item.id).assertEqual('media-7');
    expect(item.title).assertEqual('');
    expect(item.artist).assertEqual('Known Artist');
    expect(item.album).assertEqual('');
    expect(item.thumbnailUri).assertEqual('');
    expect(item.duration).assertEqual(225999);
    expect(item.uri).assertEqual('file://media/7');
    expect(item.genre).assertEqual('Jazz');
    expect(item.trackNumber).assertEqual(7);
  };

export default runExpansionCase;
