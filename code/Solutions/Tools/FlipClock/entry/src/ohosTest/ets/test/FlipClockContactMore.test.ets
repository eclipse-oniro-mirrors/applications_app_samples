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

export default function flipClockContactMoreTest() {
  describe('FlipClockContactMoreTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ContactMore_0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0000
     * @tc.desc   Construct contact variant 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactMore_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0001 begin');
      const contact: Contact = new Contact('key0', 'value0', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key0'));
      expect(contact.key).assertEqual('key0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value0'));
        expect(contact.value).assertEqual('value0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(0));
        expect(contact.reminderId).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactMore_0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0001
     * @tc.desc   Construct contact variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactMore_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0002 begin');
      const contact: Contact = new Contact('key1', 'value1', 100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key1'));
      expect(contact.key).assertEqual('key1');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value1'));
        expect(contact.value).assertEqual('value1');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(100));
        expect(contact.reminderId).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactMore_0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0002
     * @tc.desc   Construct contact variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactMore_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0003 begin');
      const contact: Contact = new Contact('key2', 'value2', 200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key2'));
      expect(contact.key).assertEqual('key2');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value2'));
        expect(contact.value).assertEqual('value2');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(200));
        expect(contact.reminderId).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactMore_0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0003
     * @tc.desc   Construct contact variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactMore_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0004 begin');
      const contact: Contact = new Contact('key3', 'value3', 300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key3'));
      expect(contact.key).assertEqual('key3');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value3'));
        expect(contact.value).assertEqual('value3');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(300));
        expect(contact.reminderId).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactMore_0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0004
     * @tc.desc   Construct contact variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactMore_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0005 begin');
      const contact: Contact = new Contact('key4', 'value4', 400);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key4'));
      expect(contact.key).assertEqual('key4');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value4'));
        expect(contact.value).assertEqual('value4');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(400));
        expect(contact.reminderId).assertEqual(400);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactMore_0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0005
     * @tc.desc   Construct contact variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactMore_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0006 begin');
      const contact: Contact = new Contact('key5', 'value5', 500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key5'));
      expect(contact.key).assertEqual('key5');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value5'));
        expect(contact.value).assertEqual('value5');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(500));
        expect(contact.reminderId).assertEqual(500);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactMore_0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0006
     * @tc.desc   Construct contact variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactMore_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0007 begin');
      const contact: Contact = new Contact('key6', 'value6', 600);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key6'));
      expect(contact.key).assertEqual('key6');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value6'));
        expect(contact.value).assertEqual('value6');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(600));
        expect(contact.reminderId).assertEqual(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactMore_0008
     * @tc.number SUB_FLIP_CLOCK_MORE3_CMORE_0007
     * @tc.desc   Construct contact variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactMore_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0008 begin');
      const contact: Contact = new Contact('key7', 'value7', 700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key7'));
      expect(contact.key).assertEqual('key7');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value7'));
        expect(contact.value).assertEqual('value7');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(700));
        expect(contact.reminderId).assertEqual(700);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactMore_0008 end');
    })
  })
}
