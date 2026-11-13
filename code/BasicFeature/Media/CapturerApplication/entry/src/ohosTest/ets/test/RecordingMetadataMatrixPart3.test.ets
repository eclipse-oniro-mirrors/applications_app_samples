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
import { RecordingMetadata } from '../../../main/ets/common/model/RecordingMetadata';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function RecordingMetadataMatrixPart3Test(): void {
  describe('RecordingMetadataMatrixPart3', () => {

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_16100
     * @tc.name      testMetaCombo0161
     * @tc.desc      Verify metadata combination (32000, 2, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0161 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0161 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_16200
     * @tc.name      testMetaCombo0162
     * @tc.desc      Verify metadata combination (32000, 2, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0162 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0162 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_16300
     * @tc.name      testMetaCombo0163
     * @tc.desc      Verify metadata combination (32000, 2, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0163 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0163 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_16400
     * @tc.name      testMetaCombo0164
     * @tc.desc      Verify metadata combination (32000, 2, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0164 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0164 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_16500
     * @tc.name      testMetaCombo0165
     * @tc.desc      Verify metadata combination (32000, 2, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0165 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0165 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_16600
     * @tc.name      testMetaCombo0166
     * @tc.desc      Verify metadata combination (32000, 2, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0166 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0166 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_16700
     * @tc.name      testMetaCombo0167
     * @tc.desc      Verify metadata combination (32000, 2, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0167 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0167 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_16800
     * @tc.name      testMetaCombo0168
     * @tc.desc      Verify metadata combination (32000, 2, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0168 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0168 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_16900
     * @tc.name      testMetaCombo0169
     * @tc.desc      Verify metadata combination (32000, 2, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0169 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0169 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17000
     * @tc.name      testMetaCombo0170
     * @tc.desc      Verify metadata combination (32000, 2, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0170 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0170 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17100
     * @tc.name      testMetaCombo0171
     * @tc.desc      Verify metadata combination (32000, 3, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0171 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0171 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17200
     * @tc.name      testMetaCombo0172
     * @tc.desc      Verify metadata combination (32000, 3, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0172 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0172 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17300
     * @tc.name      testMetaCombo0173
     * @tc.desc      Verify metadata combination (32000, 3, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0173 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0173 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17400
     * @tc.name      testMetaCombo0174
     * @tc.desc      Verify metadata combination (32000, 3, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0174 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0174 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17500
     * @tc.name      testMetaCombo0175
     * @tc.desc      Verify metadata combination (32000, 3, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0175 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0175 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17600
     * @tc.name      testMetaCombo0176
     * @tc.desc      Verify metadata combination (32000, 3, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0176 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0176 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17700
     * @tc.name      testMetaCombo0177
     * @tc.desc      Verify metadata combination (32000, 3, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0177 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0177 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17800
     * @tc.name      testMetaCombo0178
     * @tc.desc      Verify metadata combination (32000, 3, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0178 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0178 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_17900
     * @tc.name      testMetaCombo0179
     * @tc.desc      Verify metadata combination (32000, 3, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0179 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0179 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP3_18000
     * @tc.name      testMetaCombo0180
     * @tc.desc      Verify metadata combination (32000, 3, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0180 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 32000;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(32000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0180 end');
    })

  })
}
