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
import testNapi from 'libentry.so';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function dlpApiVolumeTestPart02() {
  describe('DlpApiVolumePart02', () => {
    /**
     * @tc.name   testDlpVolume0114
     * @tc.number SUB_DLP_C_API_VOLUME_0114
     * @tc.desc   Verify GetOriginalFileName volume case 114.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0114 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0114 end');
    })
    /**
     * @tc.name   testDlpVolume0115
     * @tc.number SUB_DLP_C_API_VOLUME_0115
     * @tc.desc   Verify GetOriginalFileName volume case 115.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0115 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0115 end');
    })
    /**
     * @tc.name   testDlpVolume0116
     * @tc.number SUB_DLP_C_API_VOLUME_0116
     * @tc.desc   Verify GetOriginalFileName volume case 116.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0116 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0116 end');
    })
    /**
     * @tc.name   testDlpVolume0117
     * @tc.number SUB_DLP_C_API_VOLUME_0117
     * @tc.desc   Verify GetOriginalFileName volume case 117.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0117 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0117 end');
    })
    /**
     * @tc.name   testDlpVolume0118
     * @tc.number SUB_DLP_C_API_VOLUME_0118
     * @tc.desc   Verify GetOriginalFileName volume case 118.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0118 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0118 end');
    })
    /**
     * @tc.name   testDlpVolume0119
     * @tc.number SUB_DLP_C_API_VOLUME_0119
     * @tc.desc   Verify GetOriginalFileName volume case 119.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0119 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0119 end');
    })
    /**
     * @tc.name   testDlpVolume0120
     * @tc.number SUB_DLP_C_API_VOLUME_0120
     * @tc.desc   Verify GetOriginalFileName volume case 120.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0120 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0120 end');
    })
    /**
     * @tc.name   testDlpVolume0121
     * @tc.number SUB_DLP_C_API_VOLUME_0121
     * @tc.desc   Verify GetOriginalFileName volume case 121.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0121 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0121 end');
    })
    /**
     * @tc.name   testDlpVolume0122
     * @tc.number SUB_DLP_C_API_VOLUME_0122
     * @tc.desc   Verify GetOriginalFileName volume case 122.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0122 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0122 end');
    })
    /**
     * @tc.name   testDlpVolume0123
     * @tc.number SUB_DLP_C_API_VOLUME_0123
     * @tc.desc   Verify GetOriginalFileName volume case 123.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0123 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0123 end');
    })
    /**
     * @tc.name   testDlpVolume0124
     * @tc.number SUB_DLP_C_API_VOLUME_0124
     * @tc.desc   Verify GetOriginalFileName volume case 124.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0124 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0124 end');
    })
    /**
     * @tc.name   testDlpVolume0125
     * @tc.number SUB_DLP_C_API_VOLUME_0125
     * @tc.desc   Verify GetOriginalFileName volume case 125.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0125 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0125 end');
    })
    /**
     * @tc.name   testDlpVolume0126
     * @tc.number SUB_DLP_C_API_VOLUME_0126
     * @tc.desc   Verify GetOriginalFileName volume case 126.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0126 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0126 end');
    })
    /**
     * @tc.name   testDlpVolume0127
     * @tc.number SUB_DLP_C_API_VOLUME_0127
     * @tc.desc   Verify GetOriginalFileName volume case 127.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0127 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0127 end');
    })
    /**
     * @tc.name   testDlpVolume0128
     * @tc.number SUB_DLP_C_API_VOLUME_0128
     * @tc.desc   Verify GetOriginalFileName volume case 128.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0128 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0128 end');
    })
    /**
     * @tc.name   testDlpVolume0129
     * @tc.number SUB_DLP_C_API_VOLUME_0129
     * @tc.desc   Verify GetOriginalFileName volume case 129.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0129 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0129 end');
    })
    /**
     * @tc.name   testDlpVolume0130
     * @tc.number SUB_DLP_C_API_VOLUME_0130
     * @tc.desc   Verify GetOriginalFileName volume case 130.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0130 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0130 end');
    })
    /**
     * @tc.name   testDlpVolume0131
     * @tc.number SUB_DLP_C_API_VOLUME_0131
     * @tc.desc   Verify GetOriginalFileName volume case 131.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0131 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0131 end');
    })
    /**
     * @tc.name   testDlpVolume0132
     * @tc.number SUB_DLP_C_API_VOLUME_0132
     * @tc.desc   Verify GetOriginalFileName volume case 132.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0132 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0132 end');
    })
    /**
     * @tc.name   testDlpVolume0133
     * @tc.number SUB_DLP_C_API_VOLUME_0133
     * @tc.desc   Verify GetOriginalFileName volume case 133.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0133 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0133 end');
    })
    /**
     * @tc.name   testDlpVolume0134
     * @tc.number SUB_DLP_C_API_VOLUME_0134
     * @tc.desc   Verify GetOriginalFileName volume case 134.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0134 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0134 end');
    })
    /**
     * @tc.name   testDlpVolume0135
     * @tc.number SUB_DLP_C_API_VOLUME_0135
     * @tc.desc   Verify GetOriginalFileName volume case 135.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0135 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0135 end');
    })
    /**
     * @tc.name   testDlpVolume0136
     * @tc.number SUB_DLP_C_API_VOLUME_0136
     * @tc.desc   Verify GetOriginalFileName volume case 136.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0136 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0136 end');
    })
    /**
     * @tc.name   testDlpVolume0137
     * @tc.number SUB_DLP_C_API_VOLUME_0137
     * @tc.desc   Verify GetOriginalFileName volume case 137.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0137 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0137 end');
    })
    /**
     * @tc.name   testDlpVolume0138
     * @tc.number SUB_DLP_C_API_VOLUME_0138
     * @tc.desc   Verify GetOriginalFileName volume case 138.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0138 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0138 end');
    })
    /**
     * @tc.name   testDlpVolume0139
     * @tc.number SUB_DLP_C_API_VOLUME_0139
     * @tc.desc   Verify GetOriginalFileName volume case 139.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0139 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0139 end');
    })
    /**
     * @tc.name   testDlpVolume0140
     * @tc.number SUB_DLP_C_API_VOLUME_0140
     * @tc.desc   Verify GetOriginalFileName volume case 140.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0140 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0140 end');
    })
    /**
     * @tc.name   testDlpVolume0141
     * @tc.number SUB_DLP_C_API_VOLUME_0141
     * @tc.desc   Verify GetOriginalFileName volume case 141.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0141 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0141 end');
    })
    /**
     * @tc.name   testDlpVolume0142
     * @tc.number SUB_DLP_C_API_VOLUME_0142
     * @tc.desc   Verify GetOriginalFileName volume case 142.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0142 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0142 end');
    })
    /**
     * @tc.name   testDlpVolume0143
     * @tc.number SUB_DLP_C_API_VOLUME_0143
     * @tc.desc   Verify GetOriginalFileName volume case 143.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0143 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0143 end');
    })
    /**
     * @tc.name   testDlpVolume0144
     * @tc.number SUB_DLP_C_API_VOLUME_0144
     * @tc.desc   Verify GetOriginalFileName volume case 144.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0144 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0144 end');
    })
    /**
     * @tc.name   testDlpVolume0145
     * @tc.number SUB_DLP_C_API_VOLUME_0145
     * @tc.desc   Verify GetOriginalFileName volume case 145.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0145 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0145 end');
    })
    /**
     * @tc.name   testDlpVolume0146
     * @tc.number SUB_DLP_C_API_VOLUME_0146
     * @tc.desc   Verify GetOriginalFileName volume case 146.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0146 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0146 end');
    })
    /**
     * @tc.name   testDlpVolume0147
     * @tc.number SUB_DLP_C_API_VOLUME_0147
     * @tc.desc   Verify GetOriginalFileName volume case 147.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0147 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0147 end');
    })
    /**
     * @tc.name   testDlpVolume0148
     * @tc.number SUB_DLP_C_API_VOLUME_0148
     * @tc.desc   Verify GetOriginalFileName volume case 148.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0148 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0148 end');
    })
    /**
     * @tc.name   testDlpVolume0149
     * @tc.number SUB_DLP_C_API_VOLUME_0149
     * @tc.desc   Verify GetOriginalFileName volume case 149.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0149 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0149 end');
    })
    /**
     * @tc.name   testDlpVolume0150
     * @tc.number SUB_DLP_C_API_VOLUME_0150
     * @tc.desc   Verify GetOriginalFileName volume case 150.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0150 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0150 end');
    })
    /**
     * @tc.name   testDlpVolume0151
     * @tc.number SUB_DLP_C_API_VOLUME_0151
     * @tc.desc   Verify GetOriginalFileName volume case 151.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0151 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0151 end');
    })
    /**
     * @tc.name   testDlpVolume0152
     * @tc.number SUB_DLP_C_API_VOLUME_0152
     * @tc.desc   Verify GetOriginalFileName volume case 152.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0152 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0152 end');
    })
    /**
     * @tc.name   testDlpVolume0153
     * @tc.number SUB_DLP_C_API_VOLUME_0153
     * @tc.desc   Verify GetOriginalFileName volume case 153.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0153 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0153 end');
    })
    /**
     * @tc.name   testDlpVolume0154
     * @tc.number SUB_DLP_C_API_VOLUME_0154
     * @tc.desc   Verify GetOriginalFileName volume case 154.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0154 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0154 end');
    })
    /**
     * @tc.name   testDlpVolume0155
     * @tc.number SUB_DLP_C_API_VOLUME_0155
     * @tc.desc   Verify GetOriginalFileName volume case 155.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0155 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0155 end');
    })
    /**
     * @tc.name   testDlpVolume0156
     * @tc.number SUB_DLP_C_API_VOLUME_0156
     * @tc.desc   Verify GetOriginalFileName volume case 156.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0156 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0156 end');
    })
    /**
     * @tc.name   testDlpVolume0157
     * @tc.number SUB_DLP_C_API_VOLUME_0157
     * @tc.desc   Verify GetOriginalFileName volume case 157.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0157 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0157 end');
    })
    /**
     * @tc.name   testDlpVolume0158
     * @tc.number SUB_DLP_C_API_VOLUME_0158
     * @tc.desc   Verify GetOriginalFileName volume case 158.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0158 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0158 end');
    })
    /**
     * @tc.name   testDlpVolume0159
     * @tc.number SUB_DLP_C_API_VOLUME_0159
     * @tc.desc   Verify GetOriginalFileName volume case 159.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0159 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0159 end');
    })
    /**
     * @tc.name   testDlpVolume0160
     * @tc.number SUB_DLP_C_API_VOLUME_0160
     * @tc.desc   Verify GetOriginalFileName volume case 160.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0160 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0160 end');
    })
    /**
     * @tc.name   testDlpVolume0161
     * @tc.number SUB_DLP_C_API_VOLUME_0161
     * @tc.desc   Verify GetOriginalFileName volume case 161.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0161 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0161 end');
    })
    /**
     * @tc.name   testDlpVolume0162
     * @tc.number SUB_DLP_C_API_VOLUME_0162
     * @tc.desc   Verify GetOriginalFileName volume case 162.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0162 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0162 end');
    })
    /**
     * @tc.name   testDlpVolume0163
     * @tc.number SUB_DLP_C_API_VOLUME_0163
     * @tc.desc   Verify GetOriginalFileName volume case 163.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0163 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0163 end');
    })
    /**
     * @tc.name   testDlpVolume0164
     * @tc.number SUB_DLP_C_API_VOLUME_0164
     * @tc.desc   Verify GetOriginalFileName volume case 164.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0164 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0164 end');
    })
    /**
     * @tc.name   testDlpVolume0165
     * @tc.number SUB_DLP_C_API_VOLUME_0165
     * @tc.desc   Verify GetOriginalFileName volume case 165.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0165 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0165 end');
    })
    /**
     * @tc.name   testDlpVolume0166
     * @tc.number SUB_DLP_C_API_VOLUME_0166
     * @tc.desc   Verify GetOriginalFileName volume case 166.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0166 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0166 end');
    })
    /**
     * @tc.name   testDlpVolume0167
     * @tc.number SUB_DLP_C_API_VOLUME_0167
     * @tc.desc   Verify GetOriginalFileName volume case 167.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0167 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0167 end');
    })
    /**
     * @tc.name   testDlpVolume0168
     * @tc.number SUB_DLP_C_API_VOLUME_0168
     * @tc.desc   Verify GetOriginalFileName volume case 168.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0168 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0168 end');
    })
    /**
     * @tc.name   testDlpVolume0169
     * @tc.number SUB_DLP_C_API_VOLUME_0169
     * @tc.desc   Verify GetOriginalFileName volume case 169.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0169 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0169 end');
    })
    /**
     * @tc.name   testDlpVolume0170
     * @tc.number SUB_DLP_C_API_VOLUME_0170
     * @tc.desc   Verify GetOriginalFileName volume case 170.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0170 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0170 end');
    })
    /**
     * @tc.name   testDlpVolume0171
     * @tc.number SUB_DLP_C_API_VOLUME_0171
     * @tc.desc   Verify GetOriginalFileName volume case 171.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0171 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0171 end');
    })
    /**
     * @tc.name   testDlpVolume0172
     * @tc.number SUB_DLP_C_API_VOLUME_0172
     * @tc.desc   Verify GetOriginalFileName volume case 172.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0172 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0172 end');
    })
    /**
     * @tc.name   testDlpVolume0173
     * @tc.number SUB_DLP_C_API_VOLUME_0173
     * @tc.desc   Verify GetOriginalFileName volume case 173.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0173 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0173 end');
    })
    /**
     * @tc.name   testDlpVolume0174
     * @tc.number SUB_DLP_C_API_VOLUME_0174
     * @tc.desc   Verify GetOriginalFileName volume case 174.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0174 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0174 end');
    })
    /**
     * @tc.name   testDlpVolume0175
     * @tc.number SUB_DLP_C_API_VOLUME_0175
     * @tc.desc   Verify GetOriginalFileName volume case 175.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0175 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0175 end');
    })
    /**
     * @tc.name   testDlpVolume0176
     * @tc.number SUB_DLP_C_API_VOLUME_0176
     * @tc.desc   Verify GetOriginalFileName volume case 176.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0176 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0176 end');
    })
    /**
     * @tc.name   testDlpVolume0177
     * @tc.number SUB_DLP_C_API_VOLUME_0177
     * @tc.desc   Verify GetOriginalFileName volume case 177.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0177 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0177 end');
    })
    /**
     * @tc.name   testDlpVolume0178
     * @tc.number SUB_DLP_C_API_VOLUME_0178
     * @tc.desc   Verify GetOriginalFileName volume case 178.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0178 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0178 end');
    })
    /**
     * @tc.name   testDlpVolume0179
     * @tc.number SUB_DLP_C_API_VOLUME_0179
     * @tc.desc   Verify GetOriginalFileName volume case 179.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0179 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0179 end');
    })
    /**
     * @tc.name   testDlpVolume0180
     * @tc.number SUB_DLP_C_API_VOLUME_0180
     * @tc.desc   Verify GetOriginalFileName volume case 180.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0180 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0180 end');
    })
    /**
     * @tc.name   testDlpVolume0181
     * @tc.number SUB_DLP_C_API_VOLUME_0181
     * @tc.desc   Verify GetOriginalFileName volume case 181.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0181 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0181 end');
    })
    /**
     * @tc.name   testDlpVolume0182
     * @tc.number SUB_DLP_C_API_VOLUME_0182
     * @tc.desc   Verify GetOriginalFileName volume case 182.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0182 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0182 end');
    })
    /**
     * @tc.name   testDlpVolume0183
     * @tc.number SUB_DLP_C_API_VOLUME_0183
     * @tc.desc   Verify GetOriginalFileName volume case 183.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0183 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0183 end');
    })
    /**
     * @tc.name   testDlpVolume0184
     * @tc.number SUB_DLP_C_API_VOLUME_0184
     * @tc.desc   Verify GetOriginalFileName volume case 184.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0184 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0184 end');
    })
    /**
     * @tc.name   testDlpVolume0185
     * @tc.number SUB_DLP_C_API_VOLUME_0185
     * @tc.desc   Verify GetOriginalFileName volume case 185.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0185 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0185 end');
    })
    /**
     * @tc.name   testDlpVolume0186
     * @tc.number SUB_DLP_C_API_VOLUME_0186
     * @tc.desc   Verify GetOriginalFileName volume case 186.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0186 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0186 end');
    })
    /**
     * @tc.name   testDlpVolume0187
     * @tc.number SUB_DLP_C_API_VOLUME_0187
     * @tc.desc   Verify GetOriginalFileName volume case 187.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0187 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0187 end');
    })
    /**
     * @tc.name   testDlpVolume0188
     * @tc.number SUB_DLP_C_API_VOLUME_0188
     * @tc.desc   Verify GetOriginalFileName volume case 188.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0188 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0188 end');
    })
    /**
     * @tc.name   testDlpVolume0189
     * @tc.number SUB_DLP_C_API_VOLUME_0189
     * @tc.desc   Verify GetOriginalFileName volume case 189.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0189 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0189 end');
    })
    /**
     * @tc.name   testDlpVolume0190
     * @tc.number SUB_DLP_C_API_VOLUME_0190
     * @tc.desc   Verify GetOriginalFileName volume case 190.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0190 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0190 end');
    })
    /**
     * @tc.name   testDlpVolume0191
     * @tc.number SUB_DLP_C_API_VOLUME_0191
     * @tc.desc   Verify GetOriginalFileName volume case 191.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0191 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0191 end');
    })
    /**
     * @tc.name   testDlpVolume0192
     * @tc.number SUB_DLP_C_API_VOLUME_0192
     * @tc.desc   Verify GetOriginalFileName volume case 192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0192 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0192 end');
    })
    /**
     * @tc.name   testDlpVolume0193
     * @tc.number SUB_DLP_C_API_VOLUME_0193
     * @tc.desc   Verify GetOriginalFileName volume case 193.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0193 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0193 end');
    })
    /**
     * @tc.name   testDlpVolume0194
     * @tc.number SUB_DLP_C_API_VOLUME_0194
     * @tc.desc   Verify GetOriginalFileName volume case 194.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0194 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0194 end');
    })
    /**
     * @tc.name   testDlpVolume0195
     * @tc.number SUB_DLP_C_API_VOLUME_0195
     * @tc.desc   Verify GetOriginalFileName volume case 195.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0195 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0195 end');
    })
    /**
     * @tc.name   testDlpVolume0196
     * @tc.number SUB_DLP_C_API_VOLUME_0196
     * @tc.desc   Verify GetOriginalFileName volume case 196.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0196 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0196 end');
    })
    /**
     * @tc.name   testDlpVolume0197
     * @tc.number SUB_DLP_C_API_VOLUME_0197
     * @tc.desc   Verify GetOriginalFileName volume case 197.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0197 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0197 end');
    })
    /**
     * @tc.name   testDlpVolume0198
     * @tc.number SUB_DLP_C_API_VOLUME_0198
     * @tc.desc   Verify GetOriginalFileName volume case 198.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0198 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0198 end');
    })
    /**
     * @tc.name   testDlpVolume0199
     * @tc.number SUB_DLP_C_API_VOLUME_0199
     * @tc.desc   Verify GetOriginalFileName volume case 199.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0199 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0199 end');
    })
    /**
     * @tc.name   testDlpVolume0200
     * @tc.number SUB_DLP_C_API_VOLUME_0200
     * @tc.desc   Verify GetOriginalFileName volume case 200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0200 begin');
      const result: string | number = testNapi.GetOriginalFileName();
      expect(result === 'test.txt').assertTrue();
      expect(typeof result).assertEqual('string');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0200 end');
    })
    /**
     * @tc.name   testDlpVolume0201
     * @tc.number SUB_DLP_C_API_VOLUME_0201
     * @tc.desc   Verify IsInSandbox volume case 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0201 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0201 end');
    })
    /**
     * @tc.name   testDlpVolume0202
     * @tc.number SUB_DLP_C_API_VOLUME_0202
     * @tc.desc   Verify IsInSandbox volume case 202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0202 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0202 end');
    })
    /**
     * @tc.name   testDlpVolume0203
     * @tc.number SUB_DLP_C_API_VOLUME_0203
     * @tc.desc   Verify IsInSandbox volume case 203.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0203 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0203 end');
    })
    /**
     * @tc.name   testDlpVolume0204
     * @tc.number SUB_DLP_C_API_VOLUME_0204
     * @tc.desc   Verify IsInSandbox volume case 204.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0204 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0204 end');
    })
    /**
     * @tc.name   testDlpVolume0205
     * @tc.number SUB_DLP_C_API_VOLUME_0205
     * @tc.desc   Verify IsInSandbox volume case 205.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0205 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0205 end');
    })
    /**
     * @tc.name   testDlpVolume0206
     * @tc.number SUB_DLP_C_API_VOLUME_0206
     * @tc.desc   Verify IsInSandbox volume case 206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0206 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0206 end');
    })
    /**
     * @tc.name   testDlpVolume0207
     * @tc.number SUB_DLP_C_API_VOLUME_0207
     * @tc.desc   Verify IsInSandbox volume case 207.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0207 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0207 end');
    })
    /**
     * @tc.name   testDlpVolume0208
     * @tc.number SUB_DLP_C_API_VOLUME_0208
     * @tc.desc   Verify IsInSandbox volume case 208.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0208 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0208 end');
    })
    /**
     * @tc.name   testDlpVolume0209
     * @tc.number SUB_DLP_C_API_VOLUME_0209
     * @tc.desc   Verify IsInSandbox volume case 209.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0209 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0209 end');
    })
    /**
     * @tc.name   testDlpVolume0210
     * @tc.number SUB_DLP_C_API_VOLUME_0210
     * @tc.desc   Verify IsInSandbox volume case 210.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0210 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0210 end');
    })
    /**
     * @tc.name   testDlpVolume0211
     * @tc.number SUB_DLP_C_API_VOLUME_0211
     * @tc.desc   Verify IsInSandbox volume case 211.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0211 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0211 end');
    })
    /**
     * @tc.name   testDlpVolume0212
     * @tc.number SUB_DLP_C_API_VOLUME_0212
     * @tc.desc   Verify IsInSandbox volume case 212.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0212 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0212 end');
    })
    /**
     * @tc.name   testDlpVolume0213
     * @tc.number SUB_DLP_C_API_VOLUME_0213
     * @tc.desc   Verify IsInSandbox volume case 213.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0213 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0213 end');
    })
    /**
     * @tc.name   testDlpVolume0214
     * @tc.number SUB_DLP_C_API_VOLUME_0214
     * @tc.desc   Verify IsInSandbox volume case 214.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0214 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0214 end');
    })
    /**
     * @tc.name   testDlpVolume0215
     * @tc.number SUB_DLP_C_API_VOLUME_0215
     * @tc.desc   Verify IsInSandbox volume case 215.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0215 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0215 end');
    })
    /**
     * @tc.name   testDlpVolume0216
     * @tc.number SUB_DLP_C_API_VOLUME_0216
     * @tc.desc   Verify IsInSandbox volume case 216.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0216 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0216 end');
    })
    /**
     * @tc.name   testDlpVolume0217
     * @tc.number SUB_DLP_C_API_VOLUME_0217
     * @tc.desc   Verify IsInSandbox volume case 217.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0217 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0217 end');
    })
    /**
     * @tc.name   testDlpVolume0218
     * @tc.number SUB_DLP_C_API_VOLUME_0218
     * @tc.desc   Verify IsInSandbox volume case 218.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0218 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0218 end');
    })
    /**
     * @tc.name   testDlpVolume0219
     * @tc.number SUB_DLP_C_API_VOLUME_0219
     * @tc.desc   Verify IsInSandbox volume case 219.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0219 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0219 end');
    })
    /**
     * @tc.name   testDlpVolume0220
     * @tc.number SUB_DLP_C_API_VOLUME_0220
     * @tc.desc   Verify IsInSandbox volume case 220.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0220 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0220 end');
    })
    /**
     * @tc.name   testDlpVolume0221
     * @tc.number SUB_DLP_C_API_VOLUME_0221
     * @tc.desc   Verify IsInSandbox volume case 221.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0221 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0221 end');
    })
    /**
     * @tc.name   testDlpVolume0222
     * @tc.number SUB_DLP_C_API_VOLUME_0222
     * @tc.desc   Verify IsInSandbox volume case 222.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0222 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0222 end');
    })
    /**
     * @tc.name   testDlpVolume0223
     * @tc.number SUB_DLP_C_API_VOLUME_0223
     * @tc.desc   Verify IsInSandbox volume case 223.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0223 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0223 end');
    })
    /**
     * @tc.name   testDlpVolume0224
     * @tc.number SUB_DLP_C_API_VOLUME_0224
     * @tc.desc   Verify IsInSandbox volume case 224.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0224 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0224 end');
    })
    /**
     * @tc.name   testDlpVolume0225
     * @tc.number SUB_DLP_C_API_VOLUME_0225
     * @tc.desc   Verify IsInSandbox volume case 225.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0225 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0225 end');
    })
    /**
     * @tc.name   testDlpVolume0226
     * @tc.number SUB_DLP_C_API_VOLUME_0226
     * @tc.desc   Verify IsInSandbox volume case 226.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0226 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0226 end');
    })
  })
}
