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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceAssetCore]';
const DOMAIN: number = 0xF812;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceAssetCoreTest(): void {
  describe('mediaSourceAssetCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0001
     * @tc.name      testSafeAsset0001
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0002
     * @tc.name      testSafeAsset0002
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0003
     * @tc.name      testSafeAsset0003
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0004
     * @tc.name      testSafeAsset0004
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0005
     * @tc.name      testSafeAsset0005
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0006
     * @tc.name      testSafeAsset0006
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0007
     * @tc.name      testSafeAsset0007
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0008
     * @tc.name      testSafeAsset0008
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0009
     * @tc.name      testSafeAsset0009
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0010
     * @tc.name      testSafeAsset0010
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0011
     * @tc.name      testSafeAsset0011
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0012
     * @tc.name      testSafeAsset0012
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0013
     * @tc.name      testSafeAsset0013
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0014
     * @tc.name      testSafeAsset0014
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0015
     * @tc.name      testSafeAsset0015
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0016
     * @tc.name      testSafeAsset0016
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0017
     * @tc.name      testSafeAsset0017
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0018
     * @tc.name      testSafeAsset0018
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0019
     * @tc.name      testSafeAsset0019
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0020
     * @tc.name      testSafeAsset0020
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0021
     * @tc.name      testSafeAsset0021
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0022
     * @tc.name      testSafeAsset0022
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0023
     * @tc.name      testSafeAsset0023
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0024
     * @tc.name      testSafeAsset0024
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0025
     * @tc.name      testSafeAsset0025
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0026
     * @tc.name      testSafeAsset0026
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0027
     * @tc.name      testSafeAsset0027
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0028
     * @tc.name      testSafeAsset0028
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0029
     * @tc.name      testSafeAsset0029
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0030
     * @tc.name      testSafeAsset0030
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0031
     * @tc.name      testSafeAsset0031
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0032
     * @tc.name      testSafeAsset0032
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0033
     * @tc.name      testSafeAsset0033
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0034
     * @tc.name      testSafeAsset0034
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0035
     * @tc.name      testSafeAsset0035
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0036
     * @tc.name      testSafeAsset0036
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0037
     * @tc.name      testSafeAsset0037
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0038
     * @tc.name      testSafeAsset0038
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0039
     * @tc.name      testSafeAsset0039
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0040
     * @tc.name      testSafeAsset0040
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0041
     * @tc.name      testSafeAsset0041
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0042
     * @tc.name      testSafeAsset0042
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0043
     * @tc.name      testSafeAsset0043
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0044
     * @tc.name      testSafeAsset0044
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0045
     * @tc.name      testSafeAsset0045
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0046
     * @tc.name      testSafeAsset0046
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0047
     * @tc.name      testSafeAsset0047
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0048
     * @tc.name      testSafeAsset0048
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0049
     * @tc.name      testSafeAsset0049
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0050
     * @tc.name      testSafeAsset0050
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0051
     * @tc.name      testSafeAsset0051
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0052
     * @tc.name      testSafeAsset0052
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0053
     * @tc.name      testSafeAsset0053
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0054
     * @tc.name      testSafeAsset0054
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0055
     * @tc.name      testSafeAsset0055
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0056
     * @tc.name      testSafeAsset0056
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0057
     * @tc.name      testSafeAsset0057
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0058
     * @tc.name      testSafeAsset0058
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0059
     * @tc.name      testSafeAsset0059
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0060
     * @tc.name      testSafeAsset0060
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0061
     * @tc.name      testSafeAsset0061
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0062
     * @tc.name      testSafeAsset0062
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0063
     * @tc.name      testSafeAsset0063
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0064
     * @tc.name      testSafeAsset0064
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0065
     * @tc.name      testSafeAsset0065
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0066
     * @tc.name      testSafeAsset0066
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0067
     * @tc.name      testSafeAsset0067
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0068
     * @tc.name      testSafeAsset0068
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0069
     * @tc.name      testSafeAsset0069
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0070
     * @tc.name      testSafeAsset0070
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0071
     * @tc.name      testSafeAsset0071
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0072
     * @tc.name      testSafeAsset0072
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0073
     * @tc.name      testSafeAsset0073
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0074
     * @tc.name      testSafeAsset0074
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0075
     * @tc.name      testSafeAsset0075
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0076
     * @tc.name      testSafeAsset0076
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0077
     * @tc.name      testSafeAsset0077
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0078
     * @tc.name      testSafeAsset0078
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0079
     * @tc.name      testSafeAsset0079
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0080
     * @tc.name      testSafeAsset0080
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0081
     * @tc.name      testSafeAsset0081
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0082
     * @tc.name      testSafeAsset0082
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0083
     * @tc.name      testSafeAsset0083
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0084
     * @tc.name      testSafeAsset0084
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0085
     * @tc.name      testSafeAsset0085
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0086
     * @tc.name      testSafeAsset0086
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0087
     * @tc.name      testSafeAsset0087
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0088
     * @tc.name      testSafeAsset0088
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0089
     * @tc.name      testSafeAsset0089
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0090
     * @tc.name      testSafeAsset0090
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0091
     * @tc.name      testSafeAsset0091
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0092
     * @tc.name      testSafeAsset0092
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0093
     * @tc.name      testSafeAsset0093
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0094
     * @tc.name      testSafeAsset0094
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0095
     * @tc.name      testSafeAsset0095
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0096
     * @tc.name      testSafeAsset0096
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0097
     * @tc.name      testSafeAsset0097
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0098
     * @tc.name      testSafeAsset0098
     * @tc.desc      Asset test_01.mp3 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test_01.mp3';
      const size: number = 1757305;
      expect(name.endsWith('.mp3')).assertTrue();
      expect(size).assertEqual(1757305);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0099
     * @tc.name      testSafeAsset0099
     * @tc.desc      Asset test.m3u8 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test.m3u8';
      const size: number = 1086;
      expect(name.endsWith('.m3u8')).assertTrue();
      expect(size).assertEqual(1086);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_AST_0100
     * @tc.name      testSafeAsset0100
     * @tc.desc      Asset test1.mp4 keeps expected size and extension.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeAsset0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const name: string = 'test1.mp4';
      const size: number = 21780300;
      expect(name.endsWith('.mp4')).assertTrue();
      expect(size).assertEqual(21780300);
      expect(name.length).assertLarger(0);
      expect(size).assertLarger(0);
    })
  })
}
