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
export default function IntlScientificLogic(): void {
  describe('IntlScientificLogic.test.ets', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0001
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0001';
      const input: string = 'en-US; value=-0; options={"style":"decimal","notation":"scientific","useGrou' +
        'ping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1,"signD' +
        'isplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 1, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":1,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 1, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":1,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = -0;
      const probe1: number = 0;
      const probe2: number = 0.125;
      const kitText0: string = kit.format(probe0);
      const kitText1: string = kit.format(probe1);
      const kitText2: string = kit.format(probe2);
      const kitResolved: intl.NumberOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0);
      const runtimeText1: string = runtime.format(probe1);
      const runtimeText2: string = runtime.format(probe2);
      const runtimeResolved: Intl.ResolvedNumberFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '-0E0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '0E0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '-0E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '0E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '1', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0002
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0002';
      const input: string = 'en-US; value=0; options={"style":"decimal","notation":"scientific","useGroup' +
        'ing":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1,"signDi' +
        'splay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 1, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":1,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 1, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":1,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 0;
      const probe1: number = -0;
      const probe2: number = 0.125;
      const kitText0: string = kit.format(probe0);
      const kitText1: string = kit.format(probe1);
      const kitText2: string = kit.format(probe2);
      const kitResolved: intl.NumberOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0);
      const runtimeText1: string = runtime.format(probe1);
      const runtimeText2: string = runtime.format(probe2);
      const runtimeResolved: Intl.ResolvedNumberFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '0E0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-0E0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '0E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '1', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0003
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0003';
      const input: string = 'en-US; value=-1; options={"style":"decimal","notation":"scientific","useGrou' +
        'ping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1,"signD' +
        'isplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 1, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":1,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 1, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":1,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -0.875;
      const kitText0: string = kit.format(probe0);
      const kitText1: string = kit.format(probe1);
      const kitText2: string = kit.format(probe2);
      const kitResolved: intl.NumberOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0);
      const runtimeText1: string = runtime.format(probe1);
      const runtimeText2: string = runtime.format(probe2);
      const runtimeResolved: Intl.ResolvedNumberFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '-1E0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '1E0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '-9E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '-9E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '1', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0004
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0004';
      const input: string = 'en-US; value=1; options={"style":"decimal","notation":"scientific","useGroup' +
        'ing":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1,"signDi' +
        'splay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 1, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":1,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 1, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":1,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 1;
      const probe1: number = -1;
      const probe2: number = 1.125;
      const kitText0: string = kit.format(probe0);
      const kitText1: string = kit.format(probe1);
      const kitText2: string = kit.format(probe2);
      const kitResolved: intl.NumberOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0);
      const runtimeText1: string = runtime.format(probe1);