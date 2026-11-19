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
import { Song, DEFAULT_SONG } from '../../../../../../../audioFeature/src/main/ets/util/SongModel';

/**
 * @tc.number EXP_SONG_CONSTANTS_002
 * @tc.name EXP_SONG_CONSTANTS_002
 * @tc.desc 播放枚举与默认资源快照; {"target":"DEFAULT_SONG","expected":{"id":"0","title":"Default Song","artist":"Unknown Artist","album":"Unknown Album","coverUrl":{"resource":"app.media.app_icon"},"duration":225,"filePath":"","isLiked":false},"caseId":"SONG_CONSTANTS_002"}
 * @tc.level Level 1
 * Requires an ArkTS application resource environment; no media hardware is required.
 */
const runExpansionCase: () => void = () => {
    expect(DEFAULT_SONG.id).assertEqual('0');
    expect(DEFAULT_SONG.title).assertEqual('Default Song');
    expect(DEFAULT_SONG.artist).assertEqual('Unknown Artist');
    expect(DEFAULT_SONG.album).assertEqual('Unknown Album');
    const cover: Resource | string = DEFAULT_SONG.coverUrl;
    expect(typeof cover).assertEqual('object');
    const descriptor: Resource = cover as Resource;
    const icon: Resource = $r('app.media.app_icon');
    expect(descriptor.id).assertEqual(icon.id);
    expect(descriptor.type).assertEqual(icon.type);
    expect(descriptor.bundleName).assertEqual(icon.bundleName);
    expect(descriptor.moduleName).assertEqual(icon.moduleName);
    expect(descriptor.params).assertDeepEquals(icon.params);
    expect(DEFAULT_SONG.duration).assertEqual(225);
    expect(DEFAULT_SONG.filePath).assertEqual('');
    expect(DEFAULT_SONG.isLiked).assertEqual(false);
    expect(DEFAULT_SONG.genre).assertEqual(undefined);
    expect(DEFAULT_SONG.trackNumber).assertEqual(undefined);
  };

export default runExpansionCase;
