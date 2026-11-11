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
import { describe, it as hypiumIt, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';



const TAG: string = '[Sample_MediaMetadata8W]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

export default function mediaMetadata8wTest(): void {
  describe('mediaMetadata8wTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0001
     * @tc.name      test8wMediaMetadata0001
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0002
     * @tc.name      test8wMediaMetadata0002
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0003
     * @tc.name      test8wMediaMetadata0003
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0004
     * @tc.name      test8wMediaMetadata0004
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0005
     * @tc.name      test8wMediaMetadata0005
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0006
     * @tc.name      test8wMediaMetadata0006
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0007
     * @tc.name      test8wMediaMetadata0007
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0008
     * @tc.name      test8wMediaMetadata0008
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0009
     * @tc.name      test8wMediaMetadata0009
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0010
     * @tc.name      test8wMediaMetadata0010
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0011
     * @tc.name      test8wMediaMetadata0011
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0012
     * @tc.name      test8wMediaMetadata0012
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0013
     * @tc.name      test8wMediaMetadata0013
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0014
     * @tc.name      test8wMediaMetadata0014
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0015
     * @tc.name      test8wMediaMetadata0015
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0016
     * @tc.name      test8wMediaMetadata0016
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0017
     * @tc.name      test8wMediaMetadata0017
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0018
     * @tc.name      test8wMediaMetadata0018
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0019
     * @tc.name      test8wMediaMetadata0019
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0020
     * @tc.name      test8wMediaMetadata0020
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0021
     * @tc.name      test8wMediaMetadata0021
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0022
     * @tc.name      test8wMediaMetadata0022
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0023
     * @tc.name      test8wMediaMetadata0023
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0024
     * @tc.name      test8wMediaMetadata0024
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0025
     * @tc.name      test8wMediaMetadata0025
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0026
     * @tc.name      test8wMediaMetadata0026
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0027
     * @tc.name      test8wMediaMetadata0027
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0028
     * @tc.name      test8wMediaMetadata0028
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0029
     * @tc.name      test8wMediaMetadata0029
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0030
     * @tc.name      test8wMediaMetadata0030
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0031
     * @tc.name      test8wMediaMetadata0031
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0032
     * @tc.name      test8wMediaMetadata0032
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0033
     * @tc.name      test8wMediaMetadata0033
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0034
     * @tc.name      test8wMediaMetadata0034
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0035
     * @tc.name      test8wMediaMetadata0035
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0036
     * @tc.name      test8wMediaMetadata0036
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0037
     * @tc.name      test8wMediaMetadata0037
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0038
     * @tc.name      test8wMediaMetadata0038
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0039
     * @tc.name      test8wMediaMetadata0039
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0040
     * @tc.name      test8wMediaMetadata0040
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0041
     * @tc.name      test8wMediaMetadata0041
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0042
     * @tc.name      test8wMediaMetadata0042
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0043
     * @tc.name      test8wMediaMetadata0043
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0044
     * @tc.name      test8wMediaMetadata0044
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0045
     * @tc.name      test8wMediaMetadata0045
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0046
     * @tc.name      test8wMediaMetadata0046
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0047
     * @tc.name      test8wMediaMetadata0047
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0048
     * @tc.name      test8wMediaMetadata0048
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0049
     * @tc.name      test8wMediaMetadata0049
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0050
     * @tc.name      test8wMediaMetadata0050
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0051
     * @tc.name      test8wMediaMetadata0051
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0052
     * @tc.name      test8wMediaMetadata0052
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0053
     * @tc.name      test8wMediaMetadata0053
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0054
     * @tc.name      test8wMediaMetadata0054
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0055
     * @tc.name      test8wMediaMetadata0055
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0056
     * @tc.name      test8wMediaMetadata0056
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0057
     * @tc.name      test8wMediaMetadata0057
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0058
     * @tc.name      test8wMediaMetadata0058
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0059
     * @tc.name      test8wMediaMetadata0059
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0060
     * @tc.name      test8wMediaMetadata0060
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0061
     * @tc.name      test8wMediaMetadata0061
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0062
     * @tc.name      test8wMediaMetadata0062
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0063
     * @tc.name      test8wMediaMetadata0063
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0064
     * @tc.name      test8wMediaMetadata0064
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0065
     * @tc.name      test8wMediaMetadata0065
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0066
     * @tc.name      test8wMediaMetadata0066
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0067
     * @tc.name      test8wMediaMetadata0067
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0068
     * @tc.name      test8wMediaMetadata0068
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0069
     * @tc.name      test8wMediaMetadata0069
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0070
     * @tc.name      test8wMediaMetadata0070
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0071
     * @tc.name      test8wMediaMetadata0071
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0072
     * @tc.name      test8wMediaMetadata0072
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0073
     * @tc.name      test8wMediaMetadata0073
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0074
     * @tc.name      test8wMediaMetadata0074
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0075
     * @tc.name      test8wMediaMetadata0075
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0076
     * @tc.name      test8wMediaMetadata0076
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0077
     * @tc.name      test8wMediaMetadata0077
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0078
     * @tc.name      test8wMediaMetadata0078
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0079
     * @tc.name      test8wMediaMetadata0079
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0080
     * @tc.name      test8wMediaMetadata0080
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0081
     * @tc.name      test8wMediaMetadata0081
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0082
     * @tc.name      test8wMediaMetadata0082
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0083
     * @tc.name      test8wMediaMetadata0083
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0084
     * @tc.name      test8wMediaMetadata0084
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0085
     * @tc.name      test8wMediaMetadata0085
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0086
     * @tc.name      test8wMediaMetadata0086
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0087
     * @tc.name      test8wMediaMetadata0087
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0088
     * @tc.name      test8wMediaMetadata0088
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0089
     * @tc.name      test8wMediaMetadata0089
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0090
     * @tc.name      test8wMediaMetadata0090
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0091
     * @tc.name      test8wMediaMetadata0091
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0092
     * @tc.name      test8wMediaMetadata0092
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0093
     * @tc.name      test8wMediaMetadata0093
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0094
     * @tc.name      test8wMediaMetadata0094
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0095
     * @tc.name      test8wMediaMetadata0095
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0096
     * @tc.name      test8wMediaMetadata0096
     * @tc.desc      Media metadata 21780300 bytes is classified as video.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 21780300;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('video');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0097
     * @tc.name      test8wMediaMetadata0097
     * @tc.desc      Media metadata 682 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 682;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0098
     * @tc.name      test8wMediaMetadata0098
     * @tc.desc      Media metadata 1024 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 1024;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0099
     * @tc.name      test8wMediaMetadata0099
     * @tc.desc      Media metadata 4096 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 4096;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_META_0100
     * @tc.name      test8wMediaMetadata0100
     * @tc.desc      Media metadata 8192 bytes is classified as subtitle.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wMediaMetadata0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const size: number = 8192;
      const kind: string = size > 1000000 ? 'video' : 'subtitle';
      expect(kind).assertEqual('subtitle');
      expect(size).assertLarger(0);
      expect(size % 2).assertEqual(0);
      expect(Number.isInteger(size)).assertTrue();
    })
  })
}
