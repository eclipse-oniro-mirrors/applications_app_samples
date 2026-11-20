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
import { RecordingMetadata } from '../../../main/ets/common/model/RecordingMetadata';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaBoundaryPart2Test(): void {
  describe('MediaBoundaryPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_9100
     * @tc.name      testCountdownNegInfinity0091
     * @tc.desc      Verify countdown handles negative infinity without throwing.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownNegInfinity0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownNegInfinity0091 begin');
      expect(MediaTools.msToCountdownTime(-Infinity)).assertEqual('-Infinity:\n      NaN:NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownNegInfinity0091 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_9200
     * @tc.name      testMetaEdge0092
     * @tc.desc      Verify RecordingMetadata stores unusual sampling rate -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaEdge0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0092 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = -1;
      expect(m.samplingRate).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0092 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_9300
     * @tc.name      testMetaChannelEdge0093
     * @tc.desc      Verify RecordingMetadata stores unusual channel count -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaChannelEdge0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0093 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.channelCount = -1;
      expect(m.channelCount).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0093 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_9400
     * @tc.name      testMetaEdge0094
     * @tc.desc      Verify RecordingMetadata stores unusual sampling rate 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaEdge0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0094 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 0;
      expect(m.samplingRate).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0094 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_9500
     * @tc.name      testMetaChannelEdge0095
     * @tc.desc      Verify RecordingMetadata stores unusual channel count 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaChannelEdge0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0095 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.channelCount = 0;
      expect(m.channelCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0095 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_9600
     * @tc.name      testMetaEdge0096
     * @tc.desc      Verify RecordingMetadata stores unusual sampling rate 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaEdge0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0096 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 1;
      expect(m.samplingRate).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0096 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_9700
     * @tc.name      testMetaChannelEdge0097
     * @tc.desc      Verify RecordingMetadata stores unusual channel count 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaChannelEdge0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0097 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.channelCount = 1;
      expect(m.channelCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0097 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_9800
     * @tc.name      testMetaEdge0098
     * @tc.desc      Verify RecordingMetadata stores unusual sampling rate 999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaEdge0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0098 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 999;
      expect(m.samplingRate).assertEqual(999);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0098 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_9900
     * @tc.name      testMetaChannelEdge0099
     * @tc.desc      Verify RecordingMetadata stores unusual channel count 999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaChannelEdge0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0099 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.channelCount = 999;
      expect(m.channelCount).assertEqual(999);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0099 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_ONE_0100
     * @tc.name      testMetaEdge0100
     * @tc.desc      Verify RecordingMetadata stores unusual sampling rate 999999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaEdge0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0100 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 999999;
      expect(m.samplingRate).assertEqual(999999);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0100 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_ONE_0200
     * @tc.name      testMetaChannelEdge0101
     * @tc.desc      Verify RecordingMetadata stores unusual channel count 999999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaChannelEdge0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0101 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.channelCount = 999999;
      expect(m.channelCount).assertEqual(999999);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0101 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_ONE_0300
     * @tc.name      testMetaEdge0102
     * @tc.desc      Verify RecordingMetadata stores unusual sampling rate 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaEdge0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0102 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 1.5;
      expect(m.samplingRate).assertEqual(1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaEdge0102 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_BOUNDARYP2_ONE_0400
     * @tc.name      testMetaChannelEdge0103
     * @tc.desc      Verify RecordingMetadata stores unusual channel count 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaChannelEdge0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0103 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.channelCount = 1.5;
      expect(m.channelCount).assertEqual(1.5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaChannelEdge0103 end');
    })

  })
}
