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

/** Logic checks for ListExchangeModel flow (45 cases). */
export default function listExchangeModelFlow5Test(): void {
  describe('ListExchangeModelFlow5Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0181
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0181
     * @tc.desc      ListExchangeModel call flow initData > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0181 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['abc', 'abc']);
      logInfo(`step1 initData(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.changeItem(30, 20);
      logInfo(`initData>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`initData>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('abc');
      logInfo(`initData>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('abc');
      logInfo(`initData>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`initData>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`initData>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0182
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0182
     * @tc.desc      ListExchangeModel call flow addItem > drop > changeItem > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0182 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('Se0FME75VqB');
      logInfo(`step1 addItem("Se0FME75VqB"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop('xabc');
      logInfo(`step2 drop("xabc"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(0, 110);
      const step4: number = subject.initData(['', 'a']);
      logInfo(`step4 initData(["", "a"]): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`addItem>drop>changeItem>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>drop>changeItem>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`addItem>drop>changeItem>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>drop>changeItem>initData final: JSON.stringify(subject.sca...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>drop>changeItem>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>drop>changeItem>initData final: JSON.stringify(subject.of...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0183
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0183
     * @tc.desc      ListExchangeModel call flow initData > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0183 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['', 'a']);
      logInfo(`step1 initData(["", "a"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 initData(["Hello World", "a", " ", ...: step2=${step2}`);
      expect(step2).assertEqual(5);
      logInfo(`initData>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`initData>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`initData>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`initData>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`initData>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`initData>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0184
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0184
     * @tc.desc      ListExchangeModel call flow order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0184 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.drop('123123');
      logInfo(`step2 drop("123123"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0185
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0185
     * @tc.desc      ListExchangeModel call flow changeItem > drop > longPress > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0185 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(85, 0);
      const step2: number = subject.drop('ef4VH7VOau');
      logInfo(`step2 drop("ef4VH7VOau"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.longPress('5');
      logInfo(`step3 longPress("5"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop('m8W0M9hb8mn');
      logInfo(`step4 drop("m8W0M9hb8mn"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`changeItem>drop>longPress>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem>drop>longPress>drop final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>drop>longPress>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem>drop>longPress>drop final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>drop>longPress>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem>drop>longPress>drop final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0186
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0186
     * @tc.desc      ListExchangeModel call flow initData > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0186 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['abc', 'abc']);
      logInfo(`step1 initData(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.addItem('Q8IDjza');
      logInfo(`step2 addItem("Q8IDjza"): step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`initData>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`initData>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc","Q8IDjza"]');
      logInfo(`initData>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`initData>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`initData>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`initData>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0187
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0187
     * @tc.desc      ListExchangeModel call flow changeItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0187 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(100, -97);
      const step2: number = subject.longPress('abc_1');
      logInfo(`step2 longPress("abc_1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`changeItem>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem>longPress final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem>longPress final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem>longPress final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0188
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0188
     * @tc.desc      ListExchangeModel call flow order > drop > changeItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0188 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.drop('ef4VH7VOau');
      logInfo(`step2 drop("ef4VH7VOau"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(40, 80);
      const step4: number = subject.longPress('123');
      logInfo(`step4 longPress("123"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`order>drop>changeItem>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>drop>changeItem>longPress final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`order>drop>changeItem>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>drop>changeItem>longPress final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`order>drop>changeItem>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>drop>changeItem>longPress final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0189
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0189
     * @tc.desc      ListExchangeModel call flow move > move > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0189 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('', 2, 10);
      logInfo(`step1 move("", 2, 10): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.move('a_1', 0, 20);
      logInfo(`step2 move("a_1", 0, 20): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step3 initData(["123", " ", "Hello World"...: step3=${step3}`);
      expect(step3).assertEqual(6);
      logInfo(`move>move>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`move>move>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`move>move>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`move>move>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`move>move>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`move>move>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0190
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0190
     * @tc.desc      ListExchangeModel call flow addItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0190 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('c1xkPAJo');
      logInfo(`step1 addItem("c1xkPAJo"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.addItem('BMt');
      logInfo(`step2 addItem("BMt"): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`addItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["c1xkPAJo","BMt"]');
      logInfo(`addItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0191
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0191
     * @tc.desc      ListExchangeModel call flow order > longPress > addItem > deleteItem > changeItem keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0191 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.longPress('abc');
      logInfo(`step2 longPress("abc"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.addItem(' 123 ');
      logInfo(`step3 addItem(" 123 "): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.deleteItem('123_1');
      logInfo(`step4 deleteItem("123_1"): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.changeItem(-8, 0);
      logInfo(`order>longPress>addItem>deleteItem>change...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>longPress>addItem>deleteItem>change...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" 123 "]');
      logInfo(`order>longPress>addItem>deleteItem>change...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>longPress>addItem>deleteItem>change...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`order>longPress>addItem>deleteItem>change...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>longPress>addItem>deleteItem>change...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0192
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0192
     * @tc.desc      ListExchangeModel call flow order > initData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0192 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step2 initData(["", "a", "abc", "Hello Wo...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual(',a,abc,Hello World, ');
      logInfo(`order>initData>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`order>initData>order final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`order>initData>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`order>initData>order final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`order>initData>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`order>initData>order final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0193
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0193
     * @tc.desc      ListExchangeModel call flow order > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0193 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.deleteItem('o');
      logInfo(`step2 deleteItem("o"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0194
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0194
     * @tc.desc      ListExchangeModel call flow drop > drop > initData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0194 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('bs2fPdl');
      logInfo(`step1 drop("bs2fPdl"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.drop('2Q9yQC');
      logInfo(`step2 drop("2Q9yQC"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 initData(["Hello World", "a", " ", ...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('Hello World,a, ,a,123');
      logInfo(`drop>drop>initData>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`drop>drop>initData>order final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`drop>drop>initData>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`drop>drop>initData>order final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`drop>drop>initData>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`drop>drop>initData>order final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0195
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0195
     * @tc.desc      ListExchangeModel call flow deleteItem > changeItem > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0195 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('x123');
      logInfo(`step1 deleteItem("x123"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.changeItem(0, 1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`deleteItem>changeItem>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`deleteItem>changeItem>order final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`deleteItem>changeItem>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`deleteItem>changeItem>order final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`deleteItem>changeItem>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`deleteItem>changeItem>order final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0196
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0196
     * @tc.desc      ListExchangeModel call flow changeItem > deleteItem > changeItem > order > longPress keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0196 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(70, 30);
      const step2: number = subject.deleteItem(' a ');
      logInfo(`step2 deleteItem(" a "): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.changeItem(15, 0);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual(',');
      const step5: number = subject.longPress('9s7ySMbytaC');
      logInfo(`step5 longPress("9s7ySMbytaC"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`changeItem>deleteItem>changeItem>order>lo...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>deleteItem>changeItem>order>lo...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem>order>lo...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem>order>lo...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>deleteItem>changeItem>order>lo...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem>order>lo...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0197
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0197
     * @tc.desc      ListExchangeModel call flow move > addItem > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0197 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('123', 3, -1);
      logInfo(`step1 move("123", 3, -1): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.addItem('Hello World_1');
      logInfo(`step2 addItem("Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('Hello World_1');
      logInfo(`move>addItem>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`move>addItem>order final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World_1"]');
      logInfo(`move>addItem>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`move>addItem>order final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`move>addItem>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`move>addItem>order final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0198
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0198
     * @tc.desc      ListExchangeModel call flow addItem > order > initData > initData > deleteItem keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0198 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('4TrBMQ');
      logInfo(`step1 addItem("4TrBMQ"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('4TrBMQ');
      const step3: number = subject.initData(['', 'a']);
      logInfo(`step3 initData(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.initData([]);
      logInfo(`step4 initData([]): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.deleteItem('NjHyLBmrp4u1');
      logInfo(`step5 deleteItem("NjHyLBmrp4u1"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0199
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0199
     * @tc.desc      ListExchangeModel call flow changeItem > move > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0199 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 30);
      const step2: number = subject.move('a', 1, -2);
      logInfo(`step2 move("a", 1, -2): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.drop('123123');
      logInfo(`step3 drop("123123"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`changeItem>move>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem>move>drop final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>move>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem>move>drop final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>move>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem>move>drop final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0200
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0200
     * @tc.desc      ListExchangeModel call flow addItem > initData > order > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0200 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('xHello World');
      logInfo(`step1 addItem("xHello World"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.initData(['']);
      logInfo(`step2 initData([""]): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.longPress('');
      logInfo(`step4 longPress(""): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`addItem>initData>order>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>initData>order>longPress final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[""]');
      logInfo(`addItem>initData>order>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>initData>order>longPress final: JSON.stringify(subject.sca...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1.04]');
      logInfo(`addItem>initData>order>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>initData>order>longPress final: JSON.stringify(subject.of...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0201
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0201
     * @tc.desc      ListExchangeModel call flow longPress > deleteItem > initData > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0201 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('Hello World_1');
      logInfo(`step1 longPress("Hello World_1"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('ZDl');
      logInfo(`step2 deleteItem("ZDl"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.initData(['a', '', 'abc']);
      logInfo(`step3 initData(["a", "", "abc"]): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.drop('PfuTHtwfJ7');
      logInfo(`step4 drop("PfuTHtwfJ7"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`longPress>deleteItem>initData>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`longPress>deleteItem>initData>drop final: JSON.stringify(subject.it...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`longPress>deleteItem>initData>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`longPress>deleteItem>initData>drop final: JSON.stringify(subject.s...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`longPress>deleteItem>initData>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`longPress>deleteItem>initData>drop final: JSON.stringify(subject....${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0202
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0202
     * @tc.desc      ListExchangeModel call flow drop > changeItem > order > addItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0202 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('biu9btMUZ');
      logInfo(`step1 drop("biu9btMUZ"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(15, 3);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.addItem('uex');
      logInfo(`step4 addItem("uex"): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.deleteItem('w4X');
      logInfo(`step5 deleteItem("w4X"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`drop>changeItem>order>addItem>deleteItem ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`drop>changeItem>order>addItem>deleteItem ...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`drop>changeItem>order>addItem>deleteItem ...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('uex');
      logInfo(`drop>changeItem>order>addItem>deleteItem ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`drop>changeItem>order>addItem>deleteItem ...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`drop>changeItem>order>addItem>deleteItem ...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0203
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0203
     * @tc.desc      ListExchangeModel call flow order > initData > addItem > initData > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0203 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.initData([]);
      logInfo(`step2 initData([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.addItem('RDr4hJ');
      logInfo(`step3 addItem("RDr4hJ"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.initData(['', 'a']);
      logInfo(`step4 initData(["", "a"]): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.drop('Z5ZGk62E');
      logInfo(`step5 drop("Z5ZGk62E"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`order>initData>addItem>initData>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`order>initData>addItem>initData>drop final: JSON.stringify(subject....${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`order>initData>addItem>initData>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`order>initData>addItem>initData>drop final: JSON.stringify(subject...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`order>initData>addItem>initData>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`order>initData>addItem>initData>drop final: JSON.stringify(subjec...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0204
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0204
     * @tc.desc      ListExchangeModel call flow move > deleteItem > order > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0204 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('xa', 0, 100);
      logInfo(`step1 move("xa", 0, 100): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('mtq7qxS');
      logInfo(`step2 deleteItem("mtq7qxS"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.move('abc', 50, 1);
      logInfo(`step4 move("abc", 50, 1): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0205
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0205
     * @tc.desc      ListExchangeModel call flow initData > addItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0205 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData([]);
      logInfo(`step1 initData([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.addItem(' ');
      logInfo(`step2 addItem(" "): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.addItem('AfA7o3WDf');
      logInfo(`step3 addItem("AfA7o3WDf"): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`initData>addItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`initData>addItem>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" ","AfA7o3WDf"]');
      logInfo(`initData>addItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`initData>addItem>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`initData>addItem>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`initData>addItem>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0206
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0206
     * @tc.desc      ListExchangeModel call flow changeItem > initData > drop > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0206 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(50, 0);
      const step2: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 initData(["Hello World", "a", " ", ...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.drop('yBi9');
      logInfo(`step3 drop("yBi9"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.changeItem(40, 0);
      logInfo(`changeItem>initData>drop>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`changeItem>initData>drop>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>initData>drop>changeItem final: subject.items[2]=${subject.items[2]}`);
      expect(subject.items[2]).assertEqual('a');
      logInfo(`changeItem>initData>drop>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`changeItem>initData>drop>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>initData>drop>changeItem final: subject.scales[2]=${subject.scales[2]}`);
      expect(subject.scales[2]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0207
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0207
     * @tc.desc      ListExchangeModel call flow changeItem > longPress > changeItem > deleteItem > drop keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0207 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(15, 1);
      const step2: number = subject.longPress('zNQbGok6F9');
      logInfo(`step2 longPress("zNQbGok6F9"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(50, 10);
      const step4: number = subject.deleteItem(' Hello World ');
      logInfo(`step4 deleteItem(" Hello World "): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.drop('  ');
      logInfo(`step5 drop("  "): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`changeItem>longPress>changeItem>deleteIte...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>longPress>changeItem>deleteIte...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>longPress>changeItem>deleteIte...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`changeItem>longPress>changeItem>deleteIte...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>longPress>changeItem>deleteIte...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>longPress>changeItem>deleteIte...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0208
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0208
     * @tc.desc      ListExchangeModel call flow changeItem > order > initData > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0208 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(5, 2);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.initData(['', 'a']);
      logInfo(`step3 initData(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.addItem('S8YsjJLj');
      logInfo(`step4 addItem("S8YsjJLj"): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`changeItem>order>initData>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`changeItem>order>initData>addItem final: JSON.stringify(subject.ite...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","S8YsjJLj"]');
      logInfo(`changeItem>order>initData>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`changeItem>order>initData>addItem final: JSON.stringify(subject.sc...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`changeItem>order>initData>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`changeItem>order>initData>addItem final: JSON.stringify(subject.o...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0209
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0209
     * @tc.desc      ListExchangeModel call flow changeItem > deleteItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0209 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(65, 25);
      const step2: number = subject.deleteItem('a');
      logInfo(`step2 deleteItem("a"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.deleteItem('oyOBWCB2ShS');
      logInfo(`step3 deleteItem("oyOBWCB2ShS"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`changeItem>deleteItem>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem>deleteItem>deleteItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem>deleteItem>deleteItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem>deleteItem>deleteItem final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0210
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0210
     * @tc.desc      ListExchangeModel call flow longPress > longPress > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0210 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('Xsk4zLAx9DeF');
      logInfo(`step1 longPress("Xsk4zLAx9DeF"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.longPress('uIM9TVX6');
      logInfo(`step2 longPress("uIM9TVX6"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(90, 3);
      logInfo(`longPress>longPress>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`longPress>longPress>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`longPress>longPress>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`longPress>longPress>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`longPress>longPress>changeItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`longPress>longPress>changeItem final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0211
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0211
     * @tc.desc      ListExchangeModel call flow addItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0211 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('x123');
      logInfo(`step1 addItem("x123"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop('n0pyFl');
      logInfo(`step2 drop("n0pyFl"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`addItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["x123"]');
      logInfo(`addItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>drop final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0212
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0212
     * @tc.desc      ListExchangeModel call flow changeItem > deleteItem > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0212 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(45, 5);
      const step2: number = subject.deleteItem('bPuSRfHeDR');
      logInfo(`step2 deleteItem("bPuSRfHeDR"): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.changeItem(45, 1);
      logInfo(`changeItem>deleteItem>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>deleteItem>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>deleteItem>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0213
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0213
     * @tc.desc      ListExchangeModel call flow changeItem > initData > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0213 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(25, 105);
      const step2: number = subject.initData(['a', '', 'abc']);
      logInfo(`step2 initData(["a", "", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.changeItem(15, 0);
      logInfo(`changeItem>initData>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(4);
      logInfo(`changeItem>initData>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>initData>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('a');
      logInfo(`changeItem>initData>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(4);
      logInfo(`changeItem>initData>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>initData>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0214
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0214
     * @tc.desc      ListExchangeModel call flow addItem > order > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0214 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('3IhRqztWqJ');
      logInfo(`step1 addItem("3IhRqztWqJ"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('3IhRqztWqJ');
      const step3: number = subject.deleteItem('dh');
      logInfo(`step3 deleteItem("dh"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`addItem>order>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>order>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["3IhRqztWqJ"]');
      logInfo(`addItem>order>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>order>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>order>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>order>deleteItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0215
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0215
     * @tc.desc      ListExchangeModel call flow order > deleteItem > deleteItem > order > addItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0215 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.deleteItem('a_1');
      logInfo(`step2 deleteItem("a_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.deleteItem('w4X');
      logInfo(`step3 deleteItem("w4X"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.addItem(' a ');
      logInfo(`step5 addItem(" a "): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`order>deleteItem>deleteItem>order>addItem...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>deleteItem>deleteItem>order>addItem...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" a "]');
      logInfo(`order>deleteItem>deleteItem>order>addItem...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>deleteItem>deleteItem>order>addItem...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`order>deleteItem>deleteItem>order>addItem...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>deleteItem>deleteItem>order>addItem...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0216
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0216
     * @tc.desc      ListExchangeModel call flow addItem > longPress > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0216 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('scCMTPJ');
      logInfo(`step1 addItem("scCMTPJ"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.longPress('X8');
      logInfo(`step2 longPress("X8"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.move('aa', -100, 0);
      logInfo(`step3 move("aa", -100, 0): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`addItem>longPress>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>longPress>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["scCMTPJ"]');
      logInfo(`addItem>longPress>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>longPress>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>longPress>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>longPress>move final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0217
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0217
     * @tc.desc      ListExchangeModel call flow order > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0217 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.addItem('Q8IDjza');
      logInfo(`step2 addItem("Q8IDjza"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`order>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Q8IDjza"]');
      logInfo(`order>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`order>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0218
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0218
     * @tc.desc      ListExchangeModel call flow changeItem > changeItem > drop > addItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0218 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(80, 3);
      subject.changeItem(80, 60);
      const step3: number = subject.drop(' ');
      logInfo(`step3 drop(" "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.addItem('5');
      logInfo(`step4 addItem("5"): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.move('xa', 0, 100);
      logInfo(`step5 move("xa", 0, 100): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`changeItem>changeItem>drop>addItem>move f...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`changeItem>changeItem>drop>addItem>move f...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>changeItem>drop>addItem>move f...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`changeItem>changeItem>drop>addItem>move f...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`changeItem>changeItem>drop>addItem>move f...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>changeItem>drop>addItem>move f...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0219
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0219
     * @tc.desc      ListExchangeModel call flow move > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0219 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('', 3, 0);
      logInfo(`step1 move("", 3, 0): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.initData(['', 'a']);
      logInfo(`step2 initData(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`move>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`move>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`move>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`move>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`move>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`move>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0220
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0220
     * @tc.desc      ListExchangeModel call flow addItem > initData > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0220 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('SjuHa');
      logInfo(`step1 addItem("SjuHa"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step2 initData(["", "a", "abc", "Hello Wo...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.move('', -2, 5);
      logInfo(`step3 move("", -2, 5): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`addItem>initData>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`addItem>initData>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`addItem>initData>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`addItem>initData>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`addItem>initData>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`addItem>initData>move final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[-2,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0221
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0221
     * @tc.desc      ListExchangeModel call flow initData > changeItem > longPress > order > addItem keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0221 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 initData(["123", " ", "Hello World"...: step1=${step1}`);
      expect(step1).assertEqual(6);
      subject.changeItem(75, 0);
      const step3: number = subject.longPress('I5Jr3Kq3');
      logInfo(`step3 longPress("I5Jr3Kq3"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual(',123, ,Hello World,abc,a,');
      const step5: number = subject.addItem('SBib');
      logInfo(`step5 addItem("SBib"): step5=${step5}`);
      expect(step5).assertEqual(8);
      logInfo(`initData>changeItem>longPress>order>addIt...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(8);
      logInfo(`initData>changeItem>longPress>order>addIt...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`initData>changeItem>longPress>order>addIt...: subject.items[3]=${subject.items[3]}`);
      expect(subject.items[3]).assertEqual('Hello World');
      logInfo(`initData>changeItem>longPress>order>addIt...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(8);
      logInfo(`initData>changeItem>longPress>order>addIt...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`initData>changeItem>longPress>order>addIt...: subject.scales[3]=${subject.scales[3]}`);
      expect(subject.scales[3]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0222
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0222
     * @tc.desc      ListExchangeModel call flow move > initData > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0222 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move(' a ', 100, 0);
      logInfo(`step1 move(" a ", 100, 0): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.initData(['', 'a']);
      logInfo(`step2 initData(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.changeItem(85, 0);
      logInfo(`move>initData>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`move>initData>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`move>initData>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('');
      logInfo(`move>initData>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`move>initData>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`move>initData>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0223
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0223
     * @tc.desc      ListExchangeModel call flow move > initData > changeItem > changeItem > longPress keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0223 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('aa', 99, 3);
      logInfo(`step1 move("aa", 99, 3): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.initData(['a', '', 'abc']);
      logInfo(`step2 initData(["a", "", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.changeItem(40, 20);
      subject.changeItem(20, 1);
      const step5: number = subject.longPress('123');
      logInfo(`step5 longPress("123"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`move>initData>changeItem>changeItem>longP...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`move>initData>changeItem>changeItem>longP...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('a');
      logInfo(`move>initData>changeItem>changeItem>longP...: subject.items[2]=${subject.items[2]}`);
      expect(subject.items[2]).assertEqual('');
      logInfo(`move>initData>changeItem>changeItem>longP...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`move>initData>changeItem>changeItem>longP...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`move>initData>changeItem>changeItem>longP...: subject.scales[2]=${subject.scales[2]}`);
      expect(subject.scales[2]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0224
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0224
     * @tc.desc      ListExchangeModel call flow initData > order > longPress > longPress > longPress keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0224 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData([]);
      logInfo(`step1 initData([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.longPress('L51Shr0uUtn');
      logInfo(`step3 longPress("L51Shr0uUtn"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.longPress('5');
      logInfo(`step4 longPress("5"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.longPress('27IlAQ');
      logInfo(`step5 longPress("27IlAQ"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`initData>order>longPress>longPress>longPr...: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0225
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0225
     * @tc.desc      ListExchangeModel call flow deleteItem > initData > deleteItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0225 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('jc0');
      logInfo(`step1 deleteItem("jc0"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.initData(['abc', 'abc']);
      logInfo(`step2 initData(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.deleteItem('o');
      logInfo(`step3 deleteItem("o"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.deleteItem('t');
      logInfo(`step4 deleteItem("t"): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`deleteItem>initData>deleteItem>deleteItem...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`deleteItem>initData>deleteItem>deleteItem...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc"]');
      logInfo(`deleteItem>initData>deleteItem>deleteItem...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`deleteItem>initData>deleteItem>deleteItem...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`deleteItem>initData>deleteItem>deleteItem...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`deleteItem>initData>deleteItem>deleteItem...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0225 end`);
    });
  });
}
