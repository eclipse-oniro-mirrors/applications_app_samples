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
import { Formatter } from 'library';

const DOMAIN: number = 0xF811;

export default function formatterLogicTest() {
  describe('FormatterLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_FORMATTER_0100
     * @tc.name      testFormatterBytes0001
     * @tc.desc      Verify bytes() renders B, KB and MB units exactly at the
     *               1024 and 1048576 byte boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(0)).assertEqual('0 B');
      expect(Formatter.bytes(1023)).assertEqual('1023 B');
      expect(Formatter.bytes(1024)).assertEqual('1.0 KB');
      expect(Formatter.bytes(1536)).assertEqual('1.5 KB');
      expect(Formatter.bytes(1048575)).assertEqual('1024.0 KB');
      expect(Formatter.bytes(1048576)).assertEqual('1.00 MB');
      expect(Formatter.bytes(3145728)).assertEqual('3.00 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FORMATTER_0200
     * @tc.name      testFormatterBytes0002
     * @tc.desc      Verify bytes() keeps the B unit for small and negative sizes
     *               and never switches unit below the KB threshold.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(1)).assertEqual('1 B');
      expect(Formatter.bytes(999)).assertEqual('999 B');
      expect(Formatter.bytes(1025)).assertEqual('1.0 KB');
      expect(Formatter.bytes(-1)).assertEqual('-1 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FORMATTER_0300
     * @tc.name      testFormatterTime0001
     * @tc.desc      Verify time() renders yyyy-MM-dd HH:mm:ss with zero padding
     *               for single-digit date and time components.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampA: number = new Date(2026, 0, 5, 7, 8, 9).getTime();
      expect(Formatter.time(stampA)).assertEqual('2026-01-05 07:08:09');
      const stampB: number = new Date(2026, 10, 25, 23, 59, 59).getTime();
      expect(Formatter.time(stampB)).assertEqual('2026-11-25 23:59:59');
      const stampC: number = new Date(2026, 2, 9, 5, 6, 7).getTime();
      expect(Formatter.time(stampC)).assertEqual('2026-03-09 05:06:07');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FORMATTER_0400
     * @tc.name      testFormatterFileStamp0001
     * @tc.desc      Verify fileStamp() renders a compact yyyyMMdd_HHmmss stamp
     *               with the underscore separator at a fixed position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterFileStamp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterFileStamp0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampA: number = new Date(2026, 0, 5, 7, 8, 9).getTime();
      const textA: string = Formatter.fileStamp(stampA);
      expect(textA).assertEqual('20260105_070809');
      expect(textA.length).assertEqual(15);
      expect(textA.charAt(8)).assertEqual('_');
      const stampB: number = new Date(2026, 11, 31, 23, 59, 59).getTime();
      expect(Formatter.fileStamp(stampB)).assertEqual('20261231_235959');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FORMATTER_0500
     * @tc.name      testFormatterInitial0001
     * @tc.desc      Verify initial() uppercases the first letter, trims leading
     *               spaces and falls back to '#' for empty, digit and CJK names.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('Alice')).assertEqual('A');
      expect(Formatter.initial('alice')).assertEqual('A');
      expect(Formatter.initial('  Bob ')).assertEqual('B');
      expect(Formatter.initial('')).assertEqual('#');
      expect(Formatter.initial('   ')).assertEqual('#');
      expect(Formatter.initial('123')).assertEqual('#');
      expect(Formatter.initial('张三')).assertEqual('#');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
