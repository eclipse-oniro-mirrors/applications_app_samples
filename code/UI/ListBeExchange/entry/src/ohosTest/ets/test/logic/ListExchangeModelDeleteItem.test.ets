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

/** Logic checks for ListExchangeModel.deleteItem (30 cases). */
export default function listExchangeModelDeleteItemTest(): void {
  describe('ListExchangeModelDeleteItemTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0001
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0001
     * @tc.desc      ListExchangeModel.deleteItem(item="") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0001 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('');
      logInfo(`deleteItem(item=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0002
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0002
     * @tc.desc      ListExchangeModel.deleteItem(item="a") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0002 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('a');
      logInfo(`deleteItem(item="a"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0003
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0003
     * @tc.desc      ListExchangeModel.deleteItem(item="abc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0003 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('abc');
      logInfo(`deleteItem(item="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0004
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0004
     * @tc.desc      ListExchangeModel.deleteItem(item="Hello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0004 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('Hello World');
      logInfo(`deleteItem(item="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0005
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0005
     * @tc.desc      ListExchangeModel.deleteItem(item=" ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0005 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem(' ');
      logInfo(`deleteItem(item=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0006
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0006
     * @tc.desc      ListExchangeModel.deleteItem(item="123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0006 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('123');
      logInfo(`deleteItem(item="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0007
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0007
     * @tc.desc      ListExchangeModel.deleteItem(item=" a ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0007 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem(' a ');
      logInfo(`deleteItem(item=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0008
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0008
     * @tc.desc      ListExchangeModel.deleteItem(item="aa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0008 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('aa');
      logInfo(`deleteItem(item="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0009
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0009
     * @tc.desc      ListExchangeModel.deleteItem(item="a_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0009 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('a_1');
      logInfo(`deleteItem(item="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0010
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0010
     * @tc.desc      ListExchangeModel.deleteItem(item="xa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0010 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('xa');
      logInfo(`deleteItem(item="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0011
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0011
     * @tc.desc      ListExchangeModel.deleteItem(item=" abc ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0011 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem(' abc ');
      logInfo(`deleteItem(item=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0012
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0012
     * @tc.desc      ListExchangeModel.deleteItem(item="abcabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0012 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('abcabc');
      logInfo(`deleteItem(item="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0013
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0013
     * @tc.desc      ListExchangeModel.deleteItem(item="abc_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0013 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('abc_1');
      logInfo(`deleteItem(item="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0014
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0014
     * @tc.desc      ListExchangeModel.deleteItem(item="xabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0014 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('xabc');
      logInfo(`deleteItem(item="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0015
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0015
     * @tc.desc      ListExchangeModel.deleteItem(item=" Hello World ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0015 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem(' Hello World ');
      logInfo(`deleteItem(item=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0016
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0016
     * @tc.desc      ListExchangeModel.deleteItem(item="Hello WorldHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0016 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('Hello WorldHello World');
      logInfo(`deleteItem(item="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0017
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0017
     * @tc.desc      ListExchangeModel.deleteItem(item="Hello World_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0017 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('Hello World_1');
      logInfo(`deleteItem(item="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0018
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0018
     * @tc.desc      ListExchangeModel.deleteItem(item="xHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0018 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('xHello World');
      logInfo(`deleteItem(item="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0019
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0019
     * @tc.desc      ListExchangeModel.deleteItem(item="   ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0019 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('   ');
      logInfo(`deleteItem(item="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0020
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0020
     * @tc.desc      ListExchangeModel.deleteItem(item="  ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0020 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('  ');
      logInfo(`deleteItem(item="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0021
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0021
     * @tc.desc      ListExchangeModel.deleteItem(item=" _1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0021 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem(' _1');
      logInfo(`deleteItem(item=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0022
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0022
     * @tc.desc      ListExchangeModel.deleteItem(item="x ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0022 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('x ');
      logInfo(`deleteItem(item="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0023
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0023
     * @tc.desc      ListExchangeModel.deleteItem(item=" 123 ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0023 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem(' 123 ');
      logInfo(`deleteItem(item=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0024
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0024
     * @tc.desc      ListExchangeModel.deleteItem(item="123123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0024 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('123123');
      logInfo(`deleteItem(item="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0025
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0025
     * @tc.desc      ListExchangeModel.deleteItem(item="123_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0025 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('123_1');
      logInfo(`deleteItem(item="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0026
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0026
     * @tc.desc      ListExchangeModel.deleteItem(item="x123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0026 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('x123');
      logInfo(`deleteItem(item="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0027
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0027
     * @tc.desc      ListExchangeModel.deleteItem(item="j") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0027 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('j');
      logInfo(`deleteItem(item="j"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0028
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0028
     * @tc.desc      ListExchangeModel.deleteItem(item="w4X") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0028 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('w4X');
      logInfo(`deleteItem(item="w4X"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0029
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0029
     * @tc.desc      ListExchangeModel.deleteItem(item="I7R3fEk") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0029 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('I7R3fEk');
      logInfo(`deleteItem(item="I7R3fEk"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_DELETE_ITEM_0030
     * @tc.name      ListBeExchange_ListExchangeModelDeleteItem_0030
     * @tc.desc      ListExchangeModel.deleteItem(item="J") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelDeleteItem_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0030 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.deleteItem('J');
      logInfo(`deleteItem(item="J"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelDeleteItem_0030 end`);
    });
  });
}
