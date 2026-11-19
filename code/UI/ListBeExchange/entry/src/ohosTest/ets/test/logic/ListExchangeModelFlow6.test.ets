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

/** Logic checks for ListExchangeModel flow (24 cases). */
export default function listExchangeModelFlow6Test(): void {
  describe('ListExchangeModelFlow6Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0226
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0226
     * @tc.desc      ListExchangeModel call flow addItem > move > drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0226 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('Hello World');
      logInfo(`step1 addItem("Hello World"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.move('123', 0, 5);
      logInfo(`step2 move("123", 0, 5): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.drop(' Hello World ');
      logInfo(`step3 drop(" Hello World "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('Hello World');
      logInfo(`addItem>move>drop>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>move>drop>order final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World"]');
      logInfo(`addItem>move>drop>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>move>drop>order final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>move>drop>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>move>drop>order final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0227
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0227
     * @tc.desc      ListExchangeModel call flow addItem > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0227 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('bFD0');
      logInfo(`step1 addItem("bFD0"): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.changeItem(0, -1);
      logInfo(`addItem>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>changeItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["bFD0"]');
      logInfo(`addItem>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>changeItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>changeItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>changeItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0228
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0228
     * @tc.desc      ListExchangeModel call flow changeItem > move > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0228 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(45, 34);
      const step2: number = subject.move('', 100, 0);
      logInfo(`step2 move("", 100, 0): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.initData(['', 'a']);
      logInfo(`step3 initData(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`changeItem>move>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>move>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`changeItem>move>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>move>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`changeItem>move>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`changeItem>move>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0229
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0229
     * @tc.desc      ListExchangeModel call flow drop > drop > move > longPress > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0229 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop(' _1');
      logInfo(`step1 drop(" _1"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.drop(' _1');
      logInfo(`step2 drop(" _1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.move(' a ', -1, 20);
      logInfo(`step3 move(" a ", -1, 20): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.longPress('N2D5');
      logInfo(`step4 longPress("N2D5"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.move('', 10, 0);
      logInfo(`step5 move("", 10, 0): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`drop>drop>move>longPress>move final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0230
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0230
     * @tc.desc      ListExchangeModel call flow changeItem > initData > initData > deleteItem > longPress keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0230 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(15, 3);
      const step2: number = subject.initData(['', 'a']);
      logInfo(`step2 initData(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.initData(['a', '', 'abc']);
      logInfo(`step3 initData(["a", "", "abc"]): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.deleteItem('fW9V');
      logInfo(`step4 deleteItem("fW9V"): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.longPress('abc');
      logInfo(`step5 longPress("abc"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`changeItem>initData>initData>deleteItem>l...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`changeItem>initData>initData>deleteItem>l...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`changeItem>initData>initData>deleteItem>l...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`changeItem>initData>initData>deleteItem>l...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1.04]');
      logInfo(`changeItem>initData>initData>deleteItem>l...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`changeItem>initData>initData>deleteItem>l...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0231
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0231
     * @tc.desc      ListExchangeModel call flow changeItem > drop > deleteItem > order > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0231 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(15, 10);
      const step2: number = subject.drop(' _1');
      logInfo(`step2 drop(" _1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.deleteItem('123_1');
      logInfo(`step3 deleteItem("123_1"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.addItem('MQWnRLJ');
      logInfo(`step5 addItem("MQWnRLJ"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`changeItem>drop>deleteItem>order>addItem ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>drop>deleteItem>order>addItem ...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>drop>deleteItem>order>addItem ...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('MQWnRLJ');
      logInfo(`changeItem>drop>deleteItem>order>addItem ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>drop>deleteItem>order>addItem ...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>drop>deleteItem>order>addItem ...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0232
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0232
     * @tc.desc      ListExchangeModel call flow drop > changeItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0232 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('n0pyFl');
      logInfo(`step1 drop("n0pyFl"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(-1, -97);
      const step3: number = subject.longPress('6vaW3YXYr7G5');
      logInfo(`step3 longPress("6vaW3YXYr7G5"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`drop>changeItem>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`drop>changeItem>longPress final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`drop>changeItem>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`drop>changeItem>longPress final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`drop>changeItem>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`drop>changeItem>longPress final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0233
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0233
     * @tc.desc      ListExchangeModel call flow deleteItem > changeItem > addItem > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0233 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('abc_1');
      logInfo(`step1 deleteItem("abc_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.changeItem(35, 60);
      const step3: number = subject.addItem('89y00cffJRd1');
      logInfo(`step3 addItem("89y00cffJRd1"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step4 initData(["", "a", "abc", "Hello Wo...: step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`deleteItem>changeItem>addItem>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`deleteItem>changeItem>addItem>initData final: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`deleteItem>changeItem>addItem>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`deleteItem>changeItem>addItem>initData final: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`deleteItem>changeItem>addItem>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`deleteItem>changeItem>addItem>initData final: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0234
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0234
     * @tc.desc      ListExchangeModel call flow drop > changeItem > initData > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0234 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('owLuzEhB3zDh');
      logInfo(`step1 drop("owLuzEhB3zDh"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(100, 0);
      const step3: number = subject.initData(['']);
      logInfo(`step3 initData([""]): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.move('123', -100, 100);
      logInfo(`step4 move("123", -100, 100): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`drop>changeItem>initData>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`drop>changeItem>initData>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[""]');
      logInfo(`drop>changeItem>initData>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`drop>changeItem>initData>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`drop>changeItem>initData>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`drop>changeItem>initData>move final: JSON.stringify(subject.offse...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0235
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0235
     * @tc.desc      ListExchangeModel call flow move > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0235 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('', -100, 3);
      logInfo(`step1 move("", -100, 3): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.drop('djW7');
      logInfo(`step3 drop("djW7"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0236
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0236
     * @tc.desc      ListExchangeModel call flow order > drop > drop > initData > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0236 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.drop('3v0bwF9sQ43g');
      logInfo(`step2 drop("3v0bwF9sQ43g"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.drop('123123');
      logInfo(`step3 drop("123123"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.initData(['']);
      logInfo(`step4 initData([""]): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.longPress('cLcIjN03OY4');
      logInfo(`step5 longPress("cLcIjN03OY4"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`order>drop>drop>initData>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>drop>drop>initData>longPress final: JSON.stringify(subject.it...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[""]');
      logInfo(`order>drop>drop>initData>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>drop>drop>initData>longPress final: JSON.stringify(subject.s...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`order>drop>drop>initData>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>drop>drop>initData>longPress final: JSON.stringify(subject....${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0237
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0237
     * @tc.desc      ListExchangeModel call flow addItem > move > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0237 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('lb5OFsK7');
      logInfo(`step1 addItem("lb5OFsK7"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.move('Hello World', -1, 7.19);
      logInfo(`step2 move("Hello World", -1, 7.19): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.addItem('uex');
      logInfo(`step3 addItem("uex"): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`addItem>move>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>move>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["lb5OFsK7","uex"]');
      logInfo(`addItem>move>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>move>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>move>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>move>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0238
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0238
     * @tc.desc      ListExchangeModel call flow addItem > longPress > order > changeItem > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0238 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem(' abc ');
      logInfo(`step1 addItem(" abc "): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.longPress('123_1');
      logInfo(`step2 longPress("123_1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual(' abc ');
      subject.changeItem(20, 20);
      const step5: string = subject.order();
      logInfo(`step5 order(): step5=${step5}`);
      expect(step5).assertEqual(' abc ,');
      logInfo(`addItem>longPress>order>changeItem>order ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>longPress>order>changeItem>order ...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual(' abc ');
      logInfo(`addItem>longPress>order>changeItem>order ...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`addItem>longPress>order>changeItem>order ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>longPress>order>changeItem>order ...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`addItem>longPress>order>changeItem>order ...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0239
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0239
     * @tc.desc      ListExchangeModel call flow initData > initData > longPress > move > deleteItem keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0239 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['abc', 'abc']);
      logInfo(`step1 initData(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 initData(["Hello World", "a", " ", ...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.longPress('n7Q');
      logInfo(`step3 longPress("n7Q"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.move('Hello World', 3, 10);
      logInfo(`step4 move("Hello World", 3, 10): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.deleteItem('J');
      logInfo(`step5 deleteItem("J"): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`initData>initData>longPress>move>deleteIt...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`initData>initData>longPress>move>deleteIt...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`initData>initData>longPress>move>deleteIt...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`initData>initData>longPress>move>deleteIt...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,0,1,1,1]');
      logInfo(`initData>initData>longPress>move>deleteIt...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`initData>initData>longPress>move>deleteIt...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[3,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0240
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0240
     * @tc.desc      ListExchangeModel call flow deleteItem > deleteItem > order > drop > longPress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0240 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('RbK');
      logInfo(`step1 deleteItem("RbK"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.deleteItem('t');
      logInfo(`step2 deleteItem("t"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.drop('LgaSzrL');
      logInfo(`step4 drop("LgaSzrL"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.longPress(' a ');
      logInfo(`step5 longPress(" a "): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`deleteItem>deleteItem>order>drop>longPres...: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0241
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0241
     * @tc.desc      ListExchangeModel call flow move > deleteItem > addItem > initData > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0241 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('abc', -2, 5);
      logInfo(`step1 move("abc", -2, 5): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('');
      logInfo(`step2 deleteItem(""): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.addItem('c1xkPAJo');
      logInfo(`step3 addItem("c1xkPAJo"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step4 initData(["123", " ", "Hello World"...: step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: number = subject.move('', 10, 0);
      logInfo(`step5 move("", 10, 0): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`move>deleteItem>addItem>initData>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`move>deleteItem>addItem>initData>move final: JSON.stringify(subject...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`move>deleteItem>addItem>initData>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`move>deleteItem>addItem>initData>move final: JSON.stringify(subjec...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`move>deleteItem>addItem>initData>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`move>deleteItem>addItem>initData>move final: JSON.stringify(subje...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,10]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0242
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0242
     * @tc.desc      ListExchangeModel call flow initData > drop > order > deleteItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0242 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 initData(["Hello World", "a", " ", ...: step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: number = subject.drop('lyID3zh');
      logInfo(`step2 drop("lyID3zh"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('Hello World,a, ,a,123');
      const step4: number = subject.deleteItem('2');
      logInfo(`step4 deleteItem("2"): step4=${step4}`);
      expect(step4).assertEqual(5);
      const step5: number = subject.addItem('');
      logInfo(`step5 addItem(""): step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`initData>drop>order>deleteItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`initData>drop>order>deleteItem>addItem final: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123",""]');
      logInfo(`initData>drop>order>deleteItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`initData>drop>order>deleteItem>addItem final: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`initData>drop>order>deleteItem>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`initData>drop>order>deleteItem>addItem final: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0243
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0243
     * @tc.desc      ListExchangeModel call flow initData > move > longPress > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0243 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['abc', 'abc']);
      logInfo(`step1 initData(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.move('', 10, 15);
      logInfo(`step2 move("", 10, 15): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.longPress('n7Q');
      logInfo(`step3 longPress("n7Q"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop('z0mNRlew0alg');
      logInfo(`step4 drop("z0mNRlew0alg"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`initData>move>longPress>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`initData>move>longPress>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc"]');
      logInfo(`initData>move>longPress>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`initData>move>longPress>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`initData>move>longPress>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`initData>move>longPress>drop final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0244
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0244
     * @tc.desc      ListExchangeModel call flow drop > changeItem > longPress > changeItem > move keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0244 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('1qNMhHq');
      logInfo(`step1 drop("1qNMhHq"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(3, 35);
      const step3: number = subject.longPress('Hello World');
      logInfo(`step3 longPress("Hello World"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.changeItem(45, 1);
      const step5: number = subject.move('', 99, 0);
      logInfo(`step5 move("", 99, 0): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`drop>changeItem>longPress>changeItem>move...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`drop>changeItem>longPress>changeItem>move...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`drop>changeItem>longPress>changeItem>move...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`drop>changeItem>longPress>changeItem>move...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`drop>changeItem>longPress>changeItem>move...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`drop>changeItem>longPress>changeItem>move...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0245
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0245
     * @tc.desc      ListExchangeModel call flow addItem > move > order > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0245 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('brggsXxwqZ');
      logInfo(`step1 addItem("brggsXxwqZ"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.move('123', -100, 0);
      logInfo(`step2 move("123", -100, 0): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('brggsXxwqZ');
      const step4: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step4 initData(["Hello World", "a", " ", ...: step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`addItem>move>order>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`addItem>move>order>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`addItem>move>order>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`addItem>move>order>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`addItem>move>order>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`addItem>move>order>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0246
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0246
     * @tc.desc      ListExchangeModel call flow addItem > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0246 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('x ');
      logInfo(`step1 addItem("x "): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('x ');
      logInfo(`addItem>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>order final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["x "]');
      logInfo(`addItem>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>order final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>order final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0247
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0247
     * @tc.desc      ListExchangeModel call flow changeItem > initData > move > addItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0247 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(100, 80);
      const step2: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step2 initData(["", "a", "abc", "Hello Wo...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.move('a_1', -100, 0);
      logInfo(`step3 move("a_1", -100, 0): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.addItem('pS3O');
      logInfo(`step4 addItem("pS3O"): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: number = subject.drop('biu9btMUZ');
      logInfo(`step5 drop("biu9btMUZ"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`changeItem>initData>move>addItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`changeItem>initData>move>addItem>drop final: JSON.stringify(subject...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," ","pS3O"]');
      logInfo(`changeItem>initData>move>addItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`changeItem>initData>move>addItem>drop final: JSON.stringify(subjec...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`changeItem>initData>move>addItem>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`changeItem>initData>move>addItem>drop final: JSON.stringify(subje...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0248
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0248
     * @tc.desc      ListExchangeModel call flow longPress > addItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0248 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('BLjyYq');
      logInfo(`step1 longPress("BLjyYq"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.addItem('3Vy');
      logInfo(`step2 addItem("3Vy"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.drop('N');
      logInfo(`step3 drop("N"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`longPress>addItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`longPress>addItem>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["3Vy"]');
      logInfo(`longPress>addItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`longPress>addItem>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`longPress>addItem>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`longPress>addItem>drop final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0249
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0249
     * @tc.desc      ListExchangeModel call flow initData > changeItem > changeItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0249 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['a', '', 'abc']);
      logInfo(`step1 initData(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(3);
      subject.changeItem(45, -97);
      subject.changeItem(110, 95);
      const step4: number = subject.drop('ehwpl8');
      logInfo(`step4 drop("ehwpl8"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`initData>changeItem>changeItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`initData>changeItem>changeItem>drop final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`initData>changeItem>changeItem>drop final: subject.items[2]=${subject.items[2]}`);
      expect(subject.items[2]).assertEqual('');
      logInfo(`initData>changeItem>changeItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`initData>changeItem>changeItem>drop final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`initData>changeItem>changeItem>drop final: subject.scales[2]=${subject.scales[2]}`);
      expect(subject.scales[2]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0249 end`);
    });
  });
}
