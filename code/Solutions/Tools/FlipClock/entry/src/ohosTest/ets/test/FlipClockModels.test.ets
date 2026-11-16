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
import { TabType, Contact } from '../../../main/ets/common/DataSource';
import { testTabs as tabArray } from './FlipClockTestTabs';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockModelsTest() {
  describe('FlipClockModelsTest', () => {

    /**
     * @tc.name   testFlipClockModel0000
     * @tc.number SUB_FLIP_CLOCK_MODEL_0000
     * @tc.desc   Verify tab metadata entry 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockModel0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0000 begin');
      const item: TabType = tabArray[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(0);');
      expect(item.num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
      expect(item.icon !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
      expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0000 end');
    })

    /**
     * @tc.name   testFlipClockModel0001
     * @tc.number SUB_FLIP_CLOCK_MODEL_0001
     * @tc.desc   Verify tab metadata entry 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockModel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0001 begin');
      const item: TabType = tabArray[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(1);');
      expect(item.num).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
      expect(item.icon !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
      expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0001 end');
    })

    /**
     * @tc.name   testFlipClockModel0002
     * @tc.number SUB_FLIP_CLOCK_MODEL_0002
     * @tc.desc   Verify tab metadata entry 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockModel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0002 begin');
      const item: TabType = tabArray[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(2);');
      expect(item.num).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
      expect(item.icon !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
      expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0002 end');
    })

    /**
     * @tc.name   testFlipClockModel0003
     * @tc.number SUB_FLIP_CLOCK_MODEL_0003
     * @tc.desc   Verify tab metadata entry 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockModel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0003 begin');
      const item: TabType = tabArray[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(3);');
      expect(item.num).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
      expect(item.icon !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
      expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0003 end');
    })

    /**
     * @tc.name   testFlipClockModel0004
     * @tc.number SUB_FLIP_CLOCK_MODEL_0004
     * @tc.desc   Construct contact model 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockModel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0004 begin');
      const contact: Contact = new Contact('key0', 'value0', 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.key).assertEqual(\'key0\');');
      expect(contact.key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.value).assertEqual(\'value0\');');
      expect(contact.value).assertEqual('value0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.reminderId).assertEqual(0);');
      expect(contact.reminderId).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0004 end');
    })

    /**
     * @tc.name   testFlipClockModel0005
     * @tc.number SUB_FLIP_CLOCK_MODEL_0005
     * @tc.desc   Construct contact model 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockModel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0005 begin');
      const contact: Contact = new Contact('key1', 'value1', 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.key).assertEqual(\'key1\');');
      expect(contact.key).assertEqual('key1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.value).assertEqual(\'value1\');');
      expect(contact.value).assertEqual('value1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.reminderId).assertEqual(1);');
      expect(contact.reminderId).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0005 end');
    })

    /**
     * @tc.name   testFlipClockModel0006
     * @tc.number SUB_FLIP_CLOCK_MODEL_0006
     * @tc.desc   Construct contact model 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockModel0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0006 begin');
      const contact: Contact = new Contact('key2', 'value2', 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.key).assertEqual(\'key2\');');
      expect(contact.key).assertEqual('key2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.value).assertEqual(\'value2\');');
      expect(contact.value).assertEqual('value2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.reminderId).assertEqual(2);');
      expect(contact.reminderId).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0006 end');
    })

    /**
     * @tc.name   testFlipClockModel0007
     * @tc.number SUB_FLIP_CLOCK_MODEL_0007
     * @tc.desc   Construct contact model 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockModel0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0007 begin');
      const contact: Contact = new Contact('key3', 'value3', 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.key).assertEqual(\'key3\');');
      expect(contact.key).assertEqual('key3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.value).assertEqual(\'value3\');');
      expect(contact.value).assertEqual('value3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(contact.reminderId).assertEqual(3);');
      expect(contact.reminderId).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockModel0007 end');
    })
  })
}
