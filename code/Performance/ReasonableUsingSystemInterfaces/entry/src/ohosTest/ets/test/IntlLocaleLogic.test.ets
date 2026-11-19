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
export default function IntlLocaleLogic(): void {
  describe('IntlLocaleLogic.test.ets', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0001
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0001';
      const input: string = 'tag=EN-us; options={"calendar":"gregory","hourCycle":"h23","numberingSystem"' +
        ':"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'EN-us';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'en', String(kit.language));
      expect(kit.language).assertEqual('en');
      InterfaceTestLog.value(name, 'kit.region', 'US', String(kit.region));
      expect(kit.region).assertEqual('US');
      InterfaceTestLog.value(name, 'kit.baseName', 'en-US', String(kit.baseName));
      expect(kit.baseName).assertEqual('en-US');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'en-US', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('en-US');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'en-US', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('en-US');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'en', String(runtime.language));
      expect(runtime.language).assertEqual('en');
      InterfaceTestLog.value(name, 'runtime.region', 'US', String(runtime.region));
      expect(runtime.region).assertEqual('US');
      InterfaceTestLog.value(name, 'runtime.baseName', 'en-US', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('en-US');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'en-US', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('en-US');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0002
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0002';
      const input: string = 'tag=en-gb; options={"calendar":"gregory","hourCycle":"h23","numberingSystem"' +
        ':"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'en-gb';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'en', String(kit.language));
      expect(kit.language).assertEqual('en');
      InterfaceTestLog.value(name, 'kit.region', 'GB', String(kit.region));
      expect(kit.region).assertEqual('GB');
      InterfaceTestLog.value(name, 'kit.baseName', 'en-GB', String(kit.baseName));
      expect(kit.baseName).assertEqual('en-GB');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'en-GB', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('en-GB');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'en-GB', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('en-GB');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'en', String(runtime.language));
      expect(runtime.language).assertEqual('en');
      InterfaceTestLog.value(name, 'runtime.region', 'GB', String(runtime.region));
      expect(runtime.region).assertEqual('GB');
      InterfaceTestLog.value(name, 'runtime.baseName', 'en-GB', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('en-GB');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'en-GB', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('en-GB');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0003
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0003';
      const input: string = 'tag=ZH-hans-cn; options={"calendar":"gregory","hourCycle":"h23","numberingSy' +
        'stem":"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'ZH-hans-cn';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'zh', String(kit.language));
      expect(kit.language).assertEqual('zh');
      InterfaceTestLog.value(name, 'kit.region', 'CN', String(kit.region));
      expect(kit.region).assertEqual('CN');
      InterfaceTestLog.value(name, 'kit.baseName', 'zh-Hans-CN', String(kit.baseName));
      expect(kit.baseName).assertEqual('zh-Hans-CN');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'zh-Hans-CN', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('zh-Hans-CN');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'zh-Hans-CN', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('zh-Hans-CN');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'zh', String(runtime.language));
      expect(runtime.language).assertEqual('zh');
      InterfaceTestLog.value(name, 'runtime.region', 'CN', String(runtime.region));
      expect(runtime.region).assertEqual('CN');
      InterfaceTestLog.value(name, 'runtime.baseName', 'zh-Hans-CN', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('zh-Hans-CN');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'zh-Hans-CN', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('zh-Hans-CN');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0004
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0004';
      const input: string = 'tag=zh-HANT-tw; options={"calendar":"gregory","hourCycle":"h23","numberingSy' +
        'stem":"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'zh-HANT-tw';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'zh', String(kit.language));
      expect(kit.language).assertEqual('zh');
      InterfaceTestLog.value(name, 'kit.region', 'TW', String(kit.region));
      expect(kit.region).assertEqual('TW');
      InterfaceTestLog.value(name, 'kit.baseName', 'zh-Hant-TW', String(kit.baseName));
      expect(kit.baseName).assertEqual('zh-Hant-TW');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'zh-Hant-TW', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('zh-Hant-TW');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'zh-Hant-TW', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('zh-Hant-TW');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'zh', String(runtime.language));
      expect(runtime.language).assertEqual('zh');
      InterfaceTestLog.value(name, 'runtime.region', 'TW', String(runtime.region));
      expect(runtime.region).assertEqual('TW');
      InterfaceTestLog.value(name, 'runtime.baseName', 'zh-Hant-TW', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('zh-Hant-TW');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'zh-Hant-TW', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('zh-Hant-TW');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0005
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0005';
      const input: string = 'tag=SR-latn-rs; options={"calendar":"gregory","hourCycle":"h23","numberingSy' +
        'stem":"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'SR-latn-rs';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'sr', String(kit.language));
      expect(kit.language).assertEqual('sr');
      InterfaceTestLog.value(name, 'kit.region', 'RS', String(kit.region));
      expect(kit.region).assertEqual('RS');
      InterfaceTestLog.value(name, 'kit.baseName', 'sr-Latn-RS', String(kit.baseName));
      expect(kit.baseName).assertEqual('sr-Latn-RS');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'sr-Latn-RS', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('sr-Latn-RS');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'sr-Latn-RS', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('sr-Latn-RS');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'sr', String(runtime.language));
      expect(runtime.language).assertEqual('sr');
      InterfaceTestLog.value(name, 'runtime.region', 'RS', String(runtime.region));
      expect(runtime.region).assertEqual('RS');
      InterfaceTestLog.value(name, 'runtime.baseName', 'sr-Latn-RS', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('sr-Latn-RS');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'sr-Latn-RS', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('sr-Latn-RS');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0006
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0006';
      const input: string = 'tag=sr-CYRL-rs; options={"calendar":"gregory","hourCycle":"h23","numberingSy' +
        'stem":"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'sr-CYRL-rs';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'sr', String(kit.language));
      expect(kit.language).assertEqual('sr');
      InterfaceTestLog.value(name, 'kit.region', 'RS', String(kit.region));
      expect(kit.region).assertEqual('RS');
      InterfaceTestLog.value(name, 'kit.baseName', 'sr-Cyrl-RS', String(kit.baseName));
      expect(kit.baseName).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'sr-Cyrl-RS', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'sr-Cyrl-RS', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'sr', String(runtime.language));
      expect(runtime.language).assertEqual('sr');
      InterfaceTestLog.value(name, 'runtime.region', 'RS', String(runtime.region));
      expect(runtime.region).assertEqual('RS');
      InterfaceTestLog.value(name, 'runtime.baseName', 'sr-Cyrl-RS', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'sr-Cyrl-RS', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0007
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0007';
      const input: string = 'tag=DE-de; options={"calendar":"gregory","hourCycle":"h23","numberingSystem"' +
        ':"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'DE-de';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'de', String(kit.language));
      expect(kit.language).assertEqual('de');
      InterfaceTestLog.value(name, 'kit.region', 'DE', String(kit.region));
      expect(kit.region).assertEqual('DE');
      InterfaceTestLog.value(name, 'kit.baseName', 'de-DE', String(kit.baseName));
      expect(kit.baseName).assertEqual('de-DE');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'de-DE', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('de-DE');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'de-DE', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('de-DE');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'de', String(runtime.language));
      expect(runtime.language).assertEqual('de');
      InterfaceTestLog.value(name, 'runtime.region', 'DE', String(runtime.region));
      expect(runtime.region).assertEqual('DE');
      InterfaceTestLog.value(name, 'runtime.baseName', 'de-DE', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('de-DE');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'de-DE', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('de-DE');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0008
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0008';
      const input: string = 'tag=fr-CA; options={"calendar":"gregory","hourCycle":"h23","numberingSystem"' +
        ':"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'fr-CA';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'fr', String(kit.language));
      expect(kit.language).assertEqual('fr');
      InterfaceTestLog.value(name, 'kit.region', 'CA', String(kit.region));
      expect(kit.region).assertEqual('CA');
      InterfaceTestLog.value(name, 'kit.baseName', 'fr-CA', String(kit.baseName));
      expect(kit.baseName).assertEqual('fr-CA');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'fr-CA', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('fr-CA');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'fr-CA', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('fr-CA');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'fr', String(runtime.language));
      expect(runtime.language).assertEqual('fr');
      InterfaceTestLog.value(name, 'runtime.region', 'CA', String(runtime.region));
      expect(runtime.region).assertEqual('CA');
      InterfaceTestLog.value(name, 'runtime.baseName', 'fr-CA', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('fr-CA');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'fr-CA', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('fr-CA');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0009
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0009';
      const input: string = 'tag=ja-jp; options={"calendar":"gregory","hourCycle":"h23","numberingSystem"' +
        ':"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'ja-jp';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'ja', String(kit.language));
      expect(kit.language).assertEqual('ja');
      InterfaceTestLog.value(name, 'kit.region', 'JP', String(kit.region));
      expect(kit.region).assertEqual('JP');
      InterfaceTestLog.value(name, 'kit.baseName', 'ja-JP', String(kit.baseName));
      expect(kit.baseName).assertEqual('ja-JP');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'ja-JP', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('ja-JP');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'ja-JP', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('ja-JP');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'ja', String(runtime.language));
      expect(runtime.language).assertEqual('ja');
      InterfaceTestLog.value(name, 'runtime.region', 'JP', String(runtime.region));
      expect(runtime.region).assertEqual('JP');
      InterfaceTestLog.value(name, 'runtime.baseName', 'ja-JP', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('ja-JP');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'ja-JP', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('ja-JP');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0010
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0010';
      const input: string = 'tag=ko-KR; options={"calendar":"gregory","hourCycle":"h23","numberingSystem"' +
        ':"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'ko-KR';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'ko', String(kit.language));
      expect(kit.language).assertEqual('ko');
      InterfaceTestLog.value(name, 'kit.region', 'KR', String(kit.region));
      expect(kit.region).assertEqual('KR');
      InterfaceTestLog.value(name, 'kit.baseName', 'ko-KR', String(kit.baseName));
      expect(kit.baseName).assertEqual('ko-KR');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'ko-KR', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('ko-KR');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'ko-KR', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('ko-KR');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'ko', String(runtime.language));
      expect(runtime.language).assertEqual('ko');
      InterfaceTestLog.value(name, 'runtime.region', 'KR', String(runtime.region));
      expect(runtime.region).assertEqual('KR');
      InterfaceTestLog.value(name, 'runtime.baseName', 'ko-KR', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('ko-KR');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'ko-KR', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('ko-KR');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0011
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0011';
      const input: string = 'tag=es-mx; options={"calendar":"gregory","hourCycle":"h23","numberingSystem"' +
        ':"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'es-mx';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'es', String(kit.language));
      expect(kit.language).assertEqual('es');
      InterfaceTestLog.value(name, 'kit.region', 'MX', String(kit.region));
      expect(kit.region).assertEqual('MX');
      InterfaceTestLog.value(name, 'kit.baseName', 'es-MX', String(kit.baseName));
      expect(kit.baseName).assertEqual('es-MX');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'es-MX', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('es-MX');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'es-MX', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('es-MX');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'es', String(runtime.language));
      expect(runtime.language).assertEqual('es');
      InterfaceTestLog.value(name, 'runtime.region', 'MX', String(runtime.region));
      expect(runtime.region).assertEqual('MX');
      InterfaceTestLog.value(name, 'runtime.baseName', 'es-MX', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('es-MX');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'es-MX', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('es-MX');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0012
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0012';
      const input: string = 'tag=PT-br; options={"calendar":"gregory","hourCycle":"h23","numberingSystem"' +
        ':"latn","numeric":false,"caseFirst":"false"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'PT-br';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'gregory', hourCycle: 'h23', numberingSystem: 'latn', numeric: false, caseFirst: 'false',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"gregory","hourCycle":"h23","numberingSystem":"latn","numeric":f' +
        'alse,"caseFirst":"false"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'pt', String(kit.language));
      expect(kit.language).assertEqual('pt');
      InterfaceTestLog.value(name, 'kit.region', 'BR', String(kit.region));
      expect(kit.region).assertEqual('BR');
      InterfaceTestLog.value(name, 'kit.baseName', 'pt-BR', String(kit.baseName));
      expect(kit.baseName).assertEqual('pt-BR');
      InterfaceTestLog.value(name, 'kit.calendar', 'gregory', String(kit.calendar));
      expect(kit.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h23', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'false', String(kit.numeric));
      expect(kit.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'false', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'pt-BR', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('pt-BR');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'pt-BR', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('pt-BR');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'pt', String(runtime.language));
      expect(runtime.language).assertEqual('pt');
      InterfaceTestLog.value(name, 'runtime.region', 'BR', String(runtime.region));
      expect(runtime.region).assertEqual('BR');
      InterfaceTestLog.value(name, 'runtime.baseName', 'pt-BR', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('pt-BR');
      InterfaceTestLog.value(name, 'runtime.calendar', 'gregory', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('gregory');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h23', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h23');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'false', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(false);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'false', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('false');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'pt-BR', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('pt-BR');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0013
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0013';
      const input: string = 'tag=EN-us; options={"calendar":"iso8601","hourCycle":"h12","numberingSystem"' +
        ':"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'EN-us';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'en', String(kit.language));
      expect(kit.language).assertEqual('en');
      InterfaceTestLog.value(name, 'kit.region', 'US', String(kit.region));
      expect(kit.region).assertEqual('US');
      InterfaceTestLog.value(name, 'kit.baseName', 'en-US', String(kit.baseName));
      expect(kit.baseName).assertEqual('en-US');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'en-US', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('en-US');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'en-US', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('en-US');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'en', String(runtime.language));
      expect(runtime.language).assertEqual('en');
      InterfaceTestLog.value(name, 'runtime.region', 'US', String(runtime.region));
      expect(runtime.region).assertEqual('US');
      InterfaceTestLog.value(name, 'runtime.baseName', 'en-US', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('en-US');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'en-US', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('en-US');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0014
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0014';
      const input: string = 'tag=en-gb; options={"calendar":"iso8601","hourCycle":"h12","numberingSystem"' +
        ':"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'en-gb';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'en', String(kit.language));
      expect(kit.language).assertEqual('en');
      InterfaceTestLog.value(name, 'kit.region', 'GB', String(kit.region));
      expect(kit.region).assertEqual('GB');
      InterfaceTestLog.value(name, 'kit.baseName', 'en-GB', String(kit.baseName));
      expect(kit.baseName).assertEqual('en-GB');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'en-GB', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('en-GB');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'en-GB', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('en-GB');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'en', String(runtime.language));
      expect(runtime.language).assertEqual('en');
      InterfaceTestLog.value(name, 'runtime.region', 'GB', String(runtime.region));
      expect(runtime.region).assertEqual('GB');
      InterfaceTestLog.value(name, 'runtime.baseName', 'en-GB', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('en-GB');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'en-GB', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('en-GB');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0015
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0015';
      const input: string = 'tag=ZH-hans-cn; options={"calendar":"iso8601","hourCycle":"h12","numberingSy' +
        'stem":"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'ZH-hans-cn';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'zh', String(kit.language));
      expect(kit.language).assertEqual('zh');
      InterfaceTestLog.value(name, 'kit.region', 'CN', String(kit.region));
      expect(kit.region).assertEqual('CN');
      InterfaceTestLog.value(name, 'kit.baseName', 'zh-Hans-CN', String(kit.baseName));
      expect(kit.baseName).assertEqual('zh-Hans-CN');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'zh-Hans-CN', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('zh-Hans-CN');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'zh-Hans-CN', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('zh-Hans-CN');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'zh', String(runtime.language));
      expect(runtime.language).assertEqual('zh');
      InterfaceTestLog.value(name, 'runtime.region', 'CN', String(runtime.region));
      expect(runtime.region).assertEqual('CN');
      InterfaceTestLog.value(name, 'runtime.baseName', 'zh-Hans-CN', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('zh-Hans-CN');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'zh-Hans-CN', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('zh-Hans-CN');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0016
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0016';
      const input: string = 'tag=zh-HANT-tw; options={"calendar":"iso8601","hourCycle":"h12","numberingSy' +
        'stem":"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'zh-HANT-tw';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'zh', String(kit.language));
      expect(kit.language).assertEqual('zh');
      InterfaceTestLog.value(name, 'kit.region', 'TW', String(kit.region));
      expect(kit.region).assertEqual('TW');
      InterfaceTestLog.value(name, 'kit.baseName', 'zh-Hant-TW', String(kit.baseName));
      expect(kit.baseName).assertEqual('zh-Hant-TW');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'zh-Hant-TW', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('zh-Hant-TW');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'zh-Hant-TW', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('zh-Hant-TW');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'zh', String(runtime.language));
      expect(runtime.language).assertEqual('zh');
      InterfaceTestLog.value(name, 'runtime.region', 'TW', String(runtime.region));
      expect(runtime.region).assertEqual('TW');
      InterfaceTestLog.value(name, 'runtime.baseName', 'zh-Hant-TW', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('zh-Hant-TW');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'zh-Hant-TW', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('zh-Hant-TW');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0017
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0017';
      const input: string = 'tag=SR-latn-rs; options={"calendar":"iso8601","hourCycle":"h12","numberingSy' +
        'stem":"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'SR-latn-rs';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'sr', String(kit.language));
      expect(kit.language).assertEqual('sr');
      InterfaceTestLog.value(name, 'kit.region', 'RS', String(kit.region));
      expect(kit.region).assertEqual('RS');
      InterfaceTestLog.value(name, 'kit.baseName', 'sr-Latn-RS', String(kit.baseName));
      expect(kit.baseName).assertEqual('sr-Latn-RS');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'sr-Latn-RS', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('sr-Latn-RS');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'sr-Latn-RS', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('sr-Latn-RS');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'sr', String(runtime.language));
      expect(runtime.language).assertEqual('sr');
      InterfaceTestLog.value(name, 'runtime.region', 'RS', String(runtime.region));
      expect(runtime.region).assertEqual('RS');
      InterfaceTestLog.value(name, 'runtime.baseName', 'sr-Latn-RS', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('sr-Latn-RS');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'sr-Latn-RS', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('sr-Latn-RS');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0018
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0018';
      const input: string = 'tag=sr-CYRL-rs; options={"calendar":"iso8601","hourCycle":"h12","numberingSy' +
        'stem":"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'sr-CYRL-rs';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'sr', String(kit.language));
      expect(kit.language).assertEqual('sr');
      InterfaceTestLog.value(name, 'kit.region', 'RS', String(kit.region));
      expect(kit.region).assertEqual('RS');
      InterfaceTestLog.value(name, 'kit.baseName', 'sr-Cyrl-RS', String(kit.baseName));
      expect(kit.baseName).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'sr-Cyrl-RS', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'sr-Cyrl-RS', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'sr', String(runtime.language));
      expect(runtime.language).assertEqual('sr');
      InterfaceTestLog.value(name, 'runtime.region', 'RS', String(runtime.region));
      expect(runtime.region).assertEqual('RS');
      InterfaceTestLog.value(name, 'runtime.baseName', 'sr-Cyrl-RS', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'sr-Cyrl-RS', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('sr-Cyrl-RS');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0019
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0019';
      const input: string = 'tag=DE-de; options={"calendar":"iso8601","hourCycle":"h12","numberingSystem"' +
        ':"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'DE-de';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'de', String(kit.language));
      expect(kit.language).assertEqual('de');
      InterfaceTestLog.value(name, 'kit.region', 'DE', String(kit.region));
      expect(kit.region).assertEqual('DE');
      InterfaceTestLog.value(name, 'kit.baseName', 'de-DE', String(kit.baseName));
      expect(kit.baseName).assertEqual('de-DE');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'de-DE', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('de-DE');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'de-DE', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('de-DE');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'de', String(runtime.language));
      expect(runtime.language).assertEqual('de');
      InterfaceTestLog.value(name, 'runtime.region', 'DE', String(runtime.region));
      expect(runtime.region).assertEqual('DE');
      InterfaceTestLog.value(name, 'runtime.baseName', 'de-DE', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('de-DE');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'de-DE', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('de-DE');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0020
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0020';
      const input: string = 'tag=fr-CA; options={"calendar":"iso8601","hourCycle":"h12","numberingSystem"' +
        ':"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'fr-CA';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'fr', String(kit.language));
      expect(kit.language).assertEqual('fr');
      InterfaceTestLog.value(name, 'kit.region', 'CA', String(kit.region));
      expect(kit.region).assertEqual('CA');
      InterfaceTestLog.value(name, 'kit.baseName', 'fr-CA', String(kit.baseName));
      expect(kit.baseName).assertEqual('fr-CA');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'fr-CA', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('fr-CA');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'fr-CA', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('fr-CA');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'fr', String(runtime.language));
      expect(runtime.language).assertEqual('fr');
      InterfaceTestLog.value(name, 'runtime.region', 'CA', String(runtime.region));
      expect(runtime.region).assertEqual('CA');
      InterfaceTestLog.value(name, 'runtime.baseName', 'fr-CA', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('fr-CA');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'fr-CA', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('fr-CA');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0021
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0021';
      const input: string = 'tag=ja-jp; options={"calendar":"iso8601","hourCycle":"h12","numberingSystem"' +
        ':"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'ja-jp';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'ja', String(kit.language));
      expect(kit.language).assertEqual('ja');
      InterfaceTestLog.value(name, 'kit.region', 'JP', String(kit.region));
      expect(kit.region).assertEqual('JP');
      InterfaceTestLog.value(name, 'kit.baseName', 'ja-JP', String(kit.baseName));
      expect(kit.baseName).assertEqual('ja-JP');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'ja-JP', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('ja-JP');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'ja-JP', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('ja-JP');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'ja', String(runtime.language));
      expect(runtime.language).assertEqual('ja');
      InterfaceTestLog.value(name, 'runtime.region', 'JP', String(runtime.region));
      expect(runtime.region).assertEqual('JP');
      InterfaceTestLog.value(name, 'runtime.baseName', 'ja-JP', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('ja-JP');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'ja-JP', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('ja-JP');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0022
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0022';
      const input: string = 'tag=ko-KR; options={"calendar":"iso8601","hourCycle":"h12","numberingSystem"' +
        ':"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'ko-KR';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'ko', String(kit.language));
      expect(kit.language).assertEqual('ko');
      InterfaceTestLog.value(name, 'kit.region', 'KR', String(kit.region));
      expect(kit.region).assertEqual('KR');
      InterfaceTestLog.value(name, 'kit.baseName', 'ko-KR', String(kit.baseName));
      expect(kit.baseName).assertEqual('ko-KR');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'ko-KR', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('ko-KR');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'ko-KR', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('ko-KR');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'ko', String(runtime.language));
      expect(runtime.language).assertEqual('ko');
      InterfaceTestLog.value(name, 'runtime.region', 'KR', String(runtime.region));
      expect(runtime.region).assertEqual('KR');
      InterfaceTestLog.value(name, 'runtime.baseName', 'ko-KR', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('ko-KR');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'ko-KR', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('ko-KR');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0023
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0023';
      const input: string = 'tag=es-mx; options={"calendar":"iso8601","hourCycle":"h12","numberingSystem"' +
        ':"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'es-mx';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'es', String(kit.language));
      expect(kit.language).assertEqual('es');
      InterfaceTestLog.value(name, 'kit.region', 'MX', String(kit.region));
      expect(kit.region).assertEqual('MX');
      InterfaceTestLog.value(name, 'kit.baseName', 'es-MX', String(kit.baseName));
      expect(kit.baseName).assertEqual('es-MX');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'es-MX', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('es-MX');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'es-MX', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('es-MX');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'es', String(runtime.language));
      expect(runtime.language).assertEqual('es');
      InterfaceTestLog.value(name, 'runtime.region', 'MX', String(runtime.region));
      expect(runtime.region).assertEqual('MX');
      InterfaceTestLog.value(name, 'runtime.baseName', 'es-MX', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('es-MX');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'es-MX', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('es-MX');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0024
     * @tc.desc Check canonical language/region, locale attributes and independent instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0024';
      const input: string = 'tag=PT-br; options={"calendar":"iso8601","hourCycle":"h12","numberingSystem"' +
        ':"latn","numeric":true,"caseFirst":"upper"}';
      InterfaceTestLog.begin(name, input);
      const tag: string = 'PT-br';
      const kitOptions: intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const kitOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const runtimeOptions: Intl.LocaleOptions = {
        calendar: 'iso8601', hourCycle: 'h12', numberingSystem: 'latn', numeric: true, caseFirst: 'upper',
      };
      const runtimeOptionsSnapshot: string =
        '{"calendar":"iso8601","hourCycle":"h12","numberingSystem":"latn","numeric":t' +
        'rue,"caseFirst":"upper"}';
      const kit: intl.Locale = new intl.Locale(tag, kitOptions);
      const runtime: Intl.Locale = new Intl.Locale(tag, runtimeOptions);
      const kitPlain: intl.Locale = new intl.Locale(tag);
      const runtimePlain: Intl.Locale = new Intl.Locale(tag);
      const kitPlainSerialized: string = kitPlain.toString();
      const kitPlainCanonical: string = new Intl.Locale(kitPlainSerialized).toString();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.language', 'pt', String(kit.language));
      expect(kit.language).assertEqual('pt');
      InterfaceTestLog.value(name, 'kit.region', 'BR', String(kit.region));
      expect(kit.region).assertEqual('BR');
      InterfaceTestLog.value(name, 'kit.baseName', 'pt-BR', String(kit.baseName));
      expect(kit.baseName).assertEqual('pt-BR');
      InterfaceTestLog.value(name, 'kit.calendar', 'iso8601', String(kit.calendar));
      expect(kit.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'kit.hourCycle', 'h12', String(kit.hourCycle));
      expect(kit.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'kit.numberingSystem', 'latn', String(kit.numberingSystem));
      expect(kit.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'kit.numeric', 'true', String(kit.numeric));
      expect(kit.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'kit.caseFirst', 'upper', String(kit.caseFirst));
      expect(kit.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'kit.plainBaseName', 'pt-BR', kitPlain.baseName);
      expect(kitPlain.baseName).assertEqual('pt-BR');
      InterfaceTestLog.value(name, 'kit.plainIndependent', 'pt-BR', kitPlainCanonical);
      expect(kitPlainCanonical).assertEqual('pt-BR');
      InterfaceTestLog.flag(name, 'kit.distinctInstance expected=true', kit !== kitPlain);
      expect(kit !== kitPlain).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.language', 'pt', String(runtime.language));
      expect(runtime.language).assertEqual('pt');
      InterfaceTestLog.value(name, 'runtime.region', 'BR', String(runtime.region));
      expect(runtime.region).assertEqual('BR');
      InterfaceTestLog.value(name, 'runtime.baseName', 'pt-BR', String(runtime.baseName));
      expect(runtime.baseName).assertEqual('pt-BR');
      InterfaceTestLog.value(name, 'runtime.calendar', 'iso8601', String(runtime.calendar));
      expect(runtime.calendar).assertEqual('iso8601');
      InterfaceTestLog.value(name, 'runtime.hourCycle', 'h12', String(runtime.hourCycle));
      expect(runtime.hourCycle).assertEqual('h12');
      InterfaceTestLog.value(name, 'runtime.numberingSystem', 'latn', String(runtime.numberingSystem));
      expect(runtime.numberingSystem).assertEqual('latn');
      InterfaceTestLog.value(name, 'runtime.numeric', 'true', String(runtime.numeric));
      expect(runtime.numeric).assertEqual(true);
      InterfaceTestLog.value(name, 'runtime.caseFirst', 'upper', String(runtime.caseFirst));
      expect(runtime.caseFirst).assertEqual('upper');
      InterfaceTestLog.value(name, 'runtime.plainIndependent', 'pt-BR', runtimePlain.toString());
      expect(runtimePlain.toString()).assertEqual('pt-BR');
      InterfaceTestLog.flag(name, 'runtime.distinctInstance expected=true', runtime !== runtimePlain);
      expect(runtime !== runtimePlain).assertEqual(true);
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_LOCALE_0025