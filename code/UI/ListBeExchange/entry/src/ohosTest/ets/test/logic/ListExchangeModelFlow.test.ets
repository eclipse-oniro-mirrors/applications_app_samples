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
export default function listExchangeModelFlowTest(): void {
  describe('ListExchangeModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0001
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0001
     * @tc.desc      ListExchangeModel call flow deleteItem > deleteItem > drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0001 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('  ');
      logInfo(`step1 deleteItem("  "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.deleteItem('Hello World');
      logInfo(`step2 deleteItem("Hello World"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.drop('LgaSzrL');
      logInfo(`step3 drop("LgaSzrL"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop(' ');
      logInfo(`step4 drop(" "): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0002
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0002
     * @tc.desc      ListExchangeModel call flow addItem > deleteItem > addItem > move > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0002 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem(' 123 ');
      logInfo(`step1 addItem(" 123 "): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.deleteItem('a_1');
      logInfo(`step2 deleteItem("a_1"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.addItem('udhDji');
      logInfo(`step3 addItem("udhDji"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.move('', 10, 0);
      logInfo(`step4 move("", 10, 0): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.drop('123');
      logInfo(`step5 drop("123"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`addItem>deleteItem>addItem>move>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>deleteItem>addItem>move>drop final: JSON.stringify(subject....${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" 123 ","udhDji"]');
      logInfo(`addItem>deleteItem>addItem>move>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>deleteItem>addItem>move>drop final: JSON.stringify(subject...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>deleteItem>addItem>move>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>deleteItem>addItem>move>drop final: JSON.stringify(subjec...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0003
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0003
     * @tc.desc      ListExchangeModel call flow initData > deleteItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0003 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['']);
      logInfo(`step1 initData([""]): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.deleteItem('dh');
      logInfo(`step2 deleteItem("dh"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.deleteItem('CSLSA4Mk1');
      logInfo(`step3 deleteItem("CSLSA4Mk1"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`initData>deleteItem>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`initData>deleteItem>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[""]');
      logInfo(`initData>deleteItem>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`initData>deleteItem>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`initData>deleteItem>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`initData>deleteItem>deleteItem final: JSON.stringify(subject.offs...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0004
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0004
     * @tc.desc      ListExchangeModel call flow move > deleteItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0004 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('a_1', 1, 3);
      logInfo(`step1 move("a_1", 1, 3): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('xabc');
      logInfo(`step2 deleteItem("xabc"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.addItem('Se0FME75VqB');
      logInfo(`step3 addItem("Se0FME75VqB"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`move>deleteItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`move>deleteItem>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Se0FME75VqB"]');
      logInfo(`move>deleteItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`move>deleteItem>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`move>deleteItem>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`move>deleteItem>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0005
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0005
     * @tc.desc      ListExchangeModel call flow initData > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0005 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 initData(["123", " ", "Hello World"...: step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: number = subject.deleteItem('W');
      logInfo(`step2 deleteItem("W"): step2=${step2}`);
      expect(step2).assertEqual(6);
      logInfo(`initData>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`initData>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`initData>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`initData>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`initData>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`initData>deleteItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0006
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0006
     * @tc.desc      ListExchangeModel call flow longPress > changeItem > order > move > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0006 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('cdtqB');
      logInfo(`step1 longPress("cdtqB"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(0, -97);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.move('a_1', -100, -2);
      logInfo(`step4 move("a_1", -100, -2): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step5 initData(["123", " ", "Hello World"...: step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`longPress>changeItem>order>move>initData ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`longPress>changeItem>order>move>initData ...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`longPress>changeItem>order>move>initData ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`longPress>changeItem>order>move>initData ...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`longPress>changeItem>order>move>initData ...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`longPress>changeItem>order>move>initData ...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0007
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0007
     * @tc.desc      ListExchangeModel call flow drop > order > move > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0007 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('Fy');
      logInfo(`step1 drop("Fy"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.move('', 50, 0);
      logInfo(`step3 move("", 50, 0): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.move('123', 99, 1);
      logInfo(`step4 move("123", 99, 1): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0008
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0008
     * @tc.desc      ListExchangeModel call flow longPress > order > deleteItem > longPress > initData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0008 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('aa');
      logInfo(`step1 longPress("aa"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.deleteItem(' Hello World ');
      logInfo(`step3 deleteItem(" Hello World "): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.longPress('dC1x94y');
      logInfo(`step4 longPress("dC1x94y"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.initData([]);
      logInfo(`step5 initData([]): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`longPress>order>deleteItem>longPress>init...: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0009
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0009
     * @tc.desc      ListExchangeModel call flow longPress > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0009 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress(' ');
      logInfo(`step1 longPress(" "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.longPress('JNR2rzib');
      logInfo(`step2 longPress("JNR2rzib"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`longPress>longPress final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0010
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0010
     * @tc.desc      ListExchangeModel call flow move > drop > longPress > addItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0010 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('', -100, 1);
      logInfo(`step1 move("", -100, 1): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.drop(' a ');
      logInfo(`step2 drop(" a "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.longPress('aa');
      logInfo(`step3 longPress("aa"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.addItem('x ');
      logInfo(`step4 addItem("x "): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.move('aa', -2, 2);
      logInfo(`step5 move("aa", -2, 2): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`move>drop>longPress>addItem>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`move>drop>longPress>addItem>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["x "]');
      logInfo(`move>drop>longPress>addItem>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`move>drop>longPress>addItem>move final: JSON.stringify(subject.sca...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`move>drop>longPress>addItem>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`move>drop>longPress>addItem>move final: JSON.stringify(subject.of...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0011
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0011
     * @tc.desc      ListExchangeModel call flow addItem > initData > longPress > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0011 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('5');
      logInfo(`step1 addItem("5"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step2 initData(["", "a", "abc", "Hello Wo...: step2=${step2}`);
      expect(step2).assertEqual(5);
      const step3: number = subject.longPress('Hello WorldHello World');
      logInfo(`step3 longPress("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.move(' ', -100, 10);
      logInfo(`step4 move(" ", -100, 10): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`addItem>initData>longPress>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`addItem>initData>longPress>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc"," ","Hello World"]');
      logInfo(`addItem>initData>longPress>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`addItem>initData>longPress>move final: JSON.stringify(subject.scal...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,0]');
      logInfo(`addItem>initData>longPress>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`addItem>initData>longPress>move final: JSON.stringify(subject.off...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,-50,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0012
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0012
     * @tc.desc      ListExchangeModel call flow move > addItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0012 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move(' a ', 0, 5);
      logInfo(`step1 move(" a ", 0, 5): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.addItem('r1jcmzuOz');
      logInfo(`step2 addItem("r1jcmzuOz"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.move('aa', 100, 2);
      logInfo(`step3 move("aa", 100, 2): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`move>addItem>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`move>addItem>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["r1jcmzuOz"]');
      logInfo(`move>addItem>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`move>addItem>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`move>addItem>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`move>addItem>move final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0013
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0013
     * @tc.desc      ListExchangeModel call flow changeItem > addItem > move > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0013 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(55, 60);
      const step2: number = subject.addItem('s9');
      logInfo(`step2 addItem("s9"): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.move('a', -100, -1);
      logInfo(`step3 move("a", -100, -1): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop('NIfev');
      logInfo(`step4 drop("NIfev"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`changeItem>addItem>move>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>addItem>move>drop final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>addItem>move>drop final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('s9');
      logInfo(`changeItem>addItem>move>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>addItem>move>drop final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>addItem>move>drop final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0014
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0014
     * @tc.desc      ListExchangeModel call flow drop > deleteItem > drop > drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0014 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('1qNMhHq');
      logInfo(`step1 drop("1qNMhHq"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('abc_1');
      logInfo(`step2 deleteItem("abc_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.drop('kk5qlH');
      logInfo(`step3 drop("kk5qlH"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop('mXz');
      logInfo(`step4 drop("mXz"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.drop('m8W0M9hb8mn');
      logInfo(`step5 drop("m8W0M9hb8mn"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0015
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0015
     * @tc.desc      ListExchangeModel call flow drop > changeItem > changeItem > longPress > changeItem keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0015 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('zpcCIMd');
      logInfo(`step1 drop("zpcCIMd"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(100, 95);
      subject.changeItem(75, 0);
      const step4: number = subject.longPress(' _1');
      logInfo(`step4 longPress(" _1"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      subject.changeItem(-1, -97);
      logInfo(`drop>changeItem>changeItem>longPress>chan...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`drop>changeItem>changeItem>longPress>chan...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`drop>changeItem>changeItem>longPress>chan...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`drop>changeItem>changeItem>longPress>chan...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`drop>changeItem>changeItem>longPress>chan...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`drop>changeItem>changeItem>longPress>chan...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0016
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0016
     * @tc.desc      ListExchangeModel call flow deleteItem > order > deleteItem > move > deleteItem keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0016 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('a_1');
      logInfo(`step1 deleteItem("a_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.deleteItem('B');
      logInfo(`step3 deleteItem("B"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.move('', 100, 0);
      logInfo(`step4 move("", 100, 0): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.deleteItem('Hello WorldHello World');
      logInfo(`step5 deleteItem("Hello WorldHello World"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0017
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0017
     * @tc.desc      ListExchangeModel call flow addItem > drop > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0017 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('   ');
      logInfo(`step1 addItem("   "): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop('xa');
      logInfo(`step2 drop("xa"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(45, 0);
      logInfo(`addItem>drop>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>drop>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`addItem>drop>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('   ');
      logInfo(`addItem>drop>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>drop>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`addItem>drop>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0018
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0018
     * @tc.desc      ListExchangeModel call flow order > addItem > changeItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0018 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.addItem('Hello World_1');
      logInfo(`step2 addItem("Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.changeItem(40, 20);
      const step4: number = subject.deleteItem('AMEX1KcCTo');
      logInfo(`step4 deleteItem("AMEX1KcCTo"): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`order>addItem>changeItem>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`order>addItem>changeItem>deleteItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('Hello World_1');
      logInfo(`order>addItem>changeItem>deleteItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`order>addItem>changeItem>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`order>addItem>changeItem>deleteItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`order>addItem>changeItem>deleteItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0019
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0019
     * @tc.desc      ListExchangeModel call flow order > order > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0019 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 initData(["", "a", "abc", "Hello Wo...: step3=${step3}`);
      expect(step3).assertEqual(5);
      logInfo(`order>order>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`order>order>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`order>order>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`order>order>initData final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`order>order>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`order>order>initData final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0020
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0020
     * @tc.desc      ListExchangeModel call flow drop > longPress > initData > longPress > changeItem keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0020 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('pvy7dEh');
      logInfo(`step1 drop("pvy7dEh"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.longPress('PiEQpau');
      logInfo(`step2 longPress("PiEQpau"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.initData(['', 'a']);
      logInfo(`step3 initData(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.longPress('KUJ9e');
      logInfo(`step4 longPress("KUJ9e"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      subject.changeItem(0, 10);
      logInfo(`drop>longPress>initData>longPress>changeI...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`drop>longPress>initData>longPress>changeI...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a",""]');
      logInfo(`drop>longPress>initData>longPress>changeI...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`drop>longPress>initData>longPress>changeI...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`drop>longPress>initData>longPress>changeI...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`drop>longPress>initData>longPress>changeI...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0021
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0021
     * @tc.desc      ListExchangeModel call flow drop > drop > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0021 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('123');
      logInfo(`step1 drop("123"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.drop('bs2fPdl');
      logInfo(`step2 drop("bs2fPdl"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.move('a', -1, 20);
      logInfo(`step3 move("a", -1, 20): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0022
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0022
     * @tc.desc      ListExchangeModel call flow initData > drop > changeItem > drop > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0022 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 initData(["123", " ", "Hello World"...: step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: number = subject.drop('Pr');
      logInfo(`step2 drop("Pr"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(40, 90);
      const step4: number = subject.drop(' a ');
      logInfo(`step4 drop(" a "): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.move('', 10, 15);
      logInfo(`step5 move("", 10, 15): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`initData>drop>changeItem>drop>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(7);
      logInfo(`initData>drop>changeItem>drop>move final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('123');
      logInfo(`initData>drop>changeItem>drop>move final: subject.items[3]=${subject.items[3]}`);
      expect(subject.items[3]).assertEqual('abc');
      logInfo(`initData>drop>changeItem>drop>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(7);
      logInfo(`initData>drop>changeItem>drop>move final: JSON.stringify(subject.s...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1,-0.5]');
      logInfo(`initData>drop>changeItem>drop>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(7);
      logInfo(`initData>drop>changeItem>drop>move final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertEqual(0);
      logInfo(`initData>drop>changeItem>drop>move final: subject.offsets[3]=${subject.offsets[3]}`);
      expect(subject.offsets[3]).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0023
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0023
     * @tc.desc      ListExchangeModel call flow deleteItem > initData > deleteItem > initData > changeItem keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0023 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('Jv7WSLN38DVd');
      logInfo(`step1 deleteItem("Jv7WSLN38DVd"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step2 initData(["123", " ", "Hello World"...: step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.deleteItem('xabc');
      logInfo(`step3 deleteItem("xabc"): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step4 initData(["", "a", "abc", "Hello Wo...: step4=${step4}`);
      expect(step4).assertEqual(5);
      subject.changeItem(0, 45);
      logInfo(`deleteItem>initData>deleteItem>initData>c...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`deleteItem>initData>deleteItem>initData>c...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","abc","Hello World"," ",""]');
      logInfo(`deleteItem>initData>deleteItem>initData>c...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`deleteItem>initData>deleteItem>initData>c...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`deleteItem>initData>deleteItem>initData>c...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`deleteItem>initData>deleteItem>initData>c...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0024
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0024
     * @tc.desc      ListExchangeModel call flow longPress > changeItem > changeItem > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0024 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress(' ');
      logInfo(`step1 longPress(" "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(40, 3);
      subject.changeItem(55, 70);
      const step4: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step4 initData(["", "a", "abc", "Hello Wo...: step4=${step4}`);
      expect(step4).assertEqual(5);
      logInfo(`longPress>changeItem>changeItem>initData ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`longPress>changeItem>changeItem>initData ...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`longPress>changeItem>changeItem>initData ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`longPress>changeItem>changeItem>initData ...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`longPress>changeItem>changeItem>initData ...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`longPress>changeItem>changeItem>initData ...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0025
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0025
     * @tc.desc      ListExchangeModel call flow initData > drop > order > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0025 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData([]);
      logInfo(`step1 initData([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.drop('z0mNRlew0alg');
      logInfo(`step2 drop("z0mNRlew0alg"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.longPress('X8');
      logInfo(`step4 longPress("X8"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`initData>drop>order>longPress final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0026
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0026
     * @tc.desc      ListExchangeModel call flow initData > longPress > changeItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0026 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData([]);
      logInfo(`step1 initData([]): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.longPress('9cgs1ybeQ');
      logInfo(`step2 longPress("9cgs1ybeQ"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(40, 3);
      const step4: number = subject.addItem('1IhCqhjG');
      logInfo(`step4 addItem("1IhCqhjG"): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`initData>longPress>changeItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`initData>longPress>changeItem>addItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`initData>longPress>changeItem>addItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('1IhCqhjG');
      logInfo(`initData>longPress>changeItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`initData>longPress>changeItem>addItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`initData>longPress>changeItem>addItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0027
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0027
     * @tc.desc      ListExchangeModel call flow order > initData > longPress > initData > initData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0027 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.initData(['abc', 'abc']);
      logInfo(`step2 initData(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.longPress('5JQP');
      logInfo(`step3 longPress("5JQP"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.initData(['abc', 'abc']);
      logInfo(`step4 initData(["abc", "abc"]): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.initData(['', 'a']);
      logInfo(`step5 initData(["", "a"]): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`order>initData>longPress>initData>initDat...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`order>initData>longPress>initData>initDat...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`order>initData>longPress>initData>initDat...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`order>initData>longPress>initData>initDat...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`order>initData>longPress>initData>initDat...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`order>initData>longPress>initData>initDat...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0028
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0028
     * @tc.desc      ListExchangeModel call flow initData > drop > changeItem > addItem > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0028 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['']);
      logInfo(`step1 initData([""]): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop('mu');
      logInfo(`step2 drop("mu"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(10, 45);
      const step4: number = subject.addItem(' abc ');
      logInfo(`step4 addItem(" abc "): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: string = subject.order();
      logInfo(`step5 order(): step5=${step5}`);
      expect(step5).assertEqual(',, abc ');
      logInfo(`initData>drop>changeItem>addItem>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`initData>drop>changeItem>addItem>order final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('');
      logInfo(`initData>drop>changeItem>addItem>order final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`initData>drop>changeItem>addItem>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`initData>drop>changeItem>addItem>order final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`initData>drop>changeItem>addItem>order final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0029
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0029
     * @tc.desc      ListExchangeModel call flow deleteItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0029 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('lJM8U');
      logInfo(`step1 deleteItem("lJM8U"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.longPress('9s7ySMbytaC');
      logInfo(`step2 longPress("9s7ySMbytaC"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`deleteItem>longPress final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0030
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0030
     * @tc.desc      ListExchangeModel call flow initData > initData > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0030 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['abc', 'abc']);
      logInfo(`step1 initData(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step2 initData(["123", " ", "Hello World"...: step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.drop('zpcCIMd');
      logInfo(`step3 drop("zpcCIMd"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`initData>initData>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`initData>initData>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a",""]');
      logInfo(`initData>initData>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`initData>initData>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1]');
      logInfo(`initData>initData>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`initData>initData>drop final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0031
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0031
     * @tc.desc      ListExchangeModel call flow initData > move > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0031 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['a', '', 'abc']);
      logInfo(`step1 initData(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.move(' ', -2, 1);
      logInfo(`step2 move(" ", -2, 1): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('a,,abc');
      logInfo(`initData>move>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`initData>move>order final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`initData>move>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`initData>move>order final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`initData>move>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`initData>move>order final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0032
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0032
     * @tc.desc      ListExchangeModel call flow initData > initData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0032 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step1 initData(["", "a", "abc", "Hello Wo...: step1=${step1}`);
      expect(step1).assertEqual(5);
      const step2: number = subject.initData(['a', '', 'abc']);
      logInfo(`step2 initData(["a", "", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('a,,abc');
      logInfo(`initData>initData>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`initData>initData>order final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`initData>initData>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`initData>initData>order final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`initData>initData>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`initData>initData>order final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0033
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0033
     * @tc.desc      ListExchangeModel call flow order > addItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0033 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.addItem('BKyLgmiJSF');
      logInfo(`step2 addItem("BKyLgmiJSF"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.addItem('x ');
      logInfo(`step3 addItem("x "): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`order>addItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`order>addItem>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["BKyLgmiJSF","x "]');
      logInfo(`order>addItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`order>addItem>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`order>addItem>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`order>addItem>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0034
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0034
     * @tc.desc      ListExchangeModel call flow longPress > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0034 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('GLdvS');
      logInfo(`step1 longPress("GLdvS"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.drop('EdwApd');
      logInfo(`step2 drop("EdwApd"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0035
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0035
     * @tc.desc      ListExchangeModel call flow initData > longPress > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0035 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['']);
      logInfo(`step1 initData([""]): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.longPress('uNG5b42rRR');
      logInfo(`step2 longPress("uNG5b42rRR"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.addItem('StxxnkW');
      logInfo(`step3 addItem("StxxnkW"): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`initData>longPress>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`initData>longPress>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","StxxnkW"]');
      logInfo(`initData>longPress>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`initData>longPress>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`initData>longPress>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`initData>longPress>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0036
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0036
     * @tc.desc      ListExchangeModel call flow addItem > move > changeItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0036 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('cOV21xu3');
      logInfo(`step1 addItem("cOV21xu3"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.move('a', -100, 0);
      logInfo(`step2 move("a", -100, 0): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.changeItem(0, 5);
      const step4: number = subject.longPress('VbaZ8nix6jS');
      logInfo(`step4 longPress("VbaZ8nix6jS"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`addItem>move>changeItem>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>move>changeItem>longPress final: JSON.stringify(subject.ite...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["cOV21xu3"]');
      logInfo(`addItem>move>changeItem>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>move>changeItem>longPress final: JSON.stringify(subject.sc...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>move>changeItem>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>move>changeItem>longPress final: JSON.stringify(subject.o...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0037
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0037
     * @tc.desc      ListExchangeModel call flow order > changeItem > longPress > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0037 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.changeItem(15, 10);
      const step3: number = subject.longPress('JssUts');
      logInfo(`step3 longPress("JssUts"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop(' 123 ');
      logInfo(`step4 drop(" 123 "): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`order>changeItem>longPress>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>changeItem>longPress>drop final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`order>changeItem>longPress>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>changeItem>longPress>drop final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`order>changeItem>longPress>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>changeItem>longPress>drop final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0038
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0038
     * @tc.desc      ListExchangeModel call flow move > initData > longPress > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0038 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('Hello World', 10, 20);
      logInfo(`step1 move("Hello World", 10, 20): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.initData([]);
      logInfo(`step2 initData([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.longPress('9s7ySMbytaC');
      logInfo(`step3 longPress("9s7ySMbytaC"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.changeItem(110, 0);
      logInfo(`move>initData>longPress>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`move>initData>longPress>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`move>initData>longPress>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`move>initData>longPress>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`move>initData>longPress>changeItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`move>initData>longPress>changeItem final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0039
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0039
     * @tc.desc      ListExchangeModel call flow deleteItem > deleteItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0039 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('I7R3fEk');
      logInfo(`step1 deleteItem("I7R3fEk"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.deleteItem('3YQ');
      logInfo(`step2 deleteItem("3YQ"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.longPress('PiEQpau');
      logInfo(`step3 longPress("PiEQpau"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`deleteItem>deleteItem>longPress final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0040
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0040
     * @tc.desc      ListExchangeModel call flow move > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0040 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('123', 10, 100);
      logInfo(`step1 move("123", 10, 100): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0041
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0041
     * @tc.desc      ListExchangeModel call flow drop > initData > order > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0041 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('ef4VH7VOau');
      logInfo(`step1 drop("ef4VH7VOau"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.initData(['', 'a']);
      logInfo(`step2 initData(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual(',a');
      const step4: number = subject.deleteItem('6H12r');
      logInfo(`step4 deleteItem("6H12r"): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`drop>initData>order>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`drop>initData>order>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`drop>initData>order>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`drop>initData>order>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`drop>initData>order>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`drop>initData>order>deleteItem final: JSON.stringify(subject.offs...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0042
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0042
     * @tc.desc      ListExchangeModel call flow longPress > move > order > longPress > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0042 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress(' abc ');
      logInfo(`step1 longPress(" abc "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.move('xa', 50, 2);
      logInfo(`step2 move("xa", 50, 2): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.longPress('Yj2STnm70k');
      logInfo(`step4 longPress("Yj2STnm70k"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.initData(['a', '', 'abc']);
      logInfo(`step5 initData(["a", "", "abc"]): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`longPress>move>order>longPress>initData f...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`longPress>move>order>longPress>initData f...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`longPress>move>order>longPress>initData f...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`longPress>move>order>longPress>initData f...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`longPress>move>order>longPress>initData f...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`longPress>move>order>longPress>initData f...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0043
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0043
     * @tc.desc      ListExchangeModel call flow addItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0043 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('r1jcmzuOz');
      logInfo(`step1 addItem("r1jcmzuOz"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop(' a ');
      logInfo(`step2 drop(" a "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`addItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["r1jcmzuOz"]');
      logInfo(`addItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>drop final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0044
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0044
     * @tc.desc      ListExchangeModel call flow changeItem > longPress > order > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0044 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(40, 80);
      const step2: number = subject.longPress('aFhqSN8');
      logInfo(`step2 longPress("aFhqSN8"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.changeItem(100, 0);
      logInfo(`changeItem>longPress>order>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>longPress>order>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>longPress>order>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`changeItem>longPress>order>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>longPress>order>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>longPress>order>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0045
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0045
     * @tc.desc      ListExchangeModel call flow drop > deleteItem > move > drop > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0045 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('z5K');
      logInfo(`step1 drop("z5K"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('PYuGDoHgCJaW');
      logInfo(`step2 deleteItem("PYuGDoHgCJaW"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.move('Hello World', 5, 100);
      logInfo(`step3 move("Hello World", 5, 100): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.drop('yBi9');
      logInfo(`step4 drop("yBi9"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.addItem('  ');
      logInfo(`step5 addItem("  "): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`drop>deleteItem>move>drop>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`drop>deleteItem>move>drop>addItem final: JSON.stringify(subject.ite...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["  "]');
      logInfo(`drop>deleteItem>move>drop>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`drop>deleteItem>move>drop>addItem final: JSON.stringify(subject.sc...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`drop>deleteItem>move>drop>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`drop>deleteItem>move>drop>addItem final: JSON.stringify(subject.o...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0045 end`);
    });
  });
}
