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
 * @tc.number EXP_SONG_MEDIA_024
 * @tc.name EXP_SONG_MEDIA_024
 * @tc.desc 媒体项完整映射与16种空元数据组合; {"item":{"id":"媒体/编号","title":" 歌曲 🎵 ","artist":" ","album":" ","thumbnailUri":" ","duration":225999,"uri":"content://asset/a?x=1#part","genre":"","trackNumber":0},"expected":{"id":"媒体/编号","title":" 歌曲 🎵 ","artist":" ","album":" ","coverUrl":" ","duration":225,"filePath":"content://asset/a?x=1#part","isLiked":false,"genre":"","trackNumber":0},"note":"空白字符串是truthy，不触发Unknown回退；字段不做trim或URI解析","caseId":"SONG_MEDIA_024"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    const item: MediaInput = {
      id: '媒体/编号',
      title: ' 歌曲 🎵 ',
      artist: ' ',
      album: ' ',
      thumbnailUri: ' ',
      duration: 225999,
      uri: 'content://asset/a?x=1#part',
      genre: '',
      trackNumber: 0,
    };
    const song: Song = SongUtils.fromMediaLibraryItem(item);
    expect(song.id).assertEqual('媒体/编号');
    expect(song.title).assertEqual(' 歌曲 🎵 ');
    expect(song.artist).assertEqual(' ');
    expect(song.album).assertEqual(' ');
    expect(song.coverUrl).assertEqual(' ');
    expect(song.duration).assertEqual(225);
    expect(song.filePath).assertEqual('content://asset/a?x=1#part');
    expect(song.isLiked).assertEqual(false);
    expect(song.genre).assertEqual('');
    expect(song.trackNumber).assertEqual(0);
    expect(item.id).assertEqual('媒体/编号');
    expect(item.title).assertEqual(' 歌曲 🎵 ');
    expect(item.artist).assertEqual(' ');
    expect(item.album).assertEqual(' ');
    expect(item.thumbnailUri).assertEqual(' ');
    expect(item.duration).assertEqual(225999);
    expect(item.uri).assertEqual('content://asset/a?x=1#part');
    expect(item.genre).assertEqual('');
    expect(item.trackNumber).assertEqual(0);
  };

export default runExpansionCase;
