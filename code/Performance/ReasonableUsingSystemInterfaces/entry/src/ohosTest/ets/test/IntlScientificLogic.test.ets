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
      const runtimeText2: string = runtime.format(probe2);
      const runtimeResolved: Intl.ResolvedNumberFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1E0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E0', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1E0', runtimeText2);
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0005
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0005';
      const input: string = 'en-US; value=-0.000001; options={"style":"decimal","notation":"scientific","' +
        'useGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1' +
        ',"signDisplay":"auto"}';
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
      const probe0: number = -0.000001;
      const probe1: number = 0.000001;
      const probe2: number = 0.124999;
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
      InterfaceTestLog.value(name, 'kit.format.0', '-1E-6', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '1E-6', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1E-6', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1E-6', runtimeText1);
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0006
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0006';
      const input: string = 'en-US; value=0.000001; options={"style":"decimal","notation":"scientific","u' +
        'seGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1,' +
        '"signDisplay":"auto"}';
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
      const probe0: number = 0.000001;
      const probe1: number = -0.000001;
      const probe2: number = 0.125001;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E-6', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E-6', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E-6', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E-6', runtimeText1);
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0007
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0007';
      const input: string = 'en-US; value=0.00099995; options={"style":"decimal","notation":"scientific",' +
        '"useGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":' +
        '1,"signDisplay":"auto"}';
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
      const probe0: number = 0.00099995;
      const probe1: number = -0.00099995;
      const probe2: number = 0.12599995;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E-3', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E-3', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E-3', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E-3', runtimeText1);
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0008
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0008';
      const input: string = 'en-US; value=0.001; options={"style":"decimal","notation":"scientific","useG' +
        'rouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1,"si' +
        'gnDisplay":"auto"}';
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
      const probe0: number = 0.001;
      const probe1: number = -0.001;
      const probe2: number = 0.126;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E-3', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E-3', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E-3', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E-3', runtimeText1);
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0009
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0009';
      const input: string = 'en-US; value=999.95; options={"style":"decimal","notation":"scientific","use' +
        'Grouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1,"s' +
        'ignDisplay":"auto"}';
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
      const probe0: number = 999.95;
      const probe1: number = -999.95;
      const probe2: number = 1000.075;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E3', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E3', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E3', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E3', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E3', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1E3', runtimeText2);
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0010
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0010';
      const input: string = 'en-US; value=1000; options={"style":"decimal","notation":"scientific","useGr' +
        'ouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1,"sig' +
        'nDisplay":"auto"}';
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
      const probe0: number = 1000;
      const probe1: number = -1000;
      const probe2: number = 1000.125;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E3', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E3', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E3', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E3', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E3', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1E3', runtimeText2);
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0011
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0011';
      const input: string = 'en-US; value=-123456.789; options={"style":"decimal","notation":"scientific"' +
        ',"useGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits"' +
        ':1,"signDisplay":"auto"}';
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
      const probe0: number = -123456.789;
      const probe1: number = 123456.789;
      const probe2: number = -123456.664;
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
      InterfaceTestLog.value(name, 'kit.format.0', '-1E5', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '1E5', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '-1E5', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1E5', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1E5', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '-1E5', runtimeText2);
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0012
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0012';
      const input: string = 'en-US; value=1e+21; options={"style":"decimal","notation":"scientific","useG' +
        'rouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":1,"si' +
        'gnDisplay":"auto"}';
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
      const probe0: number = 1e+21;
      const probe1: number = -1e+21;
      const probe2: number = 1.0000000000000003e+21;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E21', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E21', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E21', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '1', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(1);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E21', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E21', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1E21', runtimeText2);
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
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0013
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0013';
      const input: string = 'en-GB; value=-0; options={"style":"decimal","notation":"scientific","useGrou' +
        'ping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3,"signD' +
        'isplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.2', '1.25E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '-0E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '0E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.25E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0014
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0014';
      const input: string = 'en-GB; value=0; options={"style":"decimal","notation":"scientific","useGroup' +
        'ing":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3,"signDi' +
        'splay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.2', '1.25E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '0E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.25E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0015
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0015';
      const input: string = 'en-GB; value=-1; options={"style":"decimal","notation":"scientific","useGrou' +
        'ping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3,"signD' +
        'isplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.2', '-8.75E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '-8.75E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0016
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0016';
      const input: string = 'en-GB; value=1; options={"style":"decimal","notation":"scientific","useGroup' +
        'ing":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3,"signDi' +
        'splay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
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
      const runtimeText2: string = runtime.format(probe2);
      const runtimeResolved: Intl.ResolvedNumberFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1E0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.13E0', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.13E0', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0017
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0017';
      const input: string = 'en-GB; value=-0.000001; options={"style":"decimal","notation":"scientific","' +
        'useGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3' +
        ',"signDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = -0.000001;
      const probe1: number = 0.000001;
      const probe2: number = 0.124999;
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
      InterfaceTestLog.value(name, 'kit.format.0', '-1E-6', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '1E-6', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.25E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1E-6', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1E-6', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.25E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0018
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0018';
      const input: string = 'en-GB; value=0.000001; options={"style":"decimal","notation":"scientific","u' +
        'seGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3,' +
        '"signDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 0.000001;
      const probe1: number = -0.000001;
      const probe2: number = 0.125001;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E-6', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E-6', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.25E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E-6', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E-6', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.25E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0019
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0019';
      const input: string = 'en-GB; value=0.00099995; options={"style":"decimal","notation":"scientific",' +
        '"useGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":' +
        '3,"signDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 0.00099995;
      const probe1: number = -0.00099995;
      const probe2: number = 0.12599995;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E-3', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E-3', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.26E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E-3', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E-3', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.26E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0020
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0020';
      const input: string = 'en-GB; value=0.001; options={"style":"decimal","notation":"scientific","useG' +
        'rouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3,"si' +
        'gnDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 0.001;
      const probe1: number = -0.001;
      const probe2: number = 0.126;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E-3', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E-3', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.26E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E-3', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E-3', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.26E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0021
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0021';
      const input: string = 'en-GB; value=999.95; options={"style":"decimal","notation":"scientific","use' +
        'Grouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3,"s' +
        'ignDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 999.95;
      const probe1: number = -999.95;
      const probe2: number = 1000.075;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E3', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E3', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E3', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E3', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E3', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1E3', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0022
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0022';
      const input: string = 'en-GB; value=1000; options={"style":"decimal","notation":"scientific","useGr' +
        'ouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3,"sig' +
        'nDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 1000;
      const probe1: number = -1000;
      const probe2: number = 1000.125;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E3', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E3', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E3', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E3', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E3', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1E3', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0023
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0023';
      const input: string = 'en-GB; value=-123456.789; options={"style":"decimal","notation":"scientific"' +
        ',"useGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits"' +
        ':3,"signDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = -123456.789;
      const probe1: number = 123456.789;
      const probe2: number = -123456.664;
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
      InterfaceTestLog.value(name, 'kit.format.0', '-1.23E5', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '1.23E5', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '-1.23E5', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1.23E5', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1.23E5', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '-1.23E5', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0024
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0024';
      const input: string = 'en-GB; value=1e+21; options={"style":"decimal","notation":"scientific","useG' +
        'rouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":3,"si' +
        'gnDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 1e+21;
      const probe1: number = -1e+21;
      const probe2: number = 1.0000000000000003e+21;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E21', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E21', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1E21', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E21', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E21', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1E21', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0025
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0025
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0025';
      const input: string = 'en-US; value=-0; options={"style":"decimal","notation":"scientific","useGrou' +
        'ping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":21,"sign' +
        'Display":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.2', '1.25E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '21', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.value(name, 'runtime.format.0', '-0E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '0E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.25E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '21', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0026
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0026
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0026';
      const input: string = 'en-US; value=0; options={"style":"decimal","notation":"scientific","useGroup' +
        'ing":false,"minimumSignificantDigits":1,"maximumSignificantDigits":21,"signD' +
        'isplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.2', '1.25E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '21', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.value(name, 'runtime.format.0', '0E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.25E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '21', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0027
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0027
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0027';
      const input: string = 'en-US; value=-1; options={"style":"decimal","notation":"scientific","useGrou' +
        'ping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":21,"sign' +
        'Display":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.2', '-8.75E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '21', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '-8.75E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '21', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0028
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0028
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0028';
      const input: string = 'en-US; value=1; options={"style":"decimal","notation":"scientific","useGroup' +
        'ing":false,"minimumSignificantDigits":1,"maximumSignificantDigits":21,"signD' +
        'isplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
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
      const runtimeText2: string = runtime.format(probe2);
      const runtimeResolved: Intl.ResolvedNumberFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1E0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.125E0', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '21', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.125E0', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '21', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0029
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0029
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0029';
      const input: string = 'en-US; value=-0.000001; options={"style":"decimal","notation":"scientific","' +
        'useGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":2' +
        '1,"signDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = -0.000001;
      const probe1: number = 0.000001;
      const probe2: number = 0.124999;
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
      InterfaceTestLog.value(name, 'kit.format.0', '-1E-6', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '1E-6', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.24999E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '21', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1E-6', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1E-6', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.24999E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '21', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0030
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0030
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0030';
      const input: string = 'en-US; value=0.000001; options={"style":"decimal","notation":"scientific","u' +
        'seGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":21' +
        ',"signDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'scientific', useGrouping: false, minimumSignificantDigits: 1,
        maximumSignificantDigits: 21, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"scientific","useGrouping":false,"minimumSigni' +
        'ficantDigits":1,"maximumSignificantDigits":21,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 0.000001;
      const probe1: number = -0.000001;
      const probe2: number = 0.125001;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1E-6', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1E-6', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.25001E-1', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'scientific', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '21', String(kitResolved.maximumSignificantDigits));
      expect(kitResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.value(name, 'runtime.format.0', '1E-6', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1E-6', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.25001E-1', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'scientific', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('scientific');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '21', String(runtimeResolved.maximumSignificantDigits));
      expect(runtimeResolved.maximumSignificantDigits).assertEqual(21);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0031
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0031
     * @tc.desc Check signed scientific/engineering notation and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_SCIENTIFIC_0031';
      const input: string = 'en-US; value=0.00099995; options={"style":"decimal","notation":"scientific",' +
        '"useGrouping":false,"minimumSignificantDigits":1,"maximumSignificantDigits":' +
        '21,"signDisplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {