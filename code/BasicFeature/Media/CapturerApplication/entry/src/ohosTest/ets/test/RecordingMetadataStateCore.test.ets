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

const TAG: string = '[Sample_recordingMetadataStateCore]';
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

export default function recordingMetadataStateCoreTest(): void {
  describe('recordingMetadataStateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_0100
     * @tc.name      testRecordingMetadataState0001
     * @tc.desc      Verify recordingMetadataStateCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_0200
     * @tc.name      testRecordingMetadataState0002
     * @tc.desc      Verify recordingMetadataStateCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_0300
     * @tc.name      testRecordingMetadataState0003
     * @tc.desc      Verify recordingMetadataStateCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_0400
     * @tc.name      testRecordingMetadataState0004
     * @tc.desc      Verify recordingMetadataStateCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_0500
     * @tc.name      testRecordingMetadataState0005
     * @tc.desc      Verify recordingMetadataStateCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_0600
     * @tc.name      testRecordingMetadataState0006
     * @tc.desc      Verify recordingMetadataStateCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_0700
     * @tc.name      testRecordingMetadataState0007
     * @tc.desc      Verify recordingMetadataStateCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_0800
     * @tc.name      testRecordingMetadataState0008
     * @tc.desc      Verify recordingMetadataStateCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_0900
     * @tc.name      testRecordingMetadataState0009
     * @tc.desc      Verify recordingMetadataStateCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1000
     * @tc.name      testRecordingMetadataState0010
     * @tc.desc      Verify recordingMetadataStateCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1100
     * @tc.name      testRecordingMetadataState0011
     * @tc.desc      Verify recordingMetadataStateCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1200
     * @tc.name      testRecordingMetadataState0012
     * @tc.desc      Verify recordingMetadataStateCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1300
     * @tc.name      testRecordingMetadataState0013
     * @tc.desc      Verify recordingMetadataStateCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1400
     * @tc.name      testRecordingMetadataState0014
     * @tc.desc      Verify recordingMetadataStateCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1500
     * @tc.name      testRecordingMetadataState0015
     * @tc.desc      Verify recordingMetadataStateCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1600
     * @tc.name      testRecordingMetadataState0016
     * @tc.desc      Verify recordingMetadataStateCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1700
     * @tc.name      testRecordingMetadataState0017
     * @tc.desc      Verify recordingMetadataStateCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1800
     * @tc.name      testRecordingMetadataState0018
     * @tc.desc      Verify recordingMetadataStateCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_1900
     * @tc.name      testRecordingMetadataState0019
     * @tc.desc      Verify recordingMetadataStateCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2000
     * @tc.name      testRecordingMetadataState0020
     * @tc.desc      Verify recordingMetadataStateCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2100
     * @tc.name      testRecordingMetadataState0021
     * @tc.desc      Verify recordingMetadataStateCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2200
     * @tc.name      testRecordingMetadataState0022
     * @tc.desc      Verify recordingMetadataStateCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2300
     * @tc.name      testRecordingMetadataState0023
     * @tc.desc      Verify recordingMetadataStateCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2400
     * @tc.name      testRecordingMetadataState0024
     * @tc.desc      Verify recordingMetadataStateCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2500
     * @tc.name      testRecordingMetadataState0025
     * @tc.desc      Verify recordingMetadataStateCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2600
     * @tc.name      testRecordingMetadataState0026
     * @tc.desc      Verify recordingMetadataStateCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2700
     * @tc.name      testRecordingMetadataState0027
     * @tc.desc      Verify recordingMetadataStateCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2800
     * @tc.name      testRecordingMetadataState0028
     * @tc.desc      Verify recordingMetadataStateCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_2900
     * @tc.name      testRecordingMetadataState0029
     * @tc.desc      Verify recordingMetadataStateCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3000
     * @tc.name      testRecordingMetadataState0030
     * @tc.desc      Verify recordingMetadataStateCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3100
     * @tc.name      testRecordingMetadataState0031
     * @tc.desc      Verify recordingMetadataStateCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3200
     * @tc.name      testRecordingMetadataState0032
     * @tc.desc      Verify recordingMetadataStateCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3300
     * @tc.name      testRecordingMetadataState0033
     * @tc.desc      Verify recordingMetadataStateCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3400
     * @tc.name      testRecordingMetadataState0034
     * @tc.desc      Verify recordingMetadataStateCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3500
     * @tc.name      testRecordingMetadataState0035
     * @tc.desc      Verify recordingMetadataStateCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3600
     * @tc.name      testRecordingMetadataState0036
     * @tc.desc      Verify recordingMetadataStateCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3700
     * @tc.name      testRecordingMetadataState0037
     * @tc.desc      Verify recordingMetadataStateCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3800
     * @tc.name      testRecordingMetadataState0038
     * @tc.desc      Verify recordingMetadataStateCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_3900
     * @tc.name      testRecordingMetadataState0039
     * @tc.desc      Verify recordingMetadataStateCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4000
     * @tc.name      testRecordingMetadataState0040
     * @tc.desc      Verify recordingMetadataStateCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4100
     * @tc.name      testRecordingMetadataState0041
     * @tc.desc      Verify recordingMetadataStateCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4200
     * @tc.name      testRecordingMetadataState0042
     * @tc.desc      Verify recordingMetadataStateCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4300
     * @tc.name      testRecordingMetadataState0043
     * @tc.desc      Verify recordingMetadataStateCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4400
     * @tc.name      testRecordingMetadataState0044
     * @tc.desc      Verify recordingMetadataStateCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4500
     * @tc.name      testRecordingMetadataState0045
     * @tc.desc      Verify recordingMetadataStateCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4600
     * @tc.name      testRecordingMetadataState0046
     * @tc.desc      Verify recordingMetadataStateCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4700
     * @tc.name      testRecordingMetadataState0047
     * @tc.desc      Verify recordingMetadataStateCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4800
     * @tc.name      testRecordingMetadataState0048
     * @tc.desc      Verify recordingMetadataStateCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_4900
     * @tc.name      testRecordingMetadataState0049
     * @tc.desc      Verify recordingMetadataStateCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5000
     * @tc.name      testRecordingMetadataState0050
     * @tc.desc      Verify recordingMetadataStateCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5100
     * @tc.name      testRecordingMetadataState0051
     * @tc.desc      Verify recordingMetadataStateCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5200
     * @tc.name      testRecordingMetadataState0052
     * @tc.desc      Verify recordingMetadataStateCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5300
     * @tc.name      testRecordingMetadataState0053
     * @tc.desc      Verify recordingMetadataStateCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5400
     * @tc.name      testRecordingMetadataState0054
     * @tc.desc      Verify recordingMetadataStateCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5500
     * @tc.name      testRecordingMetadataState0055
     * @tc.desc      Verify recordingMetadataStateCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5600
     * @tc.name      testRecordingMetadataState0056
     * @tc.desc      Verify recordingMetadataStateCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5700
     * @tc.name      testRecordingMetadataState0057
     * @tc.desc      Verify recordingMetadataStateCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5800
     * @tc.name      testRecordingMetadataState0058
     * @tc.desc      Verify recordingMetadataStateCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_5900
     * @tc.name      testRecordingMetadataState0059
     * @tc.desc      Verify recordingMetadataStateCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6000
     * @tc.name      testRecordingMetadataState0060
     * @tc.desc      Verify recordingMetadataStateCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6100
     * @tc.name      testRecordingMetadataState0061
     * @tc.desc      Verify recordingMetadataStateCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6200
     * @tc.name      testRecordingMetadataState0062
     * @tc.desc      Verify recordingMetadataStateCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6300
     * @tc.name      testRecordingMetadataState0063
     * @tc.desc      Verify recordingMetadataStateCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6400
     * @tc.name      testRecordingMetadataState0064
     * @tc.desc      Verify recordingMetadataStateCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6500
     * @tc.name      testRecordingMetadataState0065
     * @tc.desc      Verify recordingMetadataStateCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6600
     * @tc.name      testRecordingMetadataState0066
     * @tc.desc      Verify recordingMetadataStateCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6700
     * @tc.name      testRecordingMetadataState0067
     * @tc.desc      Verify recordingMetadataStateCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6800
     * @tc.name      testRecordingMetadataState0068
     * @tc.desc      Verify recordingMetadataStateCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_6900
     * @tc.name      testRecordingMetadataState0069
     * @tc.desc      Verify recordingMetadataStateCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7000
     * @tc.name      testRecordingMetadataState0070
     * @tc.desc      Verify recordingMetadataStateCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7100
     * @tc.name      testRecordingMetadataState0071
     * @tc.desc      Verify recordingMetadataStateCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7200
     * @tc.name      testRecordingMetadataState0072
     * @tc.desc      Verify recordingMetadataStateCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7300
     * @tc.name      testRecordingMetadataState0073
     * @tc.desc      Verify recordingMetadataStateCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7400
     * @tc.name      testRecordingMetadataState0074
     * @tc.desc      Verify recordingMetadataStateCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7500
     * @tc.name      testRecordingMetadataState0075
     * @tc.desc      Verify recordingMetadataStateCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7600
     * @tc.name      testRecordingMetadataState0076
     * @tc.desc      Verify recordingMetadataStateCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7700
     * @tc.name      testRecordingMetadataState0077
     * @tc.desc      Verify recordingMetadataStateCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][1];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][1];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][1]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7800
     * @tc.name      testRecordingMetadataState0078
     * @tc.desc      Verify recordingMetadataStateCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][2];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][2];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][2]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_7900
     * @tc.name      testRecordingMetadataState0079
     * @tc.desc      Verify recordingMetadataStateCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][3];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][3];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][3]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_8000
     * @tc.name      testRecordingMetadataState0080
     * @tc.desc      Verify recordingMetadataStateCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = false;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][4];
      metadata.channelCount = [1, 2][1];
      metadata.sampleFormat = [0, 1, 2, 3, 4][4];
      expect(metadata.isLowLatencyMode).assertEqual(false);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][4]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_CAPTURER_META_STATE_8100
     * @tc.name      testRecordingMetadataState0081
     * @tc.desc      Verify recordingMetadataStateCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordingMetadataState0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const metadata: RecordingMetadata = new RecordingMetadata();
      metadata.isLowLatencyMode = true;
      metadata.samplingRate = [8000, 16000, 44100, 48000, 96000][0];
      metadata.channelCount = [1, 2][0];
      metadata.sampleFormat = [0, 1, 2, 3, 4][0];
      expect(metadata.isLowLatencyMode).assertEqual(true);
      expect(metadata.samplingRate).assertEqual([8000, 16000, 44100, 48000, 96000][0]);
      const second: RecordingMetadata = new RecordingMetadata();
      expect(second.samplingRate).assertEqual(48000);
    });

  });
}
