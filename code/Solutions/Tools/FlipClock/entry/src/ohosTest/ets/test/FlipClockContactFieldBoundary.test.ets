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

export default function flipClockContactFieldBoundaryTest() {
  describe('FlipClockContactFieldBoundaryTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ContactFieldBoundary_0001
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0001
     * @tc.desc   Construct contact boundary sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFieldBoundary_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0001 begin');
      const contact: Contact = new Contact('', '', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String(''));
      expect(contact.key).assertEqual('');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String(''));
        expect(contact.value).assertEqual('');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(0));
        expect(contact.reminderId).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFieldBoundary_0002
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0002
     * @tc.desc   Construct contact boundary sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFieldBoundary_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0002 begin');
      const contact: Contact = new Contact('k', 'v', -1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('k'));
      expect(contact.key).assertEqual('k');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('v'));
        expect(contact.value).assertEqual('v');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(-1));
        expect(contact.reminderId).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFieldBoundary_0003
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0003
     * @tc.desc   Construct contact boundary sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFieldBoundary_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0003 begin');
      const contact: Contact = new Contact('key', 'value', 9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key'));
      expect(contact.key).assertEqual('key');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value'));
        expect(contact.value).assertEqual('value');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(9007199254740991));
        expect(contact.reminderId).assertEqual(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFieldBoundary_0004
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0004
     * @tc.desc   Construct contact boundary sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFieldBoundary_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0004 begin');
      const contact: Contact = new Contact('key', 'value', -9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key'));
      expect(contact.key).assertEqual('key');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value'));
        expect(contact.value).assertEqual('value');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(-9007199254740991));
        expect(contact.reminderId).assertEqual(-9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFieldBoundary_0005
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0005
     * @tc.desc   Construct contact boundary sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFieldBoundary_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0005 begin');
      const contact: Contact = new Contact('longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong', 'valuevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevalue', 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong'));
      expect(contact.key).assertEqual('longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('valuevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevalue'));
        expect(contact.value).assertEqual('valuevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevaluevalue');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(1));
        expect(contact.reminderId).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFieldBoundary_0006
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0006
     * @tc.desc   Construct contact boundary sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFieldBoundary_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0006 begin');
      const contact: Contact = new Contact(' ', ' ', 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String(' '));
      expect(contact.key).assertEqual(' ');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String(' '));
        expect(contact.value).assertEqual(' ');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(2));
        expect(contact.reminderId).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFieldBoundary_0007
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0007
     * @tc.desc   Construct contact boundary sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFieldBoundary_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0007 begin');
      const contact: Contact = new Contact('0', '0', 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('0'));
      expect(contact.key).assertEqual('0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('0'));
        expect(contact.value).assertEqual('0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(3));
        expect(contact.reminderId).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactFieldBoundary_0008
     * @tc.number SUB_FLIP_CLOCK_BOUND_CONTACT_0008
     * @tc.desc   Construct contact boundary sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactFieldBoundary_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0008 begin');
      const contact: Contact = new Contact('key', 'value', -2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.key), String('key'));
      expect(contact.key).assertEqual('key');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.value), String('value'));
        expect(contact.value).assertEqual('value');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(contact.reminderId), String(-2147483648));
        expect(contact.reminderId).assertEqual(-2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactFieldBoundary_0008 end');
    })
  })
}
