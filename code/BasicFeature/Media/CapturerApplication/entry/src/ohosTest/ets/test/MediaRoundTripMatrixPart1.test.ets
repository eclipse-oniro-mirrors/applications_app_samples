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

export default function MediaRoundTripMatrixPart1Test(): void {
  describe('MediaRoundTripMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_0100
     * @tc.name      testRoundTrip0001
     * @tc.desc      Verify byte offset for 0 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0001 begin');
      const bytes: number = MediaTools.getOffsetFromTime(0);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 0) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_0200
     * @tc.name      testRoundTrip0002
     * @tc.desc      Verify byte offset for 1 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0002 begin');
      const bytes: number = MediaTools.getOffsetFromTime(1);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 1) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_0300
     * @tc.name      testRoundTrip0003
     * @tc.desc      Verify byte offset for 2 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0003 begin');
      const bytes: number = MediaTools.getOffsetFromTime(2);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 2) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_0400
     * @tc.name      testRoundTrip0004
     * @tc.desc      Verify byte offset for 3 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0004 begin');
      const bytes: number = MediaTools.getOffsetFromTime(3);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 3) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_0500
     * @tc.name      testRoundTrip0005
     * @tc.desc      Verify byte offset for 4 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0005 begin');
      const bytes: number = MediaTools.getOffsetFromTime(4);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 4) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_0600
     * @tc.name      testRoundTrip0006
     * @tc.desc      Verify byte offset for 5 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0006 begin');
      const bytes: number = MediaTools.getOffsetFromTime(5);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 5) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_0700
     * @tc.name      testRoundTrip0007
     * @tc.desc      Verify byte offset for 6 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0007 begin');
      const bytes: number = MediaTools.getOffsetFromTime(6);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 6) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_0800
     * @tc.name      testRoundTrip0008
     * @tc.desc      Verify byte offset for 7 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0008 begin');
      const bytes: number = MediaTools.getOffsetFromTime(7);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 7) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_0900
     * @tc.name      testRoundTrip0009
     * @tc.desc      Verify byte offset for 8 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0009 begin');
      const bytes: number = MediaTools.getOffsetFromTime(8);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 8) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1000
     * @tc.name      testRoundTrip0010
     * @tc.desc      Verify byte offset for 9 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0010 begin');
      const bytes: number = MediaTools.getOffsetFromTime(9);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 9) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1100
     * @tc.name      testRoundTrip0011
     * @tc.desc      Verify byte offset for 10 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0011 begin');
      const bytes: number = MediaTools.getOffsetFromTime(10);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 10) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1200
     * @tc.name      testRoundTrip0012
     * @tc.desc      Verify byte offset for 11 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0012 begin');
      const bytes: number = MediaTools.getOffsetFromTime(11);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 11) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1300
     * @tc.name      testRoundTrip0013
     * @tc.desc      Verify byte offset for 12 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0013 begin');
      const bytes: number = MediaTools.getOffsetFromTime(12);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 12) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1400
     * @tc.name      testRoundTrip0014
     * @tc.desc      Verify byte offset for 13 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0014 begin');
      const bytes: number = MediaTools.getOffsetFromTime(13);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 13) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1500
     * @tc.name      testRoundTrip0015
     * @tc.desc      Verify byte offset for 14 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0015 begin');
      const bytes: number = MediaTools.getOffsetFromTime(14);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 14) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1600
     * @tc.name      testRoundTrip0016
     * @tc.desc      Verify byte offset for 15 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0016 begin');
      const bytes: number = MediaTools.getOffsetFromTime(15);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 15) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1700
     * @tc.name      testRoundTrip0017
     * @tc.desc      Verify byte offset for 16 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0017 begin');
      const bytes: number = MediaTools.getOffsetFromTime(16);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 16) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1800
     * @tc.name      testRoundTrip0018
     * @tc.desc      Verify byte offset for 17 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0018 begin');
      const bytes: number = MediaTools.getOffsetFromTime(17);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 17) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_1900
     * @tc.name      testRoundTrip0019
     * @tc.desc      Verify byte offset for 18 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0019 begin');
      const bytes: number = MediaTools.getOffsetFromTime(18);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 18) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2000
     * @tc.name      testRoundTrip0020
     * @tc.desc      Verify byte offset for 19 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0020 begin');
      const bytes: number = MediaTools.getOffsetFromTime(19);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 19) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2100
     * @tc.name      testRoundTrip0021
     * @tc.desc      Verify byte offset for 20 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0021 begin');
      const bytes: number = MediaTools.getOffsetFromTime(20);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 20) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2200
     * @tc.name      testRoundTrip0022
     * @tc.desc      Verify byte offset for 21 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0022 begin');
      const bytes: number = MediaTools.getOffsetFromTime(21);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 21) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2300
     * @tc.name      testRoundTrip0023
     * @tc.desc      Verify byte offset for 22 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0023 begin');
      const bytes: number = MediaTools.getOffsetFromTime(22);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 22) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2400
     * @tc.name      testRoundTrip0024
     * @tc.desc      Verify byte offset for 23 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0024 begin');
      const bytes: number = MediaTools.getOffsetFromTime(23);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 23) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2500
     * @tc.name      testRoundTrip0025
     * @tc.desc      Verify byte offset for 24 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0025 begin');
      const bytes: number = MediaTools.getOffsetFromTime(24);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 24) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2600
     * @tc.name      testRoundTrip0026
     * @tc.desc      Verify byte offset for 25 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0026 begin');
      const bytes: number = MediaTools.getOffsetFromTime(25);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 25) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2700
     * @tc.name      testRoundTrip0027
     * @tc.desc      Verify byte offset for 26 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0027 begin');
      const bytes: number = MediaTools.getOffsetFromTime(26);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 26) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2800
     * @tc.name      testRoundTrip0028
     * @tc.desc      Verify byte offset for 27 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0028 begin');
      const bytes: number = MediaTools.getOffsetFromTime(27);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 27) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_2900
     * @tc.name      testRoundTrip0029
     * @tc.desc      Verify byte offset for 28 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0029 begin');
      const bytes: number = MediaTools.getOffsetFromTime(28);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 28) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3000
     * @tc.name      testRoundTrip0030
     * @tc.desc      Verify byte offset for 29 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0030 begin');
      const bytes: number = MediaTools.getOffsetFromTime(29);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 29) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0030 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3100
     * @tc.name      testRoundTrip0031
     * @tc.desc      Verify byte offset for 30 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0031 begin');
      const bytes: number = MediaTools.getOffsetFromTime(30);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 30) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0031 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3200
     * @tc.name      testRoundTrip0032
     * @tc.desc      Verify byte offset for 31 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0032 begin');
      const bytes: number = MediaTools.getOffsetFromTime(31);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 31) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0032 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3300
     * @tc.name      testRoundTrip0033
     * @tc.desc      Verify byte offset for 32 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0033 begin');
      const bytes: number = MediaTools.getOffsetFromTime(32);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 32) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0033 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3400
     * @tc.name      testRoundTrip0034
     * @tc.desc      Verify byte offset for 33 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0034 begin');
      const bytes: number = MediaTools.getOffsetFromTime(33);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 33) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0034 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3500
     * @tc.name      testRoundTrip0035
     * @tc.desc      Verify byte offset for 34 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0035 begin');
      const bytes: number = MediaTools.getOffsetFromTime(34);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 34) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0035 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3600
     * @tc.name      testRoundTrip0036
     * @tc.desc      Verify byte offset for 35 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0036 begin');
      const bytes: number = MediaTools.getOffsetFromTime(35);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 35) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0036 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3700
     * @tc.name      testRoundTrip0037
     * @tc.desc      Verify byte offset for 36 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0037 begin');
      const bytes: number = MediaTools.getOffsetFromTime(36);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 36) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0037 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3800
     * @tc.name      testRoundTrip0038
     * @tc.desc      Verify byte offset for 37 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0038 begin');
      const bytes: number = MediaTools.getOffsetFromTime(37);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 37) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0038 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_3900
     * @tc.name      testRoundTrip0039
     * @tc.desc      Verify byte offset for 38 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0039 begin');
      const bytes: number = MediaTools.getOffsetFromTime(38);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 38) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0039 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4000
     * @tc.name      testRoundTrip0040
     * @tc.desc      Verify byte offset for 39 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0040 begin');
      const bytes: number = MediaTools.getOffsetFromTime(39);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 39) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0040 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4100
     * @tc.name      testRoundTrip0041
     * @tc.desc      Verify byte offset for 40 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0041 begin');
      const bytes: number = MediaTools.getOffsetFromTime(40);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 40) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0041 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4200
     * @tc.name      testRoundTrip0042
     * @tc.desc      Verify byte offset for 41 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0042 begin');
      const bytes: number = MediaTools.getOffsetFromTime(41);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 41) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0042 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4300
     * @tc.name      testRoundTrip0043
     * @tc.desc      Verify byte offset for 42 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0043 begin');
      const bytes: number = MediaTools.getOffsetFromTime(42);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 42) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0043 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4400
     * @tc.name      testRoundTrip0044
     * @tc.desc      Verify byte offset for 43 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0044 begin');
      const bytes: number = MediaTools.getOffsetFromTime(43);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 43) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0044 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4500
     * @tc.name      testRoundTrip0045
     * @tc.desc      Verify byte offset for 44 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0045 begin');
      const bytes: number = MediaTools.getOffsetFromTime(44);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 44) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0045 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4600
     * @tc.name      testRoundTrip0046
     * @tc.desc      Verify byte offset for 45 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0046 begin');
      const bytes: number = MediaTools.getOffsetFromTime(45);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 45) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0046 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4700
     * @tc.name      testRoundTrip0047
     * @tc.desc      Verify byte offset for 46 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0047 begin');
      const bytes: number = MediaTools.getOffsetFromTime(46);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 46) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0047 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4800
     * @tc.name      testRoundTrip0048
     * @tc.desc      Verify byte offset for 47 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0048 begin');
      const bytes: number = MediaTools.getOffsetFromTime(47);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 47) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0048 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_4900
     * @tc.name      testRoundTrip0049
     * @tc.desc      Verify byte offset for 48 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0049 begin');
      const bytes: number = MediaTools.getOffsetFromTime(48);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 48) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0049 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5000
     * @tc.name      testRoundTrip0050
     * @tc.desc      Verify byte offset for 49 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0050 begin');
      const bytes: number = MediaTools.getOffsetFromTime(49);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 49) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0050 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5100
     * @tc.name      testRoundTrip0051
     * @tc.desc      Verify byte offset for 50 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0051 begin');
      const bytes: number = MediaTools.getOffsetFromTime(50);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 50) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0051 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5200
     * @tc.name      testRoundTrip0052
     * @tc.desc      Verify byte offset for 51 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0052 begin');
      const bytes: number = MediaTools.getOffsetFromTime(51);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 51) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0052 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5300
     * @tc.name      testRoundTrip0053
     * @tc.desc      Verify byte offset for 52 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0053 begin');
      const bytes: number = MediaTools.getOffsetFromTime(52);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 52) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0053 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5400
     * @tc.name      testRoundTrip0054
     * @tc.desc      Verify byte offset for 53 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0054 begin');
      const bytes: number = MediaTools.getOffsetFromTime(53);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 53) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0054 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5500
     * @tc.name      testRoundTrip0055
     * @tc.desc      Verify byte offset for 54 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0055 begin');
      const bytes: number = MediaTools.getOffsetFromTime(54);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 54) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0055 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5600
     * @tc.name      testRoundTrip0056
     * @tc.desc      Verify byte offset for 55 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0056 begin');
      const bytes: number = MediaTools.getOffsetFromTime(55);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 55) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0056 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5700
     * @tc.name      testRoundTrip0057
     * @tc.desc      Verify byte offset for 56 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0057 begin');
      const bytes: number = MediaTools.getOffsetFromTime(56);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 56) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0057 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5800
     * @tc.name      testRoundTrip0058
     * @tc.desc      Verify byte offset for 57 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0058 begin');
      const bytes: number = MediaTools.getOffsetFromTime(57);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 57) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0058 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_5900
     * @tc.name      testRoundTrip0059
     * @tc.desc      Verify byte offset for 58 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0059 begin');
      const bytes: number = MediaTools.getOffsetFromTime(58);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 58) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0059 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6000
     * @tc.name      testRoundTrip0060
     * @tc.desc      Verify byte offset for 59 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0060 begin');
      const bytes: number = MediaTools.getOffsetFromTime(59);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 59) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0060 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6100
     * @tc.name      testRoundTrip0061
     * @tc.desc      Verify byte offset for 60 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0061 begin');
      const bytes: number = MediaTools.getOffsetFromTime(60);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 60) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0061 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6200
     * @tc.name      testRoundTrip0062
     * @tc.desc      Verify byte offset for 61 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0062 begin');
      const bytes: number = MediaTools.getOffsetFromTime(61);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 61) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0062 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6300
     * @tc.name      testRoundTrip0063
     * @tc.desc      Verify byte offset for 62 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0063 begin');
      const bytes: number = MediaTools.getOffsetFromTime(62);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 62) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0063 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6400
     * @tc.name      testRoundTrip0064
     * @tc.desc      Verify byte offset for 63 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0064 begin');
      const bytes: number = MediaTools.getOffsetFromTime(63);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 63) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0064 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6500
     * @tc.name      testRoundTrip0065
     * @tc.desc      Verify byte offset for 64 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0065 begin');
      const bytes: number = MediaTools.getOffsetFromTime(64);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 64) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0065 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6600
     * @tc.name      testRoundTrip0066
     * @tc.desc      Verify byte offset for 65 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0066 begin');
      const bytes: number = MediaTools.getOffsetFromTime(65);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 65) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0066 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6700
     * @tc.name      testRoundTrip0067
     * @tc.desc      Verify byte offset for 66 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0067 begin');
      const bytes: number = MediaTools.getOffsetFromTime(66);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 66) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0067 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6800
     * @tc.name      testRoundTrip0068
     * @tc.desc      Verify byte offset for 67 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0068 begin');
      const bytes: number = MediaTools.getOffsetFromTime(67);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 67) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0068 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_6900
     * @tc.name      testRoundTrip0069
     * @tc.desc      Verify byte offset for 68 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0069 begin');
      const bytes: number = MediaTools.getOffsetFromTime(68);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 68) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0069 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7000
     * @tc.name      testRoundTrip0070
     * @tc.desc      Verify byte offset for 69 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0070 begin');
      const bytes: number = MediaTools.getOffsetFromTime(69);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 69) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0070 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7100
     * @tc.name      testRoundTrip0071
     * @tc.desc      Verify byte offset for 70 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0071 begin');
      const bytes: number = MediaTools.getOffsetFromTime(70);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 70) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0071 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7200
     * @tc.name      testRoundTrip0072
     * @tc.desc      Verify byte offset for 71 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0072 begin');
      const bytes: number = MediaTools.getOffsetFromTime(71);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 71) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0072 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7300
     * @tc.name      testRoundTrip0073
     * @tc.desc      Verify byte offset for 72 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0073 begin');
      const bytes: number = MediaTools.getOffsetFromTime(72);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 72) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0073 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7400
     * @tc.name      testRoundTrip0074
     * @tc.desc      Verify byte offset for 73 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0074 begin');
      const bytes: number = MediaTools.getOffsetFromTime(73);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 73) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0074 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7500
     * @tc.name      testRoundTrip0075
     * @tc.desc      Verify byte offset for 74 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0075 begin');
      const bytes: number = MediaTools.getOffsetFromTime(74);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 74) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0075 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7600
     * @tc.name      testRoundTrip0076
     * @tc.desc      Verify byte offset for 75 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0076 begin');
      const bytes: number = MediaTools.getOffsetFromTime(75);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 75) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0076 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7700
     * @tc.name      testRoundTrip0077
     * @tc.desc      Verify byte offset for 76 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0077 begin');
      const bytes: number = MediaTools.getOffsetFromTime(76);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 76) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0077 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7800
     * @tc.name      testRoundTrip0078
     * @tc.desc      Verify byte offset for 77 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0078 begin');
      const bytes: number = MediaTools.getOffsetFromTime(77);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 77) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0078 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_7900
     * @tc.name      testRoundTrip0079
     * @tc.desc      Verify byte offset for 78 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0079 begin');
      const bytes: number = MediaTools.getOffsetFromTime(78);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 78) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0079 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8000
     * @tc.name      testRoundTrip0080
     * @tc.desc      Verify byte offset for 79 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0080 begin');
      const bytes: number = MediaTools.getOffsetFromTime(79);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 79) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0080 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8100
     * @tc.name      testRoundTrip0081
     * @tc.desc      Verify byte offset for 80 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0081 begin');
      const bytes: number = MediaTools.getOffsetFromTime(80);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 80) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0081 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8200
     * @tc.name      testRoundTrip0082
     * @tc.desc      Verify byte offset for 81 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0082 begin');
      const bytes: number = MediaTools.getOffsetFromTime(81);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 81) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0082 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8300
     * @tc.name      testRoundTrip0083
     * @tc.desc      Verify byte offset for 82 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0083 begin');
      const bytes: number = MediaTools.getOffsetFromTime(82);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 82) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0083 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8400
     * @tc.name      testRoundTrip0084
     * @tc.desc      Verify byte offset for 83 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0084 begin');
      const bytes: number = MediaTools.getOffsetFromTime(83);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 83) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0084 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8500
     * @tc.name      testRoundTrip0085
     * @tc.desc      Verify byte offset for 84 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0085 begin');
      const bytes: number = MediaTools.getOffsetFromTime(84);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 84) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0085 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8600
     * @tc.name      testRoundTrip0086
     * @tc.desc      Verify byte offset for 85 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0086 begin');
      const bytes: number = MediaTools.getOffsetFromTime(85);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 85) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0086 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8700
     * @tc.name      testRoundTrip0087
     * @tc.desc      Verify byte offset for 86 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0087 begin');
      const bytes: number = MediaTools.getOffsetFromTime(86);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 86) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0087 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8800
     * @tc.name      testRoundTrip0088
     * @tc.desc      Verify byte offset for 87 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0088 begin');
      const bytes: number = MediaTools.getOffsetFromTime(87);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 87) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0088 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_8900
     * @tc.name      testRoundTrip0089
     * @tc.desc      Verify byte offset for 88 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0089 begin');
      const bytes: number = MediaTools.getOffsetFromTime(88);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 88) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0089 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP1_9000
     * @tc.name      testRoundTrip0090
     * @tc.desc      Verify byte offset for 89 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0090 begin');
      const bytes: number = MediaTools.getOffsetFromTime(89);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 89) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0090 end');
    })

  })
}
