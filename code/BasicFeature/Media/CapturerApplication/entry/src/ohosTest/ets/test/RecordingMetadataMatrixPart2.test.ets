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
import { RecordingMetadata } from '../../../main/ets/common/model/RecordingMetadata';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function RecordingMetadataMatrixPart2Test(): void {
  describe('RecordingMetadataMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_8100
     * @tc.name      testMetaCombo0081
     * @tc.desc      Verify metadata combination (16000, 3, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0081 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0081 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_8200
     * @tc.name      testMetaCombo0082
     * @tc.desc      Verify metadata combination (16000, 3, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0082 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0082 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_8300
     * @tc.name      testMetaCombo0083
     * @tc.desc      Verify metadata combination (16000, 3, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0083 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0083 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_8400
     * @tc.name      testMetaCombo0084
     * @tc.desc      Verify metadata combination (16000, 3, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0084 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0084 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_8500
     * @tc.name      testMetaCombo0085
     * @tc.desc      Verify metadata combination (16000, 3, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0085 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0085 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_8600
     * @tc.name      testMetaCombo0086
     * @tc.desc      Verify metadata combination (16000, 3, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0086 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0086 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_8700
     * @tc.name      testMetaCombo0087
     * @tc.desc      Verify metadata combination (16000, 3, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0087 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0087 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_8800
     * @tc.name      testMetaCombo0088
     * @tc.desc      Verify metadata combination (16000, 3, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0088 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0088 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_8900
     * @tc.name      testMetaCombo0089
     * @tc.desc      Verify metadata combination (16000, 3, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0089 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0089 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9000
     * @tc.name      testMetaCombo0090
     * @tc.desc      Verify metadata combination (16000, 3, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0090 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0090 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9100
     * @tc.name      testMetaCombo0091
     * @tc.desc      Verify metadata combination (22050, 1, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0091 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0091 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9200
     * @tc.name      testMetaCombo0092
     * @tc.desc      Verify metadata combination (22050, 1, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0092 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0092 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9300
     * @tc.name      testMetaCombo0093
     * @tc.desc      Verify metadata combination (22050, 1, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0093 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0093 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9400
     * @tc.name      testMetaCombo0094
     * @tc.desc      Verify metadata combination (22050, 1, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0094 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0094 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9500
     * @tc.name      testMetaCombo0095
     * @tc.desc      Verify metadata combination (22050, 1, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0095 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0095 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9600
     * @tc.name      testMetaCombo0096
     * @tc.desc      Verify metadata combination (22050, 1, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0096 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0096 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9700
     * @tc.name      testMetaCombo0097
     * @tc.desc      Verify metadata combination (22050, 1, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0097 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0097 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9800
     * @tc.name      testMetaCombo0098
     * @tc.desc      Verify metadata combination (22050, 1, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0098 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0098 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_9900
     * @tc.name      testMetaCombo0099
     * @tc.desc      Verify metadata combination (22050, 1, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0099 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0099 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_0100
     * @tc.name      testMetaCombo0100
     * @tc.desc      Verify metadata combination (22050, 1, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0100 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0100 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_0200
     * @tc.name      testMetaCombo0101
     * @tc.desc      Verify metadata combination (22050, 2, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0101 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0101 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_0300
     * @tc.name      testMetaCombo0102
     * @tc.desc      Verify metadata combination (22050, 2, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0102 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0102 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_0400
     * @tc.name      testMetaCombo0103
     * @tc.desc      Verify metadata combination (22050, 2, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0103 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0103 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_0500
     * @tc.name      testMetaCombo0104
     * @tc.desc      Verify metadata combination (22050, 2, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0104 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0104 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_0600
     * @tc.name      testMetaCombo0105
     * @tc.desc      Verify metadata combination (22050, 2, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0105 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0105 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_0700
     * @tc.name      testMetaCombo0106
     * @tc.desc      Verify metadata combination (22050, 2, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0106 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0106 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_0800
     * @tc.name      testMetaCombo0107
     * @tc.desc      Verify metadata combination (22050, 2, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0107 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0107 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_0900
     * @tc.name      testMetaCombo0108
     * @tc.desc      Verify metadata combination (22050, 2, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0108 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0108 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1000
     * @tc.name      testMetaCombo0109
     * @tc.desc      Verify metadata combination (22050, 2, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0109 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0109 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1100
     * @tc.name      testMetaCombo0110
     * @tc.desc      Verify metadata combination (22050, 2, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0110 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0110 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1200
     * @tc.name      testMetaCombo0111
     * @tc.desc      Verify metadata combination (22050, 3, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0111 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0111 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1300
     * @tc.name      testMetaCombo0112
     * @tc.desc      Verify metadata combination (22050, 3, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0112 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0112 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1400
     * @tc.name      testMetaCombo0113
     * @tc.desc      Verify metadata combination (22050, 3, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0113 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0113 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1500
     * @tc.name      testMetaCombo0114
     * @tc.desc      Verify metadata combination (22050, 3, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0114 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0114 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1600
     * @tc.name      testMetaCombo0115
     * @tc.desc      Verify metadata combination (22050, 3, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0115 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0115 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1700
     * @tc.name      testMetaCombo0116
     * @tc.desc      Verify metadata combination (22050, 3, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0116 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0116 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1800
     * @tc.name      testMetaCombo0117
     * @tc.desc      Verify metadata combination (22050, 3, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0117 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0117 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_1900
     * @tc.name      testMetaCombo0118
     * @tc.desc      Verify metadata combination (22050, 3, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0118 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0118 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2000
     * @tc.name      testMetaCombo0119
     * @tc.desc      Verify metadata combination (22050, 3, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0119 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0119 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2100
     * @tc.name      testMetaCombo0120
     * @tc.desc      Verify metadata combination (22050, 3, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0120 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 22050;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(22050);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0120 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2200
     * @tc.name      testMetaCombo0121
     * @tc.desc      Verify metadata combination (24000, 1, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0121 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0121 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2300
     * @tc.name      testMetaCombo0122
     * @tc.desc      Verify metadata combination (24000, 1, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0122 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0122 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2400
     * @tc.name      testMetaCombo0123
     * @tc.desc      Verify metadata combination (24000, 1, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0123 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0123 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2500
     * @tc.name      testMetaCombo0124
     * @tc.desc      Verify metadata combination (24000, 1, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0124 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0124 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2600
     * @tc.name      testMetaCombo0125
     * @tc.desc      Verify metadata combination (24000, 1, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0125 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0125 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2700
     * @tc.name      testMetaCombo0126
     * @tc.desc      Verify metadata combination (24000, 1, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0126 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0126 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2800
     * @tc.name      testMetaCombo0127
     * @tc.desc      Verify metadata combination (24000, 1, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0127 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0127 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_2900
     * @tc.name      testMetaCombo0128
     * @tc.desc      Verify metadata combination (24000, 1, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0128 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0128 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3000
     * @tc.name      testMetaCombo0129
     * @tc.desc      Verify metadata combination (24000, 1, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0129 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0129 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3100
     * @tc.name      testMetaCombo0130
     * @tc.desc      Verify metadata combination (24000, 1, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0130 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0130 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3200
     * @tc.name      testMetaCombo0131
     * @tc.desc      Verify metadata combination (24000, 2, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0131 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0131 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3300
     * @tc.name      testMetaCombo0132
     * @tc.desc      Verify metadata combination (24000, 2, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0132 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0132 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3400
     * @tc.name      testMetaCombo0133
     * @tc.desc      Verify metadata combination (24000, 2, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0133 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0133 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3500
     * @tc.name      testMetaCombo0134
     * @tc.desc      Verify metadata combination (24000, 2, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0134 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0134 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3600
     * @tc.name      testMetaCombo0135
     * @tc.desc      Verify metadata combination (24000, 2, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0135 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0135 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3700
     * @tc.name      testMetaCombo0136
     * @tc.desc      Verify metadata combination (24000, 2, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0136 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0136 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3800
     * @tc.name      testMetaCombo0137
     * @tc.desc      Verify metadata combination (24000, 2, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0137 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0137 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_3900
     * @tc.name      testMetaCombo0138
     * @tc.desc      Verify metadata combination (24000, 2, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0138 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0138 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4000
     * @tc.name      testMetaCombo0139
     * @tc.desc      Verify metadata combination (24000, 2, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0139 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0139 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4100
     * @tc.name      testMetaCombo0140
     * @tc.desc      Verify metadata combination (24000, 2, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0140 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0140 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4200
     * @tc.name      testMetaCombo0141
     * @tc.desc      Verify metadata combination (24000, 3, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0141 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0141 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4300
     * @tc.name      testMetaCombo0142
     * @tc.desc      Verify metadata combination (24000, 3, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0142 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0142 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4400
     * @tc.name      testMetaCombo0143
     * @tc.desc      Verify metadata combination (24000, 3, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0143 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0143 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4500
     * @tc.name      testMetaCombo0144
     * @tc.desc      Verify metadata combination (24000, 3, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0144 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0144 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4600
     * @tc.name      testMetaCombo0145
     * @tc.desc      Verify metadata combination (24000, 3, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0145 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0145 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4700
     * @tc.name      testMetaCombo0146
     * @tc.desc      Verify metadata combination (24000, 3, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0146 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0146 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4800
     * @tc.name      testMetaCombo0147
     * @tc.desc      Verify metadata combination (24000, 3, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0147 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0147 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_4900
     * @tc.name      testMetaCombo0148
     * @tc.desc      Verify metadata combination (24000, 3, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0148 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0148 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5000
     * @tc.name      testMetaCombo0149
     * @tc.desc      Verify metadata combination (24000, 3, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0149 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0149 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5100
     * @tc.name      testMetaCombo0150
     * @tc.desc      Verify metadata combination (24000, 3, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0150 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 24000;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(24000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0150 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5200
     * @tc.name      testMetaCombo0151
     * @tc.desc      Verify metadata combination (32000, 1, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0151 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0151 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5300
     * @tc.name      testMetaCombo0152
     * @tc.desc      Verify metadata combination (32000, 1, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0152 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0152 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5400
     * @tc.name      testMetaCombo0153
     * @tc.desc      Verify metadata combination (32000, 1, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0153 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0153 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5500
     * @tc.name      testMetaCombo0154
     * @tc.desc      Verify metadata combination (32000, 1, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0154 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0154 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5600
     * @tc.name      testMetaCombo0155
     * @tc.desc      Verify metadata combination (32000, 1, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0155 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0155 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5700
     * @tc.name      testMetaCombo0156
     * @tc.desc      Verify metadata combination (32000, 1, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0156 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0156 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5800
     * @tc.name      testMetaCombo0157
     * @tc.desc      Verify metadata combination (32000, 1, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0157 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0157 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_5900
     * @tc.name      testMetaCombo0158
     * @tc.desc      Verify metadata combination (32000, 1, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0158 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0158 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_6000
     * @tc.name      testMetaCombo0159
     * @tc.desc      Verify metadata combination (32000, 1, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0159 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0159 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP2_ONE_6100
     * @tc.name      testMetaCombo0160
     * @tc.desc      Verify metadata combination (32000, 1, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0160 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0160 end');
    })

  })
}
