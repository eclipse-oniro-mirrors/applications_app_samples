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
import { ListExchangeModel } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ListExchangeModel.longPress (30 cases). */
export default function listExchangeModelLongPressTest(): void {
  describe('ListExchangeModelLongPressTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0001
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0001
     * @tc.desc      ListExchangeModel.longPress(item="") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelLongPress_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0001 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('');
      logInfo(`longPress(item=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0002
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0002
     * @tc.desc      ListExchangeModel.longPress(item="a") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelLongPress_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0002 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('a');
      logInfo(`longPress(item="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="a") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0003
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0003
     * @tc.desc      ListExchangeModel.longPress(item="abc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0003 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('abc');
      logInfo(`longPress(item="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="abc") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0004
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0004
     * @tc.desc      ListExchangeModel.longPress(item="Hello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0004 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('Hello World');
      logInfo(`longPress(item="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="Hello World") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0005
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0005
     * @tc.desc      ListExchangeModel.longPress(item=" ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0005 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress(' ');
      logInfo(`longPress(item=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item=" ") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0006
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0006
     * @tc.desc      ListExchangeModel.longPress(item="123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0006 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('123');
      logInfo(`longPress(item="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="123") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0007
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0007
     * @tc.desc      ListExchangeModel.longPress(item=" a ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0007 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress(' a ');
      logInfo(`longPress(item=" a "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item=" a ") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0008
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0008
     * @tc.desc      ListExchangeModel.longPress(item="aa") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0008 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('aa');
      logInfo(`longPress(item="aa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="aa") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0009
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0009
     * @tc.desc      ListExchangeModel.longPress(item="a_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0009 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('a_1');
      logInfo(`longPress(item="a_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="a_1") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0010
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0010
     * @tc.desc      ListExchangeModel.longPress(item="xa") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0010 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('xa');
      logInfo(`longPress(item="xa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="xa") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0011
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0011
     * @tc.desc      ListExchangeModel.longPress(item=" abc ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0011 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress(' abc ');
      logInfo(`longPress(item=" abc "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item=" abc ") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0012
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0012
     * @tc.desc      ListExchangeModel.longPress(item="abcabc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0012 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('abcabc');
      logInfo(`longPress(item="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="abcabc") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0013
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0013
     * @tc.desc      ListExchangeModel.longPress(item="abc_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0013 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('abc_1');
      logInfo(`longPress(item="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="abc_1") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0014
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0014
     * @tc.desc      ListExchangeModel.longPress(item="xabc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0014 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('xabc');
      logInfo(`longPress(item="xabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="xabc") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0015
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0015
     * @tc.desc      ListExchangeModel.longPress(item=" Hello World ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0015 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress(' Hello World ');
      logInfo(`longPress(item=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item=" Hello World ") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0016
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0016
     * @tc.desc      ListExchangeModel.longPress(item="Hello WorldHello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0016 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('Hello WorldHello World');
      logInfo(`longPress(item="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="Hello WorldHello World") ...: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0017
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0017
     * @tc.desc      ListExchangeModel.longPress(item="Hello World_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0017 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('Hello World_1');
      logInfo(`longPress(item="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="Hello World_1") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0018
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0018
     * @tc.desc      ListExchangeModel.longPress(item="xHello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0018 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('xHello World');
      logInfo(`longPress(item="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="xHello World") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0019
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0019
     * @tc.desc      ListExchangeModel.longPress(item="   ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0019 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('   ');
      logInfo(`longPress(item="   "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="   ") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0020
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0020
     * @tc.desc      ListExchangeModel.longPress(item="  ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0020 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('  ');
      logInfo(`longPress(item="  "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="  ") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0021
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0021
     * @tc.desc      ListExchangeModel.longPress(item=" _1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0021 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress(' _1');
      logInfo(`longPress(item=" _1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item=" _1") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0022
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0022
     * @tc.desc      ListExchangeModel.longPress(item="x ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0022 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('x ');
      logInfo(`longPress(item="x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="x ") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0023
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0023
     * @tc.desc      ListExchangeModel.longPress(item=" 123 ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0023 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress(' 123 ');
      logInfo(`longPress(item=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item=" 123 ") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0024
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0024
     * @tc.desc      ListExchangeModel.longPress(item="123123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0024 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('123123');
      logInfo(`longPress(item="123123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="123123") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0025
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0025
     * @tc.desc      ListExchangeModel.longPress(item="123_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0025 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('123_1');
      logInfo(`longPress(item="123_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="123_1") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0026
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0026
     * @tc.desc      ListExchangeModel.longPress(item="x123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelLongPress_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0026 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('x123');
      logInfo(`longPress(item="x123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="x123") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0027
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0027
     * @tc.desc      ListExchangeModel.longPress(item="N2D5") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0027 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('N2D5');
      logInfo(`longPress(item="N2D5"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="N2D5") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0028
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0028
     * @tc.desc      ListExchangeModel.longPress(item="Qul6VFWAHA") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0028 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('Qul6VFWAHA');
      logInfo(`longPress(item="Qul6VFWAHA"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="Qul6VFWAHA") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0029
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0029
     * @tc.desc      ListExchangeModel.longPress(item="drO47kXXF") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0029 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('drO47kXXF');
      logInfo(`longPress(item="drO47kXXF"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="drO47kXXF") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_LONG_PRESS_0030
     * @tc.name      ListBeExchange_ListExchangeModelLongPress_0030
     * @tc.desc      ListExchangeModel.longPress(item="3Ee") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelLongPress_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0030 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.longPress('3Ee');
      logInfo(`longPress(item="3Ee"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`longPress(item="3Ee") state: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelLongPress_0030 end`);
    });
  });
}
