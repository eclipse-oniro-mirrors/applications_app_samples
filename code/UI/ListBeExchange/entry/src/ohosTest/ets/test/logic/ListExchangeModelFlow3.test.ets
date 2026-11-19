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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ListExchangeModel flow (46 cases). */
export default function listExchangeModelFlow3Test(): void {
  describe('ListExchangeModelFlow3Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0092
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0092
     * @tc.desc      ListExchangeModel call flow addItem > initData > deleteItem > order > addItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0092 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('bFD0');
      logInfo(`step1 addItem("bFD0"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.initData(['abc', 'abc']);
      logInfo(`step2 initData(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.deleteItem('aa');
      logInfo(`step3 deleteItem("aa"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('abc,abc');
      const step5: number = subject.addItem('pS3O');
      logInfo(`step5 addItem("pS3O"): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`addItem>initData>deleteItem>order>addItem...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`addItem>initData>deleteItem>order>addItem...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc","pS3O"]');
      logInfo(`addItem>initData>deleteItem>order>addItem...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`addItem>initData>deleteItem>order>addItem...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`addItem>initData>deleteItem>order>addItem...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`addItem>initData>deleteItem>order>addItem...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0093
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0093
     * @tc.desc      ListExchangeModel call flow addItem > order > changeItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0093 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('xabc');
      logInfo(`step1 addItem("xabc"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('xabc');
      subject.changeItem(100, 95);
      const step4: number = subject.longPress('b1Ahk2qyI2');
      logInfo(`step4 longPress("b1Ahk2qyI2"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`addItem>order>changeItem>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>order>changeItem>longPress final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('xabc');
      logInfo(`addItem>order>changeItem>longPress final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`addItem>order>changeItem>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>order>changeItem>longPress final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`addItem>order>changeItem>longPress final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0094
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0094
     * @tc.desc      ListExchangeModel call flow deleteItem > order > longPress > order > deleteItem keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0094 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('bHqpmrTDRrDL');
      logInfo(`step1 deleteItem("bHqpmrTDRrDL"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.longPress('c');
      logInfo(`step3 longPress("c"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.deleteItem('123');
      logInfo(`step5 deleteItem("123"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0095
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0095
     * @tc.desc      ListExchangeModel call flow initData > order > drop > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0095 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 initData(["Hello World", "a", " ", ...: step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('Hello World,a, ,a,123');
      const step3: number = subject.drop('lyID3zh');
      logInfo(`step3 drop("lyID3zh"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.move('', 10, 0);
      logInfo(`step4 move("", 10, 0): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`initData>order>drop>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`initData>order>drop>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`initData>order>drop>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`initData>order>drop>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`initData>order>drop>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`initData>order>drop>move final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0096
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0096
     * @tc.desc      ListExchangeModel call flow changeItem > deleteItem > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0096 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(20, 20);
      const step2: number = subject.deleteItem('hznL8LLs1');
      logInfo(`step2 deleteItem("hznL8LLs1"): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.changeItem(0, -1);
      logInfo(`changeItem>deleteItem>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem>deleteItem>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem>deleteItem>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>changeItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem>deleteItem>changeItem final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0097
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0097
     * @tc.desc      ListExchangeModel call flow longPress > move > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0097 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress(' 123 ');
      logInfo(`step1 longPress(" 123 "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.move('', 5, 0);
      logInfo(`step2 move("", 5, 0): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.move(' a ', 100, 0);
      logInfo(`step3 move(" a ", 100, 0): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`longPress>move>move final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0098
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0098
     * @tc.desc      ListExchangeModel call flow changeItem > addItem > move > order > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0098 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(50, 20);
      const step2: number = subject.addItem('BMt');
      logInfo(`step2 addItem("BMt"): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.move(' ', 100, 1);
      logInfo(`step3 move(" ", 100, 1): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual(',BMt');
      const step5: number = subject.deleteItem('xHello World');
      logInfo(`step5 deleteItem("xHello World"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`changeItem>addItem>move>order>deleteItem ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>addItem>move>order>deleteItem ...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>addItem>move>order>deleteItem ...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('BMt');
      logInfo(`changeItem>addItem>move>order>deleteItem ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>addItem>move>order>deleteItem ...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>addItem>move>order>deleteItem ...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0099
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0099
     * @tc.desc      ListExchangeModel call flow addItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0099 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('BKyLgmiJSF');
      logInfo(`step1 addItem("BKyLgmiJSF"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.deleteItem('123_1');
      logInfo(`step2 deleteItem("123_1"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`addItem>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["BKyLgmiJSF"]');
      logInfo(`addItem>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0100
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0100
     * @tc.desc      ListExchangeModel call flow drop > longPress > changeItem > longPress > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0100 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('iS8');
      logInfo(`step1 drop("iS8"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.longPress('rOpU1M');
      logInfo(`step2 longPress("rOpU1M"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(70, 30);
      const step4: number = subject.longPress('j7F');
      logInfo(`step4 longPress("j7F"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.move('abc', 0, 10);
      logInfo(`step5 move("abc", 0, 10): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`drop>longPress>changeItem>longPress>move ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`drop>longPress>changeItem>longPress>move ...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`drop>longPress>changeItem>longPress>move ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`drop>longPress>changeItem>longPress>move ...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`drop>longPress>changeItem>longPress>move ...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`drop>longPress>changeItem>longPress>move ...: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0101
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0101
     * @tc.desc      ListExchangeModel call flow addItem > move > initData > deleteItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0101 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('78v');
      logInfo(`step1 addItem("78v"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.move('123', 0, 5);
      logInfo(`step2 move("123", 0, 5): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.initData(['abc', 'abc']);
      logInfo(`step3 initData(["abc", "abc"]): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.deleteItem('123');
      logInfo(`step4 deleteItem("123"): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.drop(' _1');
      logInfo(`step5 drop(" _1"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`addItem>move>initData>deleteItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>move>initData>deleteItem>drop final: JSON.stringify(subject...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc"]');
      logInfo(`addItem>move>initData>deleteItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>move>initData>deleteItem>drop final: JSON.stringify(subjec...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>move>initData>deleteItem>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>move>initData>deleteItem>drop final: JSON.stringify(subje...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0102
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0102
     * @tc.desc      ListExchangeModel call flow addItem > longPress > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0102 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('OMJoDqHG95');
      logInfo(`step1 addItem("OMJoDqHG95"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.longPress('123');
      logInfo(`step2 longPress("123"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('OMJoDqHG95');
      logInfo(`addItem>longPress>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>longPress>order final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["OMJoDqHG95"]');
      logInfo(`addItem>longPress>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>longPress>order final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>longPress>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>longPress>order final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0103
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0103
     * @tc.desc      ListExchangeModel call flow initData > move > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0103 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['', 'a']);
      logInfo(`step1 initData(["", "a"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.move('', -100, 100);
      logInfo(`step2 move("", -100, 100): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.deleteItem('Z');
      logInfo(`step3 deleteItem("Z"): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`initData>move>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`initData>move>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`initData>move>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`initData>move>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`initData>move>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`initData>move>deleteItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[-100,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0104
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0104
     * @tc.desc      ListExchangeModel call flow order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0104 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0105
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0105
     * @tc.desc      ListExchangeModel call flow drop > drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0105 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('AGwwCm3');
      logInfo(`step1 drop("AGwwCm3"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.drop('zYbDjl4');
      logInfo(`step2 drop("zYbDjl4"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0106
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0106
     * @tc.desc      ListExchangeModel call flow order > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0106 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.addItem('abc');
      logInfo(`step2 addItem("abc"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`order>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc"]');
      logInfo(`order>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`order>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0107
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0107
     * @tc.desc      ListExchangeModel call flow addItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0107 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('WjYH5IerXJG8');
      logInfo(`step1 addItem("WjYH5IerXJG8"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.move('', -100, 5);
      logInfo(`step2 move("", -100, 5): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`addItem>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["WjYH5IerXJG8"]');
      logInfo(`addItem>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>move final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0108
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0108
     * @tc.desc      ListExchangeModel call flow addItem > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0108 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('WjYH5IerXJG8');
      logInfo(`step1 addItem("WjYH5IerXJG8"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.initData([]);
      logInfo(`step2 initData([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0109
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0109
     * @tc.desc      ListExchangeModel call flow move > initData > drop > initData > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0109 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('abc', 2, 15);
      logInfo(`step1 move("abc", 2, 15): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.initData(['']);
      logInfo(`step2 initData([""]): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.drop('19');
      logInfo(`step3 drop("19"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.initData(['', 'a']);
      logInfo(`step4 initData(["", "a"]): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.longPress('Hello World_1');
      logInfo(`step5 longPress("Hello World_1"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`move>initData>drop>initData>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`move>initData>drop>initData>longPress final: JSON.stringify(subject...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`move>initData>drop>initData>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`move>initData>drop>initData>longPress final: JSON.stringify(subjec...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`move>initData>drop>initData>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`move>initData>drop>initData>longPress final: JSON.stringify(subje...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0110
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0110
     * @tc.desc      ListExchangeModel call flow changeItem > move > order > deleteItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0110 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(60, 65);
      const step2: number = subject.move('xa', 100, 2);
      logInfo(`step2 move("xa", 100, 2): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.deleteItem('goR');
      logInfo(`step4 deleteItem("goR"): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.move('a_1', -100, 0);
      logInfo(`step5 move("a_1", -100, 0): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`changeItem>move>order>deleteItem>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem>move>order>deleteItem>move final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>move>order>deleteItem>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem>move>order>deleteItem>move final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>move>order>deleteItem>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem>move>order>deleteItem>move final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0111
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0111
     * @tc.desc      ListExchangeModel call flow addItem > longPress > addItem > move > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0111 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('Se0FME75VqB');
      logInfo(`step1 addItem("Se0FME75VqB"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.longPress('5FHf');
      logInfo(`step2 longPress("5FHf"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.addItem('');
      logInfo(`step3 addItem(""): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.move('', -1, 10);
      logInfo(`step4 move("", -1, 10): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.longPress('123_1');
      logInfo(`step5 longPress("123_1"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`addItem>longPress>addItem>move>longPress ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>longPress>addItem>move>longPress ...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Se0FME75VqB",""]');
      logInfo(`addItem>longPress>addItem>move>longPress ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>longPress>addItem>move>longPress ...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[0,1]');
      logInfo(`addItem>longPress>addItem>move>longPress ...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>longPress>addItem>move>longPress ...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,-1]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0112
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0112
     * @tc.desc      ListExchangeModel call flow move > initData > longPress > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0112 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('123', 10, 100);
      logInfo(`step1 move("123", 10, 100): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.initData(['', 'a']);
      logInfo(`step2 initData(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.longPress('a');
      logInfo(`step3 longPress("a"): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.changeItem(101, 85);
      logInfo(`move>initData>longPress>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`move>initData>longPress>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('');
      logInfo(`move>initData>longPress>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('a');
      logInfo(`move>initData>longPress>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`move>initData>longPress>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`move>initData>longPress>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertClose(1.04, PRECISION);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0113
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0113
     * @tc.desc      ListExchangeModel call flow drop > move > longPress > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0113 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('123_1');
      logInfo(`step1 drop("123_1"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.move(' ', 10, -2);
      logInfo(`step2 move(" ", 10, -2): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.longPress('LUyok7GdLLq');
      logInfo(`step3 longPress("LUyok7GdLLq"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.deleteItem('abcabc');
      logInfo(`step4 deleteItem("abcabc"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0114
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0114
     * @tc.desc      ListExchangeModel call flow initData > initData > longPress > changeItem > deleteItem keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0114 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step1 initData(["", "a", "abc", "Hello Wo...: step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: number = subject.initData(['a', '', 'abc']);
      logInfo(`step2 initData(["a", "", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.longPress('KUJ9e');
      logInfo(`step3 longPress("KUJ9e"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.changeItem(60, 95);
      const step5: number = subject.deleteItem('o');
      logInfo(`step5 deleteItem("o"): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`initData>initData>longPress>changeItem>de...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(4);
      logInfo(`initData>initData>longPress>changeItem>de...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('a');
      logInfo(`initData>initData>longPress>changeItem>de...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('');
      logInfo(`initData>initData>longPress>changeItem>de...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(4);
      logInfo(`initData>initData>longPress>changeItem>de...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`initData>initData>longPress>changeItem>de...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0115
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0115
     * @tc.desc      ListExchangeModel call flow longPress > changeItem > order > initData > deleteItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0115 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('njY2GvIT');
      logInfo(`step1 longPress("njY2GvIT"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(0, 20);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.initData(['abc', 'abc']);
      logInfo(`step4 initData(["abc", "abc"]): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.deleteItem(' ');
      logInfo(`step5 deleteItem(" "): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`longPress>changeItem>order>initData>delet...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`longPress>changeItem>order>initData>delet...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc"]');
      logInfo(`longPress>changeItem>order>initData>delet...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`longPress>changeItem>order>initData>delet...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`longPress>changeItem>order>initData>delet...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`longPress>changeItem>order>initData>delet...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0116
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0116
     * @tc.desc      ListExchangeModel call flow order > drop > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0116 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.drop('iS8');
      logInfo(`step2 drop("iS8"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.move('', -2, 2);
      logInfo(`step3 move("", -2, 2): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0117
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0117
     * @tc.desc      ListExchangeModel call flow longPress > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0117 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('tyn');
      logInfo(`step1 longPress("tyn"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(90, 1);
      logInfo(`longPress>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`longPress>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`longPress>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`longPress>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`longPress>changeItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`longPress>changeItem final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0118
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0118
     * @tc.desc      ListExchangeModel call flow move > changeItem > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0118 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('abc', -2, 5);
      logInfo(`step1 move("abc", -2, 5): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(-8, 34);
      const step3: number = subject.initData(['', 'a']);
      logInfo(`step3 initData(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`move>changeItem>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`move>changeItem>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`move>changeItem>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`move>changeItem>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`move>changeItem>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`move>changeItem>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0119
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0119
     * @tc.desc      ListExchangeModel call flow drop > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0119 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('a_1');
      logInfo(`step1 drop("a_1"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.addItem('3ea');
      logInfo(`step2 addItem("3ea"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`drop>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`drop>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["3ea"]');
      logInfo(`drop>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`drop>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`drop>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`drop>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0120
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0120
     * @tc.desc      ListExchangeModel call flow initData > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0120 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 initData(["Hello World", "a", " ", ...: step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: number = subject.drop(' abc ');
      logInfo(`step2 drop(" abc "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`initData>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`initData>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`initData>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`initData>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`initData>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`initData>drop final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0121
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0121
     * @tc.desc      ListExchangeModel call flow addItem > initData > order > move > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0121 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem(' abc ');
      logInfo(`step1 addItem(" abc "): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 initData(["Hello World", "a", " ", ...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('Hello World,a, ,a,123');
      const step4: number = subject.move(' a ', 0, 1);
      logInfo(`step4 move(" a ", 0, 1): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string = subject.order();
      logInfo(`step5 order(): step5=${step5}`);
      expect(step5).assertEqual('Hello World,a, ,a,123');
      logInfo(`addItem>initData>order>move>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`addItem>initData>order>move>order final: JSON.stringify(subject.ite...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`addItem>initData>order>move>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`addItem>initData>order>move>order final: JSON.stringify(subject.sc...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`addItem>initData>order>move>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`addItem>initData>order>move>order final: JSON.stringify(subject.o...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0122
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0122
     * @tc.desc      ListExchangeModel call flow longPress > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0122 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('PiEQpau');
      logInfo(`step1 longPress("PiEQpau"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.initData(['abc', 'abc']);
      logInfo(`step2 initData(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`longPress>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`longPress>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc"]');
      logInfo(`longPress>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`longPress>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`longPress>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`longPress>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0123
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0123
     * @tc.desc      ListExchangeModel call flow initData > deleteItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0123 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData([]);
      logInfo(`step1 initData([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.deleteItem('FjriD');
      logInfo(`step2 deleteItem("FjriD"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.deleteItem('2');
      logInfo(`step3 deleteItem("2"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0124
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0124
     * @tc.desc      ListExchangeModel call flow initData > drop > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0124 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['', 'a']);
      logInfo(`step1 initData(["", "a"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.drop('123_1');
      logInfo(`step2 drop("123_1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual(',a');
      const step4: number = subject.drop(' abc ');
      logInfo(`step4 drop(" abc "): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`initData>drop>order>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`initData>drop>order>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`initData>drop>order>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`initData>drop>order>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`initData>drop>order>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`initData>drop>order>drop final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0125
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0125
     * @tc.desc      ListExchangeModel call flow deleteItem > deleteItem > drop > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0125 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('x123');
      logInfo(`step1 deleteItem("x123"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.deleteItem('hznL8LLs1');
      logInfo(`step2 deleteItem("hznL8LLs1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.drop('1qNMhHq');
      logInfo(`step3 drop("1qNMhHq"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.order();
      logInfo(`step5 order(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0126
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0126
     * @tc.desc      ListExchangeModel call flow addItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0126 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('5');
      logInfo(`step1 addItem("5"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.deleteItem('SEdTc9');
      logInfo(`step2 deleteItem("SEdTc9"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`addItem>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["5"]');
      logInfo(`addItem>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0127
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0127
     * @tc.desc      ListExchangeModel call flow longPress > longPress > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0127 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('9cgs1ybeQ');
      logInfo(`step1 longPress("9cgs1ybeQ"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.longPress('m1LB');
      logInfo(`step2 longPress("m1LB"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`longPress>longPress>order>order final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0128
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0128
     * @tc.desc      ListExchangeModel call flow initData > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0128 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step1 initData(["", "a", "abc", "Hello Wo...: step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: number = subject.deleteItem('abc');
      logInfo(`step2 deleteItem("abc"): step2=${step2}`);
      expect(step2).assertEqual(4);
      logInfo(`initData>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(4);
      logInfo(`initData>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","Hello World"," "]');
      logInfo(`initData>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(4);
      logInfo(`initData>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1]');
      logInfo(`initData>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(4);
      logInfo(`initData>deleteItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0129
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0129
     * @tc.desc      ListExchangeModel call flow order > deleteItem > deleteItem > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0129 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.deleteItem('SEdTc9');
      logInfo(`step2 deleteItem("SEdTc9"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.deleteItem('abcabc');
      logInfo(`step3 deleteItem("abcabc"): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.changeItem(40, 20);
      logInfo(`order>deleteItem>deleteItem>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>deleteItem>deleteItem>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`order>deleteItem>deleteItem>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>deleteItem>deleteItem>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`order>deleteItem>deleteItem>changeItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>deleteItem>deleteItem>changeItem final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0130
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0130
     * @tc.desc      ListExchangeModel call flow addItem > longPress > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0130 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('TQa');
      logInfo(`step1 addItem("TQa"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.longPress('123123');
      logInfo(`step2 longPress("123123"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(100, 80);
      logInfo(`addItem>longPress>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>longPress>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('TQa');
      logInfo(`addItem>longPress>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`addItem>longPress>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>longPress>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`addItem>longPress>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0131
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0131
     * @tc.desc      ListExchangeModel call flow changeItem > order > addItem > deleteItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0131 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(105, 34);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.addItem('rGkBDyTDX');
      logInfo(`step3 addItem("rGkBDyTDX"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.deleteItem('t6Kl');
      logInfo(`step4 deleteItem("t6Kl"): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.drop('bs2fPdl');
      logInfo(`step5 drop("bs2fPdl"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`changeItem>order>addItem>deleteItem>drop ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>order>addItem>deleteItem>drop ...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>order>addItem>deleteItem>drop ...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('rGkBDyTDX');
      logInfo(`changeItem>order>addItem>deleteItem>drop ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>order>addItem>deleteItem>drop ...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>order>addItem>deleteItem>drop ...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0132
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0132
     * @tc.desc      ListExchangeModel call flow addItem > changeItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0132 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('s9');
      logInfo(`step1 addItem("s9"): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.changeItem(95, 0);
      const step3: number = subject.longPress('uNG5b42rRR');
      logInfo(`step3 longPress("uNG5b42rRR"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`addItem>changeItem>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>changeItem>longPress final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`addItem>changeItem>longPress final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('s9');
      logInfo(`addItem>changeItem>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>changeItem>longPress final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`addItem>changeItem>longPress final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0133
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0133
     * @tc.desc      ListExchangeModel call flow addItem > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0133 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('StxxnkW');
      logInfo(`step1 addItem("StxxnkW"): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.changeItem(30, 20);
      logInfo(`addItem>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('StxxnkW');
      logInfo(`addItem>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`addItem>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`addItem>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0134
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0134
     * @tc.desc      ListExchangeModel call flow drop > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0134 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('N');
      logInfo(`step1 drop("N"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.addItem('WjYH5IerXJG8');
      logInfo(`step2 addItem("WjYH5IerXJG8"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`drop>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`drop>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["WjYH5IerXJG8"]');
      logInfo(`drop>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`drop>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`drop>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`drop>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0135
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0135
     * @tc.desc      ListExchangeModel call flow changeItem > changeItem > longPress > initData > move keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0135 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(-1, 0);
      subject.changeItem(80, 100);
      const step3: number = subject.longPress('QnmAMXrWDyJV');
      logInfo(`step3 longPress("QnmAMXrWDyJV"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.initData(['a', '', 'abc']);
      logInfo(`step4 initData(["a", "", "abc"]): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.move('', 0, 0);
      logInfo(`step5 move("", 0, 0): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`changeItem>changeItem>longPress>initData>...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`changeItem>changeItem>longPress>initData>...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`changeItem>changeItem>longPress>initData>...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`changeItem>changeItem>longPress>initData>...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`changeItem>changeItem>longPress>initData>...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`changeItem>changeItem>longPress>initData>...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0136
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0136
     * @tc.desc      ListExchangeModel call flow longPress > drop > move > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0136 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('I5Jr3Kq3');
      logInfo(`step1 longPress("I5Jr3Kq3"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.drop('nUxiDg');
      logInfo(`step2 drop("nUxiDg"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.move('', -100, 5);
      logInfo(`step3 move("", -100, 5): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.changeItem(35, 1);
      logInfo(`longPress>drop>move>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`longPress>drop>move>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`longPress>drop>move>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`longPress>drop>move>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`longPress>drop>move>changeItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`longPress>drop>move>changeItem final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0137
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0137
     * @tc.desc      ListExchangeModel call flow changeItem > addItem > deleteItem > move > changeItem keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0137 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(45, 70);
      const step2: number = subject.addItem('Se0FME75VqB');
      logInfo(`step2 addItem("Se0FME75VqB"): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.deleteItem('lJM8U');
      logInfo(`step3 deleteItem("lJM8U"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.move('abc', 50, 1);
      logInfo(`step4 move("abc", 50, 1): step4=${step4}`);
      expect(step4).assertEqual(-1);
      subject.changeItem(5, 2);
      logInfo(`changeItem>addItem>deleteItem>move>change...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`changeItem>addItem>deleteItem>move>change...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>addItem>deleteItem>move>change...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('Se0FME75VqB');
      logInfo(`changeItem>addItem>deleteItem>move>change...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`changeItem>addItem>deleteItem>move>change...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>addItem>deleteItem>move>change...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0137 end`);
    });
  });
}
