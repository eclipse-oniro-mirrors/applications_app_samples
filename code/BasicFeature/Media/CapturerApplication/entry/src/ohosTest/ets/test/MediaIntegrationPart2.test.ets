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

export default function MediaIntegrationPart2Test(): void {
  describe('MediaIntegrationPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_9100
     * @tc.name      testByteRoundTrip0091
     * @tc.desc      Verify byte length 90 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0091 begin');
      const ms: number = MediaTools.getMsFromByteLength(90);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 90) <= Math.abs(90) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0091 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_9200
     * @tc.name      testByteRoundTrip0092
     * @tc.desc      Verify byte length 91 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0092 begin');
      const ms: number = MediaTools.getMsFromByteLength(91);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 91) <= Math.abs(91) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0092 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_9300
     * @tc.name      testByteRoundTrip0093
     * @tc.desc      Verify byte length 92 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0093 begin');
      const ms: number = MediaTools.getMsFromByteLength(92);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 92) <= Math.abs(92) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0093 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_9400
     * @tc.name      testByteRoundTrip0094
     * @tc.desc      Verify byte length 93 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0094 begin');
      const ms: number = MediaTools.getMsFromByteLength(93);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 93) <= Math.abs(93) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0094 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_9500
     * @tc.name      testByteRoundTrip0095
     * @tc.desc      Verify byte length 94 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0095 begin');
      const ms: number = MediaTools.getMsFromByteLength(94);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 94) <= Math.abs(94) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0095 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_9600
     * @tc.name      testByteRoundTrip0096
     * @tc.desc      Verify byte length 95 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0096 begin');
      const ms: number = MediaTools.getMsFromByteLength(95);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 95) <= Math.abs(95) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0096 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_9700
     * @tc.name      testByteRoundTrip0097
     * @tc.desc      Verify byte length 96 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0097 begin');
      const ms: number = MediaTools.getMsFromByteLength(96);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 96) <= Math.abs(96) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0097 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_9800
     * @tc.name      testByteRoundTrip0098
     * @tc.desc      Verify byte length 97 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0098 begin');
      const ms: number = MediaTools.getMsFromByteLength(97);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 97) <= Math.abs(97) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0098 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_9900
     * @tc.name      testByteRoundTrip0099
     * @tc.desc      Verify byte length 98 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0099 begin');
      const ms: number = MediaTools.getMsFromByteLength(98);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 98) <= Math.abs(98) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0099 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_INTEGP2_ONE_0100
     * @tc.name      testByteRoundTrip0100
     * @tc.desc      Verify byte length 99 survives a millisecond round trip.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteRoundTrip0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0100 begin');
      const ms: number = MediaTools.getMsFromByteLength(99);
      const back: number = MediaTools.getOffsetFromTime(ms);
      expect(Math.abs(back - 99) <= Math.abs(99) * 1e-9 + 1e-6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteRoundTrip0100 end');
    })

  })
}
