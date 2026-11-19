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
import { describe, it, expect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { intl } from '@kit.LocalizationKit';
import { InterfaceTestLog } from '../utils/InterfaceTestLog';
export default function IntlCollatorLogic(): void {
  describe('IntlCollatorLogic.test.ets', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0001
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0001';
      const input: string = 'en-US; pair=["2","10"]; options={"usage":"sort","sensitivity":"variant","num' +
        'eric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = '2';
      const second: string = '10';
      const kitSource: Array<string> = ['10', '2', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['10', '2', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', '2|10|item3|item20', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('2|10|item3|item20');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', '10|2|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('10|2|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', '2|10|item3|item20', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('2|10|item3|item20');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', '10|2|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('10|2|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0002
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0002';
      const input: string = 'en-US; pair=["9","100"]; options={"usage":"sort","sensitivity":"variant","nu' +
        'meric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = '9';
      const second: string = '100';
      const kitSource: Array<string> = ['100', '9', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['100', '9', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', '9|100|item3|item20', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('9|100|item3|item20');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', '100|9|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('100|9|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', '9|100|item3|item20', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('9|100|item3|item20');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', '100|9|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('100|9|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0003
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0003';
      const input: string = 'en-US; pair=["file2","file10"]; options={"usage":"sort","sensitivity":"varia' +
        'nt","numeric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'file2';
      const second: string = 'file10';
      const kitSource: Array<string> = ['file10', 'file2', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['file10', 'file2', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'file2|file10|item3|item20', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('file2|file10|item3|item20');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'file10|file2|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('file10|file2|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'file2|file10|item3|item20', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('file2|file10|item3|item20');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'file10|file2|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('file10|file2|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0004
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0004';
      const input: string = 'en-US; pair=["item9","item12"]; options={"usage":"sort","sensitivity":"varia' +
        'nt","numeric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'item9';
      const second: string = 'item12';
      const kitSource: Array<string> = ['item12', 'item9', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['item12', 'item9', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'item3|item9|item12|item20', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('item3|item9|item12|item20');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'item12|item9|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('item12|item9|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'item3|item9|item12|item20', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('item3|item9|item12|item20');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'item12|item9|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('item12|item9|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0005
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0005';
      const input: string = 'en-US; pair=["a","b"]; options={"usage":"sort","sensitivity":"variant","nume' +
        'ric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'a';
      const second: string = 'b';
      const kitSource: Array<string> = ['b', 'a', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['b', 'a', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'a|b|item3|item20', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('a|b|item3|item20');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'b|a|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('b|a|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'a|b|item3|item20', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('a|b|item3|item20');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'b|a|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('b|a|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0006
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0006';
      const input: string = 'en-US; pair=["alpha","beta"]; options={"usage":"sort","sensitivity":"variant' +
        '","numeric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'alpha';
      const second: string = 'beta';
      const kitSource: Array<string> = ['beta', 'alpha', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['beta', 'alpha', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'alpha|beta|item3|item20', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('alpha|beta|item3|item20');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'beta|alpha|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('beta|alpha|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'alpha|beta|item3|item20', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('alpha|beta|item3|item20');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'beta|alpha|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('beta|alpha|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0007
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0007';
      const input: string = 'en-US; pair=["same","same"]; options={"usage":"sort","sensitivity":"variant"' +
        ',"numeric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'same';
      const second: string = 'same';
      const kitSource: Array<string> = ['same', 'same', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['same', 'same', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', 0, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.backwardSign', 0, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'item3|item20|same|same', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('item3|item20|same|same');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'same|same|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('same|same|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', 0, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 0, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'item3|item20|same|same', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('item3|item20|same|same');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'same|same|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('same|same|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0008
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0008';
      const input: string = 'en-US; pair=["",""]; options={"usage":"sort","sensitivity":"variant","numeri' +
        'c":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = '';
      const second: string = '';
      const kitSource: Array<string> = ['', '', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['', '', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', 0, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.backwardSign', 0, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', '||item3|item20', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('||item3|item20');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', '||item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('||item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', 0, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 0, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', '||item3|item20', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('||item3|item20');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', '||item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('||item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0009
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0009';
      const input: string = 'en-US; pair=["A","a"]; options={"usage":"sort","sensitivity":"variant","nume' +
        'ric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'A';
      const second: string = 'a';
      const kitSource: Array<string> = ['a', 'A', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['a', 'A', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', 1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.backwardSign', -1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'a|A|item3|item20', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('a|A|item3|item20');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'a|A|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('a|A|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', 1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', -1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'a|A|item3|item20', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('a|A|item3|item20');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'a|A|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('a|A|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0010
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0010';
      const input: string = 'en-US; pair=["resume","RESUME"]; options={"usage":"sort","sensitivity":"vari' +
        'ant","numeric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'resume';
      const second: string = 'RESUME';
      const kitSource: Array<string> = ['RESUME', 'resume', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['RESUME', 'resume', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'item3|item20|resume|RESUME', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('item3|item20|resume|RESUME');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'RESUME|resume|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('RESUME|resume|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'item3|item20|resume|RESUME', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('item3|item20|resume|RESUME');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'RESUME|resume|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('RESUME|resume|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0011
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0011';
      const input: string = 'en-US; pair=["a-b","ab"]; options={"usage":"sort","sensitivity":"variant","n' +
        'umeric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'a-b';
      const second: string = 'ab';
      const kitSource: Array<string> = ['ab', 'a-b', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['ab', 'a-b', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'a-b|ab|item3|item20', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('a-b|ab|item3|item20');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'ab|a-b|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('ab|a-b|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'a-b|ab|item3|item20', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('a-b|ab|item3|item20');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'ab|a-b|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('ab|a-b|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0012
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0012';
      const input: string = 'en-US; pair=["x.y","xy"]; options={"usage":"sort","sensitivity":"variant","n' +
        'umeric":true,"ignorePunctuation":false,"caseFirst":"lower"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: true, ignorePunctuation: false, caseFirst: 'lower',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":true,"ignorePunctuation":f' +
        'alse,"caseFirst":"lower"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'x.y';
      const second: string = 'xy';
      const kitSource: Array<string> = ['xy', 'x.y', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['xy', 'x.y', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'item3|item20|x.y|xy', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('item3|item20|x.y|xy');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'xy|x.y|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('xy|x.y|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'item3|item20|x.y|xy', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('item3|item20|x.y|xy');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'xy|x.y|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('xy|x.y|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0013
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0013';
      const input: string = 'en-GB; pair=["2","10"]; options={"usage":"sort","sensitivity":"variant","num' +
        'eric":false,"ignorePunctuation":false,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = '2';
      const second: string = '10';
      const kitSource: Array<string> = ['10', '2', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['10', '2', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', 1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.backwardSign', -1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', '10|2|item20|item3', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('10|2|item20|item3');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', '10|2|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('10|2|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', 1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', -1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', '10|2|item20|item3', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('10|2|item20|item3');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', '10|2|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('10|2|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0014
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0014';
      const input: string = 'en-GB; pair=["9","100"]; options={"usage":"sort","sensitivity":"variant","nu' +
        'meric":false,"ignorePunctuation":false,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = '9';
      const second: string = '100';
      const kitSource: Array<string> = ['100', '9', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['100', '9', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', 1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.backwardSign', -1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', '100|9|item20|item3', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('100|9|item20|item3');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', '100|9|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('100|9|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', 1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', -1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', '100|9|item20|item3', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('100|9|item20|item3');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', '100|9|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('100|9|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0015
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0015';
      const input: string = 'en-GB; pair=["file2","file10"]; options={"usage":"sort","sensitivity":"varia' +
        'nt","numeric":false,"ignorePunctuation":false,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'file2';
      const second: string = 'file10';
      const kitSource: Array<string> = ['file10', 'file2', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['file10', 'file2', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', 1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.backwardSign', -1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'file10|file2|item20|item3', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('file10|file2|item20|item3');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'file10|file2|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('file10|file2|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', 1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', -1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'file10|file2|item20|item3', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('file10|file2|item20|item3');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'file10|file2|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('file10|file2|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0016
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0016';
      const input: string = 'en-GB; pair=["item9","item12"]; options={"usage":"sort","sensitivity":"varia' +
        'nt","numeric":false,"ignorePunctuation":false,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'item9';
      const second: string = 'item12';
      const kitSource: Array<string> = ['item12', 'item9', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['item12', 'item9', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', 1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.backwardSign', -1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'item12|item20|item3|item9', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('item12|item20|item3|item9');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'item12|item9|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('item12|item9|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', 1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', -1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'item12|item20|item3|item9', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('item12|item20|item3|item9');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'item12|item9|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('item12|item9|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0017
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0017';
      const input: string = 'en-GB; pair=["a","b"]; options={"usage":"sort","sensitivity":"variant","nume' +
        'ric":false,"ignorePunctuation":false,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'a';
      const second: string = 'b';
      const kitSource: Array<string> = ['b', 'a', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['b', 'a', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'a|b|item20|item3', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('a|b|item20|item3');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'b|a|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('b|a|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'a|b|item20|item3', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('a|b|item20|item3');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'b|a|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('b|a|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0018
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0018';
      const input: string = 'en-GB; pair=["alpha","beta"]; options={"usage":"sort","sensitivity":"variant' +
        '","numeric":false,"ignorePunctuation":false,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'alpha';
      const second: string = 'beta';
      const kitSource: Array<string> = ['beta', 'alpha', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['beta', 'alpha', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', -1, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'kit.backwardSign', 1, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'alpha|beta|item20|item3', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('alpha|beta|item20|item3');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'beta|alpha|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('beta|alpha|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', -1, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(-1);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 1, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(1);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'alpha|beta|item20|item3', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('alpha|beta|item20|item3');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'beta|alpha|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('beta|alpha|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0019
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0019';
      const input: string = 'en-GB; pair=["same","same"]; options={"usage":"sort","sensitivity":"variant"' +
        ',"numeric":false,"ignorePunctuation":false,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = 'same';
      const second: string = 'same';
      const kitSource: Array<string> = ['same', 'same', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['same', 'same', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', 0, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.backwardSign', 0, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', 'item20|item3|same|same', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('item20|item3|same|same');
      InterfaceTestLog.value(name, 'kit.inputUnchanged', 'same|same|item20|item3', kitSource.join('|'));
      expect(kitSource.join('|')).assertEqual('same|same|item20|item3');
      InterfaceTestLog.number(name, 'kit.sortLength', 4, kitSorted.length);
      expect(kitSorted.length).assertEqual(4);
      InterfaceTestLog.number(name, 'runtime.forwardSign', 0, Math.sign(runtimeForward));
      expect(Math.sign(runtimeForward)).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.backwardSign', 0, Math.sign(runtimeBackward));
      expect(Math.sign(runtimeBackward)).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.reflexive', 0, runtimeEqual);
      expect(runtimeEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'runtime.sorted', 'item20|item3|same|same', runtimeSorted.join('|'));
      expect(runtimeSorted.join('|')).assertEqual('item20|item3|same|same');
      InterfaceTestLog.value(name, 'runtime.inputUnchanged', 'same|same|item20|item3', runtimeSource.join('|'));
      expect(runtimeSource.join('|')).assertEqual('same|same|item20|item3');
      InterfaceTestLog.number(name, 'runtime.sortLength', 4, runtimeSorted.length);
      expect(runtimeSorted.length).assertEqual(4);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0020
     * @tc.desc Check comparator direction/equality, numeric sort and immutable source arrays.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_COLLATOR_0020';
      const input: string = 'en-GB; pair=["",""]; options={"usage":"sort","sensitivity":"variant","numeri' +
        'c":false,"ignorePunctuation":false,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const runtimeOptions: Intl.CollatorOptions = {
        usage: 'sort', sensitivity: 'variant', numeric: false, ignorePunctuation: false, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"usage":"sort","sensitivity":"variant","numeric":false,"ignorePunctuation":' +
        'false,"caseFirst":"upper"}';
      const kit: intl.Collator = new intl.Collator(locale, kitOptions);
      const runtime: Intl.Collator = new Intl.Collator(locale, runtimeOptions);
      const first: string = '';
      const second: string = '';
      const kitSource: Array<string> = ['', '', 'item20', 'item3'];
      const kitSorted: Array<string> = kitSource.slice();
      kitSorted.sort((a: string, b: string): number => kit.compare(a, b));
      const kitForward: number = kit.compare(first, second);
      const kitBackward: number = kit.compare(second, first);
      const kitEqual: number = kit.compare(first, first);
      const runtimeSource: Array<string> = ['', '', 'item20', 'item3'];
      const runtimeSorted: Array<string> = runtimeSource.slice();
      runtimeSorted.sort((a: string, b: string): number => runtime.compare(a, b));
      const runtimeForward: number = runtime.compare(first, second);
      const runtimeBackward: number = runtime.compare(second, first);
      const runtimeEqual: number = runtime.compare(first, first);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.number(name, 'kit.forwardSign', 0, Math.sign(kitForward));
      expect(Math.sign(kitForward)).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.backwardSign', 0, Math.sign(kitBackward));
      expect(Math.sign(kitBackward)).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.reflexive', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.value(name, 'kit.sorted', '||item20|item3', kitSorted.join('|'));
      expect(kitSorted.join('|')).assertEqual('||item20|item3');