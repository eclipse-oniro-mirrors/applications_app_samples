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
export default function IntlPluralLogic(): void {
  describe('IntlPluralLogic.test.ets', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0001
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0001';
      const input: string = 'en-US; value=-0; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = -0;
      const probe1: number = 1;
      const probe2: number = 2;
      const probe3: number = 0.5;
      const probe4: number = 100;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'one', kitCategory1);
      expect(kitCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'one', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0002
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0002';
      const input: string = 'en-US; value=0; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 0;
      const probe1: number = 1;
      const probe2: number = 2;
      const probe3: number = 0.5;
      const probe4: number = 100;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'one', kitCategory1);
      expect(kitCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'one', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0003
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0003';
      const input: string = 'en-US; value=-1; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = -1;
      const probe1: number = 0;
      const probe2: number = 1;
      const probe3: number = -0.5;
      const probe4: number = 99;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'one', kitCategory0);
      expect(kitCategory0).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'one', kitCategory2);
      expect(kitCategory2).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'one', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'one', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0004
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0004';
      const input: string = 'en-US; value=-2; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = -2;
      const probe1: number = -1;
      const probe2: number = 0;
      const probe3: number = -1.5;
      const probe4: number = 98;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'one', kitCategory1);
      expect(kitCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'one', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0005
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0005';
      const input: string = 'en-US; value=1; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 1;
      const probe1: number = 2;
      const probe2: number = 3;
      const probe3: number = 1.5;
      const probe4: number = 101;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'one', kitCategory0);
      expect(kitCategory0).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'one', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0006
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0006';
      const input: string = 'en-US; value=2; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 2;
      const probe1: number = 3;
      const probe2: number = 4;
      const probe3: number = 2.5;
      const probe4: number = 102;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0007
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0007';
      const input: string = 'en-US; value=3; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 3;
      const probe1: number = 4;
      const probe2: number = 5;
      const probe3: number = 3.5;
      const probe4: number = 103;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0008
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0008';
      const input: string = 'en-US; value=4; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 4;
      const probe1: number = 5;
      const probe2: number = 6;
      const probe3: number = 4.5;
      const probe4: number = 104;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0009
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0009';
      const input: string = 'en-US; value=10; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 10;
      const probe1: number = 11;
      const probe2: number = 12;
      const probe3: number = 10.5;
      const probe4: number = 110;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0010
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0010';
      const input: string = 'en-US; value=11; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 11;
      const probe1: number = 12;
      const probe2: number = 13;
      const probe3: number = 11.5;
      const probe4: number = 111;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0011
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0011';
      const input: string = 'en-US; value=12; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 12;
      const probe1: number = 13;
      const probe2: number = 14;
      const probe3: number = 12.5;
      const probe4: number = 112;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0012
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0012';
      const input: string = 'en-US; value=13; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 13;
      const probe1: number = 14;
      const probe2: number = 15;
      const probe3: number = 13.5;
      const probe4: number = 113;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0013
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0013';
      const input: string = 'en-US; value=20; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 20;
      const probe1: number = 21;
      const probe2: number = 22;
      const probe3: number = 20.5;
      const probe4: number = 120;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0014
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0014';
      const input: string = 'en-US; value=21; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 21;
      const probe1: number = 22;
      const probe2: number = 23;
      const probe3: number = 21.5;
      const probe4: number = 121;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0015
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0015';
      const input: string = 'en-US; value=22; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 22;
      const probe1: number = 23;
      const probe2: number = 24;
      const probe3: number = 22.5;
      const probe4: number = 122;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0016
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0016';
      const input: string = 'en-US; value=23; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 23;
      const probe1: number = 24;
      const probe2: number = 25;
      const probe3: number = 23.5;
      const probe4: number = 123;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0017
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0017';
      const input: string = 'en-US; value=24; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 24;
      const probe1: number = 25;
      const probe2: number = 26;
      const probe3: number = 24.5;
      const probe4: number = 124;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0018
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0018';
      const input: string = 'en-US; value=101; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 101;
      const probe1: number = 102;
      const probe2: number = 103;
      const probe3: number = 101.5;
      const probe4: number = 201;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0019
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0019';
      const input: string = 'en-US; value=111; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 111;
      const probe1: number = 112;
      const probe2: number = 113;
      const probe3: number = 111.5;
      const probe4: number = 211;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0020
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0020';
      const input: string = 'en-US; value=112; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 112;
      const probe1: number = 113;
      const probe2: number = 114;
      const probe3: number = 112.5;
      const probe4: number = 212;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0021
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0021';
      const input: string = 'en-US; value=113; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 113;
      const probe1: number = 114;
      const probe2: number = 115;
      const probe3: number = 113.5;
      const probe4: number = 213;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0022
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0022';
      const input: string = 'en-US; value=121; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 121;
      const probe1: number = 122;
      const probe2: number = 123;
      const probe3: number = 121.5;
      const probe4: number = 221;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0023
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0023';
      const input: string = 'en-US; value=1.5; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 1.5;
      const probe1: number = 2.5;
      const probe2: number = 3.5;
      const probe3: number = 2;
      const probe4: number = 101.5;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0024
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0024';
      const input: string = 'en-US; value=2.25; type=cardinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'cardinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"cardinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 2.25;
      const probe1: number = 3.25;
      const probe2: number = 4.25;
      const probe3: number = 2.75;
      const probe4: number = 102.25;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0025
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0025
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0025';
      const input: string = 'en-GB; value=-0; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = -0;
      const probe1: number = 1;
      const probe2: number = 2;
      const probe3: number = 0.5;
      const probe4: number = 100;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'one', kitCategory1);
      expect(kitCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.2', 'two', kitCategory2);
      expect(kitCategory2).assertEqual('two');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'one', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.2', 'two', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('two');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0026
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0026
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0026';
      const input: string = 'en-GB; value=0; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 0;
      const probe1: number = 1;
      const probe2: number = 2;
      const probe3: number = 0.5;
      const probe4: number = 100;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'one', kitCategory1);
      expect(kitCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.2', 'two', kitCategory2);
      expect(kitCategory2).assertEqual('two');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'one', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.2', 'two', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('two');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0027
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0027
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0027';
      const input: string = 'en-GB; value=-1; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = -1;
      const probe1: number = 0;
      const probe2: number = 1;
      const probe3: number = -0.5;
      const probe4: number = 99;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'one', kitCategory0);
      expect(kitCategory0).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'one', kitCategory2);
      expect(kitCategory2).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'one', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'one', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0028
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0028
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0028';
      const input: string = 'en-GB; value=-2; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = -2;
      const probe1: number = -1;
      const probe2: number = 0;
      const probe3: number = -1.5;
      const probe4: number = 98;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'two', kitCategory0);
      expect(kitCategory0).assertEqual('two');
      InterfaceTestLog.value(name, 'kit.select.1', 'one', kitCategory1);
      expect(kitCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'two', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('two');
      InterfaceTestLog.value(name, 'runtime.select.1', 'one', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0029
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0029
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0029';
      const input: string = 'en-GB; value=1; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 1;
      const probe1: number = 2;
      const probe2: number = 3;
      const probe3: number = 1.5;
      const probe4: number = 101;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'one', kitCategory0);
      expect(kitCategory0).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.1', 'two', kitCategory1);
      expect(kitCategory1).assertEqual('two');
      InterfaceTestLog.value(name, 'kit.select.2', 'few', kitCategory2);
      expect(kitCategory2).assertEqual('few');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'one', kitCategory4);
      expect(kitCategory4).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.0', 'one', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('one');
      InterfaceTestLog.value(name, 'runtime.select.1', 'two', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('two');
      InterfaceTestLog.value(name, 'runtime.select.2', 'few', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('few');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'one', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('one');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0030
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0030
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0030';
      const input: string = 'en-GB; value=2; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 2;
      const probe1: number = 3;
      const probe2: number = 4;
      const probe3: number = 2.5;
      const probe4: number = 102;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'two', kitCategory0);
      expect(kitCategory0).assertEqual('two');
      InterfaceTestLog.value(name, 'kit.select.1', 'few', kitCategory1);
      expect(kitCategory1).assertEqual('few');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'two', kitCategory4);
      expect(kitCategory4).assertEqual('two');
      InterfaceTestLog.value(name, 'runtime.select.0', 'two', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('two');
      InterfaceTestLog.value(name, 'runtime.select.1', 'few', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('few');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'two', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('two');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0031
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0031
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0031';
      const input: string = 'en-GB; value=3; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 3;
      const probe1: number = 4;
      const probe2: number = 5;
      const probe3: number = 3.5;
      const probe4: number = 103;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'few', kitCategory0);
      expect(kitCategory0).assertEqual('few');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'few', kitCategory4);
      expect(kitCategory4).assertEqual('few');
      InterfaceTestLog.value(name, 'runtime.select.0', 'few', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('few');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'few', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('few');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0032
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0032
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0032';
      const input: string = 'en-GB; value=4; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 4;
      const probe1: number = 5;
      const probe2: number = 6;
      const probe3: number = 4.5;
      const probe4: number = 104;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0033
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0033
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0033';
      const input: string = 'en-GB; value=10; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 10;
      const probe1: number = 11;
      const probe2: number = 12;
      const probe3: number = 10.5;
      const probe4: number = 110;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0034
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0034
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0034';
      const input: string = 'en-GB; value=11; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 11;
      const probe1: number = 12;
      const probe2: number = 13;
      const probe3: number = 11.5;
      const probe4: number = 111;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0035
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0035
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0035';
      const input: string = 'en-GB; value=12; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 12;
      const probe1: number = 13;
      const probe2: number = 14;
      const probe3: number = 12.5;
      const probe4: number = 112;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0036
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0036
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0036';
      const input: string = 'en-GB; value=13; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 13;
      const probe1: number = 14;
      const probe2: number = 15;
      const probe3: number = 13.5;
      const probe4: number = 113;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'other', kitCategory1);
      expect(kitCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.2', 'other', kitCategory2);
      expect(kitCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.3', 'other', kitCategory3);
      expect(kitCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.4', 'other', kitCategory4);
      expect(kitCategory4).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.0', 'other', runtimeCategory0);
      expect(runtimeCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.1', 'other', runtimeCategory1);
      expect(runtimeCategory1).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.2', 'other', runtimeCategory2);
      expect(runtimeCategory2).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.3', 'other', runtimeCategory3);
      expect(runtimeCategory3).assertEqual('other');
      InterfaceTestLog.value(name, 'runtime.select.4', 'other', runtimeCategory4);
      expect(runtimeCategory4).assertEqual('other');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0037
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0037
     * @tc.desc Check independent English cardinal/ordinal or Chinese other-category rules.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_PLURAL_0037';
      const input: string = 'en-GB; value=20; type=ordinal; localeMatcher=lookup';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const kitOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const runtimeOptions: Intl.PluralRulesOptions = {
        localeMatcher: 'lookup', type: 'ordinal',
      };
      const runtimeOptionsSnapshot: string =
        '{"localeMatcher":"lookup","type":"ordinal"}';
      const kit: intl.PluralRules = new intl.PluralRules(locale, kitOptions);
      const runtime: Intl.PluralRules = new Intl.PluralRules(locale, runtimeOptions);
      const probe0: number = 20;
      const probe1: number = 21;
      const probe2: number = 22;
      const probe3: number = 20.5;
      const probe4: number = 120;
      const kitCategory0: string = kit.select(probe0);
      const kitCategory1: string = kit.select(probe1);
      const kitCategory2: string = kit.select(probe2);
      const kitCategory3: string = kit.select(probe3);
      const kitCategory4: string = kit.select(probe4);
      const runtimeCategory0: string = runtime.select(probe0);
      const runtimeCategory1: string = runtime.select(probe1);
      const runtimeCategory2: string = runtime.select(probe2);
      const runtimeCategory3: string = runtime.select(probe3);
      const runtimeCategory4: string = runtime.select(probe4);
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.select.0', 'other', kitCategory0);
      expect(kitCategory0).assertEqual('other');
      InterfaceTestLog.value(name, 'kit.select.1', 'one', kitCategory1);
      expect(kitCategory1).assertEqual('one');
      InterfaceTestLog.value(name, 'kit.select.2', 'two', kitCategory2);