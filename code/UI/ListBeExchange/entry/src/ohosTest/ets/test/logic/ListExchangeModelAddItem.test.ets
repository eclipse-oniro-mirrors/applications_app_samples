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

/** Logic checks for ListExchangeModel.addItem (53 cases). */
export default function listExchangeModelAddItemTest(): void {
  describe('ListExchangeModelAddItemTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0001
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0001
     * @tc.desc      ListExchangeModel.addItem(item="") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelAddItem_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0001 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('');
      logInfo(`addItem(item=""): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[""]');
      logInfo(`addItem(item="") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0002
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0002
     * @tc.desc      ListExchangeModel.addItem(item="a") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelAddItem_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0002 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('a');
      logInfo(`addItem(item="a"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="a") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="a") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a"]');
      logInfo(`addItem(item="a") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="a") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="a") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="a") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0003
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0003
     * @tc.desc      ListExchangeModel.addItem(item="abc") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0003 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('abc');
      logInfo(`addItem(item="abc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="abc") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="abc") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc"]');
      logInfo(`addItem(item="abc") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="abc") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="abc") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="abc") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0004
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0004
     * @tc.desc      ListExchangeModel.addItem(item="Hello World") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0004 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('Hello World');
      logInfo(`addItem(item="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="Hello World") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="Hello World") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World"]');
      logInfo(`addItem(item="Hello World") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="Hello World") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="Hello World") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="Hello World") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0005
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0005
     * @tc.desc      ListExchangeModel.addItem(item=" ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0005 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem(' ');
      logInfo(`addItem(item=" "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item=" ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item=" ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" "]');
      logInfo(`addItem(item=" ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item=" ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item=" ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item=" ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0006
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0006
     * @tc.desc      ListExchangeModel.addItem(item="123") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0006 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('123');
      logInfo(`addItem(item="123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="123") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="123") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"]');
      logInfo(`addItem(item="123") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="123") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="123") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="123") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0007
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0007
     * @tc.desc      ListExchangeModel.addItem(item=" a ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0007 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem(' a ');
      logInfo(`addItem(item=" a "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item=" a ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item=" a ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" a "]');
      logInfo(`addItem(item=" a ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item=" a ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item=" a ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item=" a ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0008
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0008
     * @tc.desc      ListExchangeModel.addItem(item="aa") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0008 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('aa');
      logInfo(`addItem(item="aa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="aa") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="aa") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["aa"]');
      logInfo(`addItem(item="aa") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="aa") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="aa") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="aa") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0009
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0009
     * @tc.desc      ListExchangeModel.addItem(item="a_1") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0009 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('a_1');
      logInfo(`addItem(item="a_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="a_1") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="a_1") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a_1"]');
      logInfo(`addItem(item="a_1") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="a_1") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="a_1") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="a_1") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0010
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0010
     * @tc.desc      ListExchangeModel.addItem(item="xa") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0010 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('xa');
      logInfo(`addItem(item="xa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="xa") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="xa") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["xa"]');
      logInfo(`addItem(item="xa") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="xa") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="xa") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="xa") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0011
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0011
     * @tc.desc      ListExchangeModel.addItem(item=" abc ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0011 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem(' abc ');
      logInfo(`addItem(item=" abc "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item=" abc ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item=" abc ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" abc "]');
      logInfo(`addItem(item=" abc ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item=" abc ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item=" abc ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item=" abc ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0012
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0012
     * @tc.desc      ListExchangeModel.addItem(item="abcabc") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0012 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('abcabc');
      logInfo(`addItem(item="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="abcabc") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="abcabc") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abcabc"]');
      logInfo(`addItem(item="abcabc") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="abcabc") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="abcabc") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="abcabc") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0013
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0013
     * @tc.desc      ListExchangeModel.addItem(item="abc_1") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0013 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('abc_1');
      logInfo(`addItem(item="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="abc_1") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="abc_1") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc_1"]');
      logInfo(`addItem(item="abc_1") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="abc_1") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="abc_1") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="abc_1") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0014
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0014
     * @tc.desc      ListExchangeModel.addItem(item="xabc") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0014 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('xabc');
      logInfo(`addItem(item="xabc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="xabc") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="xabc") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["xabc"]');
      logInfo(`addItem(item="xabc") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="xabc") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="xabc") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="xabc") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0015
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0015
     * @tc.desc      ListExchangeModel.addItem(item=" Hello World ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0015 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem(' Hello World ');
      logInfo(`addItem(item=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item=" Hello World ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item=" Hello World ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" Hello World "]');
      logInfo(`addItem(item=" Hello World ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item=" Hello World ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item=" Hello World ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item=" Hello World ") state: JSON.stringify(subject.offse...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0016
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0016
     * @tc.desc      ListExchangeModel.addItem(item="Hello WorldHello World") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0016 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('Hello WorldHello World');
      logInfo(`addItem(item="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="Hello WorldHello World") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="Hello WorldHello World") state: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello WorldHello World"]');
      logInfo(`addItem(item="Hello WorldHello World") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="Hello WorldHello World") state: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="Hello WorldHello World") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="Hello WorldHello World") state: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0017
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0017
     * @tc.desc      ListExchangeModel.addItem(item="Hello World_1") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0017 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('Hello World_1');
      logInfo(`addItem(item="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="Hello World_1") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="Hello World_1") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World_1"]');
      logInfo(`addItem(item="Hello World_1") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="Hello World_1") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="Hello World_1") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="Hello World_1") state: JSON.stringify(subject.offse...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0018
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0018
     * @tc.desc      ListExchangeModel.addItem(item="xHello World") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0018 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('xHello World');
      logInfo(`addItem(item="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="xHello World") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="xHello World") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["xHello World"]');
      logInfo(`addItem(item="xHello World") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="xHello World") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="xHello World") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="xHello World") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0019
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0019
     * @tc.desc      ListExchangeModel.addItem(item="   ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0019 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('   ');
      logInfo(`addItem(item="   "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="   ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="   ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["   "]');
      logInfo(`addItem(item="   ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="   ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="   ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="   ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0020
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0020
     * @tc.desc      ListExchangeModel.addItem(item="  ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0020 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('  ');
      logInfo(`addItem(item="  "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="  ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="  ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["  "]');
      logInfo(`addItem(item="  ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="  ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="  ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="  ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0021
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0021
     * @tc.desc      ListExchangeModel.addItem(item=" _1") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0021 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem(' _1');
      logInfo(`addItem(item=" _1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item=" _1") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item=" _1") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" _1"]');
      logInfo(`addItem(item=" _1") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item=" _1") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item=" _1") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item=" _1") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0022
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0022
     * @tc.desc      ListExchangeModel.addItem(item="x ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0022 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('x ');
      logInfo(`addItem(item="x "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="x ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="x ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["x "]');
      logInfo(`addItem(item="x ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="x ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="x ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="x ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0023
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0023
     * @tc.desc      ListExchangeModel.addItem(item=" 123 ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0023 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem(' 123 ');
      logInfo(`addItem(item=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item=" 123 ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item=" 123 ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" 123 "]');
      logInfo(`addItem(item=" 123 ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item=" 123 ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item=" 123 ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item=" 123 ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0024
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0024
     * @tc.desc      ListExchangeModel.addItem(item="123123") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0024 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('123123');
      logInfo(`addItem(item="123123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="123123") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="123123") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123123"]');
      logInfo(`addItem(item="123123") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="123123") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="123123") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="123123") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0025
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0025
     * @tc.desc      ListExchangeModel.addItem(item="123_1") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0025 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('123_1');
      logInfo(`addItem(item="123_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="123_1") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="123_1") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123_1"]');
      logInfo(`addItem(item="123_1") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="123_1") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="123_1") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="123_1") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0026
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0026
     * @tc.desc      ListExchangeModel.addItem(item="x123") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelAddItem_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0026 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('x123');
      logInfo(`addItem(item="x123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="x123") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="x123") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["x123"]');
      logInfo(`addItem(item="x123") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="x123") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="x123") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="x123") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0027
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0027
     * @tc.desc      ListExchangeModel.addItem(item="uex") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0027 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('uex');
      logInfo(`addItem(item="uex"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="uex") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="uex") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["uex"]');
      logInfo(`addItem(item="uex") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="uex") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="uex") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="uex") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0028
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0028
     * @tc.desc      ListExchangeModel.addItem(item="Q8IDjza") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0028 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('Q8IDjza');
      logInfo(`addItem(item="Q8IDjza"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="Q8IDjza") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="Q8IDjza") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Q8IDjza"]');
      logInfo(`addItem(item="Q8IDjza") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="Q8IDjza") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="Q8IDjza") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="Q8IDjza") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0029
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0029
     * @tc.desc      ListExchangeModel.addItem(item="VdqAAcc7") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0029 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('VdqAAcc7');
      logInfo(`addItem(item="VdqAAcc7"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="VdqAAcc7") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="VdqAAcc7") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["VdqAAcc7"]');
      logInfo(`addItem(item="VdqAAcc7") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="VdqAAcc7") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="VdqAAcc7") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="VdqAAcc7") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0030
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0030
     * @tc.desc      ListExchangeModel.addItem(item="brggsXxwqZ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0030 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('brggsXxwqZ');
      logInfo(`addItem(item="brggsXxwqZ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="brggsXxwqZ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="brggsXxwqZ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["brggsXxwqZ"]');
      logInfo(`addItem(item="brggsXxwqZ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="brggsXxwqZ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="brggsXxwqZ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="brggsXxwqZ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0031
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0031
     * @tc.desc      ListExchangeModel.addItem(item="3Vy") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0031 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('3Vy');
      logInfo(`addItem(item="3Vy"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="3Vy") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="3Vy") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["3Vy"]');
      logInfo(`addItem(item="3Vy") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="3Vy") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="3Vy") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="3Vy") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0032
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0032
     * @tc.desc      ListExchangeModel.addItem(item="ScIPhydt3Mi") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0032 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('ScIPhydt3Mi');
      logInfo(`addItem(item="ScIPhydt3Mi"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="ScIPhydt3Mi") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="ScIPhydt3Mi") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["ScIPhydt3Mi"]');
      logInfo(`addItem(item="ScIPhydt3Mi") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="ScIPhydt3Mi") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="ScIPhydt3Mi") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="ScIPhydt3Mi") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0033
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0033
     * @tc.desc      ListExchangeModel.addItem(item="OMJoDqHG95") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0033 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('OMJoDqHG95');
      logInfo(`addItem(item="OMJoDqHG95"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="OMJoDqHG95") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="OMJoDqHG95") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["OMJoDqHG95"]');
      logInfo(`addItem(item="OMJoDqHG95") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="OMJoDqHG95") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="OMJoDqHG95") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="OMJoDqHG95") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0034
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0034
     * @tc.desc      ListExchangeModel.addItem(item="gGtl") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0034 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('gGtl');
      logInfo(`addItem(item="gGtl"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="gGtl") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="gGtl") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["gGtl"]');
      logInfo(`addItem(item="gGtl") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="gGtl") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="gGtl") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="gGtl") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0035
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0035
     * @tc.desc      ListExchangeModel.addItem(item="cOV21xu3") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0035 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('cOV21xu3');
      logInfo(`addItem(item="cOV21xu3"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="cOV21xu3") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="cOV21xu3") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["cOV21xu3"]');
      logInfo(`addItem(item="cOV21xu3") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="cOV21xu3") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="cOV21xu3") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="cOV21xu3") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0036
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0036
     * @tc.desc      ListExchangeModel.addItem(item="c1xkPAJo") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0036 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('c1xkPAJo');
      logInfo(`addItem(item="c1xkPAJo"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="c1xkPAJo") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="c1xkPAJo") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["c1xkPAJo"]');
      logInfo(`addItem(item="c1xkPAJo") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="c1xkPAJo") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="c1xkPAJo") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="c1xkPAJo") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0037
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0037
     * @tc.desc      ListExchangeModel.addItem(item="Ublp") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0037 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('Ublp');
      logInfo(`addItem(item="Ublp"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="Ublp") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="Ublp") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Ublp"]');
      logInfo(`addItem(item="Ublp") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="Ublp") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="Ublp") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="Ublp") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0038
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0038
     * @tc.desc      ListExchangeModel.addItem(item="qu5l3j") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0038 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('qu5l3j');
      logInfo(`addItem(item="qu5l3j"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="qu5l3j") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="qu5l3j") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["qu5l3j"]');
      logInfo(`addItem(item="qu5l3j") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="qu5l3j") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="qu5l3j") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="qu5l3j") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0039
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0039
     * @tc.desc      ListExchangeModel.addItem(item="EMx") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0039 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('EMx');
      logInfo(`addItem(item="EMx"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="EMx") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="EMx") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["EMx"]');
      logInfo(`addItem(item="EMx") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="EMx") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="EMx") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="EMx") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0040
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0040
     * @tc.desc      ListExchangeModel.addItem(item="bFD0") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0040 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('bFD0');
      logInfo(`addItem(item="bFD0"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="bFD0") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="bFD0") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["bFD0"]');
      logInfo(`addItem(item="bFD0") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="bFD0") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="bFD0") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="bFD0") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0041
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0041
     * @tc.desc      ListExchangeModel.addItem(item="ML") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0041 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('ML');
      logInfo(`addItem(item="ML"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="ML") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="ML") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["ML"]');
      logInfo(`addItem(item="ML") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="ML") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="ML") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="ML") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0042
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0042
     * @tc.desc      ListExchangeModel.addItem(item="4TrBMQ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0042 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('4TrBMQ');
      logInfo(`addItem(item="4TrBMQ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="4TrBMQ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="4TrBMQ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["4TrBMQ"]');
      logInfo(`addItem(item="4TrBMQ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="4TrBMQ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="4TrBMQ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="4TrBMQ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0043
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0043
     * @tc.desc      ListExchangeModel.addItem(item="ue7jN") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0043 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('ue7jN');
      logInfo(`addItem(item="ue7jN"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="ue7jN") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="ue7jN") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["ue7jN"]');
      logInfo(`addItem(item="ue7jN") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="ue7jN") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="ue7jN") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="ue7jN") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0044
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0044
     * @tc.desc      ListExchangeModel.addItem(item="scCMTPJ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0044 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('scCMTPJ');
      logInfo(`addItem(item="scCMTPJ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="scCMTPJ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="scCMTPJ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["scCMTPJ"]');
      logInfo(`addItem(item="scCMTPJ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="scCMTPJ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="scCMTPJ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="scCMTPJ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0045
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0045
     * @tc.desc      ListExchangeModel.addItem(item="3IhRqztWqJ") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0045 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('3IhRqztWqJ');
      logInfo(`addItem(item="3IhRqztWqJ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="3IhRqztWqJ") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="3IhRqztWqJ") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["3IhRqztWqJ"]');
      logInfo(`addItem(item="3IhRqztWqJ") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="3IhRqztWqJ") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="3IhRqztWqJ") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="3IhRqztWqJ") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0046
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0046
     * @tc.desc      ListExchangeModel.addItem(item="WydP") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0046 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('WydP');
      logInfo(`addItem(item="WydP"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="WydP") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="WydP") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["WydP"]');
      logInfo(`addItem(item="WydP") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="WydP") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="WydP") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="WydP") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0047
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0047
     * @tc.desc      ListExchangeModel.addItem(item="s9") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0047 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('s9');
      logInfo(`addItem(item="s9"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="s9") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="s9") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["s9"]');
      logInfo(`addItem(item="s9") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="s9") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="s9") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="s9") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0048
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0048
     * @tc.desc      ListExchangeModel.addItem(item="89y00cffJRd1") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0048 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('89y00cffJRd1');
      logInfo(`addItem(item="89y00cffJRd1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="89y00cffJRd1") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="89y00cffJRd1") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["89y00cffJRd1"]');
      logInfo(`addItem(item="89y00cffJRd1") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="89y00cffJRd1") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="89y00cffJRd1") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="89y00cffJRd1") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0049
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0049
     * @tc.desc      ListExchangeModel.addItem(item="1Q3") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0049 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('1Q3');
      logInfo(`addItem(item="1Q3"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="1Q3") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="1Q3") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["1Q3"]');
      logInfo(`addItem(item="1Q3") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="1Q3") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="1Q3") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="1Q3") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0050
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0050
     * @tc.desc      ListExchangeModel.addItem(item="lb5OFsK7") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0050 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('lb5OFsK7');
      logInfo(`addItem(item="lb5OFsK7"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="lb5OFsK7") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="lb5OFsK7") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["lb5OFsK7"]');
      logInfo(`addItem(item="lb5OFsK7") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="lb5OFsK7") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="lb5OFsK7") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="lb5OFsK7") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0051
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0051
     * @tc.desc      ListExchangeModel.addItem(item="S8YsjJLj") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0051 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('S8YsjJLj');
      logInfo(`addItem(item="S8YsjJLj"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="S8YsjJLj") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="S8YsjJLj") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["S8YsjJLj"]');
      logInfo(`addItem(item="S8YsjJLj") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="S8YsjJLj") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="S8YsjJLj") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="S8YsjJLj") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0052
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0052
     * @tc.desc      ListExchangeModel.addItem(item="3ea") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0052 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('3ea');
      logInfo(`addItem(item="3ea"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="3ea") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="3ea") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["3ea"]');
      logInfo(`addItem(item="3ea") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="3ea") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="3ea") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="3ea") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_ADD_ITEM_0053
     * @tc.name      ListBeExchange_ListExchangeModelAddItem_0053
     * @tc.desc      ListExchangeModel.addItem(item="a5De") yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelAddItem_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0053 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.addItem('a5De');
      logInfo(`addItem(item="a5De"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`addItem(item="a5De") state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem(item="a5De") state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a5De"]');
      logInfo(`addItem(item="a5De") state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem(item="a5De") state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem(item="a5De") state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem(item="a5De") state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelAddItem_0053 end`);
    });
  });
}
