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