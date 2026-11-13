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

export default function RecordingMetadataMatrixPart1Test(): void {
  describe('RecordingMetadataMatrixPart1', () => {

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_0100
     * @tc.name      testMetaCombo0001
     * @tc.desc      Verify metadata combination (8000, 1, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0001 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_0200
     * @tc.name      testMetaCombo0002
     * @tc.desc      Verify metadata combination (8000, 1, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0002 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_0300
     * @tc.name      testMetaCombo0003
     * @tc.desc      Verify metadata combination (8000, 1, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0003 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_0400
     * @tc.name      testMetaCombo0004
     * @tc.desc      Verify metadata combination (8000, 1, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0004 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_0500
     * @tc.name      testMetaCombo0005
     * @tc.desc      Verify metadata combination (8000, 1, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0005 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_0600
     * @tc.name      testMetaCombo0006
     * @tc.desc      Verify metadata combination (8000, 1, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0006 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_0700
     * @tc.name      testMetaCombo0007
     * @tc.desc      Verify metadata combination (8000, 1, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0007 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_0800
     * @tc.name      testMetaCombo0008
     * @tc.desc      Verify metadata combination (8000, 1, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0008 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_0900
     * @tc.name      testMetaCombo0009
     * @tc.desc      Verify metadata combination (8000, 1, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0009 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1000
     * @tc.name      testMetaCombo0010
     * @tc.desc      Verify metadata combination (8000, 1, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0010 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1100
     * @tc.name      testMetaCombo0011
     * @tc.desc      Verify metadata combination (8000, 2, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0011 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1200
     * @tc.name      testMetaCombo0012
     * @tc.desc      Verify metadata combination (8000, 2, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0012 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1300
     * @tc.name      testMetaCombo0013
     * @tc.desc      Verify metadata combination (8000, 2, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0013 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1400
     * @tc.name      testMetaCombo0014
     * @tc.desc      Verify metadata combination (8000, 2, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0014 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1500
     * @tc.name      testMetaCombo0015
     * @tc.desc      Verify metadata combination (8000, 2, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0015 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1600
     * @tc.name      testMetaCombo0016
     * @tc.desc      Verify metadata combination (8000, 2, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0016 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1700
     * @tc.name      testMetaCombo0017
     * @tc.desc      Verify metadata combination (8000, 2, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0017 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1800
     * @tc.name      testMetaCombo0018
     * @tc.desc      Verify metadata combination (8000, 2, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0018 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_1900
     * @tc.name      testMetaCombo0019
     * @tc.desc      Verify metadata combination (8000, 2, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0019 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2000
     * @tc.name      testMetaCombo0020
     * @tc.desc      Verify metadata combination (8000, 2, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0020 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2100
     * @tc.name      testMetaCombo0021
     * @tc.desc      Verify metadata combination (8000, 3, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0021 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2200
     * @tc.name      testMetaCombo0022
     * @tc.desc      Verify metadata combination (8000, 3, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0022 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2300
     * @tc.name      testMetaCombo0023
     * @tc.desc      Verify metadata combination (8000, 3, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0023 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2400
     * @tc.name      testMetaCombo0024
     * @tc.desc      Verify metadata combination (8000, 3, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0024 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2500
     * @tc.name      testMetaCombo0025
     * @tc.desc      Verify metadata combination (8000, 3, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0025 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2600
     * @tc.name      testMetaCombo0026
     * @tc.desc      Verify metadata combination (8000, 3, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0026 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2700
     * @tc.name      testMetaCombo0027
     * @tc.desc      Verify metadata combination (8000, 3, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0027 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2800
     * @tc.name      testMetaCombo0028
     * @tc.desc      Verify metadata combination (8000, 3, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0028 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_2900
     * @tc.name      testMetaCombo0029
     * @tc.desc      Verify metadata combination (8000, 3, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0029 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3000
     * @tc.name      testMetaCombo0030
     * @tc.desc      Verify metadata combination (8000, 3, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0030 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 8000;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(8000);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0030 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3100
     * @tc.name      testMetaCombo0031
     * @tc.desc      Verify metadata combination (11025, 1, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0031 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0031 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3200
     * @tc.name      testMetaCombo0032
     * @tc.desc      Verify metadata combination (11025, 1, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0032 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0032 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3300
     * @tc.name      testMetaCombo0033
     * @tc.desc      Verify metadata combination (11025, 1, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0033 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0033 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3400
     * @tc.name      testMetaCombo0034
     * @tc.desc      Verify metadata combination (11025, 1, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0034 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0034 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3500
     * @tc.name      testMetaCombo0035
     * @tc.desc      Verify metadata combination (11025, 1, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0035 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0035 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3600
     * @tc.name      testMetaCombo0036
     * @tc.desc      Verify metadata combination (11025, 1, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0036 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0036 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3700
     * @tc.name      testMetaCombo0037
     * @tc.desc      Verify metadata combination (11025, 1, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0037 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0037 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3800
     * @tc.name      testMetaCombo0038
     * @tc.desc      Verify metadata combination (11025, 1, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0038 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0038 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_3900
     * @tc.name      testMetaCombo0039
     * @tc.desc      Verify metadata combination (11025, 1, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0039 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0039 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4000
     * @tc.name      testMetaCombo0040
     * @tc.desc      Verify metadata combination (11025, 1, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0040 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0040 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4100
     * @tc.name      testMetaCombo0041
     * @tc.desc      Verify metadata combination (11025, 2, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0041 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0041 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4200
     * @tc.name      testMetaCombo0042
     * @tc.desc      Verify metadata combination (11025, 2, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0042 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0042 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4300
     * @tc.name      testMetaCombo0043
     * @tc.desc      Verify metadata combination (11025, 2, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0043 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0043 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4400
     * @tc.name      testMetaCombo0044
     * @tc.desc      Verify metadata combination (11025, 2, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0044 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0044 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4500
     * @tc.name      testMetaCombo0045
     * @tc.desc      Verify metadata combination (11025, 2, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0045 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0045 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4600
     * @tc.name      testMetaCombo0046
     * @tc.desc      Verify metadata combination (11025, 2, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0046 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0046 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4700
     * @tc.name      testMetaCombo0047
     * @tc.desc      Verify metadata combination (11025, 2, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0047 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0047 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4800
     * @tc.name      testMetaCombo0048
     * @tc.desc      Verify metadata combination (11025, 2, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0048 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0048 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_4900
     * @tc.name      testMetaCombo0049
     * @tc.desc      Verify metadata combination (11025, 2, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0049 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0049 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5000
     * @tc.name      testMetaCombo0050
     * @tc.desc      Verify metadata combination (11025, 2, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0050 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0050 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5100
     * @tc.name      testMetaCombo0051
     * @tc.desc      Verify metadata combination (11025, 3, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0051 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0051 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5200
     * @tc.name      testMetaCombo0052
     * @tc.desc      Verify metadata combination (11025, 3, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0052 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0052 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5300
     * @tc.name      testMetaCombo0053
     * @tc.desc      Verify metadata combination (11025, 3, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0053 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0053 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5400
     * @tc.name      testMetaCombo0054
     * @tc.desc      Verify metadata combination (11025, 3, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0054 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0054 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5500
     * @tc.name      testMetaCombo0055
     * @tc.desc      Verify metadata combination (11025, 3, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0055 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0055 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5600
     * @tc.name      testMetaCombo0056
     * @tc.desc      Verify metadata combination (11025, 3, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0056 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0056 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5700
     * @tc.name      testMetaCombo0057
     * @tc.desc      Verify metadata combination (11025, 3, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0057 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0057 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5800
     * @tc.name      testMetaCombo0058
     * @tc.desc      Verify metadata combination (11025, 3, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0058 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0058 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_5900
     * @tc.name      testMetaCombo0059
     * @tc.desc      Verify metadata combination (11025, 3, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0059 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0059 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6000
     * @tc.name      testMetaCombo0060
     * @tc.desc      Verify metadata combination (11025, 3, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0060 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 11025;
      m.channelCount = 3;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(11025);
      expect(m.channelCount).assertEqual(3);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0060 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6100
     * @tc.name      testMetaCombo0061
     * @tc.desc      Verify metadata combination (16000, 1, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0061 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0061 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6200
     * @tc.name      testMetaCombo0062
     * @tc.desc      Verify metadata combination (16000, 1, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0062 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0062 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6300
     * @tc.name      testMetaCombo0063
     * @tc.desc      Verify metadata combination (16000, 1, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0063 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0063 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6400
     * @tc.name      testMetaCombo0064
     * @tc.desc      Verify metadata combination (16000, 1, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0064 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0064 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6500
     * @tc.name      testMetaCombo0065
     * @tc.desc      Verify metadata combination (16000, 1, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0065 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0065 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6600
     * @tc.name      testMetaCombo0066
     * @tc.desc      Verify metadata combination (16000, 1, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0066 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0066 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6700
     * @tc.name      testMetaCombo0067
     * @tc.desc      Verify metadata combination (16000, 1, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0067 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0067 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6800
     * @tc.name      testMetaCombo0068
     * @tc.desc      Verify metadata combination (16000, 1, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0068 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0068 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_6900
     * @tc.name      testMetaCombo0069
     * @tc.desc      Verify metadata combination (16000, 1, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0069 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0069 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7000
     * @tc.name      testMetaCombo0070
     * @tc.desc      Verify metadata combination (16000, 1, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0070 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 1;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(1);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0070 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7100
     * @tc.name      testMetaCombo0071
     * @tc.desc      Verify metadata combination (16000, 2, 0, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0071 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0071 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7200
     * @tc.name      testMetaCombo0072
     * @tc.desc      Verify metadata combination (16000, 2, 0, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0072 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 0;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(0);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0072 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7300
     * @tc.name      testMetaCombo0073
     * @tc.desc      Verify metadata combination (16000, 2, 1, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0073 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0073 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7400
     * @tc.name      testMetaCombo0074
     * @tc.desc      Verify metadata combination (16000, 2, 1, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0074 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 1;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(1);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0074 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7500
     * @tc.name      testMetaCombo0075
     * @tc.desc      Verify metadata combination (16000, 2, 2, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0075 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0075 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7600
     * @tc.name      testMetaCombo0076
     * @tc.desc      Verify metadata combination (16000, 2, 2, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0076 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 2;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(2);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0076 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7700
     * @tc.name      testMetaCombo0077
     * @tc.desc      Verify metadata combination (16000, 2, 3, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0077 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0077 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7800
     * @tc.name      testMetaCombo0078
     * @tc.desc      Verify metadata combination (16000, 2, 3, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0078 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 3;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(3);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0078 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_7900
     * @tc.name      testMetaCombo0079
     * @tc.desc      Verify metadata combination (16000, 2, 4, True).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0079 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = true;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0079 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_METAMATRIXP1_8000
     * @tc.name      testMetaCombo0080
     * @tc.desc      Verify metadata combination (16000, 2, 4, False).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMetaCombo0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0080 begin');
      const m: RecordingMetadata = new RecordingMetadata();
      m.samplingRate = 16000;
      m.channelCount = 2;
      m.sampleFormat = 4;
      m.isLowLatencyMode = false;
      expect(m.samplingRate).assertEqual(16000);
      expect(m.channelCount).assertEqual(2);
      expect(m.sampleFormat).assertEqual(4);
      expect(m.isLowLatencyMode).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMetaCombo0080 end');
    })

  })
}
