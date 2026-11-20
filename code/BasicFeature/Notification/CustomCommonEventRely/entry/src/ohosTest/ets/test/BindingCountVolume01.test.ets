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
import { FormEventService } from '../../../main/ets/feature/FormEventService';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function bindingCountTest() {
  describe('BindingCountVolume01Test', () => {

    /**
     * @tc.name   testPublishCount0001
     * @tc.number SUB_CCER_BINDCHK_01_0001
     * @tc.desc   计数 0 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0001 begin');
      const result: boolean = FormEventService.isValidPublishCount(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0001 end');
    })

    /**
     * @tc.name   testPublishCount0002
     * @tc.number SUB_CCER_BINDCHK_01_0002
     * @tc.desc   计数 1 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0002 begin');
      const result: boolean = FormEventService.isValidPublishCount(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0002 end');
    })

    /**
     * @tc.name   testPublishCount0003
     * @tc.number SUB_CCER_BINDCHK_01_0003
     * @tc.desc   计数 2 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0003 begin');
      const result: boolean = FormEventService.isValidPublishCount(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0003 end');
    })

    /**
     * @tc.name   testPublishCount0004
     * @tc.number SUB_CCER_BINDCHK_01_0004
     * @tc.desc   计数 20 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0004 begin');
      const result: boolean = FormEventService.isValidPublishCount(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0004 end');
    })

    /**
     * @tc.name   testPublishCount0005
     * @tc.number SUB_CCER_BINDCHK_01_0005
     * @tc.desc   计数 100 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0005 begin');
      const result: boolean = FormEventService.isValidPublishCount(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0005 end');
    })

    /**
     * @tc.name   testPublishCount0006
     * @tc.number SUB_CCER_BINDCHK_01_0006
     * @tc.desc   计数 1000 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0006 begin');
      const result: boolean = FormEventService.isValidPublishCount(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0006 end');
    })

    /**
     * @tc.name   testPublishCount0007
     * @tc.number SUB_CCER_BINDCHK_01_0007
     * @tc.desc   计数 65535 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0007 begin');
      const result: boolean = FormEventService.isValidPublishCount(65535);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0007 end');
    })

    /**
     * @tc.name   testPublishCount0008
     * @tc.number SUB_CCER_BINDCHK_01_0008
     * @tc.desc   计数 65536 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0008 begin');
      const result: boolean = FormEventService.isValidPublishCount(65536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0008 end');
    })

    /**
     * @tc.name   testPublishCount0009
     * @tc.number SUB_CCER_BINDCHK_01_0009
     * @tc.desc   计数 2147483647 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0009 begin');
      const result: boolean = FormEventService.isValidPublishCount(2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0009 end');
    })

    /**
     * @tc.name   testPublishCount0010
     * @tc.number SUB_CCER_BINDCHK_01_0010
     * @tc.desc   计数 2147483648 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0010 begin');
      const result: boolean = FormEventService.isValidPublishCount(2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0010 end');
    })

    /**
     * @tc.name   testPublishCount0011
     * @tc.number SUB_CCER_BINDCHK_01_0011
     * @tc.desc   计数 -2147483648 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0011 begin');
      const result: boolean = FormEventService.isValidPublishCount(-2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0011 end');
    })

    /**
     * @tc.name   testPublishCount0012
     * @tc.number SUB_CCER_BINDCHK_01_0012
     * @tc.desc   计数 -2147483649 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0012 begin');
      const result: boolean = FormEventService.isValidPublishCount(-2147483649);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0012 end');
    })

    /**
     * @tc.name   testPublishCount0013
     * @tc.number SUB_CCER_BINDCHK_01_0013
     * @tc.desc   计数 9007199254740991 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0013 begin');
      const result: boolean = FormEventService.isValidPublishCount(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0013 end');
    })

    /**
     * @tc.name   testPublishCount0014
     * @tc.number SUB_CCER_BINDCHK_01_0014
     * @tc.desc   计数 Number.MAX_SAFE_INTEGER 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0014 begin');
      const result: boolean = FormEventService.isValidPublishCount(Number.MAX_SAFE_INTEGER);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0014 end');
    })

    /**
     * @tc.name   testPublishCount0015
     * @tc.number SUB_CCER_BINDCHK_01_0015
     * @tc.desc   计数 Number.MAX_SAFE_INTEGER - 1 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0015 begin');
      const result: boolean = FormEventService.isValidPublishCount(Number.MAX_SAFE_INTEGER - 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0015 end');
    })

    /**
     * @tc.name   testPublishCount0016
     * @tc.number SUB_CCER_BINDCHK_01_0016
     * @tc.desc   计数 9007199254740992 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0016 begin');
      const result: boolean = FormEventService.isValidPublishCount(9007199254740992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0016 end');
    })

    /**
     * @tc.name   testPublishCount0017
     * @tc.number SUB_CCER_BINDCHK_01_0017
     * @tc.desc   计数 1e15 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0017 begin');
      const result: boolean = FormEventService.isValidPublishCount(1e15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0017 end');
    })

    /**
     * @tc.name   testPublishCount0018
     * @tc.number SUB_CCER_BINDCHK_01_0018
     * @tc.desc   计数 1e16 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0018 begin');
      const result: boolean = FormEventService.isValidPublishCount(1e16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0018 end');
    })

    /**
     * @tc.name   testPublishCount0019
     * @tc.number SUB_CCER_BINDCHK_01_0019
     * @tc.desc   计数 1e20 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0019 begin');
      const result: boolean = FormEventService.isValidPublishCount(1e20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0019 end');
    })

    /**
     * @tc.name   testPublishCount0020
     * @tc.number SUB_CCER_BINDCHK_01_0020
     * @tc.desc   计数 1e21 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0020 begin');
      const result: boolean = FormEventService.isValidPublishCount(1e21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0020 end');
    })

    /**
     * @tc.name   testPublishCount0021
     * @tc.number SUB_CCER_BINDCHK_01_0021
     * @tc.desc   计数 -1 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0021 begin');
      const result: boolean = FormEventService.isValidPublishCount(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0021 end');
    })

    /**
     * @tc.name   testPublishCount0022
     * @tc.number SUB_CCER_BINDCHK_01_0022
     * @tc.desc   计数 -2 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0022 begin');
      const result: boolean = FormEventService.isValidPublishCount(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0022 end');
    })

    /**
     * @tc.name   testPublishCount0023
     * @tc.number SUB_CCER_BINDCHK_01_0023
     * @tc.desc   计数 -1000 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0023 begin');
      const result: boolean = FormEventService.isValidPublishCount(-1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0023 end');
    })

    /**
     * @tc.name   testPublishCount0024
     * @tc.number SUB_CCER_BINDCHK_01_0024
     * @tc.desc   计数 -1e12 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0024 begin');
      const result: boolean = FormEventService.isValidPublishCount(-1e12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0024 end');
    })

    /**
     * @tc.name   testPublishCount0025
     * @tc.number SUB_CCER_BINDCHK_01_0025
     * @tc.desc   计数 -0.5 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0025 begin');
      const result: boolean = FormEventService.isValidPublishCount(-0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0025 end');
    })

    /**
     * @tc.name   testPublishCount0026
     * @tc.number SUB_CCER_BINDCHK_01_0026
     * @tc.desc   计数 -1.5 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0026 begin');
      const result: boolean = FormEventService.isValidPublishCount(-1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0026 end');
    })

    /**
     * @tc.name   testPublishCount0027
     * @tc.number SUB_CCER_BINDCHK_01_0027
     * @tc.desc   计数 0.5 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0027 begin');
      const result: boolean = FormEventService.isValidPublishCount(0.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0027 end');
    })

    /**
     * @tc.name   testPublishCount0028
     * @tc.number SUB_CCER_BINDCHK_01_0028
     * @tc.desc   计数 1.5 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0028 begin');
      const result: boolean = FormEventService.isValidPublishCount(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0028 end');
    })

    /**
     * @tc.name   testPublishCount0029
     * @tc.number SUB_CCER_BINDCHK_01_0029
     * @tc.desc   计数 2.5 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0029 begin');
      const result: boolean = FormEventService.isValidPublishCount(2.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0029 end');
    })

    /**
     * @tc.name   testPublishCount0030
     * @tc.number SUB_CCER_BINDCHK_01_0030
     * @tc.desc   计数 NaN 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0030 begin');
      const result: boolean = FormEventService.isValidPublishCount(NaN);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0030 end');
    })

    /**
     * @tc.name   testPublishCount0031
     * @tc.number SUB_CCER_BINDCHK_01_0031
     * @tc.desc   计数 Infinity 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0031 begin');
      const result: boolean = FormEventService.isValidPublishCount(Infinity);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0031 end');
    })

    /**
     * @tc.name   testPublishCount0032
     * @tc.number SUB_CCER_BINDCHK_01_0032
     * @tc.desc   计数 -Infinity 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0032 begin');
      const result: boolean = FormEventService.isValidPublishCount(-Infinity);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0032 end');
    })

    /**
     * @tc.name   testPublishCount0033
     * @tc.number SUB_CCER_BINDCHK_01_0033
     * @tc.desc   计数 1e-7 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0033 begin');
      const result: boolean = FormEventService.isValidPublishCount(1e-7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0033 end');
    })

    /**
     * @tc.name   testPublishCount0034
     * @tc.number SUB_CCER_BINDCHK_01_0034
     * @tc.desc   计数 3.0000001 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0034 begin');
      const result: boolean = FormEventService.isValidPublishCount(3.0000001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0034 end');
    })

    /**
     * @tc.name   testPublishCount0035
     * @tc.number SUB_CCER_BINDCHK_01_0035
     * @tc.desc   计数 0.1 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0035 begin');
      const result: boolean = FormEventService.isValidPublishCount(0.1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0035 end');
    })

    /**
     * @tc.name   testPublishCount0036
     * @tc.number SUB_CCER_BINDCHK_01_0036
     * @tc.desc   计数 0.9 的合法性为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0036 begin');
      const result: boolean = FormEventService.isValidPublishCount(0.9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0036 end');
    })

    /**
     * @tc.name   testPublishCount0037
     * @tc.number SUB_CCER_BINDCHK_01_0037
     * @tc.desc   计数 -0.0 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0037 begin');
      const result: boolean = FormEventService.isValidPublishCount(-0.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0037 end');
    })

    /**
     * @tc.name   testPublishCount0038
     * @tc.number SUB_CCER_BINDCHK_01_0038
     * @tc.desc   计数 42 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0038 begin');
      const result: boolean = FormEventService.isValidPublishCount(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0038 end');
    })

    /**
     * @tc.name   testPublishCount0039
     * @tc.number SUB_CCER_BINDCHK_01_0039
     * @tc.desc   计数 7 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0039 begin');
      const result: boolean = FormEventService.isValidPublishCount(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0039 end');
    })

    /**
     * @tc.name   testPublishCount0040
     * @tc.number SUB_CCER_BINDCHK_01_0040
     * @tc.desc   计数 100000 的合法性为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0040 begin');
      const result: boolean = FormEventService.isValidPublishCount(100000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0040 end');
    })

    /**
     * @tc.name   testPublishCount0041
     * @tc.number SUB_CCER_BINDCHK_01_0041
     * @tc.desc   合法计数可直接用于绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishCount0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0041 begin');
      const result: boolean = FormEventService.isValidPublishCount(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(FormEventService.createBindingData(1024).data), String('{"publishCount":1024}'));
      expect(String(FormEventService.createBindingData(1024).data)).assertContain('"publishCount":1024');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishCount0041 end');
    })

  })
}
