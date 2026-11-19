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