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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RecordingMetadata } from '../../../main/ets/common/model/RecordingMetadata';

const TAG: string = '[Sample_recordingMetadataDefaultsCore]';
const DOMAIN: number = 0xF811;

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

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function recordingMetadataDefaultsCoreTest(): void {
  describe('recordingMetadataDefaultsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_0100
     * @tc.name      testRecordingMetadataDefaults0001
     * @tc.desc      Verify recordingMetadataDefaultsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_0200
     * @tc.name      testRecordingMetadataDefaults0002
     * @tc.desc      Verify recordingMetadataDefaultsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_0300
     * @tc.name      testRecordingMetadataDefaults0003
     * @tc.desc      Verify recordingMetadataDefaultsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_0400
     * @tc.name      testRecordingMetadataDefaults0004
     * @tc.desc      Verify recordingMetadataDefaultsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_0500
     * @tc.name      testRecordingMetadataDefaults0005
     * @tc.desc      Verify recordingMetadataDefaultsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_0600
     * @tc.name      testRecordingMetadataDefaults0006
     * @tc.desc      Verify recordingMetadataDefaultsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_0700
     * @tc.name      testRecordingMetadataDefaults0007
     * @tc.desc      Verify recordingMetadataDefaultsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_0800
     * @tc.name      testRecordingMetadataDefaults0008
     * @tc.desc      Verify recordingMetadataDefaultsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_0900
     * @tc.name      testRecordingMetadataDefaults0009
     * @tc.desc      Verify recordingMetadataDefaultsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1000
     * @tc.name      testRecordingMetadataDefaults0010
     * @tc.desc      Verify recordingMetadataDefaultsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1100
     * @tc.name      testRecordingMetadataDefaults0011
     * @tc.desc      Verify recordingMetadataDefaultsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1200
     * @tc.name      testRecordingMetadataDefaults0012
     * @tc.desc      Verify recordingMetadataDefaultsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1300
     * @tc.name      testRecordingMetadataDefaults0013
     * @tc.desc      Verify recordingMetadataDefaultsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1400
     * @tc.name      testRecordingMetadataDefaults0014
     * @tc.desc      Verify recordingMetadataDefaultsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1500
     * @tc.name      testRecordingMetadataDefaults0015
     * @tc.desc      Verify recordingMetadataDefaultsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1600
     * @tc.name      testRecordingMetadataDefaults0016
     * @tc.desc      Verify recordingMetadataDefaultsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1700
     * @tc.name      testRecordingMetadataDefaults0017
     * @tc.desc      Verify recordingMetadataDefaultsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1800
     * @tc.name      testRecordingMetadataDefaults0018
     * @tc.desc      Verify recordingMetadataDefaultsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_1900
     * @tc.name      testRecordingMetadataDefaults0019
     * @tc.desc      Verify recordingMetadataDefaultsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2000
     * @tc.name      testRecordingMetadataDefaults0020
     * @tc.desc      Verify recordingMetadataDefaultsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2100
     * @tc.name      testRecordingMetadataDefaults0021
     * @tc.desc      Verify recordingMetadataDefaultsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2200
     * @tc.name      testRecordingMetadataDefaults0022
     * @tc.desc      Verify recordingMetadataDefaultsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2300
     * @tc.name      testRecordingMetadataDefaults0023
     * @tc.desc      Verify recordingMetadataDefaultsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2400
     * @tc.name      testRecordingMetadataDefaults0024
     * @tc.desc      Verify recordingMetadataDefaultsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2500
     * @tc.name      testRecordingMetadataDefaults0025
     * @tc.desc      Verify recordingMetadataDefaultsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2600
     * @tc.name      testRecordingMetadataDefaults0026
     * @tc.desc      Verify recordingMetadataDefaultsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2700
     * @tc.name      testRecordingMetadataDefaults0027
     * @tc.desc      Verify recordingMetadataDefaultsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2800
     * @tc.name      testRecordingMetadataDefaults0028
     * @tc.desc      Verify recordingMetadataDefaultsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_2900
     * @tc.name      testRecordingMetadataDefaults0029
     * @tc.desc      Verify recordingMetadataDefaultsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3000
     * @tc.name      testRecordingMetadataDefaults0030
     * @tc.desc      Verify recordingMetadataDefaultsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3100
     * @tc.name      testRecordingMetadataDefaults0031
     * @tc.desc      Verify recordingMetadataDefaultsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3200
     * @tc.name      testRecordingMetadataDefaults0032
     * @tc.desc      Verify recordingMetadataDefaultsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3300
     * @tc.name      testRecordingMetadataDefaults0033
     * @tc.desc      Verify recordingMetadataDefaultsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3400
     * @tc.name      testRecordingMetadataDefaults0034
     * @tc.desc      Verify recordingMetadataDefaultsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3500
     * @tc.name      testRecordingMetadataDefaults0035
     * @tc.desc      Verify recordingMetadataDefaultsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3600
     * @tc.name      testRecordingMetadataDefaults0036
     * @tc.desc      Verify recordingMetadataDefaultsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3700
     * @tc.name      testRecordingMetadataDefaults0037
     * @tc.desc      Verify recordingMetadataDefaultsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3800
     * @tc.name      testRecordingMetadataDefaults0038
     * @tc.desc      Verify recordingMetadataDefaultsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_3900
     * @tc.name      testRecordingMetadataDefaults0039
     * @tc.desc      Verify recordingMetadataDefaultsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4000
     * @tc.name      testRecordingMetadataDefaults0040
     * @tc.desc      Verify recordingMetadataDefaultsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4100
     * @tc.name      testRecordingMetadataDefaults0041
     * @tc.desc      Verify recordingMetadataDefaultsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4200
     * @tc.name      testRecordingMetadataDefaults0042
     * @tc.desc      Verify recordingMetadataDefaultsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4300
     * @tc.name      testRecordingMetadataDefaults0043
     * @tc.desc      Verify recordingMetadataDefaultsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4400
     * @tc.name      testRecordingMetadataDefaults0044
     * @tc.desc      Verify recordingMetadataDefaultsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4500
     * @tc.name      testRecordingMetadataDefaults0045
     * @tc.desc      Verify recordingMetadataDefaultsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4600
     * @tc.name      testRecordingMetadataDefaults0046
     * @tc.desc      Verify recordingMetadataDefaultsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4700
     * @tc.name      testRecordingMetadataDefaults0047
     * @tc.desc      Verify recordingMetadataDefaultsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4800
     * @tc.name      testRecordingMetadataDefaults0048
     * @tc.desc      Verify recordingMetadataDefaultsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_4900
     * @tc.name      testRecordingMetadataDefaults0049
     * @tc.desc      Verify recordingMetadataDefaultsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5000
     * @tc.name      testRecordingMetadataDefaults0050
     * @tc.desc      Verify recordingMetadataDefaultsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5100
     * @tc.name      testRecordingMetadataDefaults0051
     * @tc.desc      Verify recordingMetadataDefaultsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5200
     * @tc.name      testRecordingMetadataDefaults0052
     * @tc.desc      Verify recordingMetadataDefaultsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5300
     * @tc.name      testRecordingMetadataDefaults0053
     * @tc.desc      Verify recordingMetadataDefaultsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5400
     * @tc.name      testRecordingMetadataDefaults0054
     * @tc.desc      Verify recordingMetadataDefaultsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5500
     * @tc.name      testRecordingMetadataDefaults0055
     * @tc.desc      Verify recordingMetadataDefaultsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5600
     * @tc.name      testRecordingMetadataDefaults0056
     * @tc.desc      Verify recordingMetadataDefaultsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5700
     * @tc.name      testRecordingMetadataDefaults0057
     * @tc.desc      Verify recordingMetadataDefaultsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5800
     * @tc.name      testRecordingMetadataDefaults0058
     * @tc.desc      Verify recordingMetadataDefaultsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_5900
     * @tc.name      testRecordingMetadataDefaults0059
     * @tc.desc      Verify recordingMetadataDefaultsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6000
     * @tc.name      testRecordingMetadataDefaults0060
     * @tc.desc      Verify recordingMetadataDefaultsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6100
     * @tc.name      testRecordingMetadataDefaults0061
     * @tc.desc      Verify recordingMetadataDefaultsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6200
     * @tc.name      testRecordingMetadataDefaults0062
     * @tc.desc      Verify recordingMetadataDefaultsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6300
     * @tc.name      testRecordingMetadataDefaults0063
     * @tc.desc      Verify recordingMetadataDefaultsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6400
     * @tc.name      testRecordingMetadataDefaults0064
     * @tc.desc      Verify recordingMetadataDefaultsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6500
     * @tc.name      testRecordingMetadataDefaults0065
     * @tc.desc      Verify recordingMetadataDefaultsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6600
     * @tc.name      testRecordingMetadataDefaults0066
     * @tc.desc      Verify recordingMetadataDefaultsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6700
     * @tc.name      testRecordingMetadataDefaults0067
     * @tc.desc      Verify recordingMetadataDefaultsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6800
     * @tc.name      testRecordingMetadataDefaults0068
     * @tc.desc      Verify recordingMetadataDefaultsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_6900
     * @tc.name      testRecordingMetadataDefaults0069
     * @tc.desc      Verify recordingMetadataDefaultsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7000
     * @tc.name      testRecordingMetadataDefaults0070
     * @tc.desc      Verify recordingMetadataDefaultsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7100
     * @tc.name      testRecordingMetadataDefaults0071
     * @tc.desc      Verify recordingMetadataDefaultsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7200
     * @tc.name      testRecordingMetadataDefaults0072
     * @tc.desc      Verify recordingMetadataDefaultsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7300
     * @tc.name      testRecordingMetadataDefaults0073
     * @tc.desc      Verify recordingMetadataDefaultsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7400
     * @tc.name      testRecordingMetadataDefaults0074
     * @tc.desc      Verify recordingMetadataDefaultsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7500
     * @tc.name      testRecordingMetadataDefaults0075
     * @tc.desc      Verify recordingMetadataDefaultsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7600
     * @tc.name      testRecordingMetadataDefaults0076
     * @tc.desc      Verify recordingMetadataDefaultsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7700
     * @tc.name      testRecordingMetadataDefaults0077
     * @tc.desc      Verify recordingMetadataDefaultsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7800
     * @tc.name      testRecordingMetadataDefaults0078
     * @tc.desc      Verify recordingMetadataDefaultsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_7900
     * @tc.name      testRecordingMetadataDefaults0079
     * @tc.desc      Verify recordingMetadataDefaultsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_8000
     * @tc.name      testRecordingMetadataDefaults0080
     * @tc.desc      Verify recordingMetadataDefaultsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_DEF_8100
     * @tc.name      testRecordingMetadataDefaults0081
     * @tc.desc      Verify recordingMetadataDefaultsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataDefaults0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      expect(metadata.isLowLatencyMode).assertFalse();
      expect(metadata.samplingRate).assertEqual(48000);
      expect(metadata.channelCount).assertEqual(2);
      expect(metadata.sampleFormat).assertEqual(1);
    });

  });
}
