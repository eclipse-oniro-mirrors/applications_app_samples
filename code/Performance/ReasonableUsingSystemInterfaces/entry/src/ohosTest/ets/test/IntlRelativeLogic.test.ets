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
export default function IntlRelativeLogic(): void {
  describe('IntlRelativeLogic.test.ets', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0001
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0001';
      const input: string = 'en-US; unit=year; value=-2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'year';
      const probe0: number = -2;
      const probe1: number = 0;
      const probe2: number = -4;
      const probe3: number = -1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '2 years ago', kitText0);
      expect(kitText0).assertEqual('2 years ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'this year', kitText1);
      expect(kitText1).assertEqual('this year');
      InterfaceTestLog.value(name, 'kit.format.2', '4 years ago', kitText2);
      expect(kitText2).assertEqual('4 years ago');
      InterfaceTestLog.value(name, 'kit.format.3', '1.5 years ago', kitText3);
      expect(kitText3).assertEqual('1.5 years ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '2 years ago', runtimeText0);
      expect(runtimeText0).assertEqual('2 years ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'this year', runtimeText1);
      expect(runtimeText1).assertEqual('this year');
      InterfaceTestLog.value(name, 'runtime.format.2', '4 years ago', runtimeText2);
      expect(runtimeText2).assertEqual('4 years ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '1.5 years ago', runtimeText3);
      expect(runtimeText3).assertEqual('1.5 years ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0002
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0002';
      const input: string = 'en-US; unit=year; value=-1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'year';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'last year', kitText0);
      expect(kitText0).assertEqual('last year');
      InterfaceTestLog.value(name, 'kit.format.1', 'next year', kitText1);
      expect(kitText1).assertEqual('next year');
      InterfaceTestLog.value(name, 'kit.format.2', '3 years ago', kitText2);
      expect(kitText2).assertEqual('3 years ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 years ago', kitText3);
      expect(kitText3).assertEqual('0.5 years ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'last year', runtimeText0);
      expect(runtimeText0).assertEqual('last year');
      InterfaceTestLog.value(name, 'runtime.format.1', 'next year', runtimeText1);
      expect(runtimeText1).assertEqual('next year');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 years ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 years ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 years ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 years ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0003
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0003';
      const input: string = 'en-US; unit=year; value=-0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'year';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this year', kitText0);
      expect(kitText0).assertEqual('this year');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 years', kitText1);
      expect(kitText1).assertEqual('in 2 years');
      InterfaceTestLog.value(name, 'kit.format.2', '2 years ago', kitText2);
      expect(kitText2).assertEqual('2 years ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'this year', kitText3);
      expect(kitText3).assertEqual('this year');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this year', runtimeText0);
      expect(runtimeText0).assertEqual('this year');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 years', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 years');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 years ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 years ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'this year', runtimeText3);
      expect(runtimeText3).assertEqual('this year');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0004
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0004';
      const input: string = 'en-US; unit=year; value=0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'year';
      const probe0: number = 0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this year', kitText0);
      expect(kitText0).assertEqual('this year');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 years', kitText1);
      expect(kitText1).assertEqual('in 2 years');
      InterfaceTestLog.value(name, 'kit.format.2', '2 years ago', kitText2);
      expect(kitText2).assertEqual('2 years ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0.5 years', kitText3);
      expect(kitText3).assertEqual('in 0.5 years');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this year', runtimeText0);
      expect(runtimeText0).assertEqual('this year');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 years', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 years');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 years ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 years ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0.5 years', runtimeText3);
      expect(runtimeText3).assertEqual('in 0.5 years');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0005
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0005';
      const input: string = 'en-US; unit=year; value=1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'year';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'next year', kitText0);
      expect(kitText0).assertEqual('next year');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 years', kitText1);
      expect(kitText1).assertEqual('in 3 years');
      InterfaceTestLog.value(name, 'kit.format.2', 'last year', kitText2);
      expect(kitText2).assertEqual('last year');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 years', kitText3);
      expect(kitText3).assertEqual('in 1.5 years');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'next year', runtimeText0);
      expect(runtimeText0).assertEqual('next year');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 years', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 years');
      InterfaceTestLog.value(name, 'runtime.format.2', 'last year', runtimeText2);
      expect(runtimeText2).assertEqual('last year');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 years', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 years');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0006
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0006';
      const input: string = 'en-US; unit=year; value=2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'year';
      const probe0: number = 2;
      const probe1: number = 4;
      const probe2: number = 0;
      const probe3: number = 2.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 2 years', kitText0);
      expect(kitText0).assertEqual('in 2 years');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 4 years', kitText1);
      expect(kitText1).assertEqual('in 4 years');
      InterfaceTestLog.value(name, 'kit.format.2', 'this year', kitText2);
      expect(kitText2).assertEqual('this year');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 2.5 years', kitText3);
      expect(kitText3).assertEqual('in 2.5 years');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 2 years', runtimeText0);
      expect(runtimeText0).assertEqual('in 2 years');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 4 years', runtimeText1);
      expect(runtimeText1).assertEqual('in 4 years');
      InterfaceTestLog.value(name, 'runtime.format.2', 'this year', runtimeText2);
      expect(runtimeText2).assertEqual('this year');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 2.5 years', runtimeText3);
      expect(runtimeText3).assertEqual('in 2.5 years');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0007
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0007';
      const input: string = 'en-US; unit=year; value=-1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'year';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 year ago', kitText0);
      expect(kitText0).assertEqual('1 year ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 year', kitText1);
      expect(kitText1).assertEqual('in 1 year');
      InterfaceTestLog.value(name, 'kit.format.2', '3 years ago', kitText2);
      expect(kitText2).assertEqual('3 years ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 years ago', kitText3);
      expect(kitText3).assertEqual('0.5 years ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 year ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 year ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 year', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 year');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 years ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 years ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 years ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 years ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0008
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0008';
      const input: string = 'en-US; unit=year; value=-0; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'year';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '0 years ago', kitText0);
      expect(kitText0).assertEqual('0 years ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 years', kitText1);
      expect(kitText1).assertEqual('in 2 years');
      InterfaceTestLog.value(name, 'kit.format.2', '2 years ago', kitText2);
      expect(kitText2).assertEqual('2 years ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0 years', kitText3);
      expect(kitText3).assertEqual('in 0 years');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '0 years ago', runtimeText0);
      expect(runtimeText0).assertEqual('0 years ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 years', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 years');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 years ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 years ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0 years', runtimeText3);
      expect(runtimeText3).assertEqual('in 0 years');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0009
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0009';
      const input: string = 'en-US; unit=year; value=1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'year';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 year', kitText0);
      expect(kitText0).assertEqual('in 1 year');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 years', kitText1);
      expect(kitText1).assertEqual('in 3 years');
      InterfaceTestLog.value(name, 'kit.format.2', '1 year ago', kitText2);
      expect(kitText2).assertEqual('1 year ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 years', kitText3);
      expect(kitText3).assertEqual('in 1.5 years');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 year', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 year');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 years', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 years');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 year ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 year ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 years', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 years');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0010
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0010';
      const input: string = 'en-US; unit=quarter; value=-2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'quarter';
      const probe0: number = -2;
      const probe1: number = 0;
      const probe2: number = -4;
      const probe3: number = -1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '2 quarters ago', kitText0);
      expect(kitText0).assertEqual('2 quarters ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'this quarter', kitText1);
      expect(kitText1).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'kit.format.2', '4 quarters ago', kitText2);
      expect(kitText2).assertEqual('4 quarters ago');
      InterfaceTestLog.value(name, 'kit.format.3', '1.5 quarters ago', kitText3);
      expect(kitText3).assertEqual('1.5 quarters ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '2 quarters ago', runtimeText0);
      expect(runtimeText0).assertEqual('2 quarters ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'this quarter', runtimeText1);
      expect(runtimeText1).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'runtime.format.2', '4 quarters ago', runtimeText2);
      expect(runtimeText2).assertEqual('4 quarters ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '1.5 quarters ago', runtimeText3);
      expect(runtimeText3).assertEqual('1.5 quarters ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0011
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0011';
      const input: string = 'en-US; unit=quarter; value=-1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'quarter';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'last quarter', kitText0);
      expect(kitText0).assertEqual('last quarter');
      InterfaceTestLog.value(name, 'kit.format.1', 'next quarter', kitText1);
      expect(kitText1).assertEqual('next quarter');
      InterfaceTestLog.value(name, 'kit.format.2', '3 quarters ago', kitText2);
      expect(kitText2).assertEqual('3 quarters ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 quarters ago', kitText3);
      expect(kitText3).assertEqual('0.5 quarters ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'last quarter', runtimeText0);
      expect(runtimeText0).assertEqual('last quarter');
      InterfaceTestLog.value(name, 'runtime.format.1', 'next quarter', runtimeText1);
      expect(runtimeText1).assertEqual('next quarter');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 quarters ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 quarters ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 quarters ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 quarters ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0012
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0012';
      const input: string = 'en-US; unit=quarter; value=-0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'quarter';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this quarter', kitText0);
      expect(kitText0).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 quarters', kitText1);
      expect(kitText1).assertEqual('in 2 quarters');
      InterfaceTestLog.value(name, 'kit.format.2', '2 quarters ago', kitText2);
      expect(kitText2).assertEqual('2 quarters ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'this quarter', kitText3);
      expect(kitText3).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this quarter', runtimeText0);
      expect(runtimeText0).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 quarters', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 quarters');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 quarters ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 quarters ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'this quarter', runtimeText3);
      expect(runtimeText3).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0013
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0013';
      const input: string = 'en-US; unit=quarter; value=0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'quarter';
      const probe0: number = 0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this quarter', kitText0);
      expect(kitText0).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 quarters', kitText1);
      expect(kitText1).assertEqual('in 2 quarters');
      InterfaceTestLog.value(name, 'kit.format.2', '2 quarters ago', kitText2);
      expect(kitText2).assertEqual('2 quarters ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0.5 quarters', kitText3);
      expect(kitText3).assertEqual('in 0.5 quarters');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this quarter', runtimeText0);
      expect(runtimeText0).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 quarters', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 quarters');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 quarters ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 quarters ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0.5 quarters', runtimeText3);
      expect(runtimeText3).assertEqual('in 0.5 quarters');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0014
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0014';
      const input: string = 'en-US; unit=quarter; value=1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'quarter';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'next quarter', kitText0);
      expect(kitText0).assertEqual('next quarter');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 quarters', kitText1);
      expect(kitText1).assertEqual('in 3 quarters');
      InterfaceTestLog.value(name, 'kit.format.2', 'last quarter', kitText2);
      expect(kitText2).assertEqual('last quarter');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 quarters', kitText3);
      expect(kitText3).assertEqual('in 1.5 quarters');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'next quarter', runtimeText0);
      expect(runtimeText0).assertEqual('next quarter');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 quarters', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 quarters');
      InterfaceTestLog.value(name, 'runtime.format.2', 'last quarter', runtimeText2);
      expect(runtimeText2).assertEqual('last quarter');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 quarters', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 quarters');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0015
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0015';
      const input: string = 'en-US; unit=quarter; value=2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'quarter';
      const probe0: number = 2;
      const probe1: number = 4;
      const probe2: number = 0;
      const probe3: number = 2.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 2 quarters', kitText0);
      expect(kitText0).assertEqual('in 2 quarters');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 4 quarters', kitText1);
      expect(kitText1).assertEqual('in 4 quarters');
      InterfaceTestLog.value(name, 'kit.format.2', 'this quarter', kitText2);
      expect(kitText2).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 2.5 quarters', kitText3);
      expect(kitText3).assertEqual('in 2.5 quarters');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 2 quarters', runtimeText0);
      expect(runtimeText0).assertEqual('in 2 quarters');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 4 quarters', runtimeText1);
      expect(runtimeText1).assertEqual('in 4 quarters');
      InterfaceTestLog.value(name, 'runtime.format.2', 'this quarter', runtimeText2);
      expect(runtimeText2).assertEqual('this quarter');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 2.5 quarters', runtimeText3);
      expect(runtimeText3).assertEqual('in 2.5 quarters');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0016
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0016';
      const input: string = 'en-US; unit=quarter; value=-1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'quarter';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 quarter ago', kitText0);
      expect(kitText0).assertEqual('1 quarter ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 quarter', kitText1);
      expect(kitText1).assertEqual('in 1 quarter');
      InterfaceTestLog.value(name, 'kit.format.2', '3 quarters ago', kitText2);
      expect(kitText2).assertEqual('3 quarters ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 quarters ago', kitText3);
      expect(kitText3).assertEqual('0.5 quarters ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 quarter ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 quarter ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 quarter', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 quarter');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 quarters ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 quarters ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 quarters ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 quarters ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0017
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0017';
      const input: string = 'en-US; unit=quarter; value=-0; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'quarter';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '0 quarters ago', kitText0);
      expect(kitText0).assertEqual('0 quarters ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 quarters', kitText1);
      expect(kitText1).assertEqual('in 2 quarters');
      InterfaceTestLog.value(name, 'kit.format.2', '2 quarters ago', kitText2);
      expect(kitText2).assertEqual('2 quarters ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0 quarters', kitText3);
      expect(kitText3).assertEqual('in 0 quarters');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '0 quarters ago', runtimeText0);
      expect(runtimeText0).assertEqual('0 quarters ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 quarters', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 quarters');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 quarters ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 quarters ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0 quarters', runtimeText3);
      expect(runtimeText3).assertEqual('in 0 quarters');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0018
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0018';
      const input: string = 'en-US; unit=quarter; value=1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'quarter';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 quarter', kitText0);
      expect(kitText0).assertEqual('in 1 quarter');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 quarters', kitText1);
      expect(kitText1).assertEqual('in 3 quarters');
      InterfaceTestLog.value(name, 'kit.format.2', '1 quarter ago', kitText2);
      expect(kitText2).assertEqual('1 quarter ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 quarters', kitText3);
      expect(kitText3).assertEqual('in 1.5 quarters');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 quarter', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 quarter');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 quarters', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 quarters');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 quarter ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 quarter ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 quarters', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 quarters');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0019
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0019';
      const input: string = 'en-US; unit=month; value=-2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'month';
      const probe0: number = -2;
      const probe1: number = 0;
      const probe2: number = -4;
      const probe3: number = -1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '2 months ago', kitText0);
      expect(kitText0).assertEqual('2 months ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'this month', kitText1);
      expect(kitText1).assertEqual('this month');
      InterfaceTestLog.value(name, 'kit.format.2', '4 months ago', kitText2);
      expect(kitText2).assertEqual('4 months ago');
      InterfaceTestLog.value(name, 'kit.format.3', '1.5 months ago', kitText3);
      expect(kitText3).assertEqual('1.5 months ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '2 months ago', runtimeText0);
      expect(runtimeText0).assertEqual('2 months ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'this month', runtimeText1);
      expect(runtimeText1).assertEqual('this month');
      InterfaceTestLog.value(name, 'runtime.format.2', '4 months ago', runtimeText2);
      expect(runtimeText2).assertEqual('4 months ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '1.5 months ago', runtimeText3);
      expect(runtimeText3).assertEqual('1.5 months ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0020
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0020';
      const input: string = 'en-US; unit=month; value=-1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'month';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'last month', kitText0);
      expect(kitText0).assertEqual('last month');
      InterfaceTestLog.value(name, 'kit.format.1', 'next month', kitText1);
      expect(kitText1).assertEqual('next month');
      InterfaceTestLog.value(name, 'kit.format.2', '3 months ago', kitText2);
      expect(kitText2).assertEqual('3 months ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 months ago', kitText3);
      expect(kitText3).assertEqual('0.5 months ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'last month', runtimeText0);
      expect(runtimeText0).assertEqual('last month');
      InterfaceTestLog.value(name, 'runtime.format.1', 'next month', runtimeText1);
      expect(runtimeText1).assertEqual('next month');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 months ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 months ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 months ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 months ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0021
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0021';
      const input: string = 'en-US; unit=month; value=-0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'month';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this month', kitText0);
      expect(kitText0).assertEqual('this month');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 months', kitText1);
      expect(kitText1).assertEqual('in 2 months');
      InterfaceTestLog.value(name, 'kit.format.2', '2 months ago', kitText2);
      expect(kitText2).assertEqual('2 months ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'this month', kitText3);
      expect(kitText3).assertEqual('this month');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this month', runtimeText0);
      expect(runtimeText0).assertEqual('this month');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 months', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 months');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 months ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 months ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'this month', runtimeText3);
      expect(runtimeText3).assertEqual('this month');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0022
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0022';
      const input: string = 'en-US; unit=month; value=0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'month';
      const probe0: number = 0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this month', kitText0);
      expect(kitText0).assertEqual('this month');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 months', kitText1);
      expect(kitText1).assertEqual('in 2 months');
      InterfaceTestLog.value(name, 'kit.format.2', '2 months ago', kitText2);
      expect(kitText2).assertEqual('2 months ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0.5 months', kitText3);
      expect(kitText3).assertEqual('in 0.5 months');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this month', runtimeText0);
      expect(runtimeText0).assertEqual('this month');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 months', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 months');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 months ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 months ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0.5 months', runtimeText3);
      expect(runtimeText3).assertEqual('in 0.5 months');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0023
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0023';
      const input: string = 'en-US; unit=month; value=1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'month';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'next month', kitText0);
      expect(kitText0).assertEqual('next month');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 months', kitText1);
      expect(kitText1).assertEqual('in 3 months');
      InterfaceTestLog.value(name, 'kit.format.2', 'last month', kitText2);
      expect(kitText2).assertEqual('last month');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 months', kitText3);
      expect(kitText3).assertEqual('in 1.5 months');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'next month', runtimeText0);
      expect(runtimeText0).assertEqual('next month');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 months', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 months');
      InterfaceTestLog.value(name, 'runtime.format.2', 'last month', runtimeText2);
      expect(runtimeText2).assertEqual('last month');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 months', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 months');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0024
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0024';
      const input: string = 'en-US; unit=month; value=2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'month';
      const probe0: number = 2;
      const probe1: number = 4;
      const probe2: number = 0;
      const probe3: number = 2.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 2 months', kitText0);
      expect(kitText0).assertEqual('in 2 months');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 4 months', kitText1);
      expect(kitText1).assertEqual('in 4 months');
      InterfaceTestLog.value(name, 'kit.format.2', 'this month', kitText2);
      expect(kitText2).assertEqual('this month');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 2.5 months', kitText3);
      expect(kitText3).assertEqual('in 2.5 months');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 2 months', runtimeText0);
      expect(runtimeText0).assertEqual('in 2 months');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 4 months', runtimeText1);
      expect(runtimeText1).assertEqual('in 4 months');
      InterfaceTestLog.value(name, 'runtime.format.2', 'this month', runtimeText2);
      expect(runtimeText2).assertEqual('this month');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 2.5 months', runtimeText3);
      expect(runtimeText3).assertEqual('in 2.5 months');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0025
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0025
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0025';
      const input: string = 'en-US; unit=month; value=-1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'month';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 month ago', kitText0);
      expect(kitText0).assertEqual('1 month ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 month', kitText1);
      expect(kitText1).assertEqual('in 1 month');
      InterfaceTestLog.value(name, 'kit.format.2', '3 months ago', kitText2);
      expect(kitText2).assertEqual('3 months ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 months ago', kitText3);
      expect(kitText3).assertEqual('0.5 months ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 month ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 month ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 month', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 month');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 months ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 months ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 months ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 months ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0026
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0026
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0026';
      const input: string = 'en-US; unit=month; value=-0; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'month';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '0 months ago', kitText0);
      expect(kitText0).assertEqual('0 months ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 months', kitText1);
      expect(kitText1).assertEqual('in 2 months');
      InterfaceTestLog.value(name, 'kit.format.2', '2 months ago', kitText2);
      expect(kitText2).assertEqual('2 months ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0 months', kitText3);
      expect(kitText3).assertEqual('in 0 months');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '0 months ago', runtimeText0);
      expect(runtimeText0).assertEqual('0 months ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 months', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 months');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 months ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 months ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0 months', runtimeText3);
      expect(runtimeText3).assertEqual('in 0 months');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0027
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0027
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0027';
      const input: string = 'en-US; unit=month; value=1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'month';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 month', kitText0);
      expect(kitText0).assertEqual('in 1 month');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 months', kitText1);
      expect(kitText1).assertEqual('in 3 months');
      InterfaceTestLog.value(name, 'kit.format.2', '1 month ago', kitText2);
      expect(kitText2).assertEqual('1 month ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 months', kitText3);
      expect(kitText3).assertEqual('in 1.5 months');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 month', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 month');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 months', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 months');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 month ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 month ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 months', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 months');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0028
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0028
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0028';
      const input: string = 'en-US; unit=week; value=-2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'week';
      const probe0: number = -2;
      const probe1: number = 0;
      const probe2: number = -4;
      const probe3: number = -1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '2 weeks ago', kitText0);
      expect(kitText0).assertEqual('2 weeks ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'this week', kitText1);
      expect(kitText1).assertEqual('this week');
      InterfaceTestLog.value(name, 'kit.format.2', '4 weeks ago', kitText2);
      expect(kitText2).assertEqual('4 weeks ago');
      InterfaceTestLog.value(name, 'kit.format.3', '1.5 weeks ago', kitText3);
      expect(kitText3).assertEqual('1.5 weeks ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '2 weeks ago', runtimeText0);
      expect(runtimeText0).assertEqual('2 weeks ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'this week', runtimeText1);
      expect(runtimeText1).assertEqual('this week');
      InterfaceTestLog.value(name, 'runtime.format.2', '4 weeks ago', runtimeText2);
      expect(runtimeText2).assertEqual('4 weeks ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '1.5 weeks ago', runtimeText3);
      expect(runtimeText3).assertEqual('1.5 weeks ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0029
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0029
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0029';
      const input: string = 'en-US; unit=week; value=-1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'week';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'last week', kitText0);
      expect(kitText0).assertEqual('last week');
      InterfaceTestLog.value(name, 'kit.format.1', 'next week', kitText1);
      expect(kitText1).assertEqual('next week');
      InterfaceTestLog.value(name, 'kit.format.2', '3 weeks ago', kitText2);
      expect(kitText2).assertEqual('3 weeks ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 weeks ago', kitText3);
      expect(kitText3).assertEqual('0.5 weeks ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'last week', runtimeText0);
      expect(runtimeText0).assertEqual('last week');
      InterfaceTestLog.value(name, 'runtime.format.1', 'next week', runtimeText1);
      expect(runtimeText1).assertEqual('next week');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 weeks ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 weeks ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 weeks ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 weeks ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0030
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0030
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0030';
      const input: string = 'en-US; unit=week; value=-0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'week';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this week', kitText0);
      expect(kitText0).assertEqual('this week');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 weeks', kitText1);
      expect(kitText1).assertEqual('in 2 weeks');
      InterfaceTestLog.value(name, 'kit.format.2', '2 weeks ago', kitText2);
      expect(kitText2).assertEqual('2 weeks ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'this week', kitText3);
      expect(kitText3).assertEqual('this week');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this week', runtimeText0);
      expect(runtimeText0).assertEqual('this week');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 weeks', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 weeks');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 weeks ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 weeks ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'this week', runtimeText3);
      expect(runtimeText3).assertEqual('this week');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0031
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0031
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0031';
      const input: string = 'en-US; unit=week; value=0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'week';
      const probe0: number = 0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this week', kitText0);
      expect(kitText0).assertEqual('this week');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 weeks', kitText1);
      expect(kitText1).assertEqual('in 2 weeks');
      InterfaceTestLog.value(name, 'kit.format.2', '2 weeks ago', kitText2);
      expect(kitText2).assertEqual('2 weeks ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0.5 weeks', kitText3);
      expect(kitText3).assertEqual('in 0.5 weeks');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this week', runtimeText0);
      expect(runtimeText0).assertEqual('this week');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 weeks', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 weeks');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 weeks ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 weeks ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0.5 weeks', runtimeText3);
      expect(runtimeText3).assertEqual('in 0.5 weeks');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0032
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0032
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0032';
      const input: string = 'en-US; unit=week; value=1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'week';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'next week', kitText0);
      expect(kitText0).assertEqual('next week');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 weeks', kitText1);
      expect(kitText1).assertEqual('in 3 weeks');
      InterfaceTestLog.value(name, 'kit.format.2', 'last week', kitText2);
      expect(kitText2).assertEqual('last week');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 weeks', kitText3);
      expect(kitText3).assertEqual('in 1.5 weeks');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'next week', runtimeText0);
      expect(runtimeText0).assertEqual('next week');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 weeks', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 weeks');
      InterfaceTestLog.value(name, 'runtime.format.2', 'last week', runtimeText2);
      expect(runtimeText2).assertEqual('last week');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 weeks', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 weeks');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0033
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0033
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0033';
      const input: string = 'en-US; unit=week; value=2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'week';
      const probe0: number = 2;
      const probe1: number = 4;
      const probe2: number = 0;
      const probe3: number = 2.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 2 weeks', kitText0);
      expect(kitText0).assertEqual('in 2 weeks');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 4 weeks', kitText1);
      expect(kitText1).assertEqual('in 4 weeks');
      InterfaceTestLog.value(name, 'kit.format.2', 'this week', kitText2);
      expect(kitText2).assertEqual('this week');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 2.5 weeks', kitText3);
      expect(kitText3).assertEqual('in 2.5 weeks');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 2 weeks', runtimeText0);
      expect(runtimeText0).assertEqual('in 2 weeks');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 4 weeks', runtimeText1);
      expect(runtimeText1).assertEqual('in 4 weeks');
      InterfaceTestLog.value(name, 'runtime.format.2', 'this week', runtimeText2);
      expect(runtimeText2).assertEqual('this week');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 2.5 weeks', runtimeText3);
      expect(runtimeText3).assertEqual('in 2.5 weeks');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0034
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0034
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0034';
      const input: string = 'en-US; unit=week; value=-1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'week';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 week ago', kitText0);
      expect(kitText0).assertEqual('1 week ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 week', kitText1);
      expect(kitText1).assertEqual('in 1 week');
      InterfaceTestLog.value(name, 'kit.format.2', '3 weeks ago', kitText2);
      expect(kitText2).assertEqual('3 weeks ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 weeks ago', kitText3);
      expect(kitText3).assertEqual('0.5 weeks ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 week ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 week ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 week', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 week');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 weeks ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 weeks ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 weeks ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 weeks ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0035
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0035
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0035';
      const input: string = 'en-US; unit=week; value=-0; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'week';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '0 weeks ago', kitText0);
      expect(kitText0).assertEqual('0 weeks ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 weeks', kitText1);
      expect(kitText1).assertEqual('in 2 weeks');
      InterfaceTestLog.value(name, 'kit.format.2', '2 weeks ago', kitText2);
      expect(kitText2).assertEqual('2 weeks ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0 weeks', kitText3);
      expect(kitText3).assertEqual('in 0 weeks');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '0 weeks ago', runtimeText0);
      expect(runtimeText0).assertEqual('0 weeks ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 weeks', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 weeks');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 weeks ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 weeks ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0 weeks', runtimeText3);
      expect(runtimeText3).assertEqual('in 0 weeks');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0036
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0036
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0036';
      const input: string = 'en-US; unit=week; value=1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'week';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 week', kitText0);
      expect(kitText0).assertEqual('in 1 week');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 weeks', kitText1);
      expect(kitText1).assertEqual('in 3 weeks');
      InterfaceTestLog.value(name, 'kit.format.2', '1 week ago', kitText2);
      expect(kitText2).assertEqual('1 week ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 weeks', kitText3);
      expect(kitText3).assertEqual('in 1.5 weeks');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 week', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 week');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 weeks', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 weeks');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 week ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 week ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 weeks', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 weeks');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0037
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0037
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0037';
      const input: string = 'en-US; unit=day; value=-2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'day';
      const probe0: number = -2;
      const probe1: number = 0;
      const probe2: number = -4;
      const probe3: number = -1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '2 days ago', kitText0);
      expect(kitText0).assertEqual('2 days ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'today', kitText1);
      expect(kitText1).assertEqual('today');
      InterfaceTestLog.value(name, 'kit.format.2', '4 days ago', kitText2);
      expect(kitText2).assertEqual('4 days ago');
      InterfaceTestLog.value(name, 'kit.format.3', '1.5 days ago', kitText3);
      expect(kitText3).assertEqual('1.5 days ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '2 days ago', runtimeText0);
      expect(runtimeText0).assertEqual('2 days ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'today', runtimeText1);
      expect(runtimeText1).assertEqual('today');
      InterfaceTestLog.value(name, 'runtime.format.2', '4 days ago', runtimeText2);
      expect(runtimeText2).assertEqual('4 days ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '1.5 days ago', runtimeText3);
      expect(runtimeText3).assertEqual('1.5 days ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0038
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0038
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0038';
      const input: string = 'en-US; unit=day; value=-1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'day';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'yesterday', kitText0);
      expect(kitText0).assertEqual('yesterday');
      InterfaceTestLog.value(name, 'kit.format.1', 'tomorrow', kitText1);
      expect(kitText1).assertEqual('tomorrow');
      InterfaceTestLog.value(name, 'kit.format.2', '3 days ago', kitText2);
      expect(kitText2).assertEqual('3 days ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 days ago', kitText3);
      expect(kitText3).assertEqual('0.5 days ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'yesterday', runtimeText0);
      expect(runtimeText0).assertEqual('yesterday');
      InterfaceTestLog.value(name, 'runtime.format.1', 'tomorrow', runtimeText1);
      expect(runtimeText1).assertEqual('tomorrow');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 days ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 days ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 days ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 days ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0039
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0039
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0039';
      const input: string = 'en-US; unit=day; value=-0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'day';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'today', kitText0);
      expect(kitText0).assertEqual('today');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 days', kitText1);
      expect(kitText1).assertEqual('in 2 days');
      InterfaceTestLog.value(name, 'kit.format.2', '2 days ago', kitText2);
      expect(kitText2).assertEqual('2 days ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'today', kitText3);
      expect(kitText3).assertEqual('today');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'today', runtimeText0);
      expect(runtimeText0).assertEqual('today');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 days', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 days');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 days ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 days ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'today', runtimeText3);
      expect(runtimeText3).assertEqual('today');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0040
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0040
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0040';
      const input: string = 'en-US; unit=day; value=0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'day';
      const probe0: number = 0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'today', kitText0);
      expect(kitText0).assertEqual('today');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 days', kitText1);
      expect(kitText1).assertEqual('in 2 days');
      InterfaceTestLog.value(name, 'kit.format.2', '2 days ago', kitText2);
      expect(kitText2).assertEqual('2 days ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0.5 days', kitText3);
      expect(kitText3).assertEqual('in 0.5 days');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'today', runtimeText0);
      expect(runtimeText0).assertEqual('today');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 days', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 days');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 days ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 days ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0.5 days', runtimeText3);
      expect(runtimeText3).assertEqual('in 0.5 days');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0041
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0041
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0041';
      const input: string = 'en-US; unit=day; value=1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'day';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'tomorrow', kitText0);
      expect(kitText0).assertEqual('tomorrow');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 days', kitText1);
      expect(kitText1).assertEqual('in 3 days');
      InterfaceTestLog.value(name, 'kit.format.2', 'yesterday', kitText2);
      expect(kitText2).assertEqual('yesterday');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 days', kitText3);
      expect(kitText3).assertEqual('in 1.5 days');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'tomorrow', runtimeText0);
      expect(runtimeText0).assertEqual('tomorrow');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 days', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 days');
      InterfaceTestLog.value(name, 'runtime.format.2', 'yesterday', runtimeText2);
      expect(runtimeText2).assertEqual('yesterday');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 days', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 days');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0042
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0042
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0042';
      const input: string = 'en-US; unit=day; value=2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'day';
      const probe0: number = 2;
      const probe1: number = 4;
      const probe2: number = 0;
      const probe3: number = 2.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 2 days', kitText0);
      expect(kitText0).assertEqual('in 2 days');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 4 days', kitText1);
      expect(kitText1).assertEqual('in 4 days');
      InterfaceTestLog.value(name, 'kit.format.2', 'today', kitText2);
      expect(kitText2).assertEqual('today');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 2.5 days', kitText3);
      expect(kitText3).assertEqual('in 2.5 days');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 2 days', runtimeText0);
      expect(runtimeText0).assertEqual('in 2 days');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 4 days', runtimeText1);
      expect(runtimeText1).assertEqual('in 4 days');
      InterfaceTestLog.value(name, 'runtime.format.2', 'today', runtimeText2);
      expect(runtimeText2).assertEqual('today');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 2.5 days', runtimeText3);
      expect(runtimeText3).assertEqual('in 2.5 days');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0043
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0043
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0043';
      const input: string = 'en-US; unit=day; value=-1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'day';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 day ago', kitText0);
      expect(kitText0).assertEqual('1 day ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 day', kitText1);
      expect(kitText1).assertEqual('in 1 day');
      InterfaceTestLog.value(name, 'kit.format.2', '3 days ago', kitText2);
      expect(kitText2).assertEqual('3 days ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 days ago', kitText3);
      expect(kitText3).assertEqual('0.5 days ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 day ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 day ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 day', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 day');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 days ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 days ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 days ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 days ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0044
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0044
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0044';
      const input: string = 'en-US; unit=day; value=-0; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'day';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '0 days ago', kitText0);
      expect(kitText0).assertEqual('0 days ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 days', kitText1);
      expect(kitText1).assertEqual('in 2 days');
      InterfaceTestLog.value(name, 'kit.format.2', '2 days ago', kitText2);
      expect(kitText2).assertEqual('2 days ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0 days', kitText3);
      expect(kitText3).assertEqual('in 0 days');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '0 days ago', runtimeText0);
      expect(runtimeText0).assertEqual('0 days ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 days', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 days');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 days ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 days ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0 days', runtimeText3);
      expect(runtimeText3).assertEqual('in 0 days');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0045
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0045
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0045';
      const input: string = 'en-US; unit=day; value=1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'day';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 day', kitText0);
      expect(kitText0).assertEqual('in 1 day');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 days', kitText1);
      expect(kitText1).assertEqual('in 3 days');
      InterfaceTestLog.value(name, 'kit.format.2', '1 day ago', kitText2);
      expect(kitText2).assertEqual('1 day ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 days', kitText3);
      expect(kitText3).assertEqual('in 1.5 days');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 day', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 day');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 days', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 days');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 day ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 day ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 days', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 days');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0046
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0046
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0046';
      const input: string = 'en-US; unit=hour; value=-2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'hour';
      const probe0: number = -2;
      const probe1: number = 0;
      const probe2: number = -4;
      const probe3: number = -1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '2 hours ago', kitText0);
      expect(kitText0).assertEqual('2 hours ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'this hour', kitText1);
      expect(kitText1).assertEqual('this hour');
      InterfaceTestLog.value(name, 'kit.format.2', '4 hours ago', kitText2);
      expect(kitText2).assertEqual('4 hours ago');
      InterfaceTestLog.value(name, 'kit.format.3', '1.5 hours ago', kitText3);
      expect(kitText3).assertEqual('1.5 hours ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '2 hours ago', runtimeText0);
      expect(runtimeText0).assertEqual('2 hours ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'this hour', runtimeText1);
      expect(runtimeText1).assertEqual('this hour');
      InterfaceTestLog.value(name, 'runtime.format.2', '4 hours ago', runtimeText2);
      expect(runtimeText2).assertEqual('4 hours ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '1.5 hours ago', runtimeText3);
      expect(runtimeText3).assertEqual('1.5 hours ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0047
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0047
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0047';
      const input: string = 'en-US; unit=hour; value=-1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'hour';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 hour ago', kitText0);
      expect(kitText0).assertEqual('1 hour ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 hour', kitText1);
      expect(kitText1).assertEqual('in 1 hour');
      InterfaceTestLog.value(name, 'kit.format.2', '3 hours ago', kitText2);
      expect(kitText2).assertEqual('3 hours ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 hours ago', kitText3);
      expect(kitText3).assertEqual('0.5 hours ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 hour ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 hour ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 hour', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 hour');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 hours ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 hours ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 hours ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 hours ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0048
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0048
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0048';
      const input: string = 'en-US; unit=hour; value=-0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'hour';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this hour', kitText0);
      expect(kitText0).assertEqual('this hour');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 hours', kitText1);
      expect(kitText1).assertEqual('in 2 hours');
      InterfaceTestLog.value(name, 'kit.format.2', '2 hours ago', kitText2);
      expect(kitText2).assertEqual('2 hours ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'this hour', kitText3);
      expect(kitText3).assertEqual('this hour');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this hour', runtimeText0);
      expect(runtimeText0).assertEqual('this hour');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 hours', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 hours');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 hours ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 hours ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'this hour', runtimeText3);
      expect(runtimeText3).assertEqual('this hour');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0049
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0049
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0049';
      const input: string = 'en-US; unit=hour; value=0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'hour';
      const probe0: number = 0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this hour', kitText0);
      expect(kitText0).assertEqual('this hour');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 hours', kitText1);
      expect(kitText1).assertEqual('in 2 hours');
      InterfaceTestLog.value(name, 'kit.format.2', '2 hours ago', kitText2);
      expect(kitText2).assertEqual('2 hours ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0.5 hours', kitText3);
      expect(kitText3).assertEqual('in 0.5 hours');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this hour', runtimeText0);
      expect(runtimeText0).assertEqual('this hour');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 hours', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 hours');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 hours ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 hours ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0.5 hours', runtimeText3);
      expect(runtimeText3).assertEqual('in 0.5 hours');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0050
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0050
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0050';
      const input: string = 'en-US; unit=hour; value=1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'hour';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 hour', kitText0);
      expect(kitText0).assertEqual('in 1 hour');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 hours', kitText1);
      expect(kitText1).assertEqual('in 3 hours');
      InterfaceTestLog.value(name, 'kit.format.2', '1 hour ago', kitText2);
      expect(kitText2).assertEqual('1 hour ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 hours', kitText3);
      expect(kitText3).assertEqual('in 1.5 hours');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 hour', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 hour');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 hours', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 hours');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 hour ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 hour ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 hours', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 hours');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0051
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0051
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0051';
      const input: string = 'en-US; unit=hour; value=2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'hour';
      const probe0: number = 2;
      const probe1: number = 4;
      const probe2: number = 0;
      const probe3: number = 2.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 2 hours', kitText0);
      expect(kitText0).assertEqual('in 2 hours');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 4 hours', kitText1);
      expect(kitText1).assertEqual('in 4 hours');
      InterfaceTestLog.value(name, 'kit.format.2', 'this hour', kitText2);
      expect(kitText2).assertEqual('this hour');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 2.5 hours', kitText3);
      expect(kitText3).assertEqual('in 2.5 hours');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 2 hours', runtimeText0);
      expect(runtimeText0).assertEqual('in 2 hours');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 4 hours', runtimeText1);
      expect(runtimeText1).assertEqual('in 4 hours');
      InterfaceTestLog.value(name, 'runtime.format.2', 'this hour', runtimeText2);
      expect(runtimeText2).assertEqual('this hour');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 2.5 hours', runtimeText3);
      expect(runtimeText3).assertEqual('in 2.5 hours');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0052
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0052
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0052';
      const input: string = 'en-US; unit=hour; value=-1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'hour';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 hour ago', kitText0);
      expect(kitText0).assertEqual('1 hour ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 hour', kitText1);
      expect(kitText1).assertEqual('in 1 hour');
      InterfaceTestLog.value(name, 'kit.format.2', '3 hours ago', kitText2);
      expect(kitText2).assertEqual('3 hours ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 hours ago', kitText3);
      expect(kitText3).assertEqual('0.5 hours ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 hour ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 hour ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 hour', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 hour');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 hours ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 hours ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 hours ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 hours ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0053
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0053
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0053';
      const input: string = 'en-US; unit=hour; value=-0; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'hour';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '0 hours ago', kitText0);
      expect(kitText0).assertEqual('0 hours ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 hours', kitText1);
      expect(kitText1).assertEqual('in 2 hours');
      InterfaceTestLog.value(name, 'kit.format.2', '2 hours ago', kitText2);
      expect(kitText2).assertEqual('2 hours ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0 hours', kitText3);
      expect(kitText3).assertEqual('in 0 hours');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '0 hours ago', runtimeText0);
      expect(runtimeText0).assertEqual('0 hours ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 hours', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 hours');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 hours ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 hours ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0 hours', runtimeText3);
      expect(runtimeText3).assertEqual('in 0 hours');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0054
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0054
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0054';
      const input: string = 'en-US; unit=hour; value=1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'hour';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 hour', kitText0);
      expect(kitText0).assertEqual('in 1 hour');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 hours', kitText1);
      expect(kitText1).assertEqual('in 3 hours');
      InterfaceTestLog.value(name, 'kit.format.2', '1 hour ago', kitText2);
      expect(kitText2).assertEqual('1 hour ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 hours', kitText3);
      expect(kitText3).assertEqual('in 1.5 hours');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 hour', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 hour');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 hours', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 hours');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 hour ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 hour ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 hours', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 hours');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0055
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0055
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0055';
      const input: string = 'en-US; unit=minute; value=-2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'minute';
      const probe0: number = -2;
      const probe1: number = 0;
      const probe2: number = -4;
      const probe3: number = -1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '2 minutes ago', kitText0);
      expect(kitText0).assertEqual('2 minutes ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'this minute', kitText1);
      expect(kitText1).assertEqual('this minute');
      InterfaceTestLog.value(name, 'kit.format.2', '4 minutes ago', kitText2);
      expect(kitText2).assertEqual('4 minutes ago');
      InterfaceTestLog.value(name, 'kit.format.3', '1.5 minutes ago', kitText3);
      expect(kitText3).assertEqual('1.5 minutes ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '2 minutes ago', runtimeText0);
      expect(runtimeText0).assertEqual('2 minutes ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'this minute', runtimeText1);
      expect(runtimeText1).assertEqual('this minute');
      InterfaceTestLog.value(name, 'runtime.format.2', '4 minutes ago', runtimeText2);
      expect(runtimeText2).assertEqual('4 minutes ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '1.5 minutes ago', runtimeText3);
      expect(runtimeText3).assertEqual('1.5 minutes ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0056
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0056
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0056';
      const input: string = 'en-US; unit=minute; value=-1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'minute';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 minute ago', kitText0);
      expect(kitText0).assertEqual('1 minute ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 minute', kitText1);
      expect(kitText1).assertEqual('in 1 minute');
      InterfaceTestLog.value(name, 'kit.format.2', '3 minutes ago', kitText2);
      expect(kitText2).assertEqual('3 minutes ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 minutes ago', kitText3);
      expect(kitText3).assertEqual('0.5 minutes ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 minute ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 minute ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 minute', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 minute');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 minutes ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 minutes ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 minutes ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 minutes ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0057
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0057
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0057';
      const input: string = 'en-US; unit=minute; value=-0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'minute';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this minute', kitText0);
      expect(kitText0).assertEqual('this minute');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 minutes', kitText1);
      expect(kitText1).assertEqual('in 2 minutes');
      InterfaceTestLog.value(name, 'kit.format.2', '2 minutes ago', kitText2);
      expect(kitText2).assertEqual('2 minutes ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'this minute', kitText3);
      expect(kitText3).assertEqual('this minute');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this minute', runtimeText0);
      expect(runtimeText0).assertEqual('this minute');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 minutes', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 minutes');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 minutes ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 minutes ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'this minute', runtimeText3);
      expect(runtimeText3).assertEqual('this minute');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0058
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0058
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0058';
      const input: string = 'en-US; unit=minute; value=0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'minute';
      const probe0: number = 0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'this minute', kitText0);
      expect(kitText0).assertEqual('this minute');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 minutes', kitText1);
      expect(kitText1).assertEqual('in 2 minutes');
      InterfaceTestLog.value(name, 'kit.format.2', '2 minutes ago', kitText2);
      expect(kitText2).assertEqual('2 minutes ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0.5 minutes', kitText3);
      expect(kitText3).assertEqual('in 0.5 minutes');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'this minute', runtimeText0);
      expect(runtimeText0).assertEqual('this minute');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 minutes', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 minutes');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 minutes ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 minutes ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0.5 minutes', runtimeText3);
      expect(runtimeText3).assertEqual('in 0.5 minutes');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0059
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0059
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0059';
      const input: string = 'en-US; unit=minute; value=1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'minute';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 minute', kitText0);
      expect(kitText0).assertEqual('in 1 minute');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 minutes', kitText1);
      expect(kitText1).assertEqual('in 3 minutes');
      InterfaceTestLog.value(name, 'kit.format.2', '1 minute ago', kitText2);
      expect(kitText2).assertEqual('1 minute ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 minutes', kitText3);
      expect(kitText3).assertEqual('in 1.5 minutes');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 minute', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 minute');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 minutes', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 minutes');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 minute ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 minute ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 minutes', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 minutes');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0060
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0060
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0060';
      const input: string = 'en-US; unit=minute; value=2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'minute';
      const probe0: number = 2;
      const probe1: number = 4;
      const probe2: number = 0;
      const probe3: number = 2.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 2 minutes', kitText0);
      expect(kitText0).assertEqual('in 2 minutes');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 4 minutes', kitText1);
      expect(kitText1).assertEqual('in 4 minutes');
      InterfaceTestLog.value(name, 'kit.format.2', 'this minute', kitText2);
      expect(kitText2).assertEqual('this minute');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 2.5 minutes', kitText3);
      expect(kitText3).assertEqual('in 2.5 minutes');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 2 minutes', runtimeText0);
      expect(runtimeText0).assertEqual('in 2 minutes');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 4 minutes', runtimeText1);
      expect(runtimeText1).assertEqual('in 4 minutes');
      InterfaceTestLog.value(name, 'runtime.format.2', 'this minute', runtimeText2);
      expect(runtimeText2).assertEqual('this minute');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 2.5 minutes', runtimeText3);
      expect(runtimeText3).assertEqual('in 2.5 minutes');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0061
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0061
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0061';
      const input: string = 'en-US; unit=minute; value=-1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'minute';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 minute ago', kitText0);
      expect(kitText0).assertEqual('1 minute ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 minute', kitText1);
      expect(kitText1).assertEqual('in 1 minute');
      InterfaceTestLog.value(name, 'kit.format.2', '3 minutes ago', kitText2);
      expect(kitText2).assertEqual('3 minutes ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 minutes ago', kitText3);
      expect(kitText3).assertEqual('0.5 minutes ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 minute ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 minute ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 minute', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 minute');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 minutes ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 minutes ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 minutes ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 minutes ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0062
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0062
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0062';
      const input: string = 'en-US; unit=minute; value=-0; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'minute';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '0 minutes ago', kitText0);
      expect(kitText0).assertEqual('0 minutes ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 minutes', kitText1);
      expect(kitText1).assertEqual('in 2 minutes');
      InterfaceTestLog.value(name, 'kit.format.2', '2 minutes ago', kitText2);
      expect(kitText2).assertEqual('2 minutes ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0 minutes', kitText3);
      expect(kitText3).assertEqual('in 0 minutes');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '0 minutes ago', runtimeText0);
      expect(runtimeText0).assertEqual('0 minutes ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 minutes', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 minutes');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 minutes ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 minutes ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0 minutes', runtimeText3);
      expect(runtimeText3).assertEqual('in 0 minutes');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0063
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0063
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0063';
      const input: string = 'en-US; unit=minute; value=1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'minute';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 minute', kitText0);
      expect(kitText0).assertEqual('in 1 minute');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 minutes', kitText1);
      expect(kitText1).assertEqual('in 3 minutes');
      InterfaceTestLog.value(name, 'kit.format.2', '1 minute ago', kitText2);
      expect(kitText2).assertEqual('1 minute ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 minutes', kitText3);
      expect(kitText3).assertEqual('in 1.5 minutes');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 minute', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 minute');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 minutes', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 minutes');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 minute ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 minute ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 minutes', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 minutes');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0064
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0064
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0064';
      const input: string = 'en-US; unit=second; value=-2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'second';
      const probe0: number = -2;
      const probe1: number = 0;
      const probe2: number = -4;
      const probe3: number = -1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '2 seconds ago', kitText0);
      expect(kitText0).assertEqual('2 seconds ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'now', kitText1);
      expect(kitText1).assertEqual('now');
      InterfaceTestLog.value(name, 'kit.format.2', '4 seconds ago', kitText2);
      expect(kitText2).assertEqual('4 seconds ago');
      InterfaceTestLog.value(name, 'kit.format.3', '1.5 seconds ago', kitText3);
      expect(kitText3).assertEqual('1.5 seconds ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '2 seconds ago', runtimeText0);
      expect(runtimeText0).assertEqual('2 seconds ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'now', runtimeText1);
      expect(runtimeText1).assertEqual('now');
      InterfaceTestLog.value(name, 'runtime.format.2', '4 seconds ago', runtimeText2);
      expect(runtimeText2).assertEqual('4 seconds ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '1.5 seconds ago', runtimeText3);
      expect(runtimeText3).assertEqual('1.5 seconds ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0065
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0065
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0065';
      const input: string = 'en-US; unit=second; value=-1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'second';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 second ago', kitText0);
      expect(kitText0).assertEqual('1 second ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 second', kitText1);
      expect(kitText1).assertEqual('in 1 second');
      InterfaceTestLog.value(name, 'kit.format.2', '3 seconds ago', kitText2);
      expect(kitText2).assertEqual('3 seconds ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 seconds ago', kitText3);
      expect(kitText3).assertEqual('0.5 seconds ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 second ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 second ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 second', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 second');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 seconds ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 seconds ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 seconds ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 seconds ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0066
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0066
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0066';
      const input: string = 'en-US; unit=second; value=-0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'second';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'now', kitText0);
      expect(kitText0).assertEqual('now');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 seconds', kitText1);
      expect(kitText1).assertEqual('in 2 seconds');
      InterfaceTestLog.value(name, 'kit.format.2', '2 seconds ago', kitText2);
      expect(kitText2).assertEqual('2 seconds ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'now', kitText3);
      expect(kitText3).assertEqual('now');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'now', runtimeText0);
      expect(runtimeText0).assertEqual('now');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 seconds', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 seconds');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 seconds ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 seconds ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'now', runtimeText3);
      expect(runtimeText3).assertEqual('now');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0067
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0067
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0067';
      const input: string = 'en-US; unit=second; value=0; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'second';
      const probe0: number = 0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'now', kitText0);
      expect(kitText0).assertEqual('now');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 seconds', kitText1);
      expect(kitText1).assertEqual('in 2 seconds');
      InterfaceTestLog.value(name, 'kit.format.2', '2 seconds ago', kitText2);
      expect(kitText2).assertEqual('2 seconds ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0.5 seconds', kitText3);
      expect(kitText3).assertEqual('in 0.5 seconds');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'now', runtimeText0);
      expect(runtimeText0).assertEqual('now');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 seconds', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 seconds');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 seconds ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 seconds ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0.5 seconds', runtimeText3);
      expect(runtimeText3).assertEqual('in 0.5 seconds');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0068
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0068
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0068';
      const input: string = 'en-US; unit=second; value=1; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'second';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 second', kitText0);
      expect(kitText0).assertEqual('in 1 second');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 seconds', kitText1);
      expect(kitText1).assertEqual('in 3 seconds');
      InterfaceTestLog.value(name, 'kit.format.2', '1 second ago', kitText2);
      expect(kitText2).assertEqual('1 second ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 seconds', kitText3);
      expect(kitText3).assertEqual('in 1.5 seconds');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 second', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 second');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 seconds', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 seconds');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 second ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 second ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 seconds', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 seconds');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0069
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0069
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0069';
      const input: string = 'en-US; unit=second; value=2; numeric=auto; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'auto', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"auto","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'second';
      const probe0: number = 2;
      const probe1: number = 4;
      const probe2: number = 0;
      const probe3: number = 2.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 2 seconds', kitText0);
      expect(kitText0).assertEqual('in 2 seconds');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 4 seconds', kitText1);
      expect(kitText1).assertEqual('in 4 seconds');
      InterfaceTestLog.value(name, 'kit.format.2', 'now', kitText2);
      expect(kitText2).assertEqual('now');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 2.5 seconds', kitText3);
      expect(kitText3).assertEqual('in 2.5 seconds');
      InterfaceTestLog.value(name, 'kit.numeric', 'auto', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 2 seconds', runtimeText0);
      expect(runtimeText0).assertEqual('in 2 seconds');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 4 seconds', runtimeText1);
      expect(runtimeText1).assertEqual('in 4 seconds');
      InterfaceTestLog.value(name, 'runtime.format.2', 'now', runtimeText2);
      expect(runtimeText2).assertEqual('now');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 2.5 seconds', runtimeText3);
      expect(runtimeText3).assertEqual('in 2.5 seconds');
      InterfaceTestLog.value(name, 'runtime.numeric', 'auto', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('auto');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0070
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0070
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0070';
      const input: string = 'en-US; unit=second; value=-1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'second';
      const probe0: number = -1;
      const probe1: number = 1;
      const probe2: number = -3;
      const probe3: number = -0.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '1 second ago', kitText0);
      expect(kitText0).assertEqual('1 second ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 1 second', kitText1);
      expect(kitText1).assertEqual('in 1 second');
      InterfaceTestLog.value(name, 'kit.format.2', '3 seconds ago', kitText2);
      expect(kitText2).assertEqual('3 seconds ago');
      InterfaceTestLog.value(name, 'kit.format.3', '0.5 seconds ago', kitText3);
      expect(kitText3).assertEqual('0.5 seconds ago');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '1 second ago', runtimeText0);
      expect(runtimeText0).assertEqual('1 second ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 1 second', runtimeText1);
      expect(runtimeText1).assertEqual('in 1 second');
      InterfaceTestLog.value(name, 'runtime.format.2', '3 seconds ago', runtimeText2);
      expect(runtimeText2).assertEqual('3 seconds ago');
      InterfaceTestLog.value(name, 'runtime.format.3', '0.5 seconds ago', runtimeText3);
      expect(runtimeText3).assertEqual('0.5 seconds ago');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0071
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0071
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0071';
      const input: string = 'en-US; unit=second; value=-0; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'second';
      const probe0: number = -0;
      const probe1: number = 2;
      const probe2: number = -2;
      const probe3: number = 0;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '0 seconds ago', kitText0);
      expect(kitText0).assertEqual('0 seconds ago');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 2 seconds', kitText1);
      expect(kitText1).assertEqual('in 2 seconds');
      InterfaceTestLog.value(name, 'kit.format.2', '2 seconds ago', kitText2);
      expect(kitText2).assertEqual('2 seconds ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 0 seconds', kitText3);
      expect(kitText3).assertEqual('in 0 seconds');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', '0 seconds ago', runtimeText0);
      expect(runtimeText0).assertEqual('0 seconds ago');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 2 seconds', runtimeText1);
      expect(runtimeText1).assertEqual('in 2 seconds');
      InterfaceTestLog.value(name, 'runtime.format.2', '2 seconds ago', runtimeText2);
      expect(runtimeText2).assertEqual('2 seconds ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 0 seconds', runtimeText3);
      expect(runtimeText3).assertEqual('in 0 seconds');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0072
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0072
     * @tc.desc Check English auto/always relative time, signed zero, direction and documented units.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_RELATIVE_0072';
      const input: string = 'en-US; unit=second; value=1; numeric=always; style=long';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.RelativeTimeFormatInputOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const runtimeOptions: Intl.RelativeTimeFormatOptions = {
        localeMatcher: 'lookup', numeric: 'always', style: 'long',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","numeric":"always","style":"long"}';
      const kit: intl.RelativeTimeFormat = new intl.RelativeTimeFormat(locale, kitOptions);
      const runtime: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale, runtimeOptions);
      const unit: Intl.RelativeTimeFormatUnit = 'second';
      const probe0: number = 1;
      const probe1: number = 3;
      const probe2: number = -1;
      const probe3: number = 1.5;
      const kitText0: string = kit.format(probe0, unit);
      const kitText1: string = kit.format(probe1, unit);
      const kitText2: string = kit.format(probe2, unit);
      const kitText3: string = kit.format(probe3, unit);
      const kitResolved: intl.RelativeTimeFormatResolvedOptions = kit.resolvedOptions();
      const runtimeText0: string = runtime.format(probe0, unit);
      const runtimeText1: string = runtime.format(probe1, unit);
      const runtimeText2: string = runtime.format(probe2, unit);
      const runtimeText3: string = runtime.format(probe3, unit);
      const runtimeResolved: Intl.ResolvedRelativeTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'in 1 second', kitText0);
      expect(kitText0).assertEqual('in 1 second');
      InterfaceTestLog.value(name, 'kit.format.1', 'in 3 seconds', kitText1);
      expect(kitText1).assertEqual('in 3 seconds');
      InterfaceTestLog.value(name, 'kit.format.2', '1 second ago', kitText2);
      expect(kitText2).assertEqual('1 second ago');
      InterfaceTestLog.value(name, 'kit.format.3', 'in 1.5 seconds', kitText3);
      expect(kitText3).assertEqual('in 1.5 seconds');
      InterfaceTestLog.value(name, 'kit.numeric', 'always', kitResolved.numeric);
      expect(kitResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'kit.style', 'long', kitResolved.style);
      expect(kitResolved.style).assertEqual('long');
      InterfaceTestLog.value(name, 'runtime.format.0', 'in 1 second', runtimeText0);
      expect(runtimeText0).assertEqual('in 1 second');
      InterfaceTestLog.value(name, 'runtime.format.1', 'in 3 seconds', runtimeText1);
      expect(runtimeText1).assertEqual('in 3 seconds');
      InterfaceTestLog.value(name, 'runtime.format.2', '1 second ago', runtimeText2);
      expect(runtimeText2).assertEqual('1 second ago');
      InterfaceTestLog.value(name, 'runtime.format.3', 'in 1.5 seconds', runtimeText3);
      expect(runtimeText3).assertEqual('in 1.5 seconds');
      InterfaceTestLog.value(name, 'runtime.numeric', 'always', runtimeResolved.numeric);
      expect(runtimeResolved.numeric).assertEqual('always');
      InterfaceTestLog.value(name, 'runtime.style', 'long', runtimeResolved.style);
      expect(runtimeResolved.style).assertEqual('long');
      InterfaceTestLog.end(name);
    });
  });
}
