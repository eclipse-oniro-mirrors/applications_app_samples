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

const TAG: string = '[Sample_MediaSourceHlsCore]';
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

export default function mediaSourceHlsCoreTest(): void {
  describe('mediaSourceHlsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0001
     * @tc.name      testSafeHls0001
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0002
     * @tc.name      testSafeHls0002
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0003
     * @tc.name      testSafeHls0003
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0004
     * @tc.name      testSafeHls0004
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0005
     * @tc.name      testSafeHls0005
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0006
     * @tc.name      testSafeHls0006
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0007
     * @tc.name      testSafeHls0007
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0008
     * @tc.name      testSafeHls0008
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0009
     * @tc.name      testSafeHls0009
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0010
     * @tc.name      testSafeHls0010
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0011
     * @tc.name      testSafeHls0011
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0012
     * @tc.name      testSafeHls0012
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0013
     * @tc.name      testSafeHls0013
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0014
     * @tc.name      testSafeHls0014
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0015
     * @tc.name      testSafeHls0015
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0016
     * @tc.name      testSafeHls0016
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0017
     * @tc.name      testSafeHls0017
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0018
     * @tc.name      testSafeHls0018
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0019
     * @tc.name      testSafeHls0019
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0020
     * @tc.name      testSafeHls0020
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0021
     * @tc.name      testSafeHls0021
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0022
     * @tc.name      testSafeHls0022
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0023
     * @tc.name      testSafeHls0023
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0024
     * @tc.name      testSafeHls0024
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0025
     * @tc.name      testSafeHls0025
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0026
     * @tc.name      testSafeHls0026
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0027
     * @tc.name      testSafeHls0027
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0028
     * @tc.name      testSafeHls0028
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0029
     * @tc.name      testSafeHls0029
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0030
     * @tc.name      testSafeHls0030
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0031
     * @tc.name      testSafeHls0031
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0032
     * @tc.name      testSafeHls0032
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0033
     * @tc.name      testSafeHls0033
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0034
     * @tc.name      testSafeHls0034
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0035
     * @tc.name      testSafeHls0035
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0036
     * @tc.name      testSafeHls0036
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0037
     * @tc.name      testSafeHls0037
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0038
     * @tc.name      testSafeHls0038
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0039
     * @tc.name      testSafeHls0039
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0040
     * @tc.name      testSafeHls0040
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0041
     * @tc.name      testSafeHls0041
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0042
     * @tc.name      testSafeHls0042
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0043
     * @tc.name      testSafeHls0043
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0044
     * @tc.name      testSafeHls0044
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0045
     * @tc.name      testSafeHls0045
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0046
     * @tc.name      testSafeHls0046
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0047
     * @tc.name      testSafeHls0047
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0048
     * @tc.name      testSafeHls0048
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0049
     * @tc.name      testSafeHls0049
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0050
     * @tc.name      testSafeHls0050
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0051
     * @tc.name      testSafeHls0051
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0052
     * @tc.name      testSafeHls0052
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0053
     * @tc.name      testSafeHls0053
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0054
     * @tc.name      testSafeHls0054
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0055
     * @tc.name      testSafeHls0055
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0056
     * @tc.name      testSafeHls0056
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0057
     * @tc.name      testSafeHls0057
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0058
     * @tc.name      testSafeHls0058
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0059
     * @tc.name      testSafeHls0059
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0060
     * @tc.name      testSafeHls0060
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0061
     * @tc.name      testSafeHls0061
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0062
     * @tc.name      testSafeHls0062
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0063
     * @tc.name      testSafeHls0063
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0064
     * @tc.name      testSafeHls0064
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0065
     * @tc.name      testSafeHls0065
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0066
     * @tc.name      testSafeHls0066
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0067
     * @tc.name      testSafeHls0067
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0068
     * @tc.name      testSafeHls0068
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0069
     * @tc.name      testSafeHls0069
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0070
     * @tc.name      testSafeHls0070
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0071
     * @tc.name      testSafeHls0071
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0072
     * @tc.name      testSafeHls0072
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0073
     * @tc.name      testSafeHls0073
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0074
     * @tc.name      testSafeHls0074
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0075
     * @tc.name      testSafeHls0075
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0076
     * @tc.name      testSafeHls0076
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0077
     * @tc.name      testSafeHls0077
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0078
     * @tc.name      testSafeHls0078
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0079
     * @tc.name      testSafeHls0079
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0080
     * @tc.name      testSafeHls0080
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0081
     * @tc.name      testSafeHls0081
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0082
     * @tc.name      testSafeHls0082
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0083
     * @tc.name      testSafeHls0083
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0084
     * @tc.name      testSafeHls0084
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0085
     * @tc.name      testSafeHls0085
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0086
     * @tc.name      testSafeHls0086
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0087
     * @tc.name      testSafeHls0087
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0088
     * @tc.name      testSafeHls0088
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0089
     * @tc.name      testSafeHls0089
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0090
     * @tc.name      testSafeHls0090
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0091
     * @tc.name      testSafeHls0091
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0092
     * @tc.name      testSafeHls0092
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0093
     * @tc.name      testSafeHls0093
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0094
     * @tc.name      testSafeHls0094
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0095
     * @tc.name      testSafeHls0095
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0096
     * @tc.name      testSafeHls0096
     * @tc.desc      HLS segment seg0.ts has duration 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg0.ts';
      const duration: number = 4;
      expect(segment).assertEqual('seg0.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(4);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0097
     * @tc.name      testSafeHls0097
     * @tc.desc      HLS segment seg1.ts has duration 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg1.ts';
      const duration: number = 6;
      expect(segment).assertEqual('seg1.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(6);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0098
     * @tc.name      testSafeHls0098
     * @tc.desc      HLS segment seg2.ts has duration 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg2.ts';
      const duration: number = 8;
      expect(segment).assertEqual('seg2.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(8);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0099
     * @tc.name      testSafeHls0099
     * @tc.desc      HLS segment seg3.ts has duration 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg3.ts';
      const duration: number = 10;
      expect(segment).assertEqual('seg3.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(10);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLS_0100
     * @tc.name      testSafeHls0100
     * @tc.desc      HLS segment seg4.ts has duration 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHls0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const segment: string = 'seg4.ts';
      const duration: number = 12;
      expect(segment).assertEqual('seg4.ts');
      expect(segment.endsWith('.ts')).assertTrue();
      expect(duration).assertEqual(12);
      expect(duration).assertLarger(0);
    })
  })
}
