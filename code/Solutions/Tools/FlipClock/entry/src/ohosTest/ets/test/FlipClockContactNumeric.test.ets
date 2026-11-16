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
import { Contact } from '../../../main/ets/common/DataSource';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockContactNumericTest() {
  describe('FlipClockContactNumericTest', () => {

    /**
     * @tc.name   testFlipClockContactNumeric0000
     * @tc.number SUB_FLIP_CLOCK_MORE5_CNUM_0000
     * @tc.desc   Construct numeric contact 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactNumeric0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0000 begin');
      const c: Contact = new Contact(String(0), String(0), 0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String(String(0)));
        expect(c.key).assertEqual(String(0));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String(String(0)));
        expect(c.value).assertEqual(String(0));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(0));
        expect(c.reminderId).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0000 end');
    })

    /**
     * @tc.name   testFlipClockContactNumeric0001
     * @tc.number SUB_FLIP_CLOCK_MORE5_CNUM_0001
     * @tc.desc   Construct numeric contact 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactNumeric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0001 begin');
      const c: Contact = new Contact(String(1), String(10), 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String(String(1)));
        expect(c.key).assertEqual(String(1));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String(String(10)));
        expect(c.value).assertEqual(String(10));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(1));
        expect(c.reminderId).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0001 end');
    })

    /**
     * @tc.name   testFlipClockContactNumeric0002
     * @tc.number SUB_FLIP_CLOCK_MORE5_CNUM_0002
     * @tc.desc   Construct numeric contact 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactNumeric0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0002 begin');
      const c: Contact = new Contact(String(2), String(20), 2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String(String(2)));
        expect(c.key).assertEqual(String(2));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String(String(20)));
        expect(c.value).assertEqual(String(20));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(2));
        expect(c.reminderId).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0002 end');
    })

    /**
     * @tc.name   testFlipClockContactNumeric0003
     * @tc.number SUB_FLIP_CLOCK_MORE5_CNUM_0003
     * @tc.desc   Construct numeric contact 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactNumeric0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0003 begin');
      const c: Contact = new Contact(String(3), String(30), 3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String(String(3)));
        expect(c.key).assertEqual(String(3));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String(String(30)));
        expect(c.value).assertEqual(String(30));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(3));
        expect(c.reminderId).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0003 end');
    })

    /**
     * @tc.name   testFlipClockContactNumeric0004
     * @tc.number SUB_FLIP_CLOCK_MORE5_CNUM_0004
     * @tc.desc   Construct numeric contact 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactNumeric0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0004 begin');
      const c: Contact = new Contact(String(4), String(40), 4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String(String(4)));
        expect(c.key).assertEqual(String(4));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String(String(40)));
        expect(c.value).assertEqual(String(40));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(4));
        expect(c.reminderId).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0004 end');
    })

    /**
     * @tc.name   testFlipClockContactNumeric0005
     * @tc.number SUB_FLIP_CLOCK_MORE5_CNUM_0005
     * @tc.desc   Construct numeric contact 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactNumeric0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0005 begin');
      const c: Contact = new Contact(String(5), String(50), 5);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String(String(5)));
        expect(c.key).assertEqual(String(5));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String(String(50)));
        expect(c.value).assertEqual(String(50));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(5));
        expect(c.reminderId).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0005 end');
    })

    /**
     * @tc.name   testFlipClockContactNumeric0006
     * @tc.number SUB_FLIP_CLOCK_MORE5_CNUM_0006
     * @tc.desc   Construct numeric contact 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactNumeric0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0006 begin');
      const c: Contact = new Contact(String(6), String(60), 6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String(String(6)));
        expect(c.key).assertEqual(String(6));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String(String(60)));
        expect(c.value).assertEqual(String(60));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(6));
        expect(c.reminderId).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0006 end');
    })

    /**
     * @tc.name   testFlipClockContactNumeric0007
     * @tc.number SUB_FLIP_CLOCK_MORE5_CNUM_0007
     * @tc.desc   Construct numeric contact 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactNumeric0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0007 begin');
      const c: Contact = new Contact(String(7), String(70), 7);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String(String(7)));
        expect(c.key).assertEqual(String(7));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String(String(70)));
        expect(c.value).assertEqual(String(70));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(7));
        expect(c.reminderId).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactNumeric0007 end');
    })
  })
}
