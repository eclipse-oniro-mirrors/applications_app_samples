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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { subscriberIdOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for subscriberIdOf (90 cases). */
export default function subscriberIdOfTest(): void {
  describe('SubscriberIdOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0001
     * @tc.name      FormExtAbility_SubscriberIdOf_0001
     * @tc.desc      subscriberIdOf(persistedId="") returns "110000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_SubscriberIdOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0001 begin`);
      const actual: string = subscriberIdOf('');
      logInfo(`subscriberIdOf(persistedId=""): actual=${actual}`);
      expect(actual).assertEqual('110000');
      logInfo(`${BUNDLE}SubscriberIdOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0002
     * @tc.name      FormExtAbility_SubscriberIdOf_0002
     * @tc.desc      subscriberIdOf(persistedId="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_SubscriberIdOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0002 begin`);
      const actual: string = subscriberIdOf('x');
      logInfo(`subscriberIdOf(persistedId="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}SubscriberIdOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0003
     * @tc.name      FormExtAbility_SubscriberIdOf_0003
     * @tc.desc      subscriberIdOf(persistedId="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0003 begin`);
      const actual: string = subscriberIdOf('a');
      logInfo(`subscriberIdOf(persistedId="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}SubscriberIdOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0004
     * @tc.name      FormExtAbility_SubscriberIdOf_0004
     * @tc.desc      subscriberIdOf(persistedId="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0004 begin`);
      const actual: string = subscriberIdOf('abc');
      logInfo(`subscriberIdOf(persistedId="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}SubscriberIdOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0005
     * @tc.name      FormExtAbility_SubscriberIdOf_0005
     * @tc.desc      subscriberIdOf(persistedId="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0005 begin`);
      const actual: string = subscriberIdOf('Hello World');
      logInfo(`subscriberIdOf(persistedId="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}SubscriberIdOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0006
     * @tc.name      FormExtAbility_SubscriberIdOf_0006
     * @tc.desc      subscriberIdOf(persistedId=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0006 begin`);
      const actual: string = subscriberIdOf(' ');
      logInfo(`subscriberIdOf(persistedId=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubscriberIdOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0007
     * @tc.name      FormExtAbility_SubscriberIdOf_0007
     * @tc.desc      subscriberIdOf(persistedId="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0007 begin`);
      const actual: string = subscriberIdOf('123');
      logInfo(`subscriberIdOf(persistedId="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}SubscriberIdOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0008
     * @tc.name      FormExtAbility_SubscriberIdOf_0008
     * @tc.desc      subscriberIdOf(persistedId=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0008 begin`);
      const actual: string = subscriberIdOf(' x ');
      logInfo(`subscriberIdOf(persistedId=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}SubscriberIdOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0009
     * @tc.name      FormExtAbility_SubscriberIdOf_0009
     * @tc.desc      subscriberIdOf(persistedId="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0009 begin`);
      const actual: string = subscriberIdOf('xx');
      logInfo(`subscriberIdOf(persistedId="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}SubscriberIdOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0010
     * @tc.name      FormExtAbility_SubscriberIdOf_0010
     * @tc.desc      subscriberIdOf(persistedId="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0010 begin`);
      const actual: string = subscriberIdOf('x_1');
      logInfo(`subscriberIdOf(persistedId="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}SubscriberIdOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0011
     * @tc.name      FormExtAbility_SubscriberIdOf_0011
     * @tc.desc      subscriberIdOf(persistedId=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0011 begin`);
      const actual: string = subscriberIdOf(' a ');
      logInfo(`subscriberIdOf(persistedId=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}SubscriberIdOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0012
     * @tc.name      FormExtAbility_SubscriberIdOf_0012
     * @tc.desc      subscriberIdOf(persistedId="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0012 begin`);
      const actual: string = subscriberIdOf('aa');
      logInfo(`subscriberIdOf(persistedId="aa"): actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}SubscriberIdOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0013
     * @tc.name      FormExtAbility_SubscriberIdOf_0013
     * @tc.desc      subscriberIdOf(persistedId="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0013 begin`);
      const actual: string = subscriberIdOf('a_1');
      logInfo(`subscriberIdOf(persistedId="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}SubscriberIdOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0014
     * @tc.name      FormExtAbility_SubscriberIdOf_0014
     * @tc.desc      subscriberIdOf(persistedId="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0014 begin`);
      const actual: string = subscriberIdOf('xa');
      logInfo(`subscriberIdOf(persistedId="xa"): actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}SubscriberIdOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0015
     * @tc.name      FormExtAbility_SubscriberIdOf_0015
     * @tc.desc      subscriberIdOf(persistedId=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0015 begin`);
      const actual: string = subscriberIdOf(' abc ');
      logInfo(`subscriberIdOf(persistedId=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}SubscriberIdOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0016
     * @tc.name      FormExtAbility_SubscriberIdOf_0016
     * @tc.desc      subscriberIdOf(persistedId="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0016 begin`);
      const actual: string = subscriberIdOf('abcabc');
      logInfo(`subscriberIdOf(persistedId="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}SubscriberIdOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0017
     * @tc.name      FormExtAbility_SubscriberIdOf_0017
     * @tc.desc      subscriberIdOf(persistedId="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0017 begin`);
      const actual: string = subscriberIdOf('abc_1');
      logInfo(`subscriberIdOf(persistedId="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}SubscriberIdOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0018
     * @tc.name      FormExtAbility_SubscriberIdOf_0018
     * @tc.desc      subscriberIdOf(persistedId="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0018 begin`);
      const actual: string = subscriberIdOf('xabc');
      logInfo(`subscriberIdOf(persistedId="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}SubscriberIdOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0019
     * @tc.name      FormExtAbility_SubscriberIdOf_0019
     * @tc.desc      subscriberIdOf(persistedId=" Hello World ") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0019 begin`);
      const actual: string = subscriberIdOf(' Hello World ');
      logInfo(`subscriberIdOf(persistedId=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}SubscriberIdOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0020
     * @tc.name      FormExtAbility_SubscriberIdOf_0020
     * @tc.desc      subscriberIdOf(persistedId="Hello WorldHello World") returns "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0020 begin`);
      const actual: string = subscriberIdOf('Hello WorldHello World');
      logInfo(`subscriberIdOf(persistedId="Hello WorldHe...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}SubscriberIdOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0021
     * @tc.name      FormExtAbility_SubscriberIdOf_0021
     * @tc.desc      subscriberIdOf(persistedId="Hello World_1") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0021 begin`);
      const actual: string = subscriberIdOf('Hello World_1');
      logInfo(`subscriberIdOf(persistedId="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}SubscriberIdOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0022
     * @tc.name      FormExtAbility_SubscriberIdOf_0022
     * @tc.desc      subscriberIdOf(persistedId="xHello World") returns "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0022 begin`);
      const actual: string = subscriberIdOf('xHello World');
      logInfo(`subscriberIdOf(persistedId="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`${BUNDLE}SubscriberIdOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0023
     * @tc.name      FormExtAbility_SubscriberIdOf_0023
     * @tc.desc      subscriberIdOf(persistedId="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0023 begin`);
      const actual: string = subscriberIdOf('   ');
      logInfo(`subscriberIdOf(persistedId="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}SubscriberIdOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0024
     * @tc.name      FormExtAbility_SubscriberIdOf_0024
     * @tc.desc      subscriberIdOf(persistedId="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0024 begin`);
      const actual: string = subscriberIdOf('  ');
      logInfo(`subscriberIdOf(persistedId="  "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}SubscriberIdOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0025
     * @tc.name      FormExtAbility_SubscriberIdOf_0025
     * @tc.desc      subscriberIdOf(persistedId=" _1") returns " _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0025 begin`);
      const actual: string = subscriberIdOf(' _1');
      logInfo(`subscriberIdOf(persistedId=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' _1');
      logInfo(`${BUNDLE}SubscriberIdOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0026
     * @tc.name      FormExtAbility_SubscriberIdOf_0026
     * @tc.desc      subscriberIdOf(persistedId="x ") returns "x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0026 begin`);
      const actual: string = subscriberIdOf('x ');
      logInfo(`subscriberIdOf(persistedId="x "): actual=${actual}`);
      expect(actual).assertEqual('x ');
      logInfo(`${BUNDLE}SubscriberIdOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0027
     * @tc.name      FormExtAbility_SubscriberIdOf_0027
     * @tc.desc      subscriberIdOf(persistedId=" 123 ") returns " 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0027 begin`);
      const actual: string = subscriberIdOf(' 123 ');
      logInfo(`subscriberIdOf(persistedId=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' 123 ');
      logInfo(`${BUNDLE}SubscriberIdOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0028
     * @tc.name      FormExtAbility_SubscriberIdOf_0028
     * @tc.desc      subscriberIdOf(persistedId="123123") returns "123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0028 begin`);
      const actual: string = subscriberIdOf('123123');
      logInfo(`subscriberIdOf(persistedId="123123"): actual=${actual}`);
      expect(actual).assertEqual('123123');
      logInfo(`${BUNDLE}SubscriberIdOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0029
     * @tc.name      FormExtAbility_SubscriberIdOf_0029
     * @tc.desc      subscriberIdOf(persistedId="123_1") returns "123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0029 begin`);
      const actual: string = subscriberIdOf('123_1');
      logInfo(`subscriberIdOf(persistedId="123_1"): actual=${actual}`);
      expect(actual).assertEqual('123_1');
      logInfo(`${BUNDLE}SubscriberIdOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0030
     * @tc.name      FormExtAbility_SubscriberIdOf_0030
     * @tc.desc      subscriberIdOf(persistedId="x123") returns "x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_SubscriberIdOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0030 begin`);
      const actual: string = subscriberIdOf('x123');
      logInfo(`subscriberIdOf(persistedId="x123"): actual=${actual}`);
      expect(actual).assertEqual('x123');
      logInfo(`${BUNDLE}SubscriberIdOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0031
     * @tc.name      FormExtAbility_SubscriberIdOf_0031
     * @tc.desc      subscriberIdOf(persistedId="KFVl") returns "KFVl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0031 begin`);
      const actual: string = subscriberIdOf('KFVl');
      logInfo(`subscriberIdOf(persistedId="KFVl"): actual=${actual}`);
      expect(actual).assertEqual('KFVl');
      logInfo(`${BUNDLE}SubscriberIdOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0032
     * @tc.name      FormExtAbility_SubscriberIdOf_0032
     * @tc.desc      subscriberIdOf(persistedId="bwG2eRsHUXpz") returns "bwG2eRsHUXpz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0032 begin`);
      const actual: string = subscriberIdOf('bwG2eRsHUXpz');
      logInfo(`subscriberIdOf(persistedId="bwG2eRsHUXpz"): actual=${actual}`);
      expect(actual).assertEqual('bwG2eRsHUXpz');
      logInfo(`${BUNDLE}SubscriberIdOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0033
     * @tc.name      FormExtAbility_SubscriberIdOf_0033
     * @tc.desc      subscriberIdOf(persistedId="zc4cZ") returns "zc4cZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0033 begin`);
      const actual: string = subscriberIdOf('zc4cZ');
      logInfo(`subscriberIdOf(persistedId="zc4cZ"): actual=${actual}`);
      expect(actual).assertEqual('zc4cZ');
      logInfo(`${BUNDLE}SubscriberIdOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0034
     * @tc.name      FormExtAbility_SubscriberIdOf_0034
     * @tc.desc      subscriberIdOf(persistedId="wtSmy") returns "wtSmy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0034 begin`);
      const actual: string = subscriberIdOf('wtSmy');
      logInfo(`subscriberIdOf(persistedId="wtSmy"): actual=${actual}`);
      expect(actual).assertEqual('wtSmy');
      logInfo(`${BUNDLE}SubscriberIdOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0035
     * @tc.name      FormExtAbility_SubscriberIdOf_0035
     * @tc.desc      subscriberIdOf(persistedId="D0828A72sQ8") returns "D0828A72sQ8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0035 begin`);
      const actual: string = subscriberIdOf('D0828A72sQ8');
      logInfo(`subscriberIdOf(persistedId="D0828A72sQ8"): actual=${actual}`);
      expect(actual).assertEqual('D0828A72sQ8');
      logInfo(`${BUNDLE}SubscriberIdOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0036
     * @tc.name      FormExtAbility_SubscriberIdOf_0036
     * @tc.desc      subscriberIdOf(persistedId="iev") returns "iev"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0036 begin`);
      const actual: string = subscriberIdOf('iev');
      logInfo(`subscriberIdOf(persistedId="iev"): actual=${actual}`);
      expect(actual).assertEqual('iev');
      logInfo(`${BUNDLE}SubscriberIdOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0037
     * @tc.name      FormExtAbility_SubscriberIdOf_0037
     * @tc.desc      subscriberIdOf(persistedId="j3PGIphxSs") returns "j3PGIphxSs"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0037 begin`);
      const actual: string = subscriberIdOf('j3PGIphxSs');
      logInfo(`subscriberIdOf(persistedId="j3PGIphxSs"): actual=${actual}`);
      expect(actual).assertEqual('j3PGIphxSs');
      logInfo(`${BUNDLE}SubscriberIdOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0038
     * @tc.name      FormExtAbility_SubscriberIdOf_0038
     * @tc.desc      subscriberIdOf(persistedId="ChzGTHe8") returns "ChzGTHe8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0038 begin`);
      const actual: string = subscriberIdOf('ChzGTHe8');
      logInfo(`subscriberIdOf(persistedId="ChzGTHe8"): actual=${actual}`);
      expect(actual).assertEqual('ChzGTHe8');
      logInfo(`${BUNDLE}SubscriberIdOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0039
     * @tc.name      FormExtAbility_SubscriberIdOf_0039
     * @tc.desc      subscriberIdOf(persistedId="thWJlhy") returns "thWJlhy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0039 begin`);
      const actual: string = subscriberIdOf('thWJlhy');
      logInfo(`subscriberIdOf(persistedId="thWJlhy"): actual=${actual}`);
      expect(actual).assertEqual('thWJlhy');
      logInfo(`${BUNDLE}SubscriberIdOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0040
     * @tc.name      FormExtAbility_SubscriberIdOf_0040
     * @tc.desc      subscriberIdOf(persistedId="5mEJdh") returns "5mEJdh"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0040 begin`);
      const actual: string = subscriberIdOf('5mEJdh');
      logInfo(`subscriberIdOf(persistedId="5mEJdh"): actual=${actual}`);
      expect(actual).assertEqual('5mEJdh');
      logInfo(`${BUNDLE}SubscriberIdOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0041
     * @tc.name      FormExtAbility_SubscriberIdOf_0041
     * @tc.desc      subscriberIdOf(persistedId="qCvsm") returns "qCvsm"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0041 begin`);
      const actual: string = subscriberIdOf('qCvsm');
      logInfo(`subscriberIdOf(persistedId="qCvsm"): actual=${actual}`);
      expect(actual).assertEqual('qCvsm');
      logInfo(`${BUNDLE}SubscriberIdOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0042
     * @tc.name      FormExtAbility_SubscriberIdOf_0042
     * @tc.desc      subscriberIdOf(persistedId="gJ") returns "gJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0042 begin`);
      const actual: string = subscriberIdOf('gJ');
      logInfo(`subscriberIdOf(persistedId="gJ"): actual=${actual}`);
      expect(actual).assertEqual('gJ');
      logInfo(`${BUNDLE}SubscriberIdOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0043
     * @tc.name      FormExtAbility_SubscriberIdOf_0043
     * @tc.desc      subscriberIdOf(persistedId="wZNmvjH4Tc6") returns "wZNmvjH4Tc6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0043 begin`);
      const actual: string = subscriberIdOf('wZNmvjH4Tc6');
      logInfo(`subscriberIdOf(persistedId="wZNmvjH4Tc6"): actual=${actual}`);
      expect(actual).assertEqual('wZNmvjH4Tc6');
      logInfo(`${BUNDLE}SubscriberIdOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0044
     * @tc.name      FormExtAbility_SubscriberIdOf_0044
     * @tc.desc      subscriberIdOf(persistedId="8nq") returns "8nq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0044 begin`);
      const actual: string = subscriberIdOf('8nq');
      logInfo(`subscriberIdOf(persistedId="8nq"): actual=${actual}`);
      expect(actual).assertEqual('8nq');
      logInfo(`${BUNDLE}SubscriberIdOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0045
     * @tc.name      FormExtAbility_SubscriberIdOf_0045
     * @tc.desc      subscriberIdOf(persistedId="59rSTo") returns "59rSTo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0045 begin`);
      const actual: string = subscriberIdOf('59rSTo');
      logInfo(`subscriberIdOf(persistedId="59rSTo"): actual=${actual}`);
      expect(actual).assertEqual('59rSTo');
      logInfo(`${BUNDLE}SubscriberIdOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0046
     * @tc.name      FormExtAbility_SubscriberIdOf_0046
     * @tc.desc      subscriberIdOf(persistedId="tQ") returns "tQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0046 begin`);
      const actual: string = subscriberIdOf('tQ');
      logInfo(`subscriberIdOf(persistedId="tQ"): actual=${actual}`);
      expect(actual).assertEqual('tQ');
      logInfo(`${BUNDLE}SubscriberIdOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0047
     * @tc.name      FormExtAbility_SubscriberIdOf_0047
     * @tc.desc      subscriberIdOf(persistedId="JzHlq") returns "JzHlq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0047 begin`);
      const actual: string = subscriberIdOf('JzHlq');
      logInfo(`subscriberIdOf(persistedId="JzHlq"): actual=${actual}`);
      expect(actual).assertEqual('JzHlq');
      logInfo(`${BUNDLE}SubscriberIdOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0048
     * @tc.name      FormExtAbility_SubscriberIdOf_0048
     * @tc.desc      subscriberIdOf(persistedId="r1IOdfrnom") returns "r1IOdfrnom"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0048 begin`);
      const actual: string = subscriberIdOf('r1IOdfrnom');
      logInfo(`subscriberIdOf(persistedId="r1IOdfrnom"): actual=${actual}`);
      expect(actual).assertEqual('r1IOdfrnom');
      logInfo(`${BUNDLE}SubscriberIdOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0049
     * @tc.name      FormExtAbility_SubscriberIdOf_0049
     * @tc.desc      subscriberIdOf(persistedId="lCMXNCugI") returns "lCMXNCugI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0049 begin`);
      const actual: string = subscriberIdOf('lCMXNCugI');
      logInfo(`subscriberIdOf(persistedId="lCMXNCugI"): actual=${actual}`);
      expect(actual).assertEqual('lCMXNCugI');
      logInfo(`${BUNDLE}SubscriberIdOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0050
     * @tc.name      FormExtAbility_SubscriberIdOf_0050
     * @tc.desc      subscriberIdOf(persistedId="I5wcOYPWa") returns "I5wcOYPWa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0050 begin`);
      const actual: string = subscriberIdOf('I5wcOYPWa');
      logInfo(`subscriberIdOf(persistedId="I5wcOYPWa"): actual=${actual}`);
      expect(actual).assertEqual('I5wcOYPWa');
      logInfo(`${BUNDLE}SubscriberIdOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0051
     * @tc.name      FormExtAbility_SubscriberIdOf_0051
     * @tc.desc      subscriberIdOf(persistedId="baSkPAV1") returns "baSkPAV1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0051 begin`);
      const actual: string = subscriberIdOf('baSkPAV1');
      logInfo(`subscriberIdOf(persistedId="baSkPAV1"): actual=${actual}`);
      expect(actual).assertEqual('baSkPAV1');
      logInfo(`${BUNDLE}SubscriberIdOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0052
     * @tc.name      FormExtAbility_SubscriberIdOf_0052
     * @tc.desc      subscriberIdOf(persistedId="SOVmQpvb") returns "SOVmQpvb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0052 begin`);
      const actual: string = subscriberIdOf('SOVmQpvb');
      logInfo(`subscriberIdOf(persistedId="SOVmQpvb"): actual=${actual}`);
      expect(actual).assertEqual('SOVmQpvb');
      logInfo(`${BUNDLE}SubscriberIdOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0053
     * @tc.name      FormExtAbility_SubscriberIdOf_0053
     * @tc.desc      subscriberIdOf(persistedId="mVvfYQOGSR") returns "mVvfYQOGSR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0053 begin`);
      const actual: string = subscriberIdOf('mVvfYQOGSR');
      logInfo(`subscriberIdOf(persistedId="mVvfYQOGSR"): actual=${actual}`);
      expect(actual).assertEqual('mVvfYQOGSR');
      logInfo(`${BUNDLE}SubscriberIdOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0054
     * @tc.name      FormExtAbility_SubscriberIdOf_0054
     * @tc.desc      subscriberIdOf(persistedId="iNiJN9czh9") returns "iNiJN9czh9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0054 begin`);
      const actual: string = subscriberIdOf('iNiJN9czh9');
      logInfo(`subscriberIdOf(persistedId="iNiJN9czh9"): actual=${actual}`);
      expect(actual).assertEqual('iNiJN9czh9');
      logInfo(`${BUNDLE}SubscriberIdOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0055
     * @tc.name      FormExtAbility_SubscriberIdOf_0055
     * @tc.desc      subscriberIdOf(persistedId="j76") returns "j76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0055 begin`);
      const actual: string = subscriberIdOf('j76');
      logInfo(`subscriberIdOf(persistedId="j76"): actual=${actual}`);
      expect(actual).assertEqual('j76');
      logInfo(`${BUNDLE}SubscriberIdOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0056
     * @tc.name      FormExtAbility_SubscriberIdOf_0056
     * @tc.desc      subscriberIdOf(persistedId="0fKqC1") returns "0fKqC1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0056 begin`);
      const actual: string = subscriberIdOf('0fKqC1');
      logInfo(`subscriberIdOf(persistedId="0fKqC1"): actual=${actual}`);
      expect(actual).assertEqual('0fKqC1');
      logInfo(`${BUNDLE}SubscriberIdOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0057
     * @tc.name      FormExtAbility_SubscriberIdOf_0057
     * @tc.desc      subscriberIdOf(persistedId="oK3NMNiQpEQ") returns "oK3NMNiQpEQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0057 begin`);
      const actual: string = subscriberIdOf('oK3NMNiQpEQ');
      logInfo(`subscriberIdOf(persistedId="oK3NMNiQpEQ"): actual=${actual}`);
      expect(actual).assertEqual('oK3NMNiQpEQ');
      logInfo(`${BUNDLE}SubscriberIdOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0058
     * @tc.name      FormExtAbility_SubscriberIdOf_0058
     * @tc.desc      subscriberIdOf(persistedId="67d") returns "67d"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0058 begin`);
      const actual: string = subscriberIdOf('67d');
      logInfo(`subscriberIdOf(persistedId="67d"): actual=${actual}`);
      expect(actual).assertEqual('67d');
      logInfo(`${BUNDLE}SubscriberIdOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0059
     * @tc.name      FormExtAbility_SubscriberIdOf_0059
     * @tc.desc      subscriberIdOf(persistedId="5AYY23Y") returns "5AYY23Y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0059 begin`);
      const actual: string = subscriberIdOf('5AYY23Y');
      logInfo(`subscriberIdOf(persistedId="5AYY23Y"): actual=${actual}`);
      expect(actual).assertEqual('5AYY23Y');
      logInfo(`${BUNDLE}SubscriberIdOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0060
     * @tc.name      FormExtAbility_SubscriberIdOf_0060
     * @tc.desc      subscriberIdOf(persistedId="9lYl9ydjBVE0") returns "9lYl9ydjBVE0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0060 begin`);
      const actual: string = subscriberIdOf('9lYl9ydjBVE0');
      logInfo(`subscriberIdOf(persistedId="9lYl9ydjBVE0"): actual=${actual}`);
      expect(actual).assertEqual('9lYl9ydjBVE0');
      logInfo(`${BUNDLE}SubscriberIdOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0061
     * @tc.name      FormExtAbility_SubscriberIdOf_0061
     * @tc.desc      subscriberIdOf(persistedId="u") returns "u"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0061 begin`);
      const actual: string = subscriberIdOf('u');
      logInfo(`subscriberIdOf(persistedId="u"): actual=${actual}`);
      expect(actual).assertEqual('u');
      logInfo(`${BUNDLE}SubscriberIdOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0062
     * @tc.name      FormExtAbility_SubscriberIdOf_0062
     * @tc.desc      subscriberIdOf(persistedId="Oao") returns "Oao"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0062 begin`);
      const actual: string = subscriberIdOf('Oao');
      logInfo(`subscriberIdOf(persistedId="Oao"): actual=${actual}`);
      expect(actual).assertEqual('Oao');
      logInfo(`${BUNDLE}SubscriberIdOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0063
     * @tc.name      FormExtAbility_SubscriberIdOf_0063
     * @tc.desc      subscriberIdOf(persistedId="zTk") returns "zTk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0063 begin`);
      const actual: string = subscriberIdOf('zTk');
      logInfo(`subscriberIdOf(persistedId="zTk"): actual=${actual}`);
      expect(actual).assertEqual('zTk');
      logInfo(`${BUNDLE}SubscriberIdOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0064
     * @tc.name      FormExtAbility_SubscriberIdOf_0064
     * @tc.desc      subscriberIdOf(persistedId="zRhf9qPp9v") returns "zRhf9qPp9v"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0064 begin`);
      const actual: string = subscriberIdOf('zRhf9qPp9v');
      logInfo(`subscriberIdOf(persistedId="zRhf9qPp9v"): actual=${actual}`);
      expect(actual).assertEqual('zRhf9qPp9v');
      logInfo(`${BUNDLE}SubscriberIdOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0065
     * @tc.name      FormExtAbility_SubscriberIdOf_0065
     * @tc.desc      subscriberIdOf(persistedId="fxrNptibu") returns "fxrNptibu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0065 begin`);
      const actual: string = subscriberIdOf('fxrNptibu');
      logInfo(`subscriberIdOf(persistedId="fxrNptibu"): actual=${actual}`);
      expect(actual).assertEqual('fxrNptibu');
      logInfo(`${BUNDLE}SubscriberIdOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0066
     * @tc.name      FormExtAbility_SubscriberIdOf_0066
     * @tc.desc      subscriberIdOf(persistedId="83C3") returns "83C3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0066 begin`);
      const actual: string = subscriberIdOf('83C3');
      logInfo(`subscriberIdOf(persistedId="83C3"): actual=${actual}`);
      expect(actual).assertEqual('83C3');
      logInfo(`${BUNDLE}SubscriberIdOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0067
     * @tc.name      FormExtAbility_SubscriberIdOf_0067
     * @tc.desc      subscriberIdOf(persistedId="Y") returns "Y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0067 begin`);
      const actual: string = subscriberIdOf('Y');
      logInfo(`subscriberIdOf(persistedId="Y"): actual=${actual}`);
      expect(actual).assertEqual('Y');
      logInfo(`${BUNDLE}SubscriberIdOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0068
     * @tc.name      FormExtAbility_SubscriberIdOf_0068
     * @tc.desc      subscriberIdOf(persistedId="nF2") returns "nF2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0068 begin`);
      const actual: string = subscriberIdOf('nF2');
      logInfo(`subscriberIdOf(persistedId="nF2"): actual=${actual}`);
      expect(actual).assertEqual('nF2');
      logInfo(`${BUNDLE}SubscriberIdOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0069
     * @tc.name      FormExtAbility_SubscriberIdOf_0069
     * @tc.desc      subscriberIdOf(persistedId="zqXitAy") returns "zqXitAy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0069 begin`);
      const actual: string = subscriberIdOf('zqXitAy');
      logInfo(`subscriberIdOf(persistedId="zqXitAy"): actual=${actual}`);
      expect(actual).assertEqual('zqXitAy');
      logInfo(`${BUNDLE}SubscriberIdOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0070
     * @tc.name      FormExtAbility_SubscriberIdOf_0070
     * @tc.desc      subscriberIdOf(persistedId="1ThqOFBySJgf") returns "1ThqOFBySJgf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0070 begin`);
      const actual: string = subscriberIdOf('1ThqOFBySJgf');
      logInfo(`subscriberIdOf(persistedId="1ThqOFBySJgf"): actual=${actual}`);
      expect(actual).assertEqual('1ThqOFBySJgf');
      logInfo(`${BUNDLE}SubscriberIdOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0071
     * @tc.name      FormExtAbility_SubscriberIdOf_0071
     * @tc.desc      subscriberIdOf(persistedId="orhQZKZI2") returns "orhQZKZI2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0071 begin`);
      const actual: string = subscriberIdOf('orhQZKZI2');
      logInfo(`subscriberIdOf(persistedId="orhQZKZI2"): actual=${actual}`);
      expect(actual).assertEqual('orhQZKZI2');
      logInfo(`${BUNDLE}SubscriberIdOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0072
     * @tc.name      FormExtAbility_SubscriberIdOf_0072
     * @tc.desc      subscriberIdOf(persistedId="xZMRuHEP6T") returns "xZMRuHEP6T"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0072 begin`);
      const actual: string = subscriberIdOf('xZMRuHEP6T');
      logInfo(`subscriberIdOf(persistedId="xZMRuHEP6T"): actual=${actual}`);
      expect(actual).assertEqual('xZMRuHEP6T');
      logInfo(`${BUNDLE}SubscriberIdOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0073
     * @tc.name      FormExtAbility_SubscriberIdOf_0073
     * @tc.desc      subscriberIdOf(persistedId="tbOQosnAI") returns "tbOQosnAI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0073 begin`);
      const actual: string = subscriberIdOf('tbOQosnAI');
      logInfo(`subscriberIdOf(persistedId="tbOQosnAI"): actual=${actual}`);
      expect(actual).assertEqual('tbOQosnAI');
      logInfo(`${BUNDLE}SubscriberIdOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0074
     * @tc.name      FormExtAbility_SubscriberIdOf_0074
     * @tc.desc      subscriberIdOf(persistedId="O9JutsLyk") returns "O9JutsLyk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0074 begin`);
      const actual: string = subscriberIdOf('O9JutsLyk');
      logInfo(`subscriberIdOf(persistedId="O9JutsLyk"): actual=${actual}`);
      expect(actual).assertEqual('O9JutsLyk');
      logInfo(`${BUNDLE}SubscriberIdOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0075
     * @tc.name      FormExtAbility_SubscriberIdOf_0075
     * @tc.desc      subscriberIdOf(persistedId="uutZ2NJG") returns "uutZ2NJG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0075 begin`);
      const actual: string = subscriberIdOf('uutZ2NJG');
      logInfo(`subscriberIdOf(persistedId="uutZ2NJG"): actual=${actual}`);
      expect(actual).assertEqual('uutZ2NJG');
      logInfo(`${BUNDLE}SubscriberIdOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0076
     * @tc.name      FormExtAbility_SubscriberIdOf_0076
     * @tc.desc      subscriberIdOf(persistedId="5qoqNHj") returns "5qoqNHj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0076 begin`);
      const actual: string = subscriberIdOf('5qoqNHj');
      logInfo(`subscriberIdOf(persistedId="5qoqNHj"): actual=${actual}`);
      expect(actual).assertEqual('5qoqNHj');
      logInfo(`${BUNDLE}SubscriberIdOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0077
     * @tc.name      FormExtAbility_SubscriberIdOf_0077
     * @tc.desc      subscriberIdOf(persistedId="YxSqe") returns "YxSqe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0077 begin`);
      const actual: string = subscriberIdOf('YxSqe');
      logInfo(`subscriberIdOf(persistedId="YxSqe"): actual=${actual}`);
      expect(actual).assertEqual('YxSqe');
      logInfo(`${BUNDLE}SubscriberIdOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0078
     * @tc.name      FormExtAbility_SubscriberIdOf_0078
     * @tc.desc      subscriberIdOf(persistedId="UlrY8ft") returns "UlrY8ft"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0078 begin`);
      const actual: string = subscriberIdOf('UlrY8ft');
      logInfo(`subscriberIdOf(persistedId="UlrY8ft"): actual=${actual}`);
      expect(actual).assertEqual('UlrY8ft');
      logInfo(`${BUNDLE}SubscriberIdOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0079
     * @tc.name      FormExtAbility_SubscriberIdOf_0079
     * @tc.desc      subscriberIdOf(persistedId="bqQ07hM7AMN") returns "bqQ07hM7AMN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0079 begin`);
      const actual: string = subscriberIdOf('bqQ07hM7AMN');
      logInfo(`subscriberIdOf(persistedId="bqQ07hM7AMN"): actual=${actual}`);
      expect(actual).assertEqual('bqQ07hM7AMN');
      logInfo(`${BUNDLE}SubscriberIdOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0080
     * @tc.name      FormExtAbility_SubscriberIdOf_0080
     * @tc.desc      subscriberIdOf(persistedId="t9dM") returns "t9dM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0080 begin`);
      const actual: string = subscriberIdOf('t9dM');
      logInfo(`subscriberIdOf(persistedId="t9dM"): actual=${actual}`);
      expect(actual).assertEqual('t9dM');
      logInfo(`${BUNDLE}SubscriberIdOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0081
     * @tc.name      FormExtAbility_SubscriberIdOf_0081
     * @tc.desc      subscriberIdOf(persistedId="zXHB") returns "zXHB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0081 begin`);
      const actual: string = subscriberIdOf('zXHB');
      logInfo(`subscriberIdOf(persistedId="zXHB"): actual=${actual}`);
      expect(actual).assertEqual('zXHB');
      logInfo(`${BUNDLE}SubscriberIdOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0082
     * @tc.name      FormExtAbility_SubscriberIdOf_0082
     * @tc.desc      subscriberIdOf(persistedId="1px8JxcSQxdT") returns "1px8JxcSQxdT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0082 begin`);
      const actual: string = subscriberIdOf('1px8JxcSQxdT');
      logInfo(`subscriberIdOf(persistedId="1px8JxcSQxdT"): actual=${actual}`);
      expect(actual).assertEqual('1px8JxcSQxdT');
      logInfo(`${BUNDLE}SubscriberIdOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0083
     * @tc.name      FormExtAbility_SubscriberIdOf_0083
     * @tc.desc      subscriberIdOf(persistedId="zov4UIOps") returns "zov4UIOps"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0083 begin`);
      const actual: string = subscriberIdOf('zov4UIOps');
      logInfo(`subscriberIdOf(persistedId="zov4UIOps"): actual=${actual}`);
      expect(actual).assertEqual('zov4UIOps');
      logInfo(`${BUNDLE}SubscriberIdOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0084
     * @tc.name      FormExtAbility_SubscriberIdOf_0084
     * @tc.desc      subscriberIdOf(persistedId="5EVNuADr") returns "5EVNuADr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0084 begin`);
      const actual: string = subscriberIdOf('5EVNuADr');
      logInfo(`subscriberIdOf(persistedId="5EVNuADr"): actual=${actual}`);
      expect(actual).assertEqual('5EVNuADr');
      logInfo(`${BUNDLE}SubscriberIdOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0085
     * @tc.name      FormExtAbility_SubscriberIdOf_0085
     * @tc.desc      subscriberIdOf(persistedId="5VZlkFTlrlMc") returns "5VZlkFTlrlMc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0085 begin`);
      const actual: string = subscriberIdOf('5VZlkFTlrlMc');
      logInfo(`subscriberIdOf(persistedId="5VZlkFTlrlMc"): actual=${actual}`);
      expect(actual).assertEqual('5VZlkFTlrlMc');
      logInfo(`${BUNDLE}SubscriberIdOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0086
     * @tc.name      FormExtAbility_SubscriberIdOf_0086
     * @tc.desc      subscriberIdOf(persistedId="CpMf4SpCxTm6") returns "CpMf4SpCxTm6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0086 begin`);
      const actual: string = subscriberIdOf('CpMf4SpCxTm6');
      logInfo(`subscriberIdOf(persistedId="CpMf4SpCxTm6"): actual=${actual}`);
      expect(actual).assertEqual('CpMf4SpCxTm6');
      logInfo(`${BUNDLE}SubscriberIdOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0087
     * @tc.name      FormExtAbility_SubscriberIdOf_0087
     * @tc.desc      subscriberIdOf(persistedId="9YDhZ") returns "9YDhZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0087 begin`);
      const actual: string = subscriberIdOf('9YDhZ');
      logInfo(`subscriberIdOf(persistedId="9YDhZ"): actual=${actual}`);
      expect(actual).assertEqual('9YDhZ');
      logInfo(`${BUNDLE}SubscriberIdOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0088
     * @tc.name      FormExtAbility_SubscriberIdOf_0088
     * @tc.desc      subscriberIdOf(persistedId="EJ") returns "EJ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0088 begin`);
      const actual: string = subscriberIdOf('EJ');
      logInfo(`subscriberIdOf(persistedId="EJ"): actual=${actual}`);
      expect(actual).assertEqual('EJ');
      logInfo(`${BUNDLE}SubscriberIdOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0089
     * @tc.name      FormExtAbility_SubscriberIdOf_0089
     * @tc.desc      subscriberIdOf(persistedId="L") returns "L"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0089 begin`);
      const actual: string = subscriberIdOf('L');
      logInfo(`subscriberIdOf(persistedId="L"): actual=${actual}`);
      expect(actual).assertEqual('L');
      logInfo(`${BUNDLE}SubscriberIdOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_SUBSCRIBER_ID_OF_0090
     * @tc.name      FormExtAbility_SubscriberIdOf_0090
     * @tc.desc      subscriberIdOf(persistedId="zIFh2j4") returns "zIFh2j4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_SubscriberIdOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubscriberIdOf_0090 begin`);
      const actual: string = subscriberIdOf('zIFh2j4');
      logInfo(`subscriberIdOf(persistedId="zIFh2j4"): actual=${actual}`);
      expect(actual).assertEqual('zIFh2j4');
      logInfo(`${BUNDLE}SubscriberIdOf_0090 end`);
    });
  });
}
