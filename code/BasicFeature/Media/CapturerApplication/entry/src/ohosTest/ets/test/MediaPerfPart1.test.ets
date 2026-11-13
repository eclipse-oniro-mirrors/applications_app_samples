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
import { RecordingMetadata } from '../../../main/ets/common/model/RecordingMetadata';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaPerfPart1Test(): void {
  describe('MediaPerfPart1', () => {

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_0100
     * @tc.name      testBytePerf10k0001
     * @tc.desc      Verify 10k byte conversions stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytePerf10k0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytePerf10k0001 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        MediaTools.getMsFromByteLength(i * 192);
      }
      expect(Date.now() - start < 2000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytePerf10k0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_0200
     * @tc.name      testBytePerf100k0002
     * @tc.desc      Verify 100k byte conversions stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBytePerf100k0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytePerf100k0002 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        MediaTools.getMsFromByteLength(i * 192);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBytePerf100k0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_0300
     * @tc.name      testByteAverage0003
     * @tc.desc      Verify the average byte conversion cost stays below one millisecond.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteAverage0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteAverage0003 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        MediaTools.getMsFromByteLength(i * 192);
      }
      expect((Date.now() - start) / 100000 < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteAverage0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_0400
     * @tc.name      testOffsetPerf10k0004
     * @tc.desc      Verify 10k offset conversions stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetPerf10k0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetPerf10k0004 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        MediaTools.getOffsetFromTime(i * 1000);
      }
      expect(Date.now() - start < 2000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetPerf10k0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_0500
     * @tc.name      testOffsetPerf100k0005
     * @tc.desc      Verify 100k offset conversions stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetPerf100k0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetPerf100k0005 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        MediaTools.getOffsetFromTime(i * 1000);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetPerf100k0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_0600
     * @tc.name      testOffsetAverage0006
     * @tc.desc      Verify the average offset conversion cost stays below one millisecond.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetAverage0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetAverage0006 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        MediaTools.getOffsetFromTime(i * 1000);
      }
      expect((Date.now() - start) / 100000 < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetAverage0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_0700
     * @tc.name      testCountdownPerf10k0007
     * @tc.desc      Verify 10k countdown conversions stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownPerf10k0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownPerf10k0007 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        MediaTools.msToCountdownTime(i * 1000);
      }
      expect(Date.now() - start < 5000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownPerf10k0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_0800
     * @tc.name      testCountdownPerf50k0008
     * @tc.desc      Verify 50k countdown conversions stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownPerf50k0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownPerf50k0008 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 50000; i++) {
        MediaTools.msToCountdownTime(i * 1000);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownPerf50k0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_0900
     * @tc.name      testMetaPerf0009
     * @tc.desc      Verify 100k RecordingMetadata constructions stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaPerf0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaPerf0009 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        const m: RecordingMetadata = new RecordingMetadata();
        m.samplingRate = 48000;
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaPerf0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_PERFP1_1000
     * @tc.name      testCombinedPerf0010
     * @tc.desc      Verify 50k mixed conversions stay within the budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCombinedPerf0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCombinedPerf0010 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 50000; i++) {
        const bytes: number = MediaTools.getOffsetFromTime(i * 1000);
        MediaTools.getMsFromByteLength(bytes);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCombinedPerf0010 end');
    })

  })
}
