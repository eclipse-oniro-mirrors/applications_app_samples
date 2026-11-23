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

/** Logic checks for ListExchangeModel flow (46 cases). */
export default function listExchangeModelFlow2Test(): void {
  describe('ListExchangeModelFlow2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0046
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0046
     * @tc.desc      ListExchangeModel call flow changeItem > addItem > deleteItem > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0046 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(95, 110);
      const step2: number = subject.addItem('BMt');
      logInfo(`step2 addItem("BMt"): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.deleteItem('PYuGDoHgCJaW');
      logInfo(`step3 deleteItem("PYuGDoHgCJaW"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual(',BMt');
      logInfo(`changeItem>addItem>deleteItem>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>addItem>deleteItem>order final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>addItem>deleteItem>order final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('BMt');
      logInfo(`changeItem>addItem>deleteItem>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>addItem>deleteItem>order final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>addItem>deleteItem>order final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0047
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0047
     * @tc.desc      ListExchangeModel call flow initData > deleteItem > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0047 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 initData(["123", " ", "Hello World"...: step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: number = subject.deleteItem('CSLSA4Mk1');
      logInfo(`step2 deleteItem("CSLSA4Mk1"): step2=${step2}`);
      expect(step2).assertEqual(6);
      subject.changeItem(105, 34);
      logInfo(`initData>deleteItem>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(7);
      logInfo(`initData>deleteItem>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('123');
      logInfo(`initData>deleteItem>changeItem final: subject.items[3]=${subject.items[3]}`);
      expect(subject.items[3]).assertEqual('abc');
      logInfo(`initData>deleteItem>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(7);
      logInfo(`initData>deleteItem>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`initData>deleteItem>changeItem final: subject.scales[3]=${subject.scales[3]}`);
      expect(subject.scales[3]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0048
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0048
     * @tc.desc      ListExchangeModel call flow longPress > deleteItem > move > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0048 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('DcjgH902');
      logInfo(`step1 longPress("DcjgH902"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.deleteItem('t6Kl');
      logInfo(`step2 deleteItem("t6Kl"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.move('a', -100, 5);
      logInfo(`step3 move("a", -100, 5): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0049
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0049
     * @tc.desc      ListExchangeModel call flow drop > move > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0049 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('lBGCElU8R6');
      logInfo(`step1 drop("lBGCElU8R6"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.move('a_1', 10, 20);
      logInfo(`step2 move("a_1", 10, 20): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.drop('N');
      logInfo(`step4 drop("N"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0050
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0050
     * @tc.desc      ListExchangeModel call flow order > drop > drop > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0050 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.drop('z5K');
      logInfo(`step2 drop("z5K"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.drop('EdwApd');
      logInfo(`step3 drop("EdwApd"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.move(' ', 10, -2);
      logInfo(`step4 move(" ", 10, -2): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0051
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0051
     * @tc.desc      ListExchangeModel call flow deleteItem > deleteItem > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0051 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('FX3F');
      logInfo(`step1 deleteItem("FX3F"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.deleteItem(' Hello World ');
      logInfo(`step2 deleteItem(" Hello World "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0052
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0052
     * @tc.desc      ListExchangeModel call flow deleteItem > deleteItem > drop > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0052 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('a');
      logInfo(`step1 deleteItem("a"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.deleteItem('Hello World');
      logInfo(`step2 deleteItem("Hello World"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.drop('anDxwcC98Tlq');
      logInfo(`step3 drop("anDxwcC98Tlq"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.longPress('prjN4nlk');
      logInfo(`step4 longPress("prjN4nlk"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`deleteItem>deleteItem>drop>longPress final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0053
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0053
     * @tc.desc      ListExchangeModel call flow order > changeItem > initData > drop > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0053 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.changeItem(101, 0);
      const step3: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 initData(["", "a", "abc", "Hello Wo...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: number = subject.drop('GwFVx');
      logInfo(`step4 drop("GwFVx"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.move('xa', 1, 100);
      logInfo(`step5 move("xa", 1, 100): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`order>changeItem>initData>drop>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`order>changeItem>initData>drop>move final: JSON.stringify(subject.i...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`order>changeItem>initData>drop>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`order>changeItem>initData>drop>move final: JSON.stringify(subject....${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`order>changeItem>initData>drop>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`order>changeItem>initData>drop>move final: JSON.stringify(subject...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0054
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0054
     * @tc.desc      ListExchangeModel call flow addItem > drop > drop > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0054 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('OMJoDqHG95');
      logInfo(`step1 addItem("OMJoDqHG95"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop('NIfev');
      logInfo(`step2 drop("NIfev"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.drop('ehwpl8');
      logInfo(`step3 drop("ehwpl8"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.addItem('FikVYg0b');
      logInfo(`step4 addItem("FikVYg0b"): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`addItem>drop>drop>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>drop>drop>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["OMJoDqHG95","FikVYg0b"]');
      logInfo(`addItem>drop>drop>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>drop>drop>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>drop>drop>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>drop>drop>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0055
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0055
     * @tc.desc      ListExchangeModel call flow deleteItem > initData > changeItem > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0055 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('a');
      logInfo(`step1 deleteItem("a"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step2 initData(["123", " ", "Hello World"...: step2=${step2}`);
      expect(step2).assertEqual(6);
      subject.changeItem(0, 1);
      subject.changeItem(90, 1);
      logInfo(`deleteItem>initData>changeItem>changeItem...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(7);
      logInfo(`deleteItem>initData>changeItem>changeItem...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual(' ');
      logInfo(`deleteItem>initData>changeItem>changeItem...: subject.items[3]=${subject.items[3]}`);
      expect(subject.items[3]).assertEqual('Hello World');
      logInfo(`deleteItem>initData>changeItem>changeItem...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(7);
      logInfo(`deleteItem>initData>changeItem>changeItem...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`deleteItem>initData>changeItem>changeItem...: subject.scales[3]=${subject.scales[3]}`);
      expect(subject.scales[3]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0056
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0056
     * @tc.desc      ListExchangeModel call flow addItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0056 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem(' Hello World ');
      logInfo(`step1 addItem(" Hello World "): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.drop('mXz');
      logInfo(`step2 drop("mXz"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`addItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('[" Hello World "]');
      logInfo(`addItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>drop final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0057
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0057
     * @tc.desc      ListExchangeModel call flow addItem > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0057 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('WydP');
      logInfo(`step1 addItem("WydP"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.addItem('VdqAAcc7');
      logInfo(`step2 addItem("VdqAAcc7"): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`addItem>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["WydP","VdqAAcc7"]');
      logInfo(`addItem>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0058
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0058
     * @tc.desc      ListExchangeModel call flow drop > longPress > order > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0058 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('123');
      logInfo(`step1 drop("123"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.longPress('L51Shr0uUtn');
      logInfo(`step2 longPress("L51Shr0uUtn"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.changeItem(95, 110);
      logInfo(`drop>longPress>order>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`drop>longPress>order>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`drop>longPress>order>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`drop>longPress>order>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`drop>longPress>order>changeItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`drop>longPress>order>changeItem final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0059
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0059
     * @tc.desc      ListExchangeModel call flow initData > longPress > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0059 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['', 'a']);
      logInfo(`step1 initData(["", "a"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.longPress('NPChT4iWj');
      logInfo(`step2 longPress("NPChT4iWj"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.longPress('xabc');
      logInfo(`step3 longPress("xabc"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`initData>longPress>longPress final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`initData>longPress>longPress final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a"]');
      logInfo(`initData>longPress>longPress final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`initData>longPress>longPress final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`initData>longPress>longPress final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`initData>longPress>longPress final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0060
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0060
     * @tc.desc      ListExchangeModel call flow order > order > initData > changeItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0060 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.initData([]);
      logInfo(`step3 initData([]): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.changeItem(80, 20);
      const step5: number = subject.drop('gY');
      logInfo(`step5 drop("gY"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`order>order>initData>changeItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>order>initData>changeItem>drop final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`order>order>initData>changeItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>order>initData>changeItem>drop final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`order>order>initData>changeItem>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>order>initData>changeItem>drop final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0061
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0061
     * @tc.desc      ListExchangeModel call flow changeItem > changeItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0061 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(30, 0);
      subject.changeItem(20, 65);
      const step3: number = subject.move('a_1', -100, 0);
      logInfo(`step3 move("a_1", -100, 0): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`changeItem>changeItem>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>changeItem>move final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>changeItem>move final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`changeItem>changeItem>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>changeItem>move final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>changeItem>move final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0062
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0062
     * @tc.desc      ListExchangeModel call flow deleteItem > changeItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0062 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('6H12r');
      logInfo(`step1 deleteItem("6H12r"): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.changeItem(30, 65);
      const step3: number = subject.drop('N');
      logInfo(`step3 drop("N"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`deleteItem>changeItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`deleteItem>changeItem>drop final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`deleteItem>changeItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`deleteItem>changeItem>drop final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`deleteItem>changeItem>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`deleteItem>changeItem>drop final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0063
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0063
     * @tc.desc      ListExchangeModel call flow deleteItem > addItem > deleteItem > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0063 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('w');
      logInfo(`step1 deleteItem("w"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.addItem('WydP');
      logInfo(`step2 addItem("WydP"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.deleteItem('aa');
      logInfo(`step3 deleteItem("aa"): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.changeItem(65, 10);
      logInfo(`deleteItem>addItem>deleteItem>changeItem ...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`deleteItem>addItem>deleteItem>changeItem ...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('WydP');
      logInfo(`deleteItem>addItem>deleteItem>changeItem ...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`deleteItem>addItem>deleteItem>changeItem ...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`deleteItem>addItem>deleteItem>changeItem ...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`deleteItem>addItem>deleteItem>changeItem ...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0064
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0064
     * @tc.desc      ListExchangeModel call flow longPress > changeItem > initData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0064 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('LUyok7GdLLq');
      logInfo(`step1 longPress("LUyok7GdLLq"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.changeItem(85, 35);
      const step3: number = subject.initData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 initData(["", "a", "abc", "Hello Wo...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual(',a,abc,Hello World, ');
      logInfo(`longPress>changeItem>initData>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`longPress>changeItem>initData>order final: JSON.stringify(subject.i...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["","a","abc","Hello World"," "]');
      logInfo(`longPress>changeItem>initData>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`longPress>changeItem>initData>order final: JSON.stringify(subject....${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`longPress>changeItem>initData>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`longPress>changeItem>initData>order final: JSON.stringify(subject...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0065
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0065
     * @tc.desc      ListExchangeModel call flow changeItem > move > addItem > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0065 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(0, 2);
      const step2: number = subject.move('', 0, -2);
      logInfo(`step2 move("", 0, -2): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.addItem('VdqAAcc7');
      logInfo(`step3 addItem("VdqAAcc7"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.initData(['a', '', 'abc']);
      logInfo(`step4 initData(["a", "", "abc"]): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`changeItem>move>addItem>initData final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`changeItem>move>addItem>initData final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["a","","abc"]');
      logInfo(`changeItem>move>addItem>initData final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`changeItem>move>addItem>initData final: JSON.stringify(subject.sca...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`changeItem>move>addItem>initData final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`changeItem>move>addItem>initData final: JSON.stringify(subject.of...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0066
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0066
     * @tc.desc      ListExchangeModel call flow order > initData > drop > initData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0066 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.initData(['', 'a']);
      logInfo(`step2 initData(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.drop('lyID3zh');
      logInfo(`step3 drop("lyID3zh"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.initData([]);
      logInfo(`step4 initData([]): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0067
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0067
     * @tc.desc      ListExchangeModel call flow deleteItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0067 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('w');
      logInfo(`step1 deleteItem("w"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.move('', -2, 2);
      logInfo(`step2 move("", -2, 2): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0068
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0068
     * @tc.desc      ListExchangeModel call flow changeItem > deleteItem > addItem > addItem > addItem keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0068 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(-1, 0);
      const step2: number = subject.deleteItem('  ');
      logInfo(`step2 deleteItem("  "): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.addItem('78v');
      logInfo(`step3 addItem("78v"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.addItem('63');
      logInfo(`step4 addItem("63"): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.addItem('a_1');
      logInfo(`step5 addItem("a_1"): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`changeItem>deleteItem>addItem>addItem>add...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(4);
      logInfo(`changeItem>deleteItem>addItem>addItem>add...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>addItem>addItem>add...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('78v');
      logInfo(`changeItem>deleteItem>addItem>addItem>add...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(4);
      logInfo(`changeItem>deleteItem>addItem>addItem>add...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>deleteItem>addItem>addItem>add...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0069
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0069
     * @tc.desc      ListExchangeModel call flow deleteItem > move > drop > changeItem > changeItem keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0069 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('2');
      logInfo(`step1 deleteItem("2"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.move('abc', 10, 2);
      logInfo(`step2 move("abc", 10, 2): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.drop('3v0bwF9sQ43g');
      logInfo(`step3 drop("3v0bwF9sQ43g"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.changeItem(0, -97);
      subject.changeItem(40, -83);
      logInfo(`deleteItem>move>drop>changeItem>changeIte...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`deleteItem>move>drop>changeItem>changeIte...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`deleteItem>move>drop>changeItem>changeIte...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`deleteItem>move>drop>changeItem>changeIte...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`deleteItem>move>drop>changeItem>changeIte...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`deleteItem>move>drop>changeItem>changeIte...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0070
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0070
     * @tc.desc      ListExchangeModel call flow changeItem > changeItem > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0070 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(45, 34);
      subject.changeItem(0, 34);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`changeItem>changeItem>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`changeItem>changeItem>order final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>changeItem>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`changeItem>changeItem>order final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>changeItem>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`changeItem>changeItem>order final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0071
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0071
     * @tc.desc      ListExchangeModel call flow drop > addItem > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0071 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('bs2fPdl');
      logInfo(`step1 drop("bs2fPdl"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.addItem('X');
      logInfo(`step2 addItem("X"): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.changeItem(65, 90);
      logInfo(`drop>addItem>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`drop>addItem>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('X');
      logInfo(`drop>addItem>changeItem final: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`drop>addItem>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`drop>addItem>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`drop>addItem>changeItem final: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0072
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0072
     * @tc.desc      ListExchangeModel call flow longPress > order > drop > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0072 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.longPress('  ');
      logInfo(`step1 longPress("  "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.drop('123_1');
      logInfo(`step3 drop("123_1"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.drop('OMjnmxZUyib');
      logInfo(`step5 drop("OMjnmxZUyib"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0073
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0073
     * @tc.desc      ListExchangeModel call flow addItem > order > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0073 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('X');
      logInfo(`step1 addItem("X"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('X');
      const step3: number = subject.move('Hello World', -100, 1);
      logInfo(`step3 move("Hello World", -100, 1): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`addItem>order>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>order>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["X"]');
      logInfo(`addItem>order>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>order>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>order>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>order>move final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0074
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0074
     * @tc.desc      ListExchangeModel call flow move > initData > drop > changeItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0074 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.move('xa', -2, 2);
      logInfo(`step1 move("xa", -2, 2): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step2 initData(["123", " ", "Hello World"...: step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.drop('aa');
      logInfo(`step3 drop("aa"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      subject.changeItem(100, 110);
      logInfo(`move>initData>drop>changeItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(7);
      logInfo(`move>initData>drop>changeItem final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('123');
      logInfo(`move>initData>drop>changeItem final: subject.items[3]=${subject.items[3]}`);
      expect(subject.items[3]).assertEqual('abc');
      logInfo(`move>initData>drop>changeItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(7);
      logInfo(`move>initData>drop>changeItem final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`move>initData>drop>changeItem final: subject.scales[3]=${subject.scales[3]}`);
      expect(subject.scales[3]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0075
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0075
     * @tc.desc      ListExchangeModel call flow changeItem > addItem > deleteItem > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0075 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      subject.changeItem(110, 95);
      const step2: number = subject.addItem('123');
      logInfo(`step2 addItem("123"): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.deleteItem('UBhI');
      logInfo(`step3 deleteItem("UBhI"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.longPress('N2D5');
      logInfo(`step4 longPress("N2D5"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`changeItem>addItem>deleteItem>longPress f...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`changeItem>addItem>deleteItem>longPress f...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`changeItem>addItem>deleteItem>longPress f...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertEqual('123');
      logInfo(`changeItem>addItem>deleteItem>longPress f...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`changeItem>addItem>deleteItem>longPress f...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`changeItem>addItem>deleteItem>longPress f...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0076
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0076
     * @tc.desc      ListExchangeModel call flow addItem > initData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0076 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('123');
      logInfo(`step1 addItem("123"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.initData([]);
      logInfo(`step2 initData([]): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.order();
      logInfo(`step3 order(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0077
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0077
     * @tc.desc      ListExchangeModel call flow order > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0077 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.longPress('DcjgH902');
      logInfo(`step2 longPress("DcjgH902"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`order>longPress final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0078
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0078
     * @tc.desc      ListExchangeModel call flow order > deleteItem > initData > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0078 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.deleteItem('mtq7qxS');
      logInfo(`step2 deleteItem("mtq7qxS"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.initData(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 initData(["Hello World", "a", " ", ...: step3=${step3}`);
      expect(step3).assertEqual(5);
      const step4: number = subject.drop('123_1');
      logInfo(`step4 drop("123_1"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`order>deleteItem>initData>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(5);
      logInfo(`order>deleteItem>initData>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["Hello World","a"," ","a","123"]');
      logInfo(`order>deleteItem>initData>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(5);
      logInfo(`order>deleteItem>initData>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1]');
      logInfo(`order>deleteItem>initData>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(5);
      logInfo(`order>deleteItem>initData>drop final: JSON.stringify(subject.offs...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0079
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0079
     * @tc.desc      ListExchangeModel call flow deleteItem > order > longPress > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0079 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('xabc');
      logInfo(`step1 deleteItem("xabc"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.longPress('JNR2rzib');
      logInfo(`step3 longPress("JNR2rzib"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.move('Hello World', 5, -1);
      logInfo(`step4 move("Hello World", 5, -1): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`deleteItem>order>longPress>move final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0080
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0080
     * @tc.desc      ListExchangeModel call flow deleteItem > longPress > addItem > changeItem > order keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0080 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('w');
      logInfo(`step1 deleteItem("w"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.longPress('j7F');
      logInfo(`step2 longPress("j7F"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.addItem('abc');
      logInfo(`step3 addItem("abc"): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.changeItem(40, 75);
      const step5: string = subject.order();
      logInfo(`step5 order(): step5=${step5}`);
      expect(step5).assertEqual('abc,');
      logInfo(`deleteItem>longPress>addItem>changeItem>o...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`deleteItem>longPress>addItem>changeItem>o...: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertEqual('abc');
      logInfo(`deleteItem>longPress>addItem>changeItem>o...: subject.items[1]=${subject.items[1]}`);
      expect(subject.items[1]).assertUndefined();
      logInfo(`deleteItem>longPress>addItem>changeItem>o...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`deleteItem>longPress>addItem>changeItem>o...: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertEqual(1);
      logInfo(`deleteItem>longPress>addItem>changeItem>o...: subject.scales[1]=${subject.scales[1]}`);
      expect(subject.scales[1]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0081
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0081
     * @tc.desc      ListExchangeModel call flow order > order > move > longPress > longPress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0081 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.move('aa', 99, 3);
      logInfo(`step3 move("aa", 99, 3): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.longPress('123_1');
      logInfo(`step4 longPress("123_1"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.longPress('QnmAMXrWDyJV');
      logInfo(`step5 longPress("QnmAMXrWDyJV"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`order>order>move>longPress>longPress final: subject.state=${subject.state}`);
      expect(subject.state).assertEqual(1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0082
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0082
     * @tc.desc      ListExchangeModel call flow addItem > order > addItem > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0082 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('78v');
      logInfo(`step1 addItem("78v"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('78v');
      const step3: number = subject.addItem('gGtl');
      logInfo(`step3 addItem("gGtl"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.move(' ', -2, 20);
      logInfo(`step4 move(" ", -2, 20): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`addItem>order>addItem>move final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>order>addItem>move final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["78v","gGtl"]');
      logInfo(`addItem>order>addItem>move final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>order>addItem>move final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>order>addItem>move final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>order>addItem>move final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0083
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0083
     * @tc.desc      ListExchangeModel call flow initData > initData > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0083 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['a', '', 'abc']);
      logInfo(`step1 initData(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(3);
      const step2: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step2 initData(["123", " ", "Hello World"...: step2=${step2}`);
      expect(step2).assertEqual(6);
      const step3: number = subject.addItem('l1kt6');
      logInfo(`step3 addItem("l1kt6"): step3=${step3}`);
      expect(step3).assertEqual(7);
      logInfo(`initData>initData>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(7);
      logInfo(`initData>initData>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","a","","l1kt6"]');
      logInfo(`initData>initData>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(7);
      logInfo(`initData>initData>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,1,1]');
      logInfo(`initData>initData>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(7);
      logInfo(`initData>initData>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0,0,0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0084
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0084
     * @tc.desc      ListExchangeModel call flow addItem > order > addItem > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0084 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('udhDji');
      logInfo(`step1 addItem("udhDji"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.order();
      logInfo(`step2 order(): step2=${step2}`);
      expect(step2).assertEqual('udhDji');
      const step3: number = subject.addItem('x ');
      logInfo(`step3 addItem("x "): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.drop(' abc ');
      logInfo(`step4 drop(" abc "): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`addItem>order>addItem>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`addItem>order>addItem>drop final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["udhDji","x "]');
      logInfo(`addItem>order>addItem>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`addItem>order>addItem>drop final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`addItem>order>addItem>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`addItem>order>addItem>drop final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0085
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0085
     * @tc.desc      ListExchangeModel call flow addItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0085 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('hfK');
      logInfo(`step1 addItem("hfK"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.deleteItem('abc_1');
      logInfo(`step2 deleteItem("abc_1"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`addItem>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["hfK"]');
      logInfo(`addItem>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0086
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0086
     * @tc.desc      ListExchangeModel call flow initData > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0086 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['abc', 'abc']);
      logInfo(`step1 initData(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.addItem('abc_1');
      logInfo(`step2 addItem("abc_1"): step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`initData>addItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(3);
      logInfo(`initData>addItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc","abc","abc_1"]');
      logInfo(`initData>addItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(3);
      logInfo(`initData>addItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1]');
      logInfo(`initData>addItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(3);
      logInfo(`initData>addItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0087
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0087
     * @tc.desc      ListExchangeModel call flow order > changeItem > move > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0087 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: string = subject.order();
      logInfo(`step1 order(): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.changeItem(90, 0);
      const step3: number = subject.move(' a ', 100, 0);
      logInfo(`step3 move(" a ", 100, 0): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.order();
      logInfo(`step4 order(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.order();
      logInfo(`step5 order(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`order>changeItem>move>order>order final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`order>changeItem>move>order>order final: subject.items[0]=${subject.items[0]}`);
      expect(subject.items[0]).assertUndefined();
      logInfo(`order>changeItem>move>order>order final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`order>changeItem>move>order>order final: subject.scales[0]=${subject.scales[0]}`);
      expect(subject.scales[0]).assertUndefined();
      logInfo(`order>changeItem>move>order>order final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`order>changeItem>move>order>order final: subject.offsets[0]=${subject.offsets[0]}`);
      expect(subject.offsets[0]).assertUndefined();
      logInfo(`${BUNDLE}ListExchangeModelFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0088
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0088
     * @tc.desc      ListExchangeModel call flow deleteItem > addItem > addItem > drop > deleteItem keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0088 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.deleteItem('Jv7WSLN38DVd');
      logInfo(`step1 deleteItem("Jv7WSLN38DVd"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.addItem('r1jcmzuOz');
      logInfo(`step2 addItem("r1jcmzuOz"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.addItem('N80655AM');
      logInfo(`step3 addItem("N80655AM"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.drop('Hello WorldHello World');
      logInfo(`step4 drop("Hello WorldHello World"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.deleteItem('j');
      logInfo(`step5 deleteItem("j"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`deleteItem>addItem>addItem>drop>deleteIte...: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(2);
      logInfo(`deleteItem>addItem>addItem>drop>deleteIte...: JSON.stringify(subjec...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["r1jcmzuOz","N80655AM"]');
      logInfo(`deleteItem>addItem>addItem>drop>deleteIte...: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(2);
      logInfo(`deleteItem>addItem>addItem>drop>deleteIte...: JSON.stringify(subje...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1]');
      logInfo(`deleteItem>addItem>addItem>drop>deleteIte...: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(2);
      logInfo(`deleteItem>addItem>addItem>drop>deleteIte...: JSON.stringify(subj...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0089
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0089
     * @tc.desc      ListExchangeModel call flow addItem > deleteItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0089 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.addItem('abc_1');
      logInfo(`step1 addItem("abc_1"): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.deleteItem('oyOBWCB2ShS');
      logInfo(`step2 deleteItem("oyOBWCB2ShS"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`addItem>deleteItem final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.items)=${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["abc_1"]');
      logInfo(`addItem>deleteItem final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.scales)=${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1]');
      logInfo(`addItem>deleteItem final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(1);
      logInfo(`addItem>deleteItem final: JSON.stringify(subject.offsets)=${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0090
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0090
     * @tc.desc      ListExchangeModel call flow drop > move > move > move keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0090 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.drop('Z1F');
      logInfo(`step1 drop("Z1F"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.move('aa', 99, 3);
      logInfo(`step2 move("aa", 99, 3): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.move(' a ', 100, 0);
      logInfo(`step3 move(" a ", 100, 0): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.move(' a ', 0, 1);
      logInfo(`step4 move(" a ", 0, 1): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_FLOW_0091
     * @tc.name      ListBeExchange_ListExchangeModelFlow_0091
     * @tc.desc      ListExchangeModel call flow initData > move > move > longPress > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ListExchangeModelFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelFlow_0091 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const step1: number = subject.initData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 initData(["123", " ", "Hello World"...: step1=${step1}`);
      expect(step1).assertEqual(6);
      const step2: number = subject.move('123', -100, 3);
      logInfo(`step2 move("123", -100, 3): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.move('', -100, 100);
      logInfo(`step3 move("", -100, 100): step3=${step3}`);
      expect(step3).assertEqual(4);
      const step4: number = subject.longPress('zNQbGok6F9');
      logInfo(`step4 longPress("zNQbGok6F9"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.drop('inbbrO');
      logInfo(`step5 drop("inbbrO"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`initData>move>move>longPress>drop final: subject.items.length=${subject.items.length}`);
      expect(subject.items.length).assertEqual(6);
      logInfo(`initData>move>move>longPress>drop final: JSON.stringify(subject.ite...${JSON.stringify(subject.items)}`);
      expect(JSON.stringify(subject.items)).assertEqual('["123"," ","Hello World","abc","","a"]');
      logInfo(`initData>move>move>longPress>drop final: subject.scales.length=${subject.scales.length}`);
      expect(subject.scales.length).assertEqual(6);
      logInfo(`initData>move>move>longPress>drop final: JSON.stringify(subject.sc...${JSON.stringify(subject.scales)}`);
      expect(JSON.stringify(subject.scales)).assertEqual('[1,1,1,1,1,-9]');
      logInfo(`initData>move>move>longPress>drop final: subject.offsets.length=${subject.offsets.length}`);
      expect(subject.offsets.length).assertEqual(6);
      logInfo(`initData>move>move>longPress>drop final: JSON.stringify(subject.o...${JSON.stringify(subject.offsets)}`);
      expect(JSON.stringify(subject.offsets)).assertEqual('[-100,0,0,0,-50,0]');
      logInfo(`${BUNDLE}ListExchangeModelFlow_0091 end`);
    });
  });
}
