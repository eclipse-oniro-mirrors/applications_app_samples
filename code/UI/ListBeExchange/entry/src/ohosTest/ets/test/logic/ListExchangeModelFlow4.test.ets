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

/** Logic checks for ListExchangeModel flow (43 cases). */
export default function listExchangeModelFlow4Test(): void {
  describe('ListExchangeModelFlow4Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0138
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0138
     * @tc.desc      ListExchangeModel call flow order > deleteItem > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0138 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.deleteItem('fW9V');
      logInfo(`step2 deleteItem("fW9V"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step3 initData(["123", " ", "Hello World"...: step3=${step3}`);
      expect(step3).assertEqual(6);
      logInfo(`order>deleteItem>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`order>deleteItem>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`order>deleteItem>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`order>deleteItem>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`order>deleteItem>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`order>deleteItem>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0139
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0139
     * @tc.desc      ListExchangeModel call flow initData > longPress > deleteItem > deleteItem > addItem keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0139 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['', 'a']);
      logInfo(`step1 initData(["", "a"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.longPress('NPChT4iWj');
      logInfo(`step2 longPress("NPChT4iWj"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.deleteItem('0');
      logInfo(`step3 deleteItem("0"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.deleteItem('POOKo19xuGf');
      logInfo(`step4 deleteItem("POOKo19xuGf"): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.addItem('3ea');
      logInfo(`step5 addItem("3ea"): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`initData>longPress>deleteItem>deleteItem>...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`initData>longPress>deleteItem>deleteItem>...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","3ea"]');
      logInfo(`initData>longPress>deleteItem>deleteItem>...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`initData>longPress>deleteItem>deleteItem>...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`initData>longPress>deleteItem>deleteItem>...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`initData>longPress>deleteItem>deleteItem>...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0140
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0140
     * @tc.desc      ListExchangeModel call flow deleteItem > longPress > longPress > drop > longPress keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0140 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('8AM69sZv');
      logInfo(`step1 deleteItem("8AM69sZv"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.longPress('IOSH');
      logInfo(`step2 longPress("IOSH"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.longPress('Hello WorldHello World');
      logInfo(`step3 longPress("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop('e2lVAlOT8PC');
      logInfo(`step4 drop("e2lVAlOT8PC"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.longPress('NPChT4iWj');
      logInfo(`step5 longPress("NPChT4iWj"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`deleteItem>longPress>longPress>drop>longP...: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0141
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0141
     * @tc.desc      ListExchangeModel call flow drop > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0141 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('C1oWBWfKZV');
      logInfo(`step1 drop("C1oWBWfKZV"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('hznL8LLs1');
      logInfo(`step2 deleteItem("hznL8LLs1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0142
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0142
     * @tc.desc      ListExchangeModel call flow deleteItem > longPress > move > addItem > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0142 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('abcabc');
      logInfo(`step1 deleteItem("abcabc"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.longPress('9hCzuVCbtS');
      logInfo(`step2 longPress("9hCzuVCbtS"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.move('a_1', 2, 10);
      logInfo(`step3 move("a_1", 2, 10): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.addItem('bFD0');
      logInfo(`step4 addItem("bFD0"): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.order();
      logInfo(`step5 order(): step5=${step5}`);
      expect(step5).assertEqual('bFD0');
      logInfo(`deleteItem>longPress>move>addItem>order f...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`deleteItem>longPress>move>addItem>order f...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["bFD0"]');
      logInfo(`deleteItem>longPress>move>addItem>order f...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`deleteItem>longPress>move>addItem>order f...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`deleteItem>longPress>move>addItem>order f...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`deleteItem>longPress>move>addItem>order f...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0143
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0143
     * @tc.desc      ListExchangeModel call flow drop > deleteItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0143 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('2Q9yQC');
      logInfo(`step1 drop("2Q9yQC"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('goR');
      logInfo(`step2 deleteItem("goR"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.longPress('abc_1');
      logInfo(`step3 longPress("abc_1"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`drop>deleteItem>longPress final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0144
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0144
     * @tc.desc      ListExchangeModel call flow addItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0144 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('x ');
      logInfo(`step1 addItem("x "): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.addItem('x123');
      logInfo(`step2 addItem("x123"): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`addItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["x ","x123"]');
      logInfo(`addItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0145
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0145
     * @tc.desc      ListExchangeModel call flow addItem > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0145 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('Hello World');
      logInfo(`step1 addItem("Hello World"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step2 initData(["123", " ", "Hello World"...: step2=${step2}`);
      expect(step2).assertEqual(6);
      logInfo(`addItem>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`addItem>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`addItem>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`addItem>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`addItem>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`addItem>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0146
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0146
     * @tc.desc      ListExchangeModel call flow initData > addItem > drop > order > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0146 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData([]);
      logInfo(`step1 initData([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.addItem('qu5l3j');
      logInfo(`step2 addItem("qu5l3j"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.drop('AGwwCm3');
      logInfo(`step3 drop("AGwwCm3"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('qu5l3j');
      const step5: number = subject.initData(['a', '', 'abc']);
      logInfo(`step5 initData(["a", "", "abc"]): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`initData>addItem>drop>order>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`initData>addItem>drop>order>initData final: JSON.stringify(subject....${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`initData>addItem>drop>order>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`initData>addItem>drop>order>initData final: JSON.stringify(subject...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`initData>addItem>drop>order>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`initData>addItem>drop>order>initData final: JSON.stringify(subjec...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0147
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0147
     * @tc.desc      ListExchangeModel call flow changeItem > drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0147 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(55, 45);
      const step2: number = subject.drop('oqd');
      logInfo(`step2 drop("oqd"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`changeItem>drop>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem>drop>order final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>drop>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem>drop>order final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>drop>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem>drop>order final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0148
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0148
     * @tc.desc      ListExchangeModel call flow changeItem > initData > order > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0148 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(100, 110);
      const step2: number = subject.initData(['a', '', 'abc']);
      logInfo(`step2 initData(["a", "", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('a,,abc');
      const step4: number = subject.move('abc', 100, 7.19);
      logInfo(`step4 move("abc", 100, 7.19): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`changeItem>initData>order>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`changeItem>initData>order>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`changeItem>initData>order>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`changeItem>initData>order>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`changeItem>initData>order>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`changeItem>initData>order>move final: JSON.stringify(subject.offs...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,100]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0149
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0149
     * @tc.desc      ListExchangeModel call flow drop > deleteItem > initData > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0149 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('xHello World');
      logInfo(`step1 drop("xHello World"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('B');
      logInfo(`step2 deleteItem("B"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step3 initData(["123", " ", "Hello World"...: step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: number = subject.drop('abc');
      logInfo(`step4 drop("abc"): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`drop>deleteItem>initData>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`drop>deleteItem>initData>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`drop>deleteItem>initData>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`drop>deleteItem>initData>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`drop>deleteItem>initData>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`drop>deleteItem>initData>drop final: JSON.stringify(subject.offse...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0150
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0150
     * @tc.desc      ListExchangeModel call flow initData > move > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0150 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['']);
      logInfo(`step1 initData([""]): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.move('a', -100, 3);
      logInfo(`step2 move("a", -100, 3): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`initData>move>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`initData>move>order final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[""]');
      logInfo(`initData>move>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`initData>move>order final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`initData>move>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`initData>move>order final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0151
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0151
     * @tc.desc      ListExchangeModel call flow deleteItem > initData > order > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0151 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('b17gcu550xTi');
      logInfo(`step1 deleteItem("b17gcu550xTi"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.initData(['abc', 'abc']);
      logInfo(`step2 initData(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('abc,abc');
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('abc,abc');
      const step5: string = subject.order();
      logInfo(`step5 order(): step5=${step5}`);
      expect(step5).assertEqual('abc,abc');
      logInfo(`deleteItem>initData>order>order>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`deleteItem>initData>order>order>order final: JSON.stringify(subject...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc"]');
      logInfo(`deleteItem>initData>order>order>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`deleteItem>initData>order>order>order final: JSON.stringify(subjec...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`deleteItem>initData>order>order>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`deleteItem>initData>order>order>order final: JSON.stringify(subje...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0152
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0152
     * @tc.desc      ListExchangeModel call flow longPress > order > order > initData > deleteItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0152 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress(' ');
      logInfo(`step1 longPress(" "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.initData([]);
      logInfo(`step4 initData([]): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.deleteItem(' abc ');
      logInfo(`step5 deleteItem(" abc "): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0153
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0153
     * @tc.desc      ListExchangeModel call flow order > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0153 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.initData(['abc', 'abc']);
      logInfo(`step2 initData(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`order>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`order>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc"]');
      logInfo(`order>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`order>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`order>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`order>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0154
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0154
     * @tc.desc      ListExchangeModel call flow addItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0154 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('3tXMvdjLJk');
      logInfo(`step1 addItem("3tXMvdjLJk"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.move('xa', 99, 100);
      logInfo(`step2 move("xa", 99, 100): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`addItem>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["3tXMvdjLJk"]');
      logInfo(`addItem>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>move final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0155
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0155
     * @tc.desc      ListExchangeModel call flow order > addItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0155 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.addItem('xHello World');
      logInfo(`step2 addItem("xHello World"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.addItem(' ');
      logInfo(`step3 addItem(" "): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`order>addItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`order>addItem>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["xHello World"," "]');
      logInfo(`order>addItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`order>addItem>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`order>addItem>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`order>addItem>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0156
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0156
     * @tc.desc      ListExchangeModel call flow initData > drop > deleteItem > longPress > changeItem keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0156 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step1 initData(["", "a", "abc", "Hello Wo...: step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: number = subject.drop('Tp3x0BB2Z');
      logInfo(`step2 drop("Tp3x0BB2Z"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.deleteItem('NGLSAet');
      logInfo(`step3 deleteItem("NGLSAet"): step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: number = subject.longPress('dC1x94y');
      logInfo(`step4 longPress("dC1x94y"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      subject.changeItem(95, 50);
      logInfo(`initData>drop>deleteItem>longPress>change...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`initData>drop>deleteItem>longPress>change...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('');
      logInfo(`initData>drop>deleteItem>longPress>change...: subject.items[2]=${subject.items[2]}`);
      expect(subject.items[2]).assertEqual('abc');
      logInfo(`initData>drop>deleteItem>longPress>change...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`initData>drop>deleteItem>longPress>change...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`initData>drop>deleteItem>longPress>change...: subject.scales[2]=${subject.scales[2]}`);
      expect(subject.scales[2]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0157
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0157
     * @tc.desc      ListExchangeModel call flow addItem > drop > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0157 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('WydP');
      logInfo(`step1 addItem("WydP"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop('AGwwCm3');
      logInfo(`step2 drop("AGwwCm3"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.addItem('NMTTXzKFbJhD');
      logInfo(`step3 addItem("NMTTXzKFbJhD"): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`addItem>drop>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>drop>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["WydP","NMTTXzKFbJhD"]');
      logInfo(`addItem>drop>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>drop>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>drop>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>drop>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0158
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0158
     * @tc.desc      ListExchangeModel call flow deleteItem > deleteItem > changeItem > longPress > drop keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0158 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('0');
      logInfo(`step1 deleteItem("0"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.deleteItem('aa');
      logInfo(`step2 deleteItem("aa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.changeItem(0, 15);
      const step4: number = subject.longPress('prjN4nlk');
      logInfo(`step4 longPress("prjN4nlk"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.drop('n0pyFl');
      logInfo(`step5 drop("n0pyFl"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`deleteItem>deleteItem>changeItem>longPres...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`deleteItem>deleteItem>changeItem>longPres...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`deleteItem>deleteItem>changeItem>longPres...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`deleteItem>deleteItem>changeItem>longPres...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`deleteItem>deleteItem>changeItem>longPres...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`deleteItem>deleteItem>changeItem>longPres...: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0159
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0159
     * @tc.desc      ListExchangeModel call flow drop > order > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0159 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('inbbrO');
      logInfo(`step1 drop("inbbrO"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0160
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0160
     * @tc.desc      ListExchangeModel call flow deleteItem > changeItem > drop > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0160 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('J');
      logInfo(`step1 deleteItem("J"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.changeItem(45, -97);
      const step3: number = subject.drop('yBi9');
      logInfo(`step3 drop("yBi9"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.longPress('LUyok7GdLLq');
      logInfo(`step4 longPress("LUyok7GdLLq"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`deleteItem>changeItem>drop>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`deleteItem>changeItem>drop>longPress final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`deleteItem>changeItem>drop>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`deleteItem>changeItem>drop>longPress final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`deleteItem>changeItem>drop>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`deleteItem>changeItem>drop>longPress final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0161
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0161
     * @tc.desc      ListExchangeModel call flow initData > order > initData > move > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0161 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['a', '', 'abc']);
      logInfo(`step1 initData(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('a,,abc');
      const step3: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 initData(["Hello World", "a", " ", ...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: number = subject.move('', -2, 5);
      logInfo(`step4 move("", -2, 5): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.move('123', -100, 0);
      logInfo(`step5 move("123", -100, 0): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`initData>order>initData>move>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`initData>order>initData>move>move final: JSON.stringify(subject.ite...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","123","a"]');
      logInfo(`initData>order>initData>move>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`initData>order>initData>move>move final: JSON.stringify(subject.sc...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`initData>order>initData>move>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`initData>order>initData>move>move final: JSON.stringify(subject.o...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,-50,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0162
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0162
     * @tc.desc      ListExchangeModel call flow changeItem > initData > drop > initData > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0162 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(55, 25);
      const step2: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 initData(["Hello World", "a", " ", ...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.drop('3XuUf');
      logInfo(`step3 drop("3XuUf"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step4 initData(["123", " ", "Hello World"...: step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: number = subject.move('', 0, -2);
      logInfo(`step5 move("", 0, -2): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`changeItem>initData>drop>initData>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`changeItem>initData>drop>initData>move final: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`changeItem>initData>drop>initData>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`changeItem>initData>drop>initData>move final: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1.2,1]');
      logInfo(`changeItem>initData>drop>initData>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`changeItem>initData>drop>initData>move final: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0163
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0163
     * @tc.desc      ListExchangeModel call flow deleteItem > addItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0163 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('B');
      logInfo(`step1 deleteItem("B"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.addItem('ML');
      logInfo(`step2 addItem("ML"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.move('', -100, -1);
      logInfo(`step3 move("", -100, -1): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`deleteItem>addItem>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`deleteItem>addItem>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["ML"]');
      logInfo(`deleteItem>addItem>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`deleteItem>addItem>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`deleteItem>addItem>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`deleteItem>addItem>move final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0164
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0164
     * @tc.desc      ListExchangeModel call flow addItem > drop > order > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0164 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem(' a ');
      logInfo(`step1 addItem(" a "): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop('kT5x');
      logInfo(`step2 drop("kT5x"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual(' a ');
      const step4: number = subject.deleteItem('a');
      logInfo(`step4 deleteItem("a"): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`addItem>drop>order>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>drop>order>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" a "]');
      logInfo(`addItem>drop>order>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>drop>order>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>drop>order>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>drop>order>deleteItem final: JSON.stringify(subject.offse...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0165
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0165
     * @tc.desc      ListExchangeModel call flow drop > deleteItem > addItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0165 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('kT5x');
      logInfo(`step1 drop("kT5x"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('NGLSAet');
      logInfo(`step2 deleteItem("NGLSAet"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.addItem('3IhRqztWqJ');
      logInfo(`step3 addItem("3IhRqztWqJ"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.deleteItem('dh');
      logInfo(`step4 deleteItem("dh"): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`drop>deleteItem>addItem>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`drop>deleteItem>addItem>deleteItem final: JSON.stringify(subject.it...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["3IhRqztWqJ"]');
      logInfo(`drop>deleteItem>addItem>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`drop>deleteItem>addItem>deleteItem final: JSON.stringify(subject.s...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`drop>deleteItem>addItem>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`drop>deleteItem>addItem>deleteItem final: JSON.stringify(subject....${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0166
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0166
     * @tc.desc      ListExchangeModel call flow move > order > longPress > drop > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0166 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('abc', 50, 1);
      logInfo(`step1 move("abc", 50, 1): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.longPress(' a ');
      logInfo(`step3 longPress(" a "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop('xKame4w8');
      logInfo(`step4 drop("xKame4w8"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.move('Hello World', -1, 7.19);
      logInfo(`step5 move("Hello World", -1, 7.19): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0167
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0167
     * @tc.desc      ListExchangeModel call flow addItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0167 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('lb5OFsK7');
      logInfo(`step1 addItem("lb5OFsK7"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.longPress('VbaZ8nix6jS');
      logInfo(`step2 longPress("VbaZ8nix6jS"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`addItem>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>longPress final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["lb5OFsK7"]');
      logInfo(`addItem>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>longPress final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>longPress final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0168
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0168
     * @tc.desc      ListExchangeModel call flow changeItem > order > changeItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0168 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(80, 20);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.changeItem(55, 70);
      const step4: number = subject.drop('oqd');
      logInfo(`step4 drop("oqd"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`changeItem>order>changeItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>order>changeItem>drop final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>order>changeItem>drop final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`changeItem>order>changeItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>order>changeItem>drop final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>order>changeItem>drop final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0169
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0169
     * @tc.desc      ListExchangeModel call flow deleteItem > drop > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0169 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('oyOBWCB2ShS');
      logInfo(`step1 deleteItem("oyOBWCB2ShS"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.drop(' _1');
      logInfo(`step2 drop(" _1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(101, 85);
      logInfo(`deleteItem>drop>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`deleteItem>drop>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`deleteItem>drop>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`deleteItem>drop>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`deleteItem>drop>changeItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`deleteItem>drop>changeItem final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0170
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0170
     * @tc.desc      ListExchangeModel call flow changeItem > deleteItem > changeItem > changeItem > addItem keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0170 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(-27, 20);
      const step2: number = subject.deleteItem('Nsig9Ib');
      logInfo(`step2 deleteItem("Nsig9Ib"): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.changeItem(35, 60);
      subject.changeItem(65, 90);
      const step5: number = subject.addItem('a_1');
      logInfo(`step5 addItem("a_1"): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`changeItem>deleteItem>changeItem>changeIt...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(4);
      logInfo(`changeItem>deleteItem>changeItem>changeIt...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem>changeIt...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem>changeIt...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(4);
      logInfo(`changeItem>deleteItem>changeItem>changeIt...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem>changeIt...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0171
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0171
     * @tc.desc      ListExchangeModel call flow longPress > move > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0171 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('rOpU1M');
      logInfo(`step1 longPress("rOpU1M"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.move('abc', 10, 0);
      logInfo(`step2 move("abc", 10, 0): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.addItem('abcabc');
      logInfo(`step3 addItem("abcabc"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`longPress>move>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`longPress>move>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abcabc"]');
      logInfo(`longPress>move>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`longPress>move>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`longPress>move>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`longPress>move>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0172
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0172
     * @tc.desc      ListExchangeModel call flow deleteItem > changeItem > changeItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0172 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('ghaMehwD6');
      logInfo(`step1 deleteItem("ghaMehwD6"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.changeItem(-1, -97);
      subject.changeItem(80, 60);
      const step4: number = subject.move('a_1', 2, 10);
      logInfo(`step4 move("a_1", 2, 10): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`deleteItem>changeItem>changeItem>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`deleteItem>changeItem>changeItem>move final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`deleteItem>changeItem>changeItem>move final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`deleteItem>changeItem>changeItem>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`deleteItem>changeItem>changeItem>move final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`deleteItem>changeItem>changeItem>move final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0173
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0173
     * @tc.desc      ListExchangeModel call flow addItem > changeItem > initData > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0173 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('VdqAAcc7');
      logInfo(`step1 addItem("VdqAAcc7"): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.changeItem(0, 80);
      const step3: number = subject.initData(['']);
      logInfo(`step3 initData([""]): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.move('xa', -100, 0);
      logInfo(`step4 move("xa", -100, 0): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`addItem>changeItem>initData>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>changeItem>initData>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[""]');
      logInfo(`addItem>changeItem>initData>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>changeItem>initData>move final: JSON.stringify(subject.sca...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>changeItem>initData>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>changeItem>initData>move final: JSON.stringify(subject.of...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0174
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0174
     * @tc.desc      ListExchangeModel call flow drop > deleteItem > longPress > initData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0174 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('xabc');
      logInfo(`step1 drop("xabc"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('w4X');
      logInfo(`step2 deleteItem("w4X"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.longPress('9s7ySMbytaC');
      logInfo(`step3 longPress("9s7ySMbytaC"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step4 initData(["Hello World", "a", " ", ...: step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: string = subject.order();
      logInfo(`step5 order(): step5=${step5}`);
      expect(step5).assertEqual('Hello World,a, ,a,123');
      logInfo(`drop>deleteItem>longPress>initData>order ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`drop>deleteItem>longPress>initData>order ...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`drop>deleteItem>longPress>initData>order ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`drop>deleteItem>longPress>initData>order ...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`drop>deleteItem>longPress>initData>order ...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`drop>deleteItem>longPress>initData>order ...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0175
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0175
     * @tc.desc      ListExchangeModel call flow addItem > drop > move > deleteItem > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0175 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('Ublp');
      logInfo(`step1 addItem("Ublp"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop('d');
      logInfo(`step2 drop("d"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.move('aa', 99, 3);
      logInfo(`step3 move("aa", 99, 3): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.deleteItem(' ');
      logInfo(`step4 deleteItem(" "): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.initData(['']);
      logInfo(`step5 initData([""]): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`addItem>drop>move>deleteItem>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>drop>move>deleteItem>initData final: JSON.stringify(subject...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[""]');
      logInfo(`addItem>drop>move>deleteItem>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>drop>move>deleteItem>initData final: JSON.stringify(subjec...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>drop>move>deleteItem>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>drop>move>deleteItem>initData final: JSON.stringify(subje...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0176
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0176
     * @tc.desc      ListExchangeModel call flow changeItem > addItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0176 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 20);
      const step2: number = subject.addItem('abcabc');
      logInfo(`step2 addItem("abcabc"): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.addItem('5');
      logInfo(`step3 addItem("5"): step3=${step3}`);
      expect(step3).assertEqual(3);
      logInfo(`changeItem>addItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`changeItem>addItem>addItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>addItem>addItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('abcabc');
      logInfo(`changeItem>addItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`changeItem>addItem>addItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>addItem>addItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0177
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0177
     * @tc.desc      ListExchangeModel call flow drop > move > addItem > initData > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0177 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('kT5x');
      logInfo(`step1 drop("kT5x"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.move('a', -1, 20);
      logInfo(`step2 move("a", -1, 20): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.addItem('1IhCqhjG');
      logInfo(`step3 addItem("1IhCqhjG"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step4 initData(["Hello World", "a", " ", ...: step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: number = subject.drop('xabc');
      logInfo(`step5 drop("xabc"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`drop>move>addItem>initData>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`drop>move>addItem>initData>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`drop>move>addItem>initData>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`drop>move>addItem>initData>drop final: JSON.stringify(subject.scal...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`drop>move>addItem>initData>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`drop>move>addItem>initData>drop final: JSON.stringify(subject.off...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0178
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0178
     * @tc.desc      ListExchangeModel call flow longPress > changeItem > drop > drop > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0178 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('123123');
      logInfo(`step1 longPress("123123"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(90, 85);
      const step3: number = subject.drop('Z1F');
      logInfo(`step3 drop("Z1F"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop('z5K');
      logInfo(`step4 drop("z5K"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.move('123', 10, 100);
      logInfo(`step5 move("123", 10, 100): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`longPress>changeItem>drop>drop>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`longPress>changeItem>drop>drop>move final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`longPress>changeItem>drop>drop>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`longPress>changeItem>drop>drop>move final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`longPress>changeItem>drop>drop>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`longPress>changeItem>drop>drop>move final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0179
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0179
     * @tc.desc      ListExchangeModel call flow longPress > changeItem > longPress > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0179 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('cdtqB');
      logInfo(`step1 longPress("cdtqB"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(0, 95);
      const step3: number = subject.longPress('BLjyYq');
      logInfo(`step3 longPress("BLjyYq"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.longPress('tyn');
      logInfo(`step4 longPress("tyn"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`longPress>changeItem>longPress>longPress ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`longPress>changeItem>longPress>longPress ...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`longPress>changeItem>longPress>longPress ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`longPress>changeItem>longPress>longPress ...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`longPress>changeItem>longPress>longPress ...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`longPress>changeItem>longPress>longPress ...: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0180
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0180
     * @tc.desc      ListExchangeModel call flow initData > deleteItem > move > order > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0180 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['a', '', 'abc']);
      logInfo(`step1 initData(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.deleteItem('dh');
      logInfo(`step2 deleteItem("dh"): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.move('xa', 0, 100);
      logInfo(`step3 move("xa", 0, 100): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('a,,abc');
      const step5: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step5 initData(["", "a", "abc", "Hello Wo...: step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`initData>deleteItem>move>order>initData f...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`initData>deleteItem>move>order>initData f...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`initData>deleteItem>move>order>initData f...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`initData>deleteItem>move>order>initData f...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`initData>deleteItem>move>order>initData f...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`initData>deleteItem>move>order>initData f...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0180 end`);
    });
  });
}
