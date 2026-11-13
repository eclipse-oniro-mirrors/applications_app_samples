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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaRoundTripMatrixPart2Test(): void {
  describe('MediaRoundTripMatrixPart2', () => {

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_9100
     * @tc.name      testRoundTrip0091
     * @tc.desc      Verify byte offset for 90 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0091 begin');
      const bytes: number = MediaTools.getOffsetFromTime(90);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 90) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0091 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_9200
     * @tc.name      testRoundTrip0092
     * @tc.desc      Verify byte offset for 91 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0092 begin');
      const bytes: number = MediaTools.getOffsetFromTime(91);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 91) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0092 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_9300
     * @tc.name      testRoundTrip0093
     * @tc.desc      Verify byte offset for 92 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0093 begin');
      const bytes: number = MediaTools.getOffsetFromTime(92);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 92) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0093 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_9400
     * @tc.name      testRoundTrip0094
     * @tc.desc      Verify byte offset for 93 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0094 begin');
      const bytes: number = MediaTools.getOffsetFromTime(93);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 93) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0094 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_9500
     * @tc.name      testRoundTrip0095
     * @tc.desc      Verify byte offset for 94 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0095 begin');
      const bytes: number = MediaTools.getOffsetFromTime(94);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 94) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0095 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_9600
     * @tc.name      testRoundTrip0096
     * @tc.desc      Verify byte offset for 95 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0096 begin');
      const bytes: number = MediaTools.getOffsetFromTime(95);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 95) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0096 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_9700
     * @tc.name      testRoundTrip0097
     * @tc.desc      Verify byte offset for 96 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0097 begin');
      const bytes: number = MediaTools.getOffsetFromTime(96);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 96) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0097 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_9800
     * @tc.name      testRoundTrip0098
     * @tc.desc      Verify byte offset for 97 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0098 begin');
      const bytes: number = MediaTools.getOffsetFromTime(97);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 97) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0098 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_9900
     * @tc.name      testRoundTrip0099
     * @tc.desc      Verify byte offset for 98 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0099 begin');
      const bytes: number = MediaTools.getOffsetFromTime(98);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 98) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0099 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10000
     * @tc.name      testRoundTrip0100
     * @tc.desc      Verify byte offset for 99 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0100 begin');
      const bytes: number = MediaTools.getOffsetFromTime(99);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 99) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0100 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10100
     * @tc.name      testRoundTrip0101
     * @tc.desc      Verify byte offset for 100 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0101 begin');
      const bytes: number = MediaTools.getOffsetFromTime(100);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 100) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0101 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10200
     * @tc.name      testRoundTrip0102
     * @tc.desc      Verify byte offset for 101 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0102 begin');
      const bytes: number = MediaTools.getOffsetFromTime(101);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 101) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0102 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10300
     * @tc.name      testRoundTrip0103
     * @tc.desc      Verify byte offset for 102 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0103 begin');
      const bytes: number = MediaTools.getOffsetFromTime(102);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 102) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0103 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10400
     * @tc.name      testRoundTrip0104
     * @tc.desc      Verify byte offset for 103 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0104 begin');
      const bytes: number = MediaTools.getOffsetFromTime(103);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 103) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0104 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10500
     * @tc.name      testRoundTrip0105
     * @tc.desc      Verify byte offset for 104 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0105 begin');
      const bytes: number = MediaTools.getOffsetFromTime(104);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 104) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0105 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10600
     * @tc.name      testRoundTrip0106
     * @tc.desc      Verify byte offset for 105 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0106 begin');
      const bytes: number = MediaTools.getOffsetFromTime(105);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 105) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0106 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10700
     * @tc.name      testRoundTrip0107
     * @tc.desc      Verify byte offset for 106 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0107 begin');
      const bytes: number = MediaTools.getOffsetFromTime(106);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 106) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0107 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10800
     * @tc.name      testRoundTrip0108
     * @tc.desc      Verify byte offset for 107 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0108 begin');
      const bytes: number = MediaTools.getOffsetFromTime(107);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 107) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0108 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_10900
     * @tc.name      testRoundTrip0109
     * @tc.desc      Verify byte offset for 108 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0109 begin');
      const bytes: number = MediaTools.getOffsetFromTime(108);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 108) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0109 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11000
     * @tc.name      testRoundTrip0110
     * @tc.desc      Verify byte offset for 109 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0110 begin');
      const bytes: number = MediaTools.getOffsetFromTime(109);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 109) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0110 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11100
     * @tc.name      testRoundTrip0111
     * @tc.desc      Verify byte offset for 110 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0111 begin');
      const bytes: number = MediaTools.getOffsetFromTime(110);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 110) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0111 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11200
     * @tc.name      testRoundTrip0112
     * @tc.desc      Verify byte offset for 111 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0112 begin');
      const bytes: number = MediaTools.getOffsetFromTime(111);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 111) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0112 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11300
     * @tc.name      testRoundTrip0113
     * @tc.desc      Verify byte offset for 112 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0113 begin');
      const bytes: number = MediaTools.getOffsetFromTime(112);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 112) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0113 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11400
     * @tc.name      testRoundTrip0114
     * @tc.desc      Verify byte offset for 113 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0114 begin');
      const bytes: number = MediaTools.getOffsetFromTime(113);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 113) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0114 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11500
     * @tc.name      testRoundTrip0115
     * @tc.desc      Verify byte offset for 114 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0115 begin');
      const bytes: number = MediaTools.getOffsetFromTime(114);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 114) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0115 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11600
     * @tc.name      testRoundTrip0116
     * @tc.desc      Verify byte offset for 115 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0116 begin');
      const bytes: number = MediaTools.getOffsetFromTime(115);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 115) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0116 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11700
     * @tc.name      testRoundTrip0117
     * @tc.desc      Verify byte offset for 116 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0117 begin');
      const bytes: number = MediaTools.getOffsetFromTime(116);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 116) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0117 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11800
     * @tc.name      testRoundTrip0118
     * @tc.desc      Verify byte offset for 117 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0118 begin');
      const bytes: number = MediaTools.getOffsetFromTime(117);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 117) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0118 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_11900
     * @tc.name      testRoundTrip0119
     * @tc.desc      Verify byte offset for 118 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0119 begin');
      const bytes: number = MediaTools.getOffsetFromTime(118);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 118) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0119 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12000
     * @tc.name      testRoundTrip0120
     * @tc.desc      Verify byte offset for 119 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0120 begin');
      const bytes: number = MediaTools.getOffsetFromTime(119);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 119) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0120 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12100
     * @tc.name      testRoundTrip0121
     * @tc.desc      Verify byte offset for 120 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0121 begin');
      const bytes: number = MediaTools.getOffsetFromTime(120);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 120) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0121 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12200
     * @tc.name      testRoundTrip0122
     * @tc.desc      Verify byte offset for 121 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0122 begin');
      const bytes: number = MediaTools.getOffsetFromTime(121);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 121) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0122 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12300
     * @tc.name      testRoundTrip0123
     * @tc.desc      Verify byte offset for 122 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0123 begin');
      const bytes: number = MediaTools.getOffsetFromTime(122);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 122) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0123 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12400
     * @tc.name      testRoundTrip0124
     * @tc.desc      Verify byte offset for 123 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0124 begin');
      const bytes: number = MediaTools.getOffsetFromTime(123);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 123) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0124 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12500
     * @tc.name      testRoundTrip0125
     * @tc.desc      Verify byte offset for 124 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0125 begin');
      const bytes: number = MediaTools.getOffsetFromTime(124);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 124) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0125 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12600
     * @tc.name      testRoundTrip0126
     * @tc.desc      Verify byte offset for 125 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0126 begin');
      const bytes: number = MediaTools.getOffsetFromTime(125);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 125) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0126 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12700
     * @tc.name      testRoundTrip0127
     * @tc.desc      Verify byte offset for 126 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0127 begin');
      const bytes: number = MediaTools.getOffsetFromTime(126);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 126) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0127 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12800
     * @tc.name      testRoundTrip0128
     * @tc.desc      Verify byte offset for 127 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0128 begin');
      const bytes: number = MediaTools.getOffsetFromTime(127);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 127) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0128 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_12900
     * @tc.name      testRoundTrip0129
     * @tc.desc      Verify byte offset for 128 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0129 begin');
      const bytes: number = MediaTools.getOffsetFromTime(128);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 128) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0129 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13000
     * @tc.name      testRoundTrip0130
     * @tc.desc      Verify byte offset for 129 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0130 begin');
      const bytes: number = MediaTools.getOffsetFromTime(129);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 129) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0130 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13100
     * @tc.name      testRoundTrip0131
     * @tc.desc      Verify byte offset for 130 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0131 begin');
      const bytes: number = MediaTools.getOffsetFromTime(130);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 130) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0131 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13200
     * @tc.name      testRoundTrip0132
     * @tc.desc      Verify byte offset for 131 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0132 begin');
      const bytes: number = MediaTools.getOffsetFromTime(131);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 131) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0132 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13300
     * @tc.name      testRoundTrip0133
     * @tc.desc      Verify byte offset for 132 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0133 begin');
      const bytes: number = MediaTools.getOffsetFromTime(132);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 132) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0133 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13400
     * @tc.name      testRoundTrip0134
     * @tc.desc      Verify byte offset for 133 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0134 begin');
      const bytes: number = MediaTools.getOffsetFromTime(133);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 133) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0134 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13500
     * @tc.name      testRoundTrip0135
     * @tc.desc      Verify byte offset for 134 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0135 begin');
      const bytes: number = MediaTools.getOffsetFromTime(134);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 134) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0135 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13600
     * @tc.name      testRoundTrip0136
     * @tc.desc      Verify byte offset for 135 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0136 begin');
      const bytes: number = MediaTools.getOffsetFromTime(135);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 135) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0136 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13700
     * @tc.name      testRoundTrip0137
     * @tc.desc      Verify byte offset for 136 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0137 begin');
      const bytes: number = MediaTools.getOffsetFromTime(136);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 136) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0137 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13800
     * @tc.name      testRoundTrip0138
     * @tc.desc      Verify byte offset for 137 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0138 begin');
      const bytes: number = MediaTools.getOffsetFromTime(137);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 137) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0138 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_13900
     * @tc.name      testRoundTrip0139
     * @tc.desc      Verify byte offset for 138 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0139 begin');
      const bytes: number = MediaTools.getOffsetFromTime(138);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 138) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0139 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14000
     * @tc.name      testRoundTrip0140
     * @tc.desc      Verify byte offset for 139 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0140 begin');
      const bytes: number = MediaTools.getOffsetFromTime(139);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 139) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0140 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14100
     * @tc.name      testRoundTrip0141
     * @tc.desc      Verify byte offset for 140 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0141 begin');
      const bytes: number = MediaTools.getOffsetFromTime(140);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 140) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0141 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14200
     * @tc.name      testRoundTrip0142
     * @tc.desc      Verify byte offset for 141 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0142 begin');
      const bytes: number = MediaTools.getOffsetFromTime(141);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 141) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0142 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14300
     * @tc.name      testRoundTrip0143
     * @tc.desc      Verify byte offset for 142 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0143 begin');
      const bytes: number = MediaTools.getOffsetFromTime(142);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 142) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0143 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14400
     * @tc.name      testRoundTrip0144
     * @tc.desc      Verify byte offset for 143 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0144 begin');
      const bytes: number = MediaTools.getOffsetFromTime(143);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 143) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0144 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14500
     * @tc.name      testRoundTrip0145
     * @tc.desc      Verify byte offset for 144 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0145 begin');
      const bytes: number = MediaTools.getOffsetFromTime(144);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 144) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0145 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14600
     * @tc.name      testRoundTrip0146
     * @tc.desc      Verify byte offset for 145 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0146 begin');
      const bytes: number = MediaTools.getOffsetFromTime(145);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 145) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0146 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14700
     * @tc.name      testRoundTrip0147
     * @tc.desc      Verify byte offset for 146 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0147 begin');
      const bytes: number = MediaTools.getOffsetFromTime(146);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 146) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0147 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14800
     * @tc.name      testRoundTrip0148
     * @tc.desc      Verify byte offset for 147 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0148 begin');
      const bytes: number = MediaTools.getOffsetFromTime(147);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 147) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0148 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_14900
     * @tc.name      testRoundTrip0149
     * @tc.desc      Verify byte offset for 148 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0149 begin');
      const bytes: number = MediaTools.getOffsetFromTime(148);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 148) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0149 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15000
     * @tc.name      testRoundTrip0150
     * @tc.desc      Verify byte offset for 149 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0150 begin');
      const bytes: number = MediaTools.getOffsetFromTime(149);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 149) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0150 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15100
     * @tc.name      testRoundTrip0151
     * @tc.desc      Verify byte offset for 150 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0151 begin');
      const bytes: number = MediaTools.getOffsetFromTime(150);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 150) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0151 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15200
     * @tc.name      testRoundTrip0152
     * @tc.desc      Verify byte offset for 151 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0152 begin');
      const bytes: number = MediaTools.getOffsetFromTime(151);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 151) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0152 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15300
     * @tc.name      testRoundTrip0153
     * @tc.desc      Verify byte offset for 152 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0153 begin');
      const bytes: number = MediaTools.getOffsetFromTime(152);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 152) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0153 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15400
     * @tc.name      testRoundTrip0154
     * @tc.desc      Verify byte offset for 153 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0154 begin');
      const bytes: number = MediaTools.getOffsetFromTime(153);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 153) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0154 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15500
     * @tc.name      testRoundTrip0155
     * @tc.desc      Verify byte offset for 154 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0155 begin');
      const bytes: number = MediaTools.getOffsetFromTime(154);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 154) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0155 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15600
     * @tc.name      testRoundTrip0156
     * @tc.desc      Verify byte offset for 155 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0156 begin');
      const bytes: number = MediaTools.getOffsetFromTime(155);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 155) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0156 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15700
     * @tc.name      testRoundTrip0157
     * @tc.desc      Verify byte offset for 156 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0157 begin');
      const bytes: number = MediaTools.getOffsetFromTime(156);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 156) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0157 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15800
     * @tc.name      testRoundTrip0158
     * @tc.desc      Verify byte offset for 157 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0158 begin');
      const bytes: number = MediaTools.getOffsetFromTime(157);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 157) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0158 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_15900
     * @tc.name      testRoundTrip0159
     * @tc.desc      Verify byte offset for 158 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0159 begin');
      const bytes: number = MediaTools.getOffsetFromTime(158);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 158) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0159 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16000
     * @tc.name      testRoundTrip0160
     * @tc.desc      Verify byte offset for 159 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0160 begin');
      const bytes: number = MediaTools.getOffsetFromTime(159);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 159) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0160 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16100
     * @tc.name      testRoundTrip0161
     * @tc.desc      Verify byte offset for 160 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0161 begin');
      const bytes: number = MediaTools.getOffsetFromTime(160);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 160) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0161 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16200
     * @tc.name      testRoundTrip0162
     * @tc.desc      Verify byte offset for 161 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0162 begin');
      const bytes: number = MediaTools.getOffsetFromTime(161);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 161) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0162 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16300
     * @tc.name      testRoundTrip0163
     * @tc.desc      Verify byte offset for 162 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0163 begin');
      const bytes: number = MediaTools.getOffsetFromTime(162);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 162) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0163 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16400
     * @tc.name      testRoundTrip0164
     * @tc.desc      Verify byte offset for 163 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0164 begin');
      const bytes: number = MediaTools.getOffsetFromTime(163);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 163) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0164 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16500
     * @tc.name      testRoundTrip0165
     * @tc.desc      Verify byte offset for 164 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0165 begin');
      const bytes: number = MediaTools.getOffsetFromTime(164);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 164) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0165 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16600
     * @tc.name      testRoundTrip0166
     * @tc.desc      Verify byte offset for 165 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0166 begin');
      const bytes: number = MediaTools.getOffsetFromTime(165);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 165) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0166 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16700
     * @tc.name      testRoundTrip0167
     * @tc.desc      Verify byte offset for 166 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0167 begin');
      const bytes: number = MediaTools.getOffsetFromTime(166);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 166) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0167 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16800
     * @tc.name      testRoundTrip0168
     * @tc.desc      Verify byte offset for 167 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0168 begin');
      const bytes: number = MediaTools.getOffsetFromTime(167);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 167) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0168 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_16900
     * @tc.name      testRoundTrip0169
     * @tc.desc      Verify byte offset for 168 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0169 begin');
      const bytes: number = MediaTools.getOffsetFromTime(168);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 168) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0169 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17000
     * @tc.name      testRoundTrip0170
     * @tc.desc      Verify byte offset for 169 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0170 begin');
      const bytes: number = MediaTools.getOffsetFromTime(169);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 169) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0170 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17100
     * @tc.name      testRoundTrip0171
     * @tc.desc      Verify byte offset for 170 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0171 begin');
      const bytes: number = MediaTools.getOffsetFromTime(170);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 170) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0171 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17200
     * @tc.name      testRoundTrip0172
     * @tc.desc      Verify byte offset for 171 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0172 begin');
      const bytes: number = MediaTools.getOffsetFromTime(171);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 171) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0172 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17300
     * @tc.name      testRoundTrip0173
     * @tc.desc      Verify byte offset for 172 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0173 begin');
      const bytes: number = MediaTools.getOffsetFromTime(172);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 172) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0173 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17400
     * @tc.name      testRoundTrip0174
     * @tc.desc      Verify byte offset for 173 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0174 begin');
      const bytes: number = MediaTools.getOffsetFromTime(173);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 173) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0174 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17500
     * @tc.name      testRoundTrip0175
     * @tc.desc      Verify byte offset for 174 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0175 begin');
      const bytes: number = MediaTools.getOffsetFromTime(174);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 174) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0175 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17600
     * @tc.name      testRoundTrip0176
     * @tc.desc      Verify byte offset for 175 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0176 begin');
      const bytes: number = MediaTools.getOffsetFromTime(175);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 175) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0176 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17700
     * @tc.name      testRoundTrip0177
     * @tc.desc      Verify byte offset for 176 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0177 begin');
      const bytes: number = MediaTools.getOffsetFromTime(176);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 176) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0177 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17800
     * @tc.name      testRoundTrip0178
     * @tc.desc      Verify byte offset for 177 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0178 begin');
      const bytes: number = MediaTools.getOffsetFromTime(177);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 177) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0178 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_17900
     * @tc.name      testRoundTrip0179
     * @tc.desc      Verify byte offset for 178 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0179 begin');
      const bytes: number = MediaTools.getOffsetFromTime(178);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 178) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0179 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP2_18000
     * @tc.name      testRoundTrip0180
     * @tc.desc      Verify byte offset for 179 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0180 begin');
      const bytes: number = MediaTools.getOffsetFromTime(179);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 179) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0180 end');
    })

  })
}
