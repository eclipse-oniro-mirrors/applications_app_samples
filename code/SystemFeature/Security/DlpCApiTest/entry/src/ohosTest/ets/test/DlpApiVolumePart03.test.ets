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

export default function dlpApiVolumeTestPart03() {
  describe('DlpApiVolumePart03', () => {
    /**
     * @tc.name   testDlpVolume0227
     * @tc.number SUB_DLP_C_API_VOLUME_0227
     * @tc.desc   Verify IsInSandbox volume case 227.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0227 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0227 end');
    })
    /**
     * @tc.name   testDlpVolume0228
     * @tc.number SUB_DLP_C_API_VOLUME_0228
     * @tc.desc   Verify IsInSandbox volume case 228.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0228 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0228 end');
    })
    /**
     * @tc.name   testDlpVolume0229
     * @tc.number SUB_DLP_C_API_VOLUME_0229
     * @tc.desc   Verify IsInSandbox volume case 229.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0229 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0229 end');
    })
    /**
     * @tc.name   testDlpVolume0230
     * @tc.number SUB_DLP_C_API_VOLUME_0230
     * @tc.desc   Verify IsInSandbox volume case 230.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0230 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0230 end');
    })
    /**
     * @tc.name   testDlpVolume0231
     * @tc.number SUB_DLP_C_API_VOLUME_0231
     * @tc.desc   Verify IsInSandbox volume case 231.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0231 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0231 end');
    })
    /**
     * @tc.name   testDlpVolume0232
     * @tc.number SUB_DLP_C_API_VOLUME_0232
     * @tc.desc   Verify IsInSandbox volume case 232.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0232 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0232 end');
    })
    /**
     * @tc.name   testDlpVolume0233
     * @tc.number SUB_DLP_C_API_VOLUME_0233
     * @tc.desc   Verify IsInSandbox volume case 233.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0233 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0233 end');
    })
    /**
     * @tc.name   testDlpVolume0234
     * @tc.number SUB_DLP_C_API_VOLUME_0234
     * @tc.desc   Verify IsInSandbox volume case 234.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0234 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0234 end');
    })
    /**
     * @tc.name   testDlpVolume0235
     * @tc.number SUB_DLP_C_API_VOLUME_0235
     * @tc.desc   Verify IsInSandbox volume case 235.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0235 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0235 end');
    })
    /**
     * @tc.name   testDlpVolume0236
     * @tc.number SUB_DLP_C_API_VOLUME_0236
     * @tc.desc   Verify IsInSandbox volume case 236.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0236 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0236 end');
    })
    /**
     * @tc.name   testDlpVolume0237
     * @tc.number SUB_DLP_C_API_VOLUME_0237
     * @tc.desc   Verify IsInSandbox volume case 237.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0237 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0237 end');
    })
    /**
     * @tc.name   testDlpVolume0238
     * @tc.number SUB_DLP_C_API_VOLUME_0238
     * @tc.desc   Verify IsInSandbox volume case 238.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0238 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0238 end');
    })
    /**
     * @tc.name   testDlpVolume0239
     * @tc.number SUB_DLP_C_API_VOLUME_0239
     * @tc.desc   Verify IsInSandbox volume case 239.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0239 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0239 end');
    })
    /**
     * @tc.name   testDlpVolume0240
     * @tc.number SUB_DLP_C_API_VOLUME_0240
     * @tc.desc   Verify IsInSandbox volume case 240.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0240 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0240 end');
    })
    /**
     * @tc.name   testDlpVolume0241
     * @tc.number SUB_DLP_C_API_VOLUME_0241
     * @tc.desc   Verify IsInSandbox volume case 241.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0241 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0241 end');
    })
    /**
     * @tc.name   testDlpVolume0242
     * @tc.number SUB_DLP_C_API_VOLUME_0242
     * @tc.desc   Verify IsInSandbox volume case 242.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0242 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0242 end');
    })
    /**
     * @tc.name   testDlpVolume0243
     * @tc.number SUB_DLP_C_API_VOLUME_0243
     * @tc.desc   Verify IsInSandbox volume case 243.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0243 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0243 end');
    })
    /**
     * @tc.name   testDlpVolume0244
     * @tc.number SUB_DLP_C_API_VOLUME_0244
     * @tc.desc   Verify IsInSandbox volume case 244.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0244 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0244 end');
    })
    /**
     * @tc.name   testDlpVolume0245
     * @tc.number SUB_DLP_C_API_VOLUME_0245
     * @tc.desc   Verify IsInSandbox volume case 245.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0245 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0245 end');
    })
    /**
     * @tc.name   testDlpVolume0246
     * @tc.number SUB_DLP_C_API_VOLUME_0246
     * @tc.desc   Verify IsInSandbox volume case 246.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0246 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0246 end');
    })
    /**
     * @tc.name   testDlpVolume0247
     * @tc.number SUB_DLP_C_API_VOLUME_0247
     * @tc.desc   Verify IsInSandbox volume case 247.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0247 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0247 end');
    })
    /**
     * @tc.name   testDlpVolume0248
     * @tc.number SUB_DLP_C_API_VOLUME_0248
     * @tc.desc   Verify IsInSandbox volume case 248.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0248 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0248 end');
    })
    /**
     * @tc.name   testDlpVolume0249
     * @tc.number SUB_DLP_C_API_VOLUME_0249
     * @tc.desc   Verify IsInSandbox volume case 249.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0249 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0249 end');
    })
    /**
     * @tc.name   testDlpVolume0250
     * @tc.number SUB_DLP_C_API_VOLUME_0250
     * @tc.desc   Verify IsInSandbox volume case 250.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0250 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0250 end');
    })
    /**
     * @tc.name   testDlpVolume0251
     * @tc.number SUB_DLP_C_API_VOLUME_0251
     * @tc.desc   Verify IsInSandbox volume case 251.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0251 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0251 end');
    })
    /**
     * @tc.name   testDlpVolume0252
     * @tc.number SUB_DLP_C_API_VOLUME_0252
     * @tc.desc   Verify IsInSandbox volume case 252.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0252 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0252 end');
    })
    /**
     * @tc.name   testDlpVolume0253
     * @tc.number SUB_DLP_C_API_VOLUME_0253
     * @tc.desc   Verify IsInSandbox volume case 253.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0253 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0253 end');
    })
    /**
     * @tc.name   testDlpVolume0254
     * @tc.number SUB_DLP_C_API_VOLUME_0254
     * @tc.desc   Verify IsInSandbox volume case 254.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0254 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0254 end');
    })
    /**
     * @tc.name   testDlpVolume0255
     * @tc.number SUB_DLP_C_API_VOLUME_0255
     * @tc.desc   Verify IsInSandbox volume case 255.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0255 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0255 end');
    })
    /**
     * @tc.name   testDlpVolume0256
     * @tc.number SUB_DLP_C_API_VOLUME_0256
     * @tc.desc   Verify IsInSandbox volume case 256.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0256 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0256 end');
    })
    /**
     * @tc.name   testDlpVolume0257
     * @tc.number SUB_DLP_C_API_VOLUME_0257
     * @tc.desc   Verify IsInSandbox volume case 257.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0257 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0257 end');
    })
    /**
     * @tc.name   testDlpVolume0258
     * @tc.number SUB_DLP_C_API_VOLUME_0258
     * @tc.desc   Verify IsInSandbox volume case 258.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0258 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0258 end');
    })
    /**
     * @tc.name   testDlpVolume0259
     * @tc.number SUB_DLP_C_API_VOLUME_0259
     * @tc.desc   Verify IsInSandbox volume case 259.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0259 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0259 end');
    })
    /**
     * @tc.name   testDlpVolume0260
     * @tc.number SUB_DLP_C_API_VOLUME_0260
     * @tc.desc   Verify IsInSandbox volume case 260.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0260 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0260 end');
    })
    /**
     * @tc.name   testDlpVolume0261
     * @tc.number SUB_DLP_C_API_VOLUME_0261
     * @tc.desc   Verify IsInSandbox volume case 261.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0261 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0261 end');
    })
    /**
     * @tc.name   testDlpVolume0262
     * @tc.number SUB_DLP_C_API_VOLUME_0262
     * @tc.desc   Verify IsInSandbox volume case 262.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0262 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0262 end');
    })
    /**
     * @tc.name   testDlpVolume0263
     * @tc.number SUB_DLP_C_API_VOLUME_0263
     * @tc.desc   Verify IsInSandbox volume case 263.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0263 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0263 end');
    })
    /**
     * @tc.name   testDlpVolume0264
     * @tc.number SUB_DLP_C_API_VOLUME_0264
     * @tc.desc   Verify IsInSandbox volume case 264.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0264 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0264 end');
    })
    /**
     * @tc.name   testDlpVolume0265
     * @tc.number SUB_DLP_C_API_VOLUME_0265
     * @tc.desc   Verify IsInSandbox volume case 265.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0265 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0265 end');
    })
    /**
     * @tc.name   testDlpVolume0266
     * @tc.number SUB_DLP_C_API_VOLUME_0266
     * @tc.desc   Verify IsInSandbox volume case 266.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0266 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0266 end');
    })
    /**
     * @tc.name   testDlpVolume0267
     * @tc.number SUB_DLP_C_API_VOLUME_0267
     * @tc.desc   Verify IsInSandbox volume case 267.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0267 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0267 end');
    })
    /**
     * @tc.name   testDlpVolume0268
     * @tc.number SUB_DLP_C_API_VOLUME_0268
     * @tc.desc   Verify IsInSandbox volume case 268.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0268 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0268 end');
    })
    /**
     * @tc.name   testDlpVolume0269
     * @tc.number SUB_DLP_C_API_VOLUME_0269
     * @tc.desc   Verify IsInSandbox volume case 269.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0269 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0269 end');
    })
    /**
     * @tc.name   testDlpVolume0270
     * @tc.number SUB_DLP_C_API_VOLUME_0270
     * @tc.desc   Verify IsInSandbox volume case 270.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0270 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0270 end');
    })
    /**
     * @tc.name   testDlpVolume0271
     * @tc.number SUB_DLP_C_API_VOLUME_0271
     * @tc.desc   Verify IsInSandbox volume case 271.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0271 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0271 end');
    })
    /**
     * @tc.name   testDlpVolume0272
     * @tc.number SUB_DLP_C_API_VOLUME_0272
     * @tc.desc   Verify IsInSandbox volume case 272.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0272 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0272 end');
    })
    /**
     * @tc.name   testDlpVolume0273
     * @tc.number SUB_DLP_C_API_VOLUME_0273
     * @tc.desc   Verify IsInSandbox volume case 273.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0273 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0273 end');
    })
    /**
     * @tc.name   testDlpVolume0274
     * @tc.number SUB_DLP_C_API_VOLUME_0274
     * @tc.desc   Verify IsInSandbox volume case 274.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0274 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0274 end');
    })
    /**
     * @tc.name   testDlpVolume0275
     * @tc.number SUB_DLP_C_API_VOLUME_0275
     * @tc.desc   Verify IsInSandbox volume case 275.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0275 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0275 end');
    })
    /**
     * @tc.name   testDlpVolume0276
     * @tc.number SUB_DLP_C_API_VOLUME_0276
     * @tc.desc   Verify IsInSandbox volume case 276.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0276 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0276 end');
    })
    /**
     * @tc.name   testDlpVolume0277
     * @tc.number SUB_DLP_C_API_VOLUME_0277
     * @tc.desc   Verify IsInSandbox volume case 277.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0277 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0277 end');
    })
    /**
     * @tc.name   testDlpVolume0278
     * @tc.number SUB_DLP_C_API_VOLUME_0278
     * @tc.desc   Verify IsInSandbox volume case 278.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0278 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0278 end');
    })
    /**
     * @tc.name   testDlpVolume0279
     * @tc.number SUB_DLP_C_API_VOLUME_0279
     * @tc.desc   Verify IsInSandbox volume case 279.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0279 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0279 end');
    })
    /**
     * @tc.name   testDlpVolume0280
     * @tc.number SUB_DLP_C_API_VOLUME_0280
     * @tc.desc   Verify IsInSandbox volume case 280.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0280 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0280 end');
    })
    /**
     * @tc.name   testDlpVolume0281
     * @tc.number SUB_DLP_C_API_VOLUME_0281
     * @tc.desc   Verify IsInSandbox volume case 281.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0281 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0281 end');
    })
    /**
     * @tc.name   testDlpVolume0282
     * @tc.number SUB_DLP_C_API_VOLUME_0282
     * @tc.desc   Verify IsInSandbox volume case 282.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0282 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0282 end');
    })
    /**
     * @tc.name   testDlpVolume0283
     * @tc.number SUB_DLP_C_API_VOLUME_0283
     * @tc.desc   Verify IsInSandbox volume case 283.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0283 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0283 end');
    })
    /**
     * @tc.name   testDlpVolume0284
     * @tc.number SUB_DLP_C_API_VOLUME_0284
     * @tc.desc   Verify IsInSandbox volume case 284.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0284 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0284 end');
    })
    /**
     * @tc.name   testDlpVolume0285
     * @tc.number SUB_DLP_C_API_VOLUME_0285
     * @tc.desc   Verify IsInSandbox volume case 285.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0285 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0285 end');
    })
    /**
     * @tc.name   testDlpVolume0286
     * @tc.number SUB_DLP_C_API_VOLUME_0286
     * @tc.desc   Verify IsInSandbox volume case 286.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0286 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0286 end');
    })
    /**
     * @tc.name   testDlpVolume0287
     * @tc.number SUB_DLP_C_API_VOLUME_0287
     * @tc.desc   Verify IsInSandbox volume case 287.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0287 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0287 end');
    })
    /**
     * @tc.name   testDlpVolume0288
     * @tc.number SUB_DLP_C_API_VOLUME_0288
     * @tc.desc   Verify IsInSandbox volume case 288.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0288 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0288 end');
    })
    /**
     * @tc.name   testDlpVolume0289
     * @tc.number SUB_DLP_C_API_VOLUME_0289
     * @tc.desc   Verify IsInSandbox volume case 289.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0289 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0289 end');
    })
    /**
     * @tc.name   testDlpVolume0290
     * @tc.number SUB_DLP_C_API_VOLUME_0290
     * @tc.desc   Verify IsInSandbox volume case 290.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0290 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0290 end');
    })
    /**
     * @tc.name   testDlpVolume0291
     * @tc.number SUB_DLP_C_API_VOLUME_0291
     * @tc.desc   Verify IsInSandbox volume case 291.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0291 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0291 end');
    })
    /**
     * @tc.name   testDlpVolume0292
     * @tc.number SUB_DLP_C_API_VOLUME_0292
     * @tc.desc   Verify IsInSandbox volume case 292.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0292 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0292 end');
    })
    /**
     * @tc.name   testDlpVolume0293
     * @tc.number SUB_DLP_C_API_VOLUME_0293
     * @tc.desc   Verify IsInSandbox volume case 293.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0293 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0293 end');
    })
    /**
     * @tc.name   testDlpVolume0294
     * @tc.number SUB_DLP_C_API_VOLUME_0294
     * @tc.desc   Verify IsInSandbox volume case 294.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0294 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0294 end');
    })
    /**
     * @tc.name   testDlpVolume0295
     * @tc.number SUB_DLP_C_API_VOLUME_0295
     * @tc.desc   Verify IsInSandbox volume case 295.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0295 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0295 end');
    })
    /**
     * @tc.name   testDlpVolume0296
     * @tc.number SUB_DLP_C_API_VOLUME_0296
     * @tc.desc   Verify IsInSandbox volume case 296.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0296 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0296 end');
    })
    /**
     * @tc.name   testDlpVolume0297
     * @tc.number SUB_DLP_C_API_VOLUME_0297
     * @tc.desc   Verify IsInSandbox volume case 297.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0297 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0297 end');
    })
    /**
     * @tc.name   testDlpVolume0298
     * @tc.number SUB_DLP_C_API_VOLUME_0298
     * @tc.desc   Verify IsInSandbox volume case 298.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0298 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0298 end');
    })
    /**
     * @tc.name   testDlpVolume0299
     * @tc.number SUB_DLP_C_API_VOLUME_0299
     * @tc.desc   Verify IsInSandbox volume case 299.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0299 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0299 end');
    })
    /**
     * @tc.name   testDlpVolume0300
     * @tc.number SUB_DLP_C_API_VOLUME_0300
     * @tc.desc   Verify IsInSandbox volume case 300.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDlpVolume0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0300 begin');
      const result: boolean | number = testNapi.IsInSandbox();
      expect(result === false).assertTrue();
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDlpVolume0300 end');
    })
  })
}
