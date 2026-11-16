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

export default function flipClockContactPropertiesTest() {
  describe('FlipClockContactPropertiesTest', () => {

    /**
     * @tc.name   testFlipClockContactProp0000
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0000
     * @tc.desc   Verify contact property variant 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0000 begin');
      const c: Contact = new Contact('key0', 'value0', 50);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key0'));
        expect(c.key).assertEqual('key0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value0'));
        expect(c.value).assertEqual('value0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(50));
        expect(c.reminderId).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0000 end');
    })

    /**
     * @tc.name   testFlipClockContactProp0001
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0001
     * @tc.desc   Verify contact property variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0001 begin');
      const c: Contact = new Contact('key1', 'value1', 51);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key1'));
        expect(c.key).assertEqual('key1');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value1'));
        expect(c.value).assertEqual('value1');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(51));
        expect(c.reminderId).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0001 end');
    })

    /**
     * @tc.name   testFlipClockContactProp0002
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0002
     * @tc.desc   Verify contact property variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0002 begin');
      const c: Contact = new Contact('key2', 'value2', 52);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key2'));
        expect(c.key).assertEqual('key2');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value2'));
        expect(c.value).assertEqual('value2');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(52));
        expect(c.reminderId).assertEqual(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0002 end');
    })

    /**
     * @tc.name   testFlipClockContactProp0003
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0003
     * @tc.desc   Verify contact property variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0003 begin');
      const c: Contact = new Contact('key3', 'value3', 53);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key3'));
        expect(c.key).assertEqual('key3');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value3'));
        expect(c.value).assertEqual('value3');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(53));
        expect(c.reminderId).assertEqual(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0003 end');
    })

    /**
     * @tc.name   testFlipClockContactProp0004
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0004
     * @tc.desc   Verify contact property variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0004 begin');
      const c: Contact = new Contact('key4', 'value4', 54);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key4'));
        expect(c.key).assertEqual('key4');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value4'));
        expect(c.value).assertEqual('value4');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(54));
        expect(c.reminderId).assertEqual(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0004 end');
    })

    /**
     * @tc.name   testFlipClockContactProp0005
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0005
     * @tc.desc   Verify contact property variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0005 begin');
      const c: Contact = new Contact('key5', 'value5', 55);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key5'));
        expect(c.key).assertEqual('key5');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value5'));
        expect(c.value).assertEqual('value5');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(55));
        expect(c.reminderId).assertEqual(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0005 end');
    })

    /**
     * @tc.name   testFlipClockContactProp0006
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0006
     * @tc.desc   Verify contact property variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0006 begin');
      const c: Contact = new Contact('key6', 'value6', 56);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key6'));
        expect(c.key).assertEqual('key6');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value6'));
        expect(c.value).assertEqual('value6');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(56));
        expect(c.reminderId).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0006 end');
    })

    /**
     * @tc.name   testFlipClockContactProp0007
     * @tc.number SUB_FLIP_CLOCK_MORE4_CPROP_0007
     * @tc.desc   Verify contact property variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactProp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0007 begin');
      const c: Contact = new Contact('key7', 'value7', 57);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.key), String('key7'));
        expect(c.key).assertEqual('key7');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.value), String('value7'));
        expect(c.value).assertEqual('value7');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(c.reminderId), String(57));
        expect(c.reminderId).assertEqual(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactProp0007 end');
    })
  })
}
