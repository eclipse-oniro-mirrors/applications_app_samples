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
import { Constants } from '../../../main/ets/common/Constants';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function shakeLiveFormBasicTypesTest() {
  describe('ShakeLiveFormBasicTypesTest', () => {

    /**
     * @tc.name   testShakeBasic0001
     * @tc.number SUB_SHAKE_BASIC_0001
     * @tc.desc   Verify typeof Constants.OVERFLOW_LEFT_RATIO === \'number\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_LEFT_RATIO === 'number'));
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0001 end');
    })

    /**
     * @tc.name   testShakeBasic0002
     * @tc.number SUB_SHAKE_BASIC_0002
     * @tc.desc   Verify typeof Constants.OVERFLOW_LEFT_RATIO === \'number\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_LEFT_RATIO === 'number'));
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0002 end');
    })

    /**
     * @tc.name   testShakeBasic0003
     * @tc.number SUB_SHAKE_BASIC_0003
     * @tc.desc   Verify typeof Constants.OVERFLOW_LEFT_RATIO === \'number\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0003 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_LEFT_RATIO === 'number'));
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0003 end');
    })

    /**
     * @tc.name   testShakeBasic0004
     * @tc.number SUB_SHAKE_BASIC_0004
     * @tc.desc   Verify typeof Constants.OVERFLOW_LEFT_RATIO === \'number\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0004 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_LEFT_RATIO === 'number'));
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0004 end');
    })

    /**
     * @tc.name   testShakeBasic0005
     * @tc.number SUB_SHAKE_BASIC_0005
     * @tc.desc   Verify typeof Constants.OVERFLOW_LEFT_RATIO === \'number\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0005 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof Constants.OVERFLOW_LEFT_RATIO === 'number'));
      expect(typeof Constants.OVERFLOW_LEFT_RATIO === 'number').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0005 end');
    })

    /**
     * @tc.name   testShakeBasic0006
     * @tc.number SUB_SHAKE_BASIC_0006
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0006 end');
    })

    /**
     * @tc.name   testShakeBasic0007
     * @tc.number SUB_SHAKE_BASIC_0007
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0007 end');
    })

    /**
     * @tc.name   testShakeBasic0008
     * @tc.number SUB_SHAKE_BASIC_0008
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0008 end');
    })

    /**
     * @tc.name   testShakeBasic0009
     * @tc.number SUB_SHAKE_BASIC_0009
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0009 end');
    })

    /**
     * @tc.name   testShakeBasic0010
     * @tc.number SUB_SHAKE_BASIC_0010
     * @tc.desc   Verify a.onAddForm({}) is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAddForm({}) !== undefined));
        expect(a.onAddForm({}) !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBasic0010 end');
    })
  })
}
