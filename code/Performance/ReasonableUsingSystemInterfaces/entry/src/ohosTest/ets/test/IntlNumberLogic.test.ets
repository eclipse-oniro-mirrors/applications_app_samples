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
export default function IntlNumberLogic(): void {
  describe('IntlNumberLogic.test.ets', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0001
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0001';
      const input: string = 'en-US; value=-0; options={"style":"decimal","notation":"standard","useGroupi' +
        'ng":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDisplay":"' +
        'auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '-0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '0.125', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '-0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '0.125', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0002
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0002';
      const input: string = 'en-US; value=0; options={"style":"decimal","notation":"standard","useGroupin' +
        'g":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDisplay":"a' +
        'uto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '0.125', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '0.125', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0003
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0003';
      const input: string = 'en-US; value=-12345.678; options={"style":"decimal","notation":"standard","u' +
        'seGrouping":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDi' +
        'splay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = -12345.678;
      const probe1: number = 12345.678;
      const probe2: number = -12345.553;
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
      InterfaceTestLog.value(name, 'kit.format.0', '-12,345.678', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '12,345.678', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '-12,345.553', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '-12,345.678', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '12,345.678', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '-12,345.553', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0004
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0004';
      const input: string = 'en-US; value=12345.678; options={"style":"decimal","notation":"standard","us' +
        'eGrouping":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDis' +
        'play":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 12345.678;
      const probe1: number = -12345.678;
      const probe2: number = 12345.803;
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
      InterfaceTestLog.value(name, 'kit.format.0', '12,345.678', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-12,345.678', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '12,345.803', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '12,345.678', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-12,345.678', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '12,345.803', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0005
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0005';
      const input: string = 'en-US; value=-1; options={"style":"decimal","notation":"standard","useGroupi' +
        'ng":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDisplay":"' +
        'auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '-1', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '1', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '-0.875', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '-0.875', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0006
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0006';
      const input: string = 'en-US; value=1; options={"style":"decimal","notation":"standard","useGroupin' +
        'g":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDisplay":"a' +
        'uto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '1', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.125', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.125', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0007
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0007';
      const input: string = 'en-US; value=0.0049; options={"style":"decimal","notation":"standard","useGr' +
        'ouping":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDispla' +
        'y":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 0.0049;
      const probe1: number = -0.0049;
      const probe2: number = 0.1299;
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
      InterfaceTestLog.value(name, 'kit.format.0', '0.005', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-0.005', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '0.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '0.005', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0.005', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '0.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0008
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0008';
      const input: string = 'en-US; value=0.005; options={"style":"decimal","notation":"standard","useGro' +
        'uping":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDisplay' +
        '":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 0.005;
      const probe1: number = -0.005;
      const probe2: number = 0.13;
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
      InterfaceTestLog.value(name, 'kit.format.0', '0.005', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-0.005', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '0.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '0.005', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0.005', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '0.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0009
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0009';
      const input: string = 'en-US; value=999.995; options={"style":"decimal","notation":"standard","useG' +
        'rouping":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDispl' +
        'ay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 999.995;
      const probe1: number = -999.995;
      const probe2: number = 1000.12;
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
      InterfaceTestLog.value(name, 'kit.format.0', '999.995', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-999.995', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1,000.12', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '999.995', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-999.995', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1,000.12', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0010
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0010';
      const input: string = 'en-US; value=1000; options={"style":"decimal","notation":"standard","useGrou' +
        'ping":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDisplay"' +
        ':"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '1,000', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1,000', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1,000.125', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1,000', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1,000', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1,000.125', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0011
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0011';
      const input: string = 'en-US; value=9.9995; options={"style":"decimal","notation":"standard","useGr' +
        'ouping":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signDispla' +
        'y":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 9.9995;
      const probe1: number = -9.9995;
      const probe2: number = 10.1245;
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
      InterfaceTestLog.value(name, 'kit.format.0', '10', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-10', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '10.125', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '10', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-10', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '10.125', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0012
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0012';
      const input: string = 'en-US; value=1000000.125; options={"style":"decimal","notation":"standard","' +
        'useGrouping":true,"minimumFractionDigits":0,"maximumFractionDigits":3,"signD' +
        'isplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 0,
        maximumFractionDigits: 3, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":0,"maximumFractionDigits":3,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 1000000.125;
      const probe1: number = -1000000.125;
      const probe2: number = 1000000.25;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1,000,000.125', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1,000,000.125', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1,000,000.25', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '3', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.value(name, 'runtime.format.0', '1,000,000.125', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1,000,000.125', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1,000,000.25', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '3', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(3);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0013
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0013';
      const input: string = 'en-GB; value=-0; options={"style":"decimal","notation":"standard","useGroupi' +
        'ng":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDisplay":' +
        '"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '-0.00', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '0.00', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '0.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '-0.00', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '0.00', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '0.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0014
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0014';
      const input: string = 'en-GB; value=0; options={"style":"decimal","notation":"standard","useGroupin' +
        'g":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDisplay":"' +
        'auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '0.00', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-0.00', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '0.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '0.00', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0.00', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '0.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0015
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0015';
      const input: string = 'en-GB; value=-12345.678; options={"style":"decimal","notation":"standard","u' +
        'seGrouping":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signD' +
        'isplay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = -12345.678;
      const probe1: number = 12345.678;
      const probe2: number = -12345.553;
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
      InterfaceTestLog.value(name, 'kit.format.0', '-12345.68', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '12345.68', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '-12345.55', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '-12345.68', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '12345.68', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '-12345.55', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0016
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0016';
      const input: string = 'en-GB; value=12345.678; options={"style":"decimal","notation":"standard","us' +
        'eGrouping":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDi' +
        'splay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 12345.678;
      const probe1: number = -12345.678;
      const probe2: number = 12345.803;
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
      InterfaceTestLog.value(name, 'kit.format.0', '12345.68', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-12345.68', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '12345.80', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '12345.68', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-12345.68', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '12345.80', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0017
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0017';
      const input: string = 'en-GB; value=-1; options={"style":"decimal","notation":"standard","useGroupi' +
        'ng":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDisplay":' +
        '"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '-1.00', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '1.00', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '-0.88', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '-1.00', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '1.00', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '-0.88', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0018
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0018';
      const input: string = 'en-GB; value=1; options={"style":"decimal","notation":"standard","useGroupin' +
        'g":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDisplay":"' +
        'auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '1.00', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1.00', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '1.00', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1.00', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0019
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0019';
      const input: string = 'en-GB; value=0.0049; options={"style":"decimal","notation":"standard","useGr' +
        'ouping":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDispl' +
        'ay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 0.0049;
      const probe1: number = -0.0049;
      const probe2: number = 0.1299;
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
      InterfaceTestLog.value(name, 'kit.format.0', '0.00', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-0.00', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '0.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '0.00', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0.00', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '0.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0020
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0020';
      const input: string = 'en-GB; value=0.005; options={"style":"decimal","notation":"standard","useGro' +
        'uping":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDispla' +
        'y":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 0.005;
      const probe1: number = -0.005;
      const probe2: number = 0.13;
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
      InterfaceTestLog.value(name, 'kit.format.0', '0.01', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-0.01', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '0.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '0.01', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0.01', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '0.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0021
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0021';
      const input: string = 'en-GB; value=999.995; options={"style":"decimal","notation":"standard","useG' +
        'rouping":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDisp' +
        'lay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 999.995;
      const probe1: number = -999.995;
      const probe2: number = 1000.12;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1000.00', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1000.00', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1000.12', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '1000.00', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1000.00', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1000.12', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0022
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0022';
      const input: string = 'en-GB; value=1000; options={"style":"decimal","notation":"standard","useGrou' +
        'ping":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDisplay' +
        '":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '1000.00', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1000.00', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1000.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '1000.00', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1000.00', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1000.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0023
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0023';
      const input: string = 'en-GB; value=9.9995; options={"style":"decimal","notation":"standard","useGr' +
        'ouping":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"signDispl' +
        'ay":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 9.9995;
      const probe1: number = -9.9995;
      const probe2: number = 10.1245;
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
      InterfaceTestLog.value(name, 'kit.format.0', '10.00', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-10.00', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '10.12', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '10.00', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-10.00', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '10.12', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0024
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0024';
      const input: string = 'en-GB; value=1000000.125; options={"style":"decimal","notation":"standard","' +
        'useGrouping":false,"minimumFractionDigits":2,"maximumFractionDigits":2,"sign' +
        'Display":"auto"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: false, minimumFractionDigits: 2,
        maximumFractionDigits: 2, signDisplay: 'auto',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":false,"minimumFractio' +
        'nDigits":2,"maximumFractionDigits":2,"signDisplay":"auto"}';
      const kit: intl.NumberFormat = new intl.NumberFormat(locale, kitOptions);
      const runtime: Intl.NumberFormat = new Intl.NumberFormat(locale, runtimeOptions);
      const probe0: number = 1000000.125;
      const probe1: number = -1000000.125;
      const probe2: number = 1000000.25;
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
      InterfaceTestLog.value(name, 'kit.format.0', '1000000.13', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-1000000.13', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '1000000.25', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'auto', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '1000000.13', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-1000000.13', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '1000000.25', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'auto', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0025
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0025
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0025';
      const input: string = 'en-US; value=-0; options={"style":"decimal","notation":"standard","useGroupi' +
        'ng":true,"minimumFractionDigits":1,"maximumFractionDigits":2,"signDisplay":"' +
        'always"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 1,
        maximumFractionDigits: 2, signDisplay: 'always',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":1,"maximumFractionDigits":2,"signDisplay":"always"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 1,
        maximumFractionDigits: 2, signDisplay: 'always',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":1,"maximumFractionDigits":2,"signDisplay":"always"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '-0.0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '+0.0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '+0.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'always', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '-0.0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '+0.0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '+0.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'always', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0026
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0026
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0026';
      const input: string = 'en-US; value=0; options={"style":"decimal","notation":"standard","useGroupin' +
        'g":true,"minimumFractionDigits":1,"maximumFractionDigits":2,"signDisplay":"a' +
        'lways"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 1,
        maximumFractionDigits: 2, signDisplay: 'always',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":1,"maximumFractionDigits":2,"signDisplay":"always"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 1,
        maximumFractionDigits: 2, signDisplay: 'always',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":1,"maximumFractionDigits":2,"signDisplay":"always"}';
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
      InterfaceTestLog.value(name, 'kit.format.0', '+0.0', kitText0);
      expect(kitText0).assertEqual(runtimeText0);
      InterfaceTestLog.value(name, 'kit.format.1', '-0.0', kitText1);
      expect(kitText1).assertEqual(runtimeText1);
      InterfaceTestLog.value(name, 'kit.format.2', '+0.13', kitText2);
      expect(kitText2).assertEqual(runtimeText2);
      InterfaceTestLog.value(name, 'kit.notation', 'standard', String(kitResolved.notation));
      expect(kitResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'kit.signDisplay', 'always', String(kitResolved.signDisplay));
      expect(kitResolved.signDisplay).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.digits', '2', String(kitResolved.maximumFractionDigits));
      expect(kitResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.value(name, 'runtime.format.0', '+0.0', runtimeText0);
      expect(runtimeText0).assertEqual(kitText0);
      InterfaceTestLog.value(name, 'runtime.format.1', '-0.0', runtimeText1);
      expect(runtimeText1).assertEqual(kitText1);
      InterfaceTestLog.value(name, 'runtime.format.2', '+0.13', runtimeText2);
      expect(runtimeText2).assertEqual(kitText2);
      InterfaceTestLog.value(name, 'runtime.notation', 'standard', String(runtimeResolved.notation));
      expect(runtimeResolved.notation).assertEqual('standard');
      InterfaceTestLog.value(name, 'runtime.signDisplay', 'always', String(runtimeResolved.signDisplay));
      expect(runtimeResolved.signDisplay).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.digits', '2', String(runtimeResolved.maximumFractionDigits));
      expect(runtimeResolved.maximumFractionDigits).assertEqual(2);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0027
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0027
     * @tc.desc Check signed decimal, rounding, grouping and significant-digit boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_NUMBER_0027';
      const input: string = 'en-US; value=-12345.678; options={"style":"decimal","notation":"standard","u' +
        'seGrouping":true,"minimumFractionDigits":1,"maximumFractionDigits":2,"signDi' +
        'splay":"always"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.NumberOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 1,
        maximumFractionDigits: 2, signDisplay: 'always',
      };
      const kitOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":1,"maximumFractionDigits":2,"signDisplay":"always"}';
      const runtimeOptions: Intl.NumberFormatOptions = {
        style: 'decimal', notation: 'standard', useGrouping: true, minimumFractionDigits: 1,
        maximumFractionDigits: 2, signDisplay: 'always',
      };
      const runtimeOptionsSnapshot: string =
        '{"style":"decimal","notation":"standard","useGrouping":true,"minimumFraction' +
        'Digits":1,"maximumFractionDigits":2,"signDisplay":"always"}';