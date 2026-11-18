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
import { formatTime, getFileNameFromUrl } from 'multiplefilesdownload/src/main/ets/utils/formatTime';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MultipleFilesDownload]';

export default function FormatTimeEdgesPart1Test(): void {
  describe('FormatTimeEdgesPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_0100
     * @tc.name      testInvalidString0001
     * @tc.desc      Verify an invalid date string returns an empty result.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvalidString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidString0001 begin');
      expect(formatTime('invalid')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidString0001 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_0200
     * @tc.name      testInvalidText0002
     * @tc.desc      Verify an arbitrary text value returns an empty result.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInvalidText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidText0002 begin');
      expect(formatTime('abc')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInvalidText0002 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_0300
     * @tc.name      testEmptyString0003
     * @tc.desc      Verify an empty string returns an empty result.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testEmptyString0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyString0003 begin');
      expect(formatTime('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyString0003 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_0400
     * @tc.name      testNaN0004
     * @tc.desc      Verify NaN returns an empty result.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNaN0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNaN0004 begin');
      expect(formatTime(NaN)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNaN0004 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_0500
     * @tc.name      testInfinity0005
     * @tc.desc      Verify positive infinity returns an empty result.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfinity0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfinity0005 begin');
      expect(formatTime(Infinity)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfinity0005 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_0600
     * @tc.name      testNegInfinity0006
     * @tc.desc      Verify negative infinity returns an empty result.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNegInfinity0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegInfinity0006 begin');
      expect(formatTime(-Infinity)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNegInfinity0006 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_0700
     * @tc.name      testDefaultFormat0007
     * @tc.desc      Verify the default format uses YYYY-MM-DD HH:mm:ss.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDefaultFormat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDefaultFormat0007 begin');
      const value: Date = new Date(2026, 0, 2, 3, 4, 5);
      expect(formatTime(value)).assertEqual('2026-01-02 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDefaultFormat0007 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_0800
     * @tc.name      testLiteralFormat0008
     * @tc.desc      Verify a format without tokens is returned unchanged.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLiteralFormat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLiteralFormat0008 begin');
      const value: Date = new Date(2026, 0, 2, 3, 4, 5);
      expect(formatTime(value, 'literal')).assertEqual('literal');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLiteralFormat0008 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_0900
     * @tc.name      testUnknownToken0009
     * @tc.desc      Verify unknown tokens are preserved.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUnknownToken0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnknownToken0009 begin');
      const value: Date = new Date(2026, 0, 2, 3, 4, 5);
      expect(formatTime(value, 'YYYY-XX')).assertEqual('2026-XX');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnknownToken0009 end');
    })

    /**
     * @tc.number    SUB_MULTI_DOWNLOAD_FTEDGEP1_1000
     * @tc.name      testRepeatedToken0010
     * @tc.desc      Verify repeated year tokens are expanded twice.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatedToken0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedToken0010 begin');
      const value: Date = new Date(2026, 0, 2, 3, 4, 5);
      expect(formatTime(value, 'YYYYYYYY')).assertEqual('20262026');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedToken0010 end');
    })

  })
}
