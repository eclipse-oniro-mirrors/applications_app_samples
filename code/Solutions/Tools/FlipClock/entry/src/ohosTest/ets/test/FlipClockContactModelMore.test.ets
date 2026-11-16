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

export default function flipClockContactModelMoreTest() {
  describe('FlipClockContactModelMoreTest', () => {

    /**
     * @tc.name   testFlipClockContactMore20000
     * @tc.number SUB_FLIP_CLOCK_MORE6_CMORE_0000
     * @tc.desc   Verify contact model 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore20000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20000 begin');
      const c: Contact = new Contact('key0', 'value0', 0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key0'));
        expect(c.key).assertEqual('key0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value0'));
        expect(c.value).assertEqual('value0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(0));
        expect(c.reminderId).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20000 end');
    })

    /**
     * @tc.name   testFlipClockContactMore20001
     * @tc.number SUB_FLIP_CLOCK_MORE6_CMORE_0001
     * @tc.desc   Verify contact model 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20001 begin');
      const c: Contact = new Contact('key1', 'value1', 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key1'));
        expect(c.key).assertEqual('key1');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value1'));
        expect(c.value).assertEqual('value1');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(1));
        expect(c.reminderId).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20001 end');
    })

    /**
     * @tc.name   testFlipClockContactMore20002
     * @tc.number SUB_FLIP_CLOCK_MORE6_CMORE_0002
     * @tc.desc   Verify contact model 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20002 begin');
      const c: Contact = new Contact('key2', 'value2', 2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key2'));
        expect(c.key).assertEqual('key2');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value2'));
        expect(c.value).assertEqual('value2');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(2));
        expect(c.reminderId).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20002 end');
    })

    /**
     * @tc.name   testFlipClockContactMore20003
     * @tc.number SUB_FLIP_CLOCK_MORE6_CMORE_0003
     * @tc.desc   Verify contact model 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20003 begin');
      const c: Contact = new Contact('key3', 'value3', 3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key3'));
        expect(c.key).assertEqual('key3');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value3'));
        expect(c.value).assertEqual('value3');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(3));
        expect(c.reminderId).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20003 end');
    })

    /**
     * @tc.name   testFlipClockContactMore20004
     * @tc.number SUB_FLIP_CLOCK_MORE6_CMORE_0004
     * @tc.desc   Verify contact model 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20004 begin');
      const c: Contact = new Contact('key4', 'value4', 4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key4'));
        expect(c.key).assertEqual('key4');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value4'));
        expect(c.value).assertEqual('value4');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(4));
        expect(c.reminderId).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20004 end');
    })

    /**
     * @tc.name   testFlipClockContactMore20005
     * @tc.number SUB_FLIP_CLOCK_MORE6_CMORE_0005
     * @tc.desc   Verify contact model 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20005 begin');
      const c: Contact = new Contact('key5', 'value5', 5);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key5'));
        expect(c.key).assertEqual('key5');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value5'));
        expect(c.value).assertEqual('value5');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(5));
        expect(c.reminderId).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20005 end');
    })

    /**
     * @tc.name   testFlipClockContactMore20006
     * @tc.number SUB_FLIP_CLOCK_MORE6_CMORE_0006
     * @tc.desc   Verify contact model 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20006 begin');
      const c: Contact = new Contact('key6', 'value6', 6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key6'));
        expect(c.key).assertEqual('key6');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value6'));
        expect(c.value).assertEqual('value6');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(6));
        expect(c.reminderId).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20006 end');
    })

    /**
     * @tc.name   testFlipClockContactMore20007
     * @tc.number SUB_FLIP_CLOCK_MORE6_CMORE_0007
     * @tc.desc   Verify contact model 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactMore20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20007 begin');
      const c: Contact = new Contact('key7', 'value7', 7);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key7'));
        expect(c.key).assertEqual('key7');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value7'));
        expect(c.value).assertEqual('value7');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(7));
        expect(c.reminderId).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactMore20007 end');
    })
  })
}
