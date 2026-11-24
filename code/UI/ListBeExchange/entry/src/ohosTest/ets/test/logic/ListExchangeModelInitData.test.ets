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

/** Logic checks for ListExchangeModel.initData (8 cases). */
export default function listExchangeModelInitDataTest(): void {
  describe('ListExchangeModelInitDataTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_INIT_DATA_0001
     * @tc.name      ListBeExchange_ListExchangeModelInitData_0001
     * @tc.desc      ListExchangeModel.initData(items=[]) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelInitData_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelInitData_0001 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.initData([]);
      logInfo(`initData(items=[]): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelInitData_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_INIT_DATA_0002
     * @tc.name      ListBeExchange_ListExchangeModelInitData_0002
     * @tc.desc      ListExchangeModel.initData(items=[""]) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelInitData_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelInitData_0002 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.initData(['']);
      logInfo(`initData(items=[""]): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`initData(items=[""]) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`initData(items=[""]) state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[""]');
      logInfo(`initData(items=[""]) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`initData(items=[""]) state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`initData(items=[""]) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`initData(items=[""]) state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelInitData_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_INIT_DATA_0003
     * @tc.name      ListBeExchange_ListExchangeModelInitData_0003
     * @tc.desc      ListExchangeModel.initData(items=["", "a"]) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelInitData_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelInitData_0003 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.initData(['', 'a']);
      logInfo(`initData(items=["", "a"]): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`initData(items=["", "a"]) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`initData(items=["", "a"]) state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`initData(items=["", "a"]) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`initData(items=["", "a"]) state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`initData(items=["", "a"]) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`initData(items=["", "a"]) state: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelInitData_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_INIT_DATA_0004
     * @tc.name      ListBeExchange_ListExchangeModelInitData_0004
     * @tc.desc      ListExchangeModel.initData(items=["a", "", "abc"]) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelInitData_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelInitData_0004 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.initData(['a', '', 'abc']);
      logInfo(`initData(items=["a", "", "abc"]): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`initData(items=["a", "", "abc"]) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`initData(items=["a", "", "abc"]) state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`initData(items=["a", "", "abc"]) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`initData(items=["a", "", "abc"]) state: JSON.stringify(subject.sca...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`initData(items=["a", "", "abc"]) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`initData(items=["a", "", "abc"]) state: JSON.stringify(subject.of...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelInitData_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_INIT_DATA_0005
     * @tc.name      ListBeExchange_ListExchangeModelInitData_0005
     * @tc.desc      ListExchangeModel.initData(items=["abc", "abc"]) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelInitData_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelInitData_0005 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.initData(['abc', 'abc']);
      logInfo(`initData(items=["abc", "abc"]): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`initData(items=["abc", "abc"]) state: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`initData(items=["abc", "abc"]) state: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc"]');
      logInfo(`initData(items=["abc", "abc"]) state: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`initData(items=["abc", "abc"]) state: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`initData(items=["abc", "abc"]) state: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`initData(items=["abc", "abc"]) state: JSON.stringify(subject.offs...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelInitData_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_INIT_DATA_0006
     * @tc.name      ListBeExchange_ListExchangeModelInitData_0006
     * @tc.desc      ListExchangeModel.initData(items=["", "a", "abc", "Hello World", " "]) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelInitData_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelInitData_0006 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`initData(items=["", "a", "abc", "Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`initData(items=["", "a", "abc", "Hello Wo...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`initData(items=["", "a", "abc", "Hello Wo...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`initData(items=["", "a", "abc", "Hello Wo...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`initData(items=["", "a", "abc", "Hello Wo...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`initData(items=["", "a", "abc", "Hello Wo...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`initData(items=["", "a", "abc", "Hello Wo...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelInitData_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_INIT_DATA_0007
     * @tc.name      ListBeExchange_ListExchangeModelInitData_0007
     * @tc.desc      ListExchangeModel.initData(items=["Hello World", "a", " ", "a", "123"]) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelInitData_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelInitData_0007 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`initData(items=["Hello World", "a", " ", ...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`initData(items=["Hello World", "a", " ", ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`initData(items=["Hello World", "a", " ", ...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`initData(items=["Hello World", "a", " ", ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`initData(items=["Hello World", "a", " ", ...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`initData(items=["Hello World", "a", " ", ...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`initData(items=["Hello World", "a", " ", ...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelInitData_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_INIT_DATA_0008
     * @tc.name      ListBeExchange_ListExchangeModelInitData_0008
     * @tc.desc      ListExchangeModel.initData(items=["123", " ", "Hello World", "abc", "a", ""]) yields 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelInitData_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelInitData_0008 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`initData(items=["123", " ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`initData(items=["123", " ", "Hello World"...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`initData(items=["123", " ", "Hello World"...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`initData(items=["123", " ", "Hello World"...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`initData(items=["123", " ", "Hello World"...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`initData(items=["123", " ", "Hello World"...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`initData(items=["123", " ", "Hello World"...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelInitData_0008 end`);
    });
  });
}
