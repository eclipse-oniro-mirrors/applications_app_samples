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

export default function flipClockContactFieldsTest() {
  describe('FlipClockContactFieldsTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ContactFields_0001
     * @tc.number SUB_FLIP_CLOCK_MORE2_CONTACT_0001
     * @tc.desc   Verify contact field sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFields_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0001 begin');
      const contact: Contact = new Contact('k1', 'v1', 1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('k1'));
        expect(contact.key).assertEqual('k1');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('v1'));
        expect(contact.value).assertEqual('v1');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(1));
        expect(contact.reminderId).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFields_0002
     * @tc.number SUB_FLIP_CLOCK_MORE2_CONTACT_0002
     * @tc.desc   Verify contact field sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFields_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0002 begin');
      const contact: Contact = new Contact('k2', 'v2', 2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('k2'));
        expect(contact.key).assertEqual('k2');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('v2'));
        expect(contact.value).assertEqual('v2');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(2));
        expect(contact.reminderId).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFields_0003
     * @tc.number SUB_FLIP_CLOCK_MORE2_CONTACT_0003
     * @tc.desc   Verify contact field sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFields_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0003 begin');
      const contact: Contact = new Contact('k3', 'v3', 3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('k3'));
        expect(contact.key).assertEqual('k3');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('v3'));
        expect(contact.value).assertEqual('v3');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(3));
        expect(contact.reminderId).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFields_0004
     * @tc.number SUB_FLIP_CLOCK_MORE2_CONTACT_0004
     * @tc.desc   Verify contact field sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFields_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0004 begin');
      const contact: Contact = new Contact('k4', 'v4', 4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('k4'));
        expect(contact.key).assertEqual('k4');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('v4'));
        expect(contact.value).assertEqual('v4');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(4));
        expect(contact.reminderId).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFields_0005
     * @tc.number SUB_FLIP_CLOCK_MORE2_CONTACT_0005
     * @tc.desc   Verify contact field sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFields_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0005 begin');
      const contact: Contact = new Contact('k5', 'v5', 5);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('k5'));
        expect(contact.key).assertEqual('k5');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('v5'));
        expect(contact.value).assertEqual('v5');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(5));
        expect(contact.reminderId).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFields_0006
     * @tc.number SUB_FLIP_CLOCK_MORE2_CONTACT_0006
     * @tc.desc   Verify contact field sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFields_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0006 begin');
      const contact: Contact = new Contact('k6', 'v6', 6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('k6'));
        expect(contact.key).assertEqual('k6');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('v6'));
        expect(contact.value).assertEqual('v6');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(6));
        expect(contact.reminderId).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFields_0007
     * @tc.number SUB_FLIP_CLOCK_MORE2_CONTACT_0007
     * @tc.desc   Verify contact field sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFields_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0007 begin');
      const contact: Contact = new Contact('k7', 'v7', 7);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('k7'));
        expect(contact.key).assertEqual('k7');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('v7'));
        expect(contact.value).assertEqual('v7');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(7));
        expect(contact.reminderId).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFields_0008
     * @tc.number SUB_FLIP_CLOCK_MORE2_CONTACT_0008
     * @tc.desc   Verify contact field sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFields_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0008 begin');
      const contact: Contact = new Contact('k8', 'value-8', 8);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('k8'));
        expect(contact.key).assertEqual('k8');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value-8'));
        expect(contact.value).assertEqual('value-8');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(8));
        expect(contact.reminderId).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFields_0008 end');
    })
  })
}
