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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaIntegrationPart1Test(): void {
  describe('MediaIntegrationPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_0100
     * @tc.name      testByteRoundTrip0001
     * @tc.desc      Verify byte length 0 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0001 begin');
      const ms: number = MediaTools.getMsFromByteLength(0);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 0) <= Math.abs(0) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_0200
     * @tc.name      testByteRoundTrip0002
     * @tc.desc      Verify byte length 1 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0002 begin');
      const ms: number = MediaTools.getMsFromByteLength(1);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 1) <= Math.abs(1) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_0300
     * @tc.name      testByteRoundTrip0003
     * @tc.desc      Verify byte length 2 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0003 begin');
      const ms: number = MediaTools.getMsFromByteLength(2);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 2) <= Math.abs(2) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_0400
     * @tc.name      testByteRoundTrip0004
     * @tc.desc      Verify byte length 3 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0004 begin');
      const ms: number = MediaTools.getMsFromByteLength(3);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 3) <= Math.abs(3) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_0500
     * @tc.name      testByteRoundTrip0005
     * @tc.desc      Verify byte length 4 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0005 begin');
      const ms: number = MediaTools.getMsFromByteLength(4);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 4) <= Math.abs(4) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_0600
     * @tc.name      testByteRoundTrip0006
     * @tc.desc      Verify byte length 5 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0006 begin');
      const ms: number = MediaTools.getMsFromByteLength(5);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 5) <= Math.abs(5) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_0700
     * @tc.name      testByteRoundTrip0007
     * @tc.desc      Verify byte length 6 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0007 begin');
      const ms: number = MediaTools.getMsFromByteLength(6);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 6) <= Math.abs(6) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_0800
     * @tc.name      testByteRoundTrip0008
     * @tc.desc      Verify byte length 7 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0008 begin');
      const ms: number = MediaTools.getMsFromByteLength(7);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 7) <= Math.abs(7) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_0900
     * @tc.name      testByteRoundTrip0009
     * @tc.desc      Verify byte length 8 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0009 begin');
      const ms: number = MediaTools.getMsFromByteLength(8);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 8) <= Math.abs(8) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1000
     * @tc.name      testByteRoundTrip0010
     * @tc.desc      Verify byte length 9 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0010 begin');
      const ms: number = MediaTools.getMsFromByteLength(9);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 9) <= Math.abs(9) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1100
     * @tc.name      testByteRoundTrip0011
     * @tc.desc      Verify byte length 10 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0011 begin');
      const ms: number = MediaTools.getMsFromByteLength(10);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 10) <= Math.abs(10) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1200
     * @tc.name      testByteRoundTrip0012
     * @tc.desc      Verify byte length 11 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0012 begin');
      const ms: number = MediaTools.getMsFromByteLength(11);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 11) <= Math.abs(11) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1300
     * @tc.name      testByteRoundTrip0013
     * @tc.desc      Verify byte length 12 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0013 begin');
      const ms: number = MediaTools.getMsFromByteLength(12);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 12) <= Math.abs(12) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1400
     * @tc.name      testByteRoundTrip0014
     * @tc.desc      Verify byte length 13 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0014 begin');
      const ms: number = MediaTools.getMsFromByteLength(13);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 13) <= Math.abs(13) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1500
     * @tc.name      testByteRoundTrip0015
     * @tc.desc      Verify byte length 14 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0015 begin');
      const ms: number = MediaTools.getMsFromByteLength(14);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 14) <= Math.abs(14) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1600
     * @tc.name      testByteRoundTrip0016
     * @tc.desc      Verify byte length 15 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0016 begin');
      const ms: number = MediaTools.getMsFromByteLength(15);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 15) <= Math.abs(15) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1700
     * @tc.name      testByteRoundTrip0017
     * @tc.desc      Verify byte length 16 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0017 begin');
      const ms: number = MediaTools.getMsFromByteLength(16);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 16) <= Math.abs(16) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1800
     * @tc.name      testByteRoundTrip0018
     * @tc.desc      Verify byte length 17 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0018 begin');
      const ms: number = MediaTools.getMsFromByteLength(17);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 17) <= Math.abs(17) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_1900
     * @tc.name      testByteRoundTrip0019
     * @tc.desc      Verify byte length 18 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0019 begin');
      const ms: number = MediaTools.getMsFromByteLength(18);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 18) <= Math.abs(18) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2000
     * @tc.name      testByteRoundTrip0020
     * @tc.desc      Verify byte length 19 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0020 begin');
      const ms: number = MediaTools.getMsFromByteLength(19);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 19) <= Math.abs(19) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2100
     * @tc.name      testByteRoundTrip0021
     * @tc.desc      Verify byte length 20 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0021 begin');
      const ms: number = MediaTools.getMsFromByteLength(20);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 20) <= Math.abs(20) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2200
     * @tc.name      testByteRoundTrip0022
     * @tc.desc      Verify byte length 21 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0022 begin');
      const ms: number = MediaTools.getMsFromByteLength(21);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 21) <= Math.abs(21) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2300
     * @tc.name      testByteRoundTrip0023
     * @tc.desc      Verify byte length 22 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0023 begin');
      const ms: number = MediaTools.getMsFromByteLength(22);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 22) <= Math.abs(22) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2400
     * @tc.name      testByteRoundTrip0024
     * @tc.desc      Verify byte length 23 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0024 begin');
      const ms: number = MediaTools.getMsFromByteLength(23);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 23) <= Math.abs(23) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2500
     * @tc.name      testByteRoundTrip0025
     * @tc.desc      Verify byte length 24 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0025 begin');
      const ms: number = MediaTools.getMsFromByteLength(24);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 24) <= Math.abs(24) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2600
     * @tc.name      testByteRoundTrip0026
     * @tc.desc      Verify byte length 25 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0026 begin');
      const ms: number = MediaTools.getMsFromByteLength(25);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 25) <= Math.abs(25) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2700
     * @tc.name      testByteRoundTrip0027
     * @tc.desc      Verify byte length 26 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0027 begin');
      const ms: number = MediaTools.getMsFromByteLength(26);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 26) <= Math.abs(26) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2800
     * @tc.name      testByteRoundTrip0028
     * @tc.desc      Verify byte length 27 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0028 begin');
      const ms: number = MediaTools.getMsFromByteLength(27);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 27) <= Math.abs(27) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_2900
     * @tc.name      testByteRoundTrip0029
     * @tc.desc      Verify byte length 28 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0029 begin');
      const ms: number = MediaTools.getMsFromByteLength(28);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 28) <= Math.abs(28) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3000
     * @tc.name      testByteRoundTrip0030
     * @tc.desc      Verify byte length 29 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0030 begin');
      const ms: number = MediaTools.getMsFromByteLength(29);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 29) <= Math.abs(29) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0030 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3100
     * @tc.name      testByteRoundTrip0031
     * @tc.desc      Verify byte length 30 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0031 begin');
      const ms: number = MediaTools.getMsFromByteLength(30);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 30) <= Math.abs(30) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0031 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3200
     * @tc.name      testByteRoundTrip0032
     * @tc.desc      Verify byte length 31 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0032 begin');
      const ms: number = MediaTools.getMsFromByteLength(31);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 31) <= Math.abs(31) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0032 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3300
     * @tc.name      testByteRoundTrip0033
     * @tc.desc      Verify byte length 32 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0033 begin');
      const ms: number = MediaTools.getMsFromByteLength(32);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 32) <= Math.abs(32) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0033 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3400
     * @tc.name      testByteRoundTrip0034
     * @tc.desc      Verify byte length 33 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0034 begin');
      const ms: number = MediaTools.getMsFromByteLength(33);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 33) <= Math.abs(33) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0034 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3500
     * @tc.name      testByteRoundTrip0035
     * @tc.desc      Verify byte length 34 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0035 begin');
      const ms: number = MediaTools.getMsFromByteLength(34);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 34) <= Math.abs(34) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0035 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3600
     * @tc.name      testByteRoundTrip0036
     * @tc.desc      Verify byte length 35 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0036 begin');
      const ms: number = MediaTools.getMsFromByteLength(35);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 35) <= Math.abs(35) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0036 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3700
     * @tc.name      testByteRoundTrip0037
     * @tc.desc      Verify byte length 36 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0037 begin');
      const ms: number = MediaTools.getMsFromByteLength(36);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 36) <= Math.abs(36) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0037 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3800
     * @tc.name      testByteRoundTrip0038
     * @tc.desc      Verify byte length 37 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0038 begin');
      const ms: number = MediaTools.getMsFromByteLength(37);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 37) <= Math.abs(37) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0038 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_3900
     * @tc.name      testByteRoundTrip0039
     * @tc.desc      Verify byte length 38 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0039 begin');
      const ms: number = MediaTools.getMsFromByteLength(38);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 38) <= Math.abs(38) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0039 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4000
     * @tc.name      testByteRoundTrip0040
     * @tc.desc      Verify byte length 39 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0040 begin');
      const ms: number = MediaTools.getMsFromByteLength(39);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 39) <= Math.abs(39) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0040 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4100
     * @tc.name      testByteRoundTrip0041
     * @tc.desc      Verify byte length 40 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0041 begin');
      const ms: number = MediaTools.getMsFromByteLength(40);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 40) <= Math.abs(40) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0041 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4200
     * @tc.name      testByteRoundTrip0042
     * @tc.desc      Verify byte length 41 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0042 begin');
      const ms: number = MediaTools.getMsFromByteLength(41);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 41) <= Math.abs(41) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0042 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4300
     * @tc.name      testByteRoundTrip0043
     * @tc.desc      Verify byte length 42 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0043 begin');
      const ms: number = MediaTools.getMsFromByteLength(42);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 42) <= Math.abs(42) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0043 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4400
     * @tc.name      testByteRoundTrip0044
     * @tc.desc      Verify byte length 43 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0044 begin');
      const ms: number = MediaTools.getMsFromByteLength(43);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 43) <= Math.abs(43) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0044 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4500
     * @tc.name      testByteRoundTrip0045
     * @tc.desc      Verify byte length 44 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0045 begin');
      const ms: number = MediaTools.getMsFromByteLength(44);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 44) <= Math.abs(44) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0045 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4600
     * @tc.name      testByteRoundTrip0046
     * @tc.desc      Verify byte length 45 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0046 begin');
      const ms: number = MediaTools.getMsFromByteLength(45);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 45) <= Math.abs(45) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0046 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4700
     * @tc.name      testByteRoundTrip0047
     * @tc.desc      Verify byte length 46 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0047 begin');
      const ms: number = MediaTools.getMsFromByteLength(46);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 46) <= Math.abs(46) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0047 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4800
     * @tc.name      testByteRoundTrip0048
     * @tc.desc      Verify byte length 47 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0048 begin');
      const ms: number = MediaTools.getMsFromByteLength(47);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 47) <= Math.abs(47) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0048 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_4900
     * @tc.name      testByteRoundTrip0049
     * @tc.desc      Verify byte length 48 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0049 begin');
      const ms: number = MediaTools.getMsFromByteLength(48);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 48) <= Math.abs(48) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0049 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5000
     * @tc.name      testByteRoundTrip0050
     * @tc.desc      Verify byte length 49 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0050 begin');
      const ms: number = MediaTools.getMsFromByteLength(49);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 49) <= Math.abs(49) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0050 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5100
     * @tc.name      testByteRoundTrip0051
     * @tc.desc      Verify byte length 50 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0051 begin');
      const ms: number = MediaTools.getMsFromByteLength(50);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 50) <= Math.abs(50) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0051 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5200
     * @tc.name      testByteRoundTrip0052
     * @tc.desc      Verify byte length 51 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0052 begin');
      const ms: number = MediaTools.getMsFromByteLength(51);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 51) <= Math.abs(51) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0052 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5300
     * @tc.name      testByteRoundTrip0053
     * @tc.desc      Verify byte length 52 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0053 begin');
      const ms: number = MediaTools.getMsFromByteLength(52);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 52) <= Math.abs(52) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0053 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5400
     * @tc.name      testByteRoundTrip0054
     * @tc.desc      Verify byte length 53 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0054 begin');
      const ms: number = MediaTools.getMsFromByteLength(53);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 53) <= Math.abs(53) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0054 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5500
     * @tc.name      testByteRoundTrip0055
     * @tc.desc      Verify byte length 54 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0055 begin');
      const ms: number = MediaTools.getMsFromByteLength(54);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 54) <= Math.abs(54) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0055 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5600
     * @tc.name      testByteRoundTrip0056
     * @tc.desc      Verify byte length 55 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0056 begin');
      const ms: number = MediaTools.getMsFromByteLength(55);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 55) <= Math.abs(55) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0056 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5700
     * @tc.name      testByteRoundTrip0057
     * @tc.desc      Verify byte length 56 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0057 begin');
      const ms: number = MediaTools.getMsFromByteLength(56);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 56) <= Math.abs(56) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0057 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5800
     * @tc.name      testByteRoundTrip0058
     * @tc.desc      Verify byte length 57 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0058 begin');
      const ms: number = MediaTools.getMsFromByteLength(57);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 57) <= Math.abs(57) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0058 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_5900
     * @tc.name      testByteRoundTrip0059
     * @tc.desc      Verify byte length 58 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0059 begin');
      const ms: number = MediaTools.getMsFromByteLength(58);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 58) <= Math.abs(58) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0059 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6000
     * @tc.name      testByteRoundTrip0060
     * @tc.desc      Verify byte length 59 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0060 begin');
      const ms: number = MediaTools.getMsFromByteLength(59);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 59) <= Math.abs(59) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0060 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6100
     * @tc.name      testByteRoundTrip0061
     * @tc.desc      Verify byte length 60 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0061 begin');
      const ms: number = MediaTools.getMsFromByteLength(60);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 60) <= Math.abs(60) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0061 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6200
     * @tc.name      testByteRoundTrip0062
     * @tc.desc      Verify byte length 61 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0062 begin');
      const ms: number = MediaTools.getMsFromByteLength(61);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 61) <= Math.abs(61) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0062 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6300
     * @tc.name      testByteRoundTrip0063
     * @tc.desc      Verify byte length 62 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0063 begin');
      const ms: number = MediaTools.getMsFromByteLength(62);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 62) <= Math.abs(62) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0063 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6400
     * @tc.name      testByteRoundTrip0064
     * @tc.desc      Verify byte length 63 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0064 begin');
      const ms: number = MediaTools.getMsFromByteLength(63);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 63) <= Math.abs(63) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0064 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6500
     * @tc.name      testByteRoundTrip0065
     * @tc.desc      Verify byte length 64 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0065 begin');
      const ms: number = MediaTools.getMsFromByteLength(64);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 64) <= Math.abs(64) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0065 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6600
     * @tc.name      testByteRoundTrip0066
     * @tc.desc      Verify byte length 65 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0066 begin');
      const ms: number = MediaTools.getMsFromByteLength(65);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 65) <= Math.abs(65) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0066 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6700
     * @tc.name      testByteRoundTrip0067
     * @tc.desc      Verify byte length 66 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0067 begin');
      const ms: number = MediaTools.getMsFromByteLength(66);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 66) <= Math.abs(66) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0067 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6800
     * @tc.name      testByteRoundTrip0068
     * @tc.desc      Verify byte length 67 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0068 begin');
      const ms: number = MediaTools.getMsFromByteLength(67);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 67) <= Math.abs(67) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0068 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_6900
     * @tc.name      testByteRoundTrip0069
     * @tc.desc      Verify byte length 68 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0069 begin');
      const ms: number = MediaTools.getMsFromByteLength(68);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 68) <= Math.abs(68) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0069 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7000
     * @tc.name      testByteRoundTrip0070
     * @tc.desc      Verify byte length 69 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0070 begin');
      const ms: number = MediaTools.getMsFromByteLength(69);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 69) <= Math.abs(69) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0070 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7100
     * @tc.name      testByteRoundTrip0071
     * @tc.desc      Verify byte length 70 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0071 begin');
      const ms: number = MediaTools.getMsFromByteLength(70);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 70) <= Math.abs(70) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0071 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7200
     * @tc.name      testByteRoundTrip0072
     * @tc.desc      Verify byte length 71 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0072 begin');
      const ms: number = MediaTools.getMsFromByteLength(71);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 71) <= Math.abs(71) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0072 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7300
     * @tc.name      testByteRoundTrip0073
     * @tc.desc      Verify byte length 72 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0073 begin');
      const ms: number = MediaTools.getMsFromByteLength(72);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 72) <= Math.abs(72) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0073 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7400
     * @tc.name      testByteRoundTrip0074
     * @tc.desc      Verify byte length 73 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0074 begin');
      const ms: number = MediaTools.getMsFromByteLength(73);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 73) <= Math.abs(73) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0074 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7500
     * @tc.name      testByteRoundTrip0075
     * @tc.desc      Verify byte length 74 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0075 begin');
      const ms: number = MediaTools.getMsFromByteLength(74);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 74) <= Math.abs(74) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0075 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7600
     * @tc.name      testByteRoundTrip0076
     * @tc.desc      Verify byte length 75 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0076 begin');
      const ms: number = MediaTools.getMsFromByteLength(75);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 75) <= Math.abs(75) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0076 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7700
     * @tc.name      testByteRoundTrip0077
     * @tc.desc      Verify byte length 76 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0077 begin');
      const ms: number = MediaTools.getMsFromByteLength(76);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 76) <= Math.abs(76) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0077 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7800
     * @tc.name      testByteRoundTrip0078
     * @tc.desc      Verify byte length 77 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0078 begin');
      const ms: number = MediaTools.getMsFromByteLength(77);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 77) <= Math.abs(77) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0078 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_7900
     * @tc.name      testByteRoundTrip0079
     * @tc.desc      Verify byte length 78 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0079 begin');
      const ms: number = MediaTools.getMsFromByteLength(78);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 78) <= Math.abs(78) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0079 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8000
     * @tc.name      testByteRoundTrip0080
     * @tc.desc      Verify byte length 79 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0080 begin');
      const ms: number = MediaTools.getMsFromByteLength(79);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 79) <= Math.abs(79) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0080 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8100
     * @tc.name      testByteRoundTrip0081
     * @tc.desc      Verify byte length 80 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0081 begin');
      const ms: number = MediaTools.getMsFromByteLength(80);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 80) <= Math.abs(80) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0081 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8200
     * @tc.name      testByteRoundTrip0082
     * @tc.desc      Verify byte length 81 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0082 begin');
      const ms: number = MediaTools.getMsFromByteLength(81);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 81) <= Math.abs(81) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0082 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8300
     * @tc.name      testByteRoundTrip0083
     * @tc.desc      Verify byte length 82 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0083 begin');
      const ms: number = MediaTools.getMsFromByteLength(82);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 82) <= Math.abs(82) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0083 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8400
     * @tc.name      testByteRoundTrip0084
     * @tc.desc      Verify byte length 83 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0084 begin');
      const ms: number = MediaTools.getMsFromByteLength(83);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 83) <= Math.abs(83) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0084 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8500
     * @tc.name      testByteRoundTrip0085
     * @tc.desc      Verify byte length 84 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0085 begin');
      const ms: number = MediaTools.getMsFromByteLength(84);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 84) <= Math.abs(84) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0085 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8600
     * @tc.name      testByteRoundTrip0086
     * @tc.desc      Verify byte length 85 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0086 begin');
      const ms: number = MediaTools.getMsFromByteLength(85);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 85) <= Math.abs(85) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0086 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8700
     * @tc.name      testByteRoundTrip0087
     * @tc.desc      Verify byte length 86 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0087 begin');
      const ms: number = MediaTools.getMsFromByteLength(86);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 86) <= Math.abs(86) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0087 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8800
     * @tc.name      testByteRoundTrip0088
     * @tc.desc      Verify byte length 87 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0088 begin');
      const ms: number = MediaTools.getMsFromByteLength(87);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 87) <= Math.abs(87) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0088 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_8900
     * @tc.name      testByteRoundTrip0089
     * @tc.desc      Verify byte length 88 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0089 begin');
      const ms: number = MediaTools.getMsFromByteLength(88);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 88) <= Math.abs(88) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0089 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP1_9000
     * @tc.name      testByteRoundTrip0090
     * @tc.desc      Verify byte length 89 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0090 begin');
      const ms: number = MediaTools.getMsFromByteLength(89);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 89) <= Math.abs(89) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0090 end');
    })

  })
}
