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
export default function IntlDateTimeLogic(): void {
  describe('IntlDateTimeLogic.test.ets', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0001
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0001';
      const input: string = 'en-US; instant=1969-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = -1000;
      const kitDate0: Date = new Date(-1000);
      const kitDate1: Date = new Date(-86401000);
      const kitDate2: Date = new Date(86399000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(-1000);
      const runtimeDate1: Date = new Date(-86401000);
      const runtimeDate2: Date = new Date(86399000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '12/31/1969', kitText0);
      expect(kitText0).assertEqual('12/31/1969');
      InterfaceTestLog.value(name, 'kit.format.1', '12/30/1969', kitText1);
      expect(kitText1).assertEqual('12/30/1969');
      InterfaceTestLog.value(name, 'kit.format.2', '01/01/1970', kitText2);
      expect(kitText2).assertEqual('01/01/1970');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', -1000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86401000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86399000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '12/31/1969', runtimeText0);
      expect(runtimeText0).assertEqual('12/31/1969');
      InterfaceTestLog.value(name, 'runtime.format.1', '12/30/1969', runtimeText1);
      expect(runtimeText1).assertEqual('12/30/1969');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/01/1970', runtimeText2);
      expect(runtimeText2).assertEqual('01/01/1970');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', -1000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86401000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86399000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0002
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0002';
      const input: string = 'en-US; instant=1970-01-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 0;
      const kitDate0: Date = new Date(0);
      const kitDate1: Date = new Date(-86400000);
      const kitDate2: Date = new Date(86400000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(0);
      const runtimeDate1: Date = new Date(-86400000);
      const runtimeDate2: Date = new Date(86400000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '01/01/1970', kitText0);
      expect(kitText0).assertEqual('01/01/1970');
      InterfaceTestLog.value(name, 'kit.format.1', '12/31/1969', kitText1);
      expect(kitText1).assertEqual('12/31/1969');
      InterfaceTestLog.value(name, 'kit.format.2', '01/02/1970', kitText2);
      expect(kitText2).assertEqual('01/02/1970');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 0, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86400000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86400000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '01/01/1970', runtimeText0);
      expect(runtimeText0).assertEqual('01/01/1970');
      InterfaceTestLog.value(name, 'runtime.format.1', '12/31/1969', runtimeText1);
      expect(runtimeText1).assertEqual('12/31/1969');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/02/1970', runtimeText2);
      expect(runtimeText2).assertEqual('01/02/1970');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 0, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86400000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86400000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0003
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0003';
      const input: string = 'en-US; instant=1999-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 946684799000;
      const kitDate0: Date = new Date(946684799000);
      const kitDate1: Date = new Date(946598399000);
      const kitDate2: Date = new Date(946771199000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(946684799000);
      const runtimeDate1: Date = new Date(946598399000);
      const runtimeDate2: Date = new Date(946771199000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '12/31/1999', kitText0);
      expect(kitText0).assertEqual('12/31/1999');
      InterfaceTestLog.value(name, 'kit.format.1', '12/30/1999', kitText1);
      expect(kitText1).assertEqual('12/30/1999');
      InterfaceTestLog.value(name, 'kit.format.2', '01/01/2000', kitText2);
      expect(kitText2).assertEqual('01/01/2000');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 946684799000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 946598399000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 946771199000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '12/31/1999', runtimeText0);
      expect(runtimeText0).assertEqual('12/31/1999');
      InterfaceTestLog.value(name, 'runtime.format.1', '12/30/1999', runtimeText1);
      expect(runtimeText1).assertEqual('12/30/1999');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/01/2000', runtimeText2);
      expect(runtimeText2).assertEqual('01/01/2000');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 946684799000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 946598399000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 946771199000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0004
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0004';
      const input: string = 'en-US; instant=2000-02-28T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951782399000;
      const kitDate0: Date = new Date(951782399000);
      const kitDate1: Date = new Date(951695999000);
      const kitDate2: Date = new Date(951868799000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951782399000);
      const runtimeDate1: Date = new Date(951695999000);
      const runtimeDate2: Date = new Date(951868799000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '02/28/2000', kitText0);
      expect(kitText0).assertEqual('02/28/2000');
      InterfaceTestLog.value(name, 'kit.format.1', '02/27/2000', kitText1);
      expect(kitText1).assertEqual('02/27/2000');
      InterfaceTestLog.value(name, 'kit.format.2', '02/29/2000', kitText2);
      expect(kitText2).assertEqual('02/29/2000');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951782399000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951782399000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951695999000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951695999000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951868799000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951868799000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '02/28/2000', runtimeText0);
      expect(runtimeText0).assertEqual('02/28/2000');
      InterfaceTestLog.value(name, 'runtime.format.1', '02/27/2000', runtimeText1);
      expect(runtimeText1).assertEqual('02/27/2000');
      InterfaceTestLog.value(name, 'runtime.format.2', '02/29/2000', runtimeText2);
      expect(runtimeText2).assertEqual('02/29/2000');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951782399000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951782399000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951695999000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951695999000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951868799000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951868799000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0005
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0005';
      const input: string = 'en-US; instant=2000-02-29T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951782400000;
      const kitDate0: Date = new Date(951782400000);
      const kitDate1: Date = new Date(951696000000);
      const kitDate2: Date = new Date(951868800000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951782400000);
      const runtimeDate1: Date = new Date(951696000000);
      const runtimeDate2: Date = new Date(951868800000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '02/29/2000', kitText0);
      expect(kitText0).assertEqual('02/29/2000');
      InterfaceTestLog.value(name, 'kit.format.1', '02/28/2000', kitText1);
      expect(kitText1).assertEqual('02/28/2000');
      InterfaceTestLog.value(name, 'kit.format.2', '03/01/2000', kitText2);
      expect(kitText2).assertEqual('03/01/2000');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951782400000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951696000000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951696000000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951868800000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951868800000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '02/29/2000', runtimeText0);
      expect(runtimeText0).assertEqual('02/29/2000');
      InterfaceTestLog.value(name, 'runtime.format.1', '02/28/2000', runtimeText1);
      expect(runtimeText1).assertEqual('02/28/2000');
      InterfaceTestLog.value(name, 'runtime.format.2', '03/01/2000', runtimeText2);
      expect(runtimeText2).assertEqual('03/01/2000');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951782400000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951696000000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951696000000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951868800000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951868800000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0006
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0006';
      const input: string = 'en-US; instant=2000-03-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951868800000;
      const kitDate0: Date = new Date(951868800000);
      const kitDate1: Date = new Date(951782400000);
      const kitDate2: Date = new Date(951955200000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951868800000);
      const runtimeDate1: Date = new Date(951782400000);
      const runtimeDate2: Date = new Date(951955200000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '03/01/2000', kitText0);
      expect(kitText0).assertEqual('03/01/2000');
      InterfaceTestLog.value(name, 'kit.format.1', '02/29/2000', kitText1);
      expect(kitText1).assertEqual('02/29/2000');
      InterfaceTestLog.value(name, 'kit.format.2', '03/02/2000', kitText2);
      expect(kitText2).assertEqual('03/02/2000');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951868800000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951868800000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951782400000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951955200000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951955200000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '03/01/2000', runtimeText0);
      expect(runtimeText0).assertEqual('03/01/2000');
      InterfaceTestLog.value(name, 'runtime.format.1', '02/29/2000', runtimeText1);
      expect(runtimeText1).assertEqual('02/29/2000');
      InterfaceTestLog.value(name, 'runtime.format.2', '03/02/2000', runtimeText2);
      expect(runtimeText2).assertEqual('03/02/2000');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951868800000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951868800000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951782400000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951955200000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951955200000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0007
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0007';
      const input: string = 'en-US; instant=2023-02-28T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1677628799000;
      const kitDate0: Date = new Date(1677628799000);
      const kitDate1: Date = new Date(1677542399000);
      const kitDate2: Date = new Date(1677715199000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1677628799000);
      const runtimeDate1: Date = new Date(1677542399000);
      const runtimeDate2: Date = new Date(1677715199000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '02/28/2023', kitText0);
      expect(kitText0).assertEqual('02/28/2023');
      InterfaceTestLog.value(name, 'kit.format.1', '02/27/2023', kitText1);
      expect(kitText1).assertEqual('02/27/2023');
      InterfaceTestLog.value(name, 'kit.format.2', '03/01/2023', kitText2);
      expect(kitText2).assertEqual('03/01/2023');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1677628799000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1677628799000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1677542399000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1677542399000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1677715199000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1677715199000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '02/28/2023', runtimeText0);
      expect(runtimeText0).assertEqual('02/28/2023');
      InterfaceTestLog.value(name, 'runtime.format.1', '02/27/2023', runtimeText1);
      expect(runtimeText1).assertEqual('02/27/2023');
      InterfaceTestLog.value(name, 'runtime.format.2', '03/01/2023', runtimeText2);
      expect(runtimeText2).assertEqual('03/01/2023');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1677628799000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1677628799000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1677542399000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1677542399000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1677715199000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1677715199000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0008
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0008';
      const input: string = 'en-US; instant=2024-02-29T12:34:56.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1709210096000;
      const kitDate0: Date = new Date(1709210096000);
      const kitDate1: Date = new Date(1709123696000);
      const kitDate2: Date = new Date(1709296496000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1709210096000);
      const runtimeDate1: Date = new Date(1709123696000);
      const runtimeDate2: Date = new Date(1709296496000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '02/29/2024', kitText0);
      expect(kitText0).assertEqual('02/29/2024');
      InterfaceTestLog.value(name, 'kit.format.1', '02/28/2024', kitText1);
      expect(kitText1).assertEqual('02/28/2024');
      InterfaceTestLog.value(name, 'kit.format.2', '03/01/2024', kitText2);
      expect(kitText2).assertEqual('03/01/2024');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1709210096000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1709210096000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1709123696000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1709123696000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1709296496000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1709296496000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '02/29/2024', runtimeText0);
      expect(runtimeText0).assertEqual('02/29/2024');
      InterfaceTestLog.value(name, 'runtime.format.1', '02/28/2024', runtimeText1);
      expect(runtimeText1).assertEqual('02/28/2024');
      InterfaceTestLog.value(name, 'runtime.format.2', '03/01/2024', runtimeText2);
      expect(runtimeText2).assertEqual('03/01/2024');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1709210096000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1709210096000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1709123696000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1709123696000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1709296496000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1709296496000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0009
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0009';
      const input: string = 'en-US; instant=2024-04-30T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1714521599000;
      const kitDate0: Date = new Date(1714521599000);
      const kitDate1: Date = new Date(1714435199000);
      const kitDate2: Date = new Date(1714607999000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1714521599000);
      const runtimeDate1: Date = new Date(1714435199000);
      const runtimeDate2: Date = new Date(1714607999000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '04/30/2024', kitText0);
      expect(kitText0).assertEqual('04/30/2024');
      InterfaceTestLog.value(name, 'kit.format.1', '04/29/2024', kitText1);
      expect(kitText1).assertEqual('04/29/2024');
      InterfaceTestLog.value(name, 'kit.format.2', '05/01/2024', kitText2);
      expect(kitText2).assertEqual('05/01/2024');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1714521599000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1714521599000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1714435199000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1714435199000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1714607999000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1714607999000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '04/30/2024', runtimeText0);
      expect(runtimeText0).assertEqual('04/30/2024');
      InterfaceTestLog.value(name, 'runtime.format.1', '04/29/2024', runtimeText1);
      expect(runtimeText1).assertEqual('04/29/2024');
      InterfaceTestLog.value(name, 'runtime.format.2', '05/01/2024', runtimeText2);
      expect(runtimeText2).assertEqual('05/01/2024');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1714521599000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1714521599000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1714435199000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1714435199000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1714607999000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1714607999000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0010
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0010';
      const input: string = 'en-US; instant=2024-05-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1714521600000;
      const kitDate0: Date = new Date(1714521600000);
      const kitDate1: Date = new Date(1714435200000);
      const kitDate2: Date = new Date(1714608000000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1714521600000);
      const runtimeDate1: Date = new Date(1714435200000);
      const runtimeDate2: Date = new Date(1714608000000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '05/01/2024', kitText0);
      expect(kitText0).assertEqual('05/01/2024');
      InterfaceTestLog.value(name, 'kit.format.1', '04/30/2024', kitText1);
      expect(kitText1).assertEqual('04/30/2024');
      InterfaceTestLog.value(name, 'kit.format.2', '05/02/2024', kitText2);
      expect(kitText2).assertEqual('05/02/2024');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1714521600000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1714521600000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1714435200000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1714435200000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1714608000000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1714608000000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '05/01/2024', runtimeText0);
      expect(runtimeText0).assertEqual('05/01/2024');
      InterfaceTestLog.value(name, 'runtime.format.1', '04/30/2024', runtimeText1);
      expect(runtimeText1).assertEqual('04/30/2024');
      InterfaceTestLog.value(name, 'runtime.format.2', '05/02/2024', runtimeText2);
      expect(runtimeText2).assertEqual('05/02/2024');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1714521600000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1714521600000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1714435200000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1714435200000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1714608000000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1714608000000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0011
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0011';
      const input: string = 'en-US; instant=2024-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1735689599000;
      const kitDate0: Date = new Date(1735689599000);
      const kitDate1: Date = new Date(1735603199000);
      const kitDate2: Date = new Date(1735775999000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1735689599000);
      const runtimeDate1: Date = new Date(1735603199000);
      const runtimeDate2: Date = new Date(1735775999000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '12/31/2024', kitText0);
      expect(kitText0).assertEqual('12/31/2024');
      InterfaceTestLog.value(name, 'kit.format.1', '12/30/2024', kitText1);
      expect(kitText1).assertEqual('12/30/2024');
      InterfaceTestLog.value(name, 'kit.format.2', '01/01/2025', kitText2);
      expect(kitText2).assertEqual('01/01/2025');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1735689599000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1735689599000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1735603199000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1735603199000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1735775999000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1735775999000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '12/31/2024', runtimeText0);
      expect(runtimeText0).assertEqual('12/31/2024');
      InterfaceTestLog.value(name, 'runtime.format.1', '12/30/2024', runtimeText1);
      expect(runtimeText1).assertEqual('12/30/2024');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/01/2025', runtimeText2);
      expect(runtimeText2).assertEqual('01/01/2025');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1735689599000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1735689599000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1735603199000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1735603199000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1735775999000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1735775999000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0012
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0012';
      const input: string = 'en-US; instant=2100-03-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 4107542400000;
      const kitDate0: Date = new Date(4107542400000);
      const kitDate1: Date = new Date(4107456000000);
      const kitDate2: Date = new Date(4107628800000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(4107542400000);
      const runtimeDate1: Date = new Date(4107456000000);
      const runtimeDate2: Date = new Date(4107628800000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '03/01/2100', kitText0);
      expect(kitText0).assertEqual('03/01/2100');
      InterfaceTestLog.value(name, 'kit.format.1', '02/28/2100', kitText1);
      expect(kitText1).assertEqual('02/28/2100');
      InterfaceTestLog.value(name, 'kit.format.2', '03/02/2100', kitText2);
      expect(kitText2).assertEqual('03/02/2100');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 4107542400000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(4107542400000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 4107456000000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(4107456000000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 4107628800000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(4107628800000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '03/01/2100', runtimeText0);
      expect(runtimeText0).assertEqual('03/01/2100');
      InterfaceTestLog.value(name, 'runtime.format.1', '02/28/2100', runtimeText1);
      expect(runtimeText1).assertEqual('02/28/2100');
      InterfaceTestLog.value(name, 'runtime.format.2', '03/02/2100', runtimeText2);
      expect(runtimeText2).assertEqual('03/02/2100');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 4107542400000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(4107542400000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 4107456000000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(4107456000000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 4107628800000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(4107628800000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0013
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0013';
      const input: string = 'en-GB; instant=1969-12-31T23:59:59.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = -1000;
      const kitDate0: Date = new Date(-1000);
      const kitDate1: Date = new Date(-86401000);
      const kitDate2: Date = new Date(86399000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(-1000);
      const runtimeDate1: Date = new Date(-86401000);
      const runtimeDate2: Date = new Date(86399000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '31/12/69', kitText0);
      expect(kitText0).assertEqual('31/12/69');
      InterfaceTestLog.value(name, 'kit.format.1', '30/12/69', kitText1);
      expect(kitText1).assertEqual('30/12/69');
      InterfaceTestLog.value(name, 'kit.format.2', '01/01/70', kitText2);
      expect(kitText2).assertEqual('01/01/70');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', -1000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86401000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86399000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '31/12/69', runtimeText0);
      expect(runtimeText0).assertEqual('31/12/69');
      InterfaceTestLog.value(name, 'runtime.format.1', '30/12/69', runtimeText1);
      expect(runtimeText1).assertEqual('30/12/69');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/01/70', runtimeText2);
      expect(runtimeText2).assertEqual('01/01/70');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', -1000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86401000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86399000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0014
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0014';
      const input: string = 'en-GB; instant=1970-01-01T00:00:00.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 0;
      const kitDate0: Date = new Date(0);
      const kitDate1: Date = new Date(-86400000);
      const kitDate2: Date = new Date(86400000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(0);
      const runtimeDate1: Date = new Date(-86400000);
      const runtimeDate2: Date = new Date(86400000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '01/01/70', kitText0);
      expect(kitText0).assertEqual('01/01/70');
      InterfaceTestLog.value(name, 'kit.format.1', '31/12/69', kitText1);
      expect(kitText1).assertEqual('31/12/69');
      InterfaceTestLog.value(name, 'kit.format.2', '02/01/70', kitText2);
      expect(kitText2).assertEqual('02/01/70');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 0, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86400000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86400000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '01/01/70', runtimeText0);
      expect(runtimeText0).assertEqual('01/01/70');
      InterfaceTestLog.value(name, 'runtime.format.1', '31/12/69', runtimeText1);
      expect(runtimeText1).assertEqual('31/12/69');
      InterfaceTestLog.value(name, 'runtime.format.2', '02/01/70', runtimeText2);
      expect(runtimeText2).assertEqual('02/01/70');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 0, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86400000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86400000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0015
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0015';
      const input: string = 'en-GB; instant=1999-12-31T23:59:59.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 946684799000;
      const kitDate0: Date = new Date(946684799000);
      const kitDate1: Date = new Date(946598399000);
      const kitDate2: Date = new Date(946771199000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(946684799000);
      const runtimeDate1: Date = new Date(946598399000);
      const runtimeDate2: Date = new Date(946771199000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '31/12/99', kitText0);
      expect(kitText0).assertEqual('31/12/99');
      InterfaceTestLog.value(name, 'kit.format.1', '30/12/99', kitText1);
      expect(kitText1).assertEqual('30/12/99');
      InterfaceTestLog.value(name, 'kit.format.2', '01/01/00', kitText2);
      expect(kitText2).assertEqual('01/01/00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 946684799000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 946598399000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 946771199000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '31/12/99', runtimeText0);
      expect(runtimeText0).assertEqual('31/12/99');
      InterfaceTestLog.value(name, 'runtime.format.1', '30/12/99', runtimeText1);
      expect(runtimeText1).assertEqual('30/12/99');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/01/00', runtimeText2);
      expect(runtimeText2).assertEqual('01/01/00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 946684799000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 946598399000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 946771199000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0016
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0016';
      const input: string = 'en-GB; instant=2000-02-28T23:59:59.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951782399000;
      const kitDate0: Date = new Date(951782399000);
      const kitDate1: Date = new Date(951695999000);
      const kitDate2: Date = new Date(951868799000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951782399000);
      const runtimeDate1: Date = new Date(951695999000);
      const runtimeDate2: Date = new Date(951868799000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '28/02/00', kitText0);
      expect(kitText0).assertEqual('28/02/00');
      InterfaceTestLog.value(name, 'kit.format.1', '27/02/00', kitText1);
      expect(kitText1).assertEqual('27/02/00');
      InterfaceTestLog.value(name, 'kit.format.2', '29/02/00', kitText2);
      expect(kitText2).assertEqual('29/02/00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951782399000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951782399000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951695999000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951695999000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951868799000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951868799000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '28/02/00', runtimeText0);
      expect(runtimeText0).assertEqual('28/02/00');
      InterfaceTestLog.value(name, 'runtime.format.1', '27/02/00', runtimeText1);
      expect(runtimeText1).assertEqual('27/02/00');
      InterfaceTestLog.value(name, 'runtime.format.2', '29/02/00', runtimeText2);
      expect(runtimeText2).assertEqual('29/02/00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951782399000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951782399000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951695999000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951695999000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951868799000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951868799000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0017
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0017';
      const input: string = 'en-GB; instant=2000-02-29T00:00:00.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951782400000;
      const kitDate0: Date = new Date(951782400000);
      const kitDate1: Date = new Date(951696000000);
      const kitDate2: Date = new Date(951868800000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951782400000);
      const runtimeDate1: Date = new Date(951696000000);
      const runtimeDate2: Date = new Date(951868800000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '29/02/00', kitText0);
      expect(kitText0).assertEqual('29/02/00');
      InterfaceTestLog.value(name, 'kit.format.1', '28/02/00', kitText1);
      expect(kitText1).assertEqual('28/02/00');
      InterfaceTestLog.value(name, 'kit.format.2', '01/03/00', kitText2);
      expect(kitText2).assertEqual('01/03/00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951782400000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951696000000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951696000000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951868800000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951868800000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '29/02/00', runtimeText0);
      expect(runtimeText0).assertEqual('29/02/00');
      InterfaceTestLog.value(name, 'runtime.format.1', '28/02/00', runtimeText1);
      expect(runtimeText1).assertEqual('28/02/00');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/03/00', runtimeText2);
      expect(runtimeText2).assertEqual('01/03/00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951782400000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951696000000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951696000000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951868800000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951868800000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0018
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0018';
      const input: string = 'en-GB; instant=2000-03-01T00:00:00.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951868800000;
      const kitDate0: Date = new Date(951868800000);
      const kitDate1: Date = new Date(951782400000);
      const kitDate2: Date = new Date(951955200000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951868800000);
      const runtimeDate1: Date = new Date(951782400000);
      const runtimeDate2: Date = new Date(951955200000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '01/03/00', kitText0);
      expect(kitText0).assertEqual('01/03/00');
      InterfaceTestLog.value(name, 'kit.format.1', '29/02/00', kitText1);
      expect(kitText1).assertEqual('29/02/00');
      InterfaceTestLog.value(name, 'kit.format.2', '02/03/00', kitText2);
      expect(kitText2).assertEqual('02/03/00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951868800000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951868800000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951782400000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951955200000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951955200000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '01/03/00', runtimeText0);
      expect(runtimeText0).assertEqual('01/03/00');
      InterfaceTestLog.value(name, 'runtime.format.1', '29/02/00', runtimeText1);
      expect(runtimeText1).assertEqual('29/02/00');
      InterfaceTestLog.value(name, 'runtime.format.2', '02/03/00', runtimeText2);
      expect(runtimeText2).assertEqual('02/03/00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951868800000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951868800000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951782400000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951955200000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951955200000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0019
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0019';
      const input: string = 'en-GB; instant=2023-02-28T23:59:59.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1677628799000;
      const kitDate0: Date = new Date(1677628799000);
      const kitDate1: Date = new Date(1677542399000);
      const kitDate2: Date = new Date(1677715199000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1677628799000);
      const runtimeDate1: Date = new Date(1677542399000);
      const runtimeDate2: Date = new Date(1677715199000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '28/02/23', kitText0);
      expect(kitText0).assertEqual('28/02/23');
      InterfaceTestLog.value(name, 'kit.format.1', '27/02/23', kitText1);
      expect(kitText1).assertEqual('27/02/23');
      InterfaceTestLog.value(name, 'kit.format.2', '01/03/23', kitText2);
      expect(kitText2).assertEqual('01/03/23');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1677628799000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1677628799000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1677542399000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1677542399000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1677715199000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1677715199000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '28/02/23', runtimeText0);
      expect(runtimeText0).assertEqual('28/02/23');
      InterfaceTestLog.value(name, 'runtime.format.1', '27/02/23', runtimeText1);
      expect(runtimeText1).assertEqual('27/02/23');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/03/23', runtimeText2);
      expect(runtimeText2).assertEqual('01/03/23');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1677628799000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1677628799000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1677542399000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1677542399000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1677715199000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1677715199000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0020
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0020';
      const input: string = 'en-GB; instant=2024-02-29T12:34:56.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1709210096000;
      const kitDate0: Date = new Date(1709210096000);
      const kitDate1: Date = new Date(1709123696000);
      const kitDate2: Date = new Date(1709296496000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1709210096000);
      const runtimeDate1: Date = new Date(1709123696000);
      const runtimeDate2: Date = new Date(1709296496000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '29/02/24', kitText0);
      expect(kitText0).assertEqual('29/02/24');
      InterfaceTestLog.value(name, 'kit.format.1', '28/02/24', kitText1);
      expect(kitText1).assertEqual('28/02/24');
      InterfaceTestLog.value(name, 'kit.format.2', '01/03/24', kitText2);
      expect(kitText2).assertEqual('01/03/24');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1709210096000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1709210096000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1709123696000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1709123696000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1709296496000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1709296496000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '29/02/24', runtimeText0);
      expect(runtimeText0).assertEqual('29/02/24');
      InterfaceTestLog.value(name, 'runtime.format.1', '28/02/24', runtimeText1);
      expect(runtimeText1).assertEqual('28/02/24');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/03/24', runtimeText2);
      expect(runtimeText2).assertEqual('01/03/24');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1709210096000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1709210096000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1709123696000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1709123696000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1709296496000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1709296496000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0021
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0021';
      const input: string = 'en-GB; instant=2024-04-30T23:59:59.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1714521599000;
      const kitDate0: Date = new Date(1714521599000);
      const kitDate1: Date = new Date(1714435199000);
      const kitDate2: Date = new Date(1714607999000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1714521599000);
      const runtimeDate1: Date = new Date(1714435199000);
      const runtimeDate2: Date = new Date(1714607999000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '30/04/24', kitText0);
      expect(kitText0).assertEqual('30/04/24');
      InterfaceTestLog.value(name, 'kit.format.1', '29/04/24', kitText1);
      expect(kitText1).assertEqual('29/04/24');
      InterfaceTestLog.value(name, 'kit.format.2', '01/05/24', kitText2);
      expect(kitText2).assertEqual('01/05/24');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1714521599000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1714521599000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1714435199000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1714435199000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1714607999000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1714607999000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '30/04/24', runtimeText0);
      expect(runtimeText0).assertEqual('30/04/24');
      InterfaceTestLog.value(name, 'runtime.format.1', '29/04/24', runtimeText1);
      expect(runtimeText1).assertEqual('29/04/24');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/05/24', runtimeText2);
      expect(runtimeText2).assertEqual('01/05/24');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1714521599000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1714521599000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1714435199000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1714435199000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1714607999000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1714607999000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0022
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0022';
      const input: string = 'en-GB; instant=2024-05-01T00:00:00.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1714521600000;
      const kitDate0: Date = new Date(1714521600000);
      const kitDate1: Date = new Date(1714435200000);
      const kitDate2: Date = new Date(1714608000000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1714521600000);
      const runtimeDate1: Date = new Date(1714435200000);
      const runtimeDate2: Date = new Date(1714608000000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '01/05/24', kitText0);
      expect(kitText0).assertEqual('01/05/24');
      InterfaceTestLog.value(name, 'kit.format.1', '30/04/24', kitText1);
      expect(kitText1).assertEqual('30/04/24');
      InterfaceTestLog.value(name, 'kit.format.2', '02/05/24', kitText2);
      expect(kitText2).assertEqual('02/05/24');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1714521600000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1714521600000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1714435200000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1714435200000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1714608000000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1714608000000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '01/05/24', runtimeText0);
      expect(runtimeText0).assertEqual('01/05/24');
      InterfaceTestLog.value(name, 'runtime.format.1', '30/04/24', runtimeText1);
      expect(runtimeText1).assertEqual('30/04/24');
      InterfaceTestLog.value(name, 'runtime.format.2', '02/05/24', runtimeText2);
      expect(runtimeText2).assertEqual('02/05/24');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1714521600000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1714521600000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1714435200000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1714435200000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1714608000000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1714608000000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0023
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0023';
      const input: string = 'en-GB; instant=2024-12-31T23:59:59.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1735689599000;
      const kitDate0: Date = new Date(1735689599000);
      const kitDate1: Date = new Date(1735603199000);
      const kitDate2: Date = new Date(1735775999000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1735689599000);
      const runtimeDate1: Date = new Date(1735603199000);
      const runtimeDate2: Date = new Date(1735775999000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '31/12/24', kitText0);
      expect(kitText0).assertEqual('31/12/24');
      InterfaceTestLog.value(name, 'kit.format.1', '30/12/24', kitText1);
      expect(kitText1).assertEqual('30/12/24');
      InterfaceTestLog.value(name, 'kit.format.2', '01/01/25', kitText2);
      expect(kitText2).assertEqual('01/01/25');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1735689599000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1735689599000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1735603199000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1735603199000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1735775999000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1735775999000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '31/12/24', runtimeText0);
      expect(runtimeText0).assertEqual('31/12/24');
      InterfaceTestLog.value(name, 'runtime.format.1', '30/12/24', runtimeText1);
      expect(runtimeText1).assertEqual('30/12/24');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/01/25', runtimeText2);
      expect(runtimeText2).assertEqual('01/01/25');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1735689599000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1735689599000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1735603199000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1735603199000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1735775999000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1735775999000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0024
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0024';
      const input: string = 'en-GB; instant=2100-03-01T00:00:00.000Z; options={"year":"2-digit","month":"' +
        'numeric","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: '2-digit', month: 'numeric', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"2-digit","month":"numeric","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 4107542400000;
      const kitDate0: Date = new Date(4107542400000);
      const kitDate1: Date = new Date(4107456000000);
      const kitDate2: Date = new Date(4107628800000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(4107542400000);
      const runtimeDate1: Date = new Date(4107456000000);
      const runtimeDate2: Date = new Date(4107628800000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '01/03/00', kitText0);
      expect(kitText0).assertEqual('01/03/00');
      InterfaceTestLog.value(name, 'kit.format.1', '28/02/00', kitText1);
      expect(kitText1).assertEqual('28/02/00');
      InterfaceTestLog.value(name, 'kit.format.2', '02/03/00', kitText2);
      expect(kitText2).assertEqual('02/03/00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 4107542400000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(4107542400000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 4107456000000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(4107456000000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 4107628800000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(4107628800000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '01/03/00', runtimeText0);
      expect(runtimeText0).assertEqual('01/03/00');
      InterfaceTestLog.value(name, 'runtime.format.1', '28/02/00', runtimeText1);
      expect(runtimeText1).assertEqual('28/02/00');
      InterfaceTestLog.value(name, 'runtime.format.2', '02/03/00', runtimeText2);
      expect(runtimeText2).assertEqual('02/03/00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 4107542400000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(4107542400000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 4107456000000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(4107456000000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 4107628800000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(4107628800000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0025
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0025
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0025';
      const input: string = 'en-US; instant=1969-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = -1000;
      const kitDate0: Date = new Date(-1000);
      const kitDate1: Date = new Date(-86401000);
      const kitDate2: Date = new Date(86399000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(-1000);
      const runtimeDate1: Date = new Date(-86401000);
      const runtimeDate2: Date = new Date(86399000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Dec 31, 1969', kitText0);
      expect(kitText0).assertEqual('Dec 31, 1969');
      InterfaceTestLog.value(name, 'kit.format.1', 'Dec 30, 1969', kitText1);
      expect(kitText1).assertEqual('Dec 30, 1969');
      InterfaceTestLog.value(name, 'kit.format.2', 'Jan 1, 1970', kitText2);
      expect(kitText2).assertEqual('Jan 1, 1970');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', -1000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86401000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86399000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Dec 31, 1969', runtimeText0);
      expect(runtimeText0).assertEqual('Dec 31, 1969');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Dec 30, 1969', runtimeText1);
      expect(runtimeText1).assertEqual('Dec 30, 1969');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Jan 1, 1970', runtimeText2);
      expect(runtimeText2).assertEqual('Jan 1, 1970');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', -1000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86401000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86399000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0026
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0026
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0026';
      const input: string = 'en-US; instant=1970-01-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 0;
      const kitDate0: Date = new Date(0);
      const kitDate1: Date = new Date(-86400000);
      const kitDate2: Date = new Date(86400000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(0);
      const runtimeDate1: Date = new Date(-86400000);
      const runtimeDate2: Date = new Date(86400000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Jan 1, 1970', kitText0);
      expect(kitText0).assertEqual('Jan 1, 1970');
      InterfaceTestLog.value(name, 'kit.format.1', 'Dec 31, 1969', kitText1);
      expect(kitText1).assertEqual('Dec 31, 1969');
      InterfaceTestLog.value(name, 'kit.format.2', 'Jan 2, 1970', kitText2);
      expect(kitText2).assertEqual('Jan 2, 1970');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 0, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86400000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86400000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Jan 1, 1970', runtimeText0);
      expect(runtimeText0).assertEqual('Jan 1, 1970');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Dec 31, 1969', runtimeText1);
      expect(runtimeText1).assertEqual('Dec 31, 1969');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Jan 2, 1970', runtimeText2);
      expect(runtimeText2).assertEqual('Jan 2, 1970');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 0, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86400000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86400000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0027
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0027
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0027';
      const input: string = 'en-US; instant=1999-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 946684799000;
      const kitDate0: Date = new Date(946684799000);
      const kitDate1: Date = new Date(946598399000);
      const kitDate2: Date = new Date(946771199000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(946684799000);
      const runtimeDate1: Date = new Date(946598399000);
      const runtimeDate2: Date = new Date(946771199000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Dec 31, 1999', kitText0);
      expect(kitText0).assertEqual('Dec 31, 1999');
      InterfaceTestLog.value(name, 'kit.format.1', 'Dec 30, 1999', kitText1);
      expect(kitText1).assertEqual('Dec 30, 1999');
      InterfaceTestLog.value(name, 'kit.format.2', 'Jan 1, 2000', kitText2);
      expect(kitText2).assertEqual('Jan 1, 2000');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 946684799000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 946598399000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 946771199000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Dec 31, 1999', runtimeText0);
      expect(runtimeText0).assertEqual('Dec 31, 1999');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Dec 30, 1999', runtimeText1);
      expect(runtimeText1).assertEqual('Dec 30, 1999');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Jan 1, 2000', runtimeText2);
      expect(runtimeText2).assertEqual('Jan 1, 2000');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 946684799000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 946598399000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 946771199000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0028
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0028
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0028';
      const input: string = 'en-US; instant=2000-02-28T23:59:59.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951782399000;
      const kitDate0: Date = new Date(951782399000);
      const kitDate1: Date = new Date(951695999000);
      const kitDate2: Date = new Date(951868799000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951782399000);
      const runtimeDate1: Date = new Date(951695999000);
      const runtimeDate2: Date = new Date(951868799000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Feb 28, 2000', kitText0);
      expect(kitText0).assertEqual('Feb 28, 2000');
      InterfaceTestLog.value(name, 'kit.format.1', 'Feb 27, 2000', kitText1);
      expect(kitText1).assertEqual('Feb 27, 2000');
      InterfaceTestLog.value(name, 'kit.format.2', 'Feb 29, 2000', kitText2);
      expect(kitText2).assertEqual('Feb 29, 2000');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951782399000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951782399000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951695999000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951695999000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951868799000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951868799000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Feb 28, 2000', runtimeText0);
      expect(runtimeText0).assertEqual('Feb 28, 2000');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Feb 27, 2000', runtimeText1);
      expect(runtimeText1).assertEqual('Feb 27, 2000');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Feb 29, 2000', runtimeText2);
      expect(runtimeText2).assertEqual('Feb 29, 2000');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951782399000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951782399000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951695999000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951695999000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951868799000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951868799000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0029
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0029
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0029';
      const input: string = 'en-US; instant=2000-02-29T00:00:00.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951782400000;
      const kitDate0: Date = new Date(951782400000);
      const kitDate1: Date = new Date(951696000000);
      const kitDate2: Date = new Date(951868800000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951782400000);
      const runtimeDate1: Date = new Date(951696000000);
      const runtimeDate2: Date = new Date(951868800000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Feb 29, 2000', kitText0);
      expect(kitText0).assertEqual('Feb 29, 2000');
      InterfaceTestLog.value(name, 'kit.format.1', 'Feb 28, 2000', kitText1);
      expect(kitText1).assertEqual('Feb 28, 2000');
      InterfaceTestLog.value(name, 'kit.format.2', 'Mar 1, 2000', kitText2);
      expect(kitText2).assertEqual('Mar 1, 2000');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951782400000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951696000000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951696000000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951868800000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951868800000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Feb 29, 2000', runtimeText0);
      expect(runtimeText0).assertEqual('Feb 29, 2000');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Feb 28, 2000', runtimeText1);
      expect(runtimeText1).assertEqual('Feb 28, 2000');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Mar 1, 2000', runtimeText2);
      expect(runtimeText2).assertEqual('Mar 1, 2000');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951782400000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951696000000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951696000000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951868800000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951868800000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0030
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0030
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0030';
      const input: string = 'en-US; instant=2000-03-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951868800000;
      const kitDate0: Date = new Date(951868800000);
      const kitDate1: Date = new Date(951782400000);
      const kitDate2: Date = new Date(951955200000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951868800000);
      const runtimeDate1: Date = new Date(951782400000);
      const runtimeDate2: Date = new Date(951955200000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Mar 1, 2000', kitText0);
      expect(kitText0).assertEqual('Mar 1, 2000');
      InterfaceTestLog.value(name, 'kit.format.1', 'Feb 29, 2000', kitText1);
      expect(kitText1).assertEqual('Feb 29, 2000');
      InterfaceTestLog.value(name, 'kit.format.2', 'Mar 2, 2000', kitText2);
      expect(kitText2).assertEqual('Mar 2, 2000');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951868800000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951868800000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951782400000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951955200000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951955200000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Mar 1, 2000', runtimeText0);
      expect(runtimeText0).assertEqual('Mar 1, 2000');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Feb 29, 2000', runtimeText1);
      expect(runtimeText1).assertEqual('Feb 29, 2000');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Mar 2, 2000', runtimeText2);
      expect(runtimeText2).assertEqual('Mar 2, 2000');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951868800000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951868800000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951782400000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951955200000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951955200000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0031
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0031
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0031';
      const input: string = 'en-US; instant=2023-02-28T23:59:59.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1677628799000;
      const kitDate0: Date = new Date(1677628799000);
      const kitDate1: Date = new Date(1677542399000);
      const kitDate2: Date = new Date(1677715199000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1677628799000);
      const runtimeDate1: Date = new Date(1677542399000);
      const runtimeDate2: Date = new Date(1677715199000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Feb 28, 2023', kitText0);
      expect(kitText0).assertEqual('Feb 28, 2023');
      InterfaceTestLog.value(name, 'kit.format.1', 'Feb 27, 2023', kitText1);
      expect(kitText1).assertEqual('Feb 27, 2023');
      InterfaceTestLog.value(name, 'kit.format.2', 'Mar 1, 2023', kitText2);
      expect(kitText2).assertEqual('Mar 1, 2023');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1677628799000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1677628799000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1677542399000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1677542399000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1677715199000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1677715199000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Feb 28, 2023', runtimeText0);
      expect(runtimeText0).assertEqual('Feb 28, 2023');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Feb 27, 2023', runtimeText1);
      expect(runtimeText1).assertEqual('Feb 27, 2023');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Mar 1, 2023', runtimeText2);
      expect(runtimeText2).assertEqual('Mar 1, 2023');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1677628799000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1677628799000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1677542399000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1677542399000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1677715199000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1677715199000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0032
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0032
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0032';
      const input: string = 'en-US; instant=2024-02-29T12:34:56.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1709210096000;
      const kitDate0: Date = new Date(1709210096000);
      const kitDate1: Date = new Date(1709123696000);
      const kitDate2: Date = new Date(1709296496000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1709210096000);
      const runtimeDate1: Date = new Date(1709123696000);
      const runtimeDate2: Date = new Date(1709296496000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Feb 29, 2024', kitText0);
      expect(kitText0).assertEqual('Feb 29, 2024');
      InterfaceTestLog.value(name, 'kit.format.1', 'Feb 28, 2024', kitText1);
      expect(kitText1).assertEqual('Feb 28, 2024');
      InterfaceTestLog.value(name, 'kit.format.2', 'Mar 1, 2024', kitText2);
      expect(kitText2).assertEqual('Mar 1, 2024');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1709210096000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1709210096000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1709123696000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1709123696000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1709296496000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1709296496000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Feb 29, 2024', runtimeText0);
      expect(runtimeText0).assertEqual('Feb 29, 2024');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Feb 28, 2024', runtimeText1);
      expect(runtimeText1).assertEqual('Feb 28, 2024');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Mar 1, 2024', runtimeText2);
      expect(runtimeText2).assertEqual('Mar 1, 2024');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1709210096000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1709210096000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1709123696000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1709123696000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1709296496000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1709296496000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0033
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0033
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0033';
      const input: string = 'en-US; instant=2024-04-30T23:59:59.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1714521599000;
      const kitDate0: Date = new Date(1714521599000);
      const kitDate1: Date = new Date(1714435199000);
      const kitDate2: Date = new Date(1714607999000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1714521599000);
      const runtimeDate1: Date = new Date(1714435199000);
      const runtimeDate2: Date = new Date(1714607999000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Apr 30, 2024', kitText0);
      expect(kitText0).assertEqual('Apr 30, 2024');
      InterfaceTestLog.value(name, 'kit.format.1', 'Apr 29, 2024', kitText1);
      expect(kitText1).assertEqual('Apr 29, 2024');
      InterfaceTestLog.value(name, 'kit.format.2', 'May 1, 2024', kitText2);
      expect(kitText2).assertEqual('May 1, 2024');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1714521599000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1714521599000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1714435199000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1714435199000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1714607999000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1714607999000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Apr 30, 2024', runtimeText0);
      expect(runtimeText0).assertEqual('Apr 30, 2024');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Apr 29, 2024', runtimeText1);
      expect(runtimeText1).assertEqual('Apr 29, 2024');
      InterfaceTestLog.value(name, 'runtime.format.2', 'May 1, 2024', runtimeText2);
      expect(runtimeText2).assertEqual('May 1, 2024');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1714521599000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1714521599000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1714435199000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1714435199000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1714607999000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1714607999000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0034
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0034
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0034';
      const input: string = 'en-US; instant=2024-05-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1714521600000;
      const kitDate0: Date = new Date(1714521600000);
      const kitDate1: Date = new Date(1714435200000);
      const kitDate2: Date = new Date(1714608000000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1714521600000);
      const runtimeDate1: Date = new Date(1714435200000);
      const runtimeDate2: Date = new Date(1714608000000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'May 1, 2024', kitText0);
      expect(kitText0).assertEqual('May 1, 2024');
      InterfaceTestLog.value(name, 'kit.format.1', 'Apr 30, 2024', kitText1);
      expect(kitText1).assertEqual('Apr 30, 2024');
      InterfaceTestLog.value(name, 'kit.format.2', 'May 2, 2024', kitText2);
      expect(kitText2).assertEqual('May 2, 2024');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1714521600000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1714521600000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1714435200000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1714435200000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1714608000000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1714608000000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'May 1, 2024', runtimeText0);
      expect(runtimeText0).assertEqual('May 1, 2024');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Apr 30, 2024', runtimeText1);
      expect(runtimeText1).assertEqual('Apr 30, 2024');
      InterfaceTestLog.value(name, 'runtime.format.2', 'May 2, 2024', runtimeText2);
      expect(runtimeText2).assertEqual('May 2, 2024');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1714521600000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1714521600000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1714435200000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1714435200000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1714608000000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1714608000000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0035
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0035
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0035';
      const input: string = 'en-US; instant=2024-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1735689599000;
      const kitDate0: Date = new Date(1735689599000);
      const kitDate1: Date = new Date(1735603199000);
      const kitDate2: Date = new Date(1735775999000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1735689599000);
      const runtimeDate1: Date = new Date(1735603199000);
      const runtimeDate2: Date = new Date(1735775999000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Dec 31, 2024', kitText0);
      expect(kitText0).assertEqual('Dec 31, 2024');
      InterfaceTestLog.value(name, 'kit.format.1', 'Dec 30, 2024', kitText1);
      expect(kitText1).assertEqual('Dec 30, 2024');
      InterfaceTestLog.value(name, 'kit.format.2', 'Jan 1, 2025', kitText2);
      expect(kitText2).assertEqual('Jan 1, 2025');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1735689599000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1735689599000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1735603199000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1735603199000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1735775999000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1735775999000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Dec 31, 2024', runtimeText0);
      expect(runtimeText0).assertEqual('Dec 31, 2024');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Dec 30, 2024', runtimeText1);
      expect(runtimeText1).assertEqual('Dec 30, 2024');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Jan 1, 2025', runtimeText2);
      expect(runtimeText2).assertEqual('Jan 1, 2025');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1735689599000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1735689599000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1735603199000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1735603199000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1735775999000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1735775999000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0036
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0036
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0036';
      const input: string = 'en-US; instant=2100-03-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        'short","day":"numeric","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'short', day: 'numeric', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"short","day":"numeric","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 4107542400000;
      const kitDate0: Date = new Date(4107542400000);
      const kitDate1: Date = new Date(4107456000000);
      const kitDate2: Date = new Date(4107628800000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(4107542400000);
      const runtimeDate1: Date = new Date(4107456000000);
      const runtimeDate2: Date = new Date(4107628800000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Mar 1, 2100', kitText0);
      expect(kitText0).assertEqual('Mar 1, 2100');
      InterfaceTestLog.value(name, 'kit.format.1', 'Feb 28, 2100', kitText1);
      expect(kitText1).assertEqual('Feb 28, 2100');
      InterfaceTestLog.value(name, 'kit.format.2', 'Mar 2, 2100', kitText2);
      expect(kitText2).assertEqual('Mar 2, 2100');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 4107542400000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(4107542400000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 4107456000000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(4107456000000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 4107628800000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(4107628800000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Mar 1, 2100', runtimeText0);
      expect(runtimeText0).assertEqual('Mar 1, 2100');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Feb 28, 2100', runtimeText1);
      expect(runtimeText1).assertEqual('Feb 28, 2100');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Mar 2, 2100', runtimeText2);
      expect(runtimeText2).assertEqual('Mar 2, 2100');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 4107542400000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(4107542400000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 4107456000000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(4107456000000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 4107628800000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(4107628800000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0037
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0037
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0037';
      const input: string = 'en-GB; instant=1969-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = -1000;
      const kitDate0: Date = new Date(-1000);
      const kitDate1: Date = new Date(-86401000);
      const kitDate2: Date = new Date(86399000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(-1000);
      const runtimeDate1: Date = new Date(-86401000);
      const runtimeDate2: Date = new Date(86399000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '31/12/1969, 23:59:59', kitText0);
      expect(kitText0).assertEqual('31/12/1969, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.1', '30/12/1969, 23:59:59', kitText1);
      expect(kitText1).assertEqual('30/12/1969, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.2', '01/01/1970, 23:59:59', kitText2);
      expect(kitText2).assertEqual('01/01/1970, 23:59:59');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', -1000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86401000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86399000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '31/12/1969, 23:59:59', runtimeText0);
      expect(runtimeText0).assertEqual('31/12/1969, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.1', '30/12/1969, 23:59:59', runtimeText1);
      expect(runtimeText1).assertEqual('30/12/1969, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/01/1970, 23:59:59', runtimeText2);
      expect(runtimeText2).assertEqual('01/01/1970, 23:59:59');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', -1000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86401000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86399000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0038
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0038
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0038';
      const input: string = 'en-GB; instant=1970-01-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 0;
      const kitDate0: Date = new Date(0);
      const kitDate1: Date = new Date(-86400000);
      const kitDate2: Date = new Date(86400000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(0);
      const runtimeDate1: Date = new Date(-86400000);
      const runtimeDate2: Date = new Date(86400000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '01/01/1970, 00:00:00', kitText0);
      expect(kitText0).assertEqual('01/01/1970, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.1', '31/12/1969, 00:00:00', kitText1);
      expect(kitText1).assertEqual('31/12/1969, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.2', '02/01/1970, 00:00:00', kitText2);
      expect(kitText2).assertEqual('02/01/1970, 00:00:00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 0, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86400000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86400000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '01/01/1970, 00:00:00', runtimeText0);
      expect(runtimeText0).assertEqual('01/01/1970, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.1', '31/12/1969, 00:00:00', runtimeText1);
      expect(runtimeText1).assertEqual('31/12/1969, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.2', '02/01/1970, 00:00:00', runtimeText2);
      expect(runtimeText2).assertEqual('02/01/1970, 00:00:00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 0, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86400000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86400000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0039
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0039
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0039';
      const input: string = 'en-GB; instant=1999-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 946684799000;
      const kitDate0: Date = new Date(946684799000);
      const kitDate1: Date = new Date(946598399000);
      const kitDate2: Date = new Date(946771199000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(946684799000);
      const runtimeDate1: Date = new Date(946598399000);
      const runtimeDate2: Date = new Date(946771199000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '31/12/1999, 23:59:59', kitText0);
      expect(kitText0).assertEqual('31/12/1999, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.1', '30/12/1999, 23:59:59', kitText1);
      expect(kitText1).assertEqual('30/12/1999, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.2', '01/01/2000, 23:59:59', kitText2);
      expect(kitText2).assertEqual('01/01/2000, 23:59:59');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 946684799000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 946598399000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 946771199000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '31/12/1999, 23:59:59', runtimeText0);
      expect(runtimeText0).assertEqual('31/12/1999, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.1', '30/12/1999, 23:59:59', runtimeText1);
      expect(runtimeText1).assertEqual('30/12/1999, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/01/2000, 23:59:59', runtimeText2);
      expect(runtimeText2).assertEqual('01/01/2000, 23:59:59');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 946684799000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 946598399000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 946771199000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0040
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0040
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0040';
      const input: string = 'en-GB; instant=2000-02-28T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951782399000;
      const kitDate0: Date = new Date(951782399000);
      const kitDate1: Date = new Date(951695999000);
      const kitDate2: Date = new Date(951868799000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951782399000);
      const runtimeDate1: Date = new Date(951695999000);
      const runtimeDate2: Date = new Date(951868799000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '28/02/2000, 23:59:59', kitText0);
      expect(kitText0).assertEqual('28/02/2000, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.1', '27/02/2000, 23:59:59', kitText1);
      expect(kitText1).assertEqual('27/02/2000, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.2', '29/02/2000, 23:59:59', kitText2);
      expect(kitText2).assertEqual('29/02/2000, 23:59:59');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951782399000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951782399000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951695999000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951695999000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951868799000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951868799000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '28/02/2000, 23:59:59', runtimeText0);
      expect(runtimeText0).assertEqual('28/02/2000, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.1', '27/02/2000, 23:59:59', runtimeText1);
      expect(runtimeText1).assertEqual('27/02/2000, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.2', '29/02/2000, 23:59:59', runtimeText2);
      expect(runtimeText2).assertEqual('29/02/2000, 23:59:59');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951782399000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951782399000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951695999000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951695999000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951868799000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951868799000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0041
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0041
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0041';
      const input: string = 'en-GB; instant=2000-02-29T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951782400000;
      const kitDate0: Date = new Date(951782400000);
      const kitDate1: Date = new Date(951696000000);
      const kitDate2: Date = new Date(951868800000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951782400000);
      const runtimeDate1: Date = new Date(951696000000);
      const runtimeDate2: Date = new Date(951868800000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '29/02/2000, 00:00:00', kitText0);
      expect(kitText0).assertEqual('29/02/2000, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.1', '28/02/2000, 00:00:00', kitText1);
      expect(kitText1).assertEqual('28/02/2000, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.2', '01/03/2000, 00:00:00', kitText2);
      expect(kitText2).assertEqual('01/03/2000, 00:00:00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951782400000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951696000000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951696000000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951868800000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951868800000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '29/02/2000, 00:00:00', runtimeText0);
      expect(runtimeText0).assertEqual('29/02/2000, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.1', '28/02/2000, 00:00:00', runtimeText1);
      expect(runtimeText1).assertEqual('28/02/2000, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/03/2000, 00:00:00', runtimeText2);
      expect(runtimeText2).assertEqual('01/03/2000, 00:00:00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951782400000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951696000000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951696000000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951868800000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951868800000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0042
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0042
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0042';
      const input: string = 'en-GB; instant=2000-03-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 951868800000;
      const kitDate0: Date = new Date(951868800000);
      const kitDate1: Date = new Date(951782400000);
      const kitDate2: Date = new Date(951955200000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(951868800000);
      const runtimeDate1: Date = new Date(951782400000);
      const runtimeDate2: Date = new Date(951955200000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '01/03/2000, 00:00:00', kitText0);
      expect(kitText0).assertEqual('01/03/2000, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.1', '29/02/2000, 00:00:00', kitText1);
      expect(kitText1).assertEqual('29/02/2000, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.2', '02/03/2000, 00:00:00', kitText2);
      expect(kitText2).assertEqual('02/03/2000, 00:00:00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 951868800000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(951868800000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 951782400000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 951955200000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(951955200000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '01/03/2000, 00:00:00', runtimeText0);
      expect(runtimeText0).assertEqual('01/03/2000, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.1', '29/02/2000, 00:00:00', runtimeText1);
      expect(runtimeText1).assertEqual('29/02/2000, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.2', '02/03/2000, 00:00:00', runtimeText2);
      expect(runtimeText2).assertEqual('02/03/2000, 00:00:00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 951868800000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(951868800000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 951782400000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(951782400000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 951955200000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(951955200000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0043
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0043
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0043';
      const input: string = 'en-GB; instant=2023-02-28T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1677628799000;
      const kitDate0: Date = new Date(1677628799000);
      const kitDate1: Date = new Date(1677542399000);
      const kitDate2: Date = new Date(1677715199000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1677628799000);
      const runtimeDate1: Date = new Date(1677542399000);
      const runtimeDate2: Date = new Date(1677715199000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '28/02/2023, 23:59:59', kitText0);
      expect(kitText0).assertEqual('28/02/2023, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.1', '27/02/2023, 23:59:59', kitText1);
      expect(kitText1).assertEqual('27/02/2023, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.2', '01/03/2023, 23:59:59', kitText2);
      expect(kitText2).assertEqual('01/03/2023, 23:59:59');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1677628799000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1677628799000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1677542399000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1677542399000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1677715199000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1677715199000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '28/02/2023, 23:59:59', runtimeText0);
      expect(runtimeText0).assertEqual('28/02/2023, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.1', '27/02/2023, 23:59:59', runtimeText1);
      expect(runtimeText1).assertEqual('27/02/2023, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/03/2023, 23:59:59', runtimeText2);
      expect(runtimeText2).assertEqual('01/03/2023, 23:59:59');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1677628799000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1677628799000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1677542399000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1677542399000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1677715199000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1677715199000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0044
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0044
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0044';
      const input: string = 'en-GB; instant=2024-02-29T12:34:56.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1709210096000;
      const kitDate0: Date = new Date(1709210096000);
      const kitDate1: Date = new Date(1709123696000);
      const kitDate2: Date = new Date(1709296496000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1709210096000);
      const runtimeDate1: Date = new Date(1709123696000);
      const runtimeDate2: Date = new Date(1709296496000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '29/02/2024, 12:34:56', kitText0);
      expect(kitText0).assertEqual('29/02/2024, 12:34:56');
      InterfaceTestLog.value(name, 'kit.format.1', '28/02/2024, 12:34:56', kitText1);
      expect(kitText1).assertEqual('28/02/2024, 12:34:56');
      InterfaceTestLog.value(name, 'kit.format.2', '01/03/2024, 12:34:56', kitText2);
      expect(kitText2).assertEqual('01/03/2024, 12:34:56');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1709210096000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1709210096000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1709123696000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1709123696000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1709296496000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1709296496000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '29/02/2024, 12:34:56', runtimeText0);
      expect(runtimeText0).assertEqual('29/02/2024, 12:34:56');
      InterfaceTestLog.value(name, 'runtime.format.1', '28/02/2024, 12:34:56', runtimeText1);
      expect(runtimeText1).assertEqual('28/02/2024, 12:34:56');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/03/2024, 12:34:56', runtimeText2);
      expect(runtimeText2).assertEqual('01/03/2024, 12:34:56');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1709210096000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1709210096000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1709123696000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1709123696000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1709296496000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1709296496000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0045
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0045
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0045';
      const input: string = 'en-GB; instant=2024-04-30T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1714521599000;
      const kitDate0: Date = new Date(1714521599000);
      const kitDate1: Date = new Date(1714435199000);
      const kitDate2: Date = new Date(1714607999000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1714521599000);
      const runtimeDate1: Date = new Date(1714435199000);
      const runtimeDate2: Date = new Date(1714607999000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '30/04/2024, 23:59:59', kitText0);
      expect(kitText0).assertEqual('30/04/2024, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.1', '29/04/2024, 23:59:59', kitText1);
      expect(kitText1).assertEqual('29/04/2024, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.2', '01/05/2024, 23:59:59', kitText2);
      expect(kitText2).assertEqual('01/05/2024, 23:59:59');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1714521599000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1714521599000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1714435199000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1714435199000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1714607999000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1714607999000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '30/04/2024, 23:59:59', runtimeText0);
      expect(runtimeText0).assertEqual('30/04/2024, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.1', '29/04/2024, 23:59:59', runtimeText1);
      expect(runtimeText1).assertEqual('29/04/2024, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/05/2024, 23:59:59', runtimeText2);
      expect(runtimeText2).assertEqual('01/05/2024, 23:59:59');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1714521599000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1714521599000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1714435199000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1714435199000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1714607999000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1714607999000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0046
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0046
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0046';
      const input: string = 'en-GB; instant=2024-05-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1714521600000;
      const kitDate0: Date = new Date(1714521600000);
      const kitDate1: Date = new Date(1714435200000);
      const kitDate2: Date = new Date(1714608000000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1714521600000);
      const runtimeDate1: Date = new Date(1714435200000);
      const runtimeDate2: Date = new Date(1714608000000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '01/05/2024, 00:00:00', kitText0);
      expect(kitText0).assertEqual('01/05/2024, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.1', '30/04/2024, 00:00:00', kitText1);
      expect(kitText1).assertEqual('30/04/2024, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.2', '02/05/2024, 00:00:00', kitText2);
      expect(kitText2).assertEqual('02/05/2024, 00:00:00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1714521600000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1714521600000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1714435200000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1714435200000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1714608000000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1714608000000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '01/05/2024, 00:00:00', runtimeText0);
      expect(runtimeText0).assertEqual('01/05/2024, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.1', '30/04/2024, 00:00:00', runtimeText1);
      expect(runtimeText1).assertEqual('30/04/2024, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.2', '02/05/2024, 00:00:00', runtimeText2);
      expect(runtimeText2).assertEqual('02/05/2024, 00:00:00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1714521600000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1714521600000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1714435200000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1714435200000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1714608000000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1714608000000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0047
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0047
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0047';
      const input: string = 'en-GB; instant=2024-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 1735689599000;
      const kitDate0: Date = new Date(1735689599000);
      const kitDate1: Date = new Date(1735603199000);
      const kitDate2: Date = new Date(1735775999000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(1735689599000);
      const runtimeDate1: Date = new Date(1735603199000);
      const runtimeDate2: Date = new Date(1735775999000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '31/12/2024, 23:59:59', kitText0);
      expect(kitText0).assertEqual('31/12/2024, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.1', '30/12/2024, 23:59:59', kitText1);
      expect(kitText1).assertEqual('30/12/2024, 23:59:59');
      InterfaceTestLog.value(name, 'kit.format.2', '01/01/2025, 23:59:59', kitText2);
      expect(kitText2).assertEqual('01/01/2025, 23:59:59');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 1735689599000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(1735689599000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 1735603199000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(1735603199000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 1735775999000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(1735775999000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '31/12/2024, 23:59:59', runtimeText0);
      expect(runtimeText0).assertEqual('31/12/2024, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.1', '30/12/2024, 23:59:59', runtimeText1);
      expect(runtimeText1).assertEqual('30/12/2024, 23:59:59');
      InterfaceTestLog.value(name, 'runtime.format.2', '01/01/2025, 23:59:59', runtimeText2);
      expect(runtimeText2).assertEqual('01/01/2025, 23:59:59');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 1735689599000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(1735689599000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 1735603199000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(1735603199000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 1735775999000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(1735775999000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0048
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0048
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0048';
      const input: string = 'en-GB; instant=2100-03-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        '2-digit","day":"2-digit","hour":"2-digit","minute":"2-digit","second":"2-dig' +
        'it","hourCycle":"h23","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-GB';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
        second: '2-digit', hourCycle: 'h23', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"2-digit","day":"2-digit","hour":"2-digit","minute' +
        '":"2-digit","second":"2-digit","hourCycle":"h23","timeZone":"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 4107542400000;
      const kitDate0: Date = new Date(4107542400000);
      const kitDate1: Date = new Date(4107456000000);
      const kitDate2: Date = new Date(4107628800000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(4107542400000);
      const runtimeDate1: Date = new Date(4107456000000);
      const runtimeDate2: Date = new Date(4107628800000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', '01/03/2100, 00:00:00', kitText0);
      expect(kitText0).assertEqual('01/03/2100, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.1', '28/02/2100, 00:00:00', kitText1);
      expect(kitText1).assertEqual('28/02/2100, 00:00:00');
      InterfaceTestLog.value(name, 'kit.format.2', '02/03/2100, 00:00:00', kitText2);
      expect(kitText2).assertEqual('02/03/2100, 00:00:00');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 4107542400000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(4107542400000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 4107456000000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(4107456000000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 4107628800000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(4107628800000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', '01/03/2100, 00:00:00', runtimeText0);
      expect(runtimeText0).assertEqual('01/03/2100, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.1', '28/02/2100, 00:00:00', runtimeText1);
      expect(runtimeText1).assertEqual('28/02/2100, 00:00:00');
      InterfaceTestLog.value(name, 'runtime.format.2', '02/03/2100, 00:00:00', runtimeText2);
      expect(runtimeText2).assertEqual('02/03/2100, 00:00:00');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 4107542400000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(4107542400000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 4107456000000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(4107456000000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 4107628800000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(4107628800000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0049
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0049
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0049';
      const input: string = 'en-US; instant=1969-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        'long","day":"numeric","weekday":"long","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'long', day: 'numeric', weekday: 'long', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"long","day":"numeric","weekday":"long","timeZone"' +
        ':"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'long', day: 'numeric', weekday: 'long', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"long","day":"numeric","weekday":"long","timeZone"' +
        ':"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = -1000;
      const kitDate0: Date = new Date(-1000);
      const kitDate1: Date = new Date(-86401000);
      const kitDate2: Date = new Date(86399000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(-1000);
      const runtimeDate1: Date = new Date(-86401000);
      const runtimeDate2: Date = new Date(86399000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Wednesday, December 31, 1969', kitText0);
      expect(kitText0).assertEqual('Wednesday, December 31, 1969');
      InterfaceTestLog.value(name, 'kit.format.1', 'Tuesday, December 30, 1969', kitText1);
      expect(kitText1).assertEqual('Tuesday, December 30, 1969');
      InterfaceTestLog.value(name, 'kit.format.2', 'Thursday, January 1, 1970', kitText2);
      expect(kitText2).assertEqual('Thursday, January 1, 1970');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', -1000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86401000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86399000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Wednesday, December 31, 1969', runtimeText0);
      expect(runtimeText0).assertEqual('Wednesday, December 31, 1969');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Tuesday, December 30, 1969', runtimeText1);
      expect(runtimeText1).assertEqual('Tuesday, December 30, 1969');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Thursday, January 1, 1970', runtimeText2);
      expect(runtimeText2).assertEqual('Thursday, January 1, 1970');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', -1000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(-1000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86401000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86401000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86399000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86399000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0050
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0050
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0050';
      const input: string = 'en-US; instant=1970-01-01T00:00:00.000Z; options={"year":"numeric","month":"' +
        'long","day":"numeric","weekday":"long","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'long', day: 'numeric', weekday: 'long', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"long","day":"numeric","weekday":"long","timeZone"' +
        ':"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'long', day: 'numeric', weekday: 'long', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"long","day":"numeric","weekday":"long","timeZone"' +
        ':"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 0;
      const kitDate0: Date = new Date(0);
      const kitDate1: Date = new Date(-86400000);
      const kitDate2: Date = new Date(86400000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(0);
      const runtimeDate1: Date = new Date(-86400000);
      const runtimeDate2: Date = new Date(86400000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Thursday, January 1, 1970', kitText0);
      expect(kitText0).assertEqual('Thursday, January 1, 1970');
      InterfaceTestLog.value(name, 'kit.format.1', 'Wednesday, December 31, 1969', kitText1);
      expect(kitText1).assertEqual('Wednesday, December 31, 1969');
      InterfaceTestLog.value(name, 'kit.format.2', 'Friday, January 2, 1970', kitText2);
      expect(kitText2).assertEqual('Friday, January 2, 1970');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 0, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', -86400000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 86400000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Thursday, January 1, 1970', runtimeText0);
      expect(runtimeText0).assertEqual('Thursday, January 1, 1970');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Wednesday, December 31, 1969', runtimeText1);
      expect(runtimeText1).assertEqual('Wednesday, December 31, 1969');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Friday, January 2, 1970', runtimeText2);
      expect(runtimeText2).assertEqual('Friday, January 2, 1970');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 0, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(0);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', -86400000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(-86400000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 86400000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(86400000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0051
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0051
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0051';
      const input: string = 'en-US; instant=1999-12-31T23:59:59.000Z; options={"year":"numeric","month":"' +
        'long","day":"numeric","weekday":"long","timeZone":"UTC"}';
      InterfaceTestLog.begin(name, input);
      const locale: string = 'en-US';
      const kitOptions: intl.DateTimeOptions = {
        year: 'numeric', month: 'long', day: 'numeric', weekday: 'long', timeZone: 'UTC',
      };
      const kitOptionsSnapshot: string =
        '{"year":"numeric","month":"long","day":"numeric","weekday":"long","timeZone"' +
        ':"UTC"}';
      const runtimeOptions: Intl.DateTimeFormatOptions = {
        year: 'numeric', month: 'long', day: 'numeric', weekday: 'long', timeZone: 'UTC',
      };
      const runtimeOptionsSnapshot: string =
        '{"year":"numeric","month":"long","day":"numeric","weekday":"long","timeZone"' +
        ':"UTC"}';
      const kit: intl.DateTimeFormat = new intl.DateTimeFormat(locale, kitOptions);
      const runtime: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale, runtimeOptions);
      const timestamp: number = 946684799000;
      const kitDate0: Date = new Date(946684799000);
      const kitDate1: Date = new Date(946598399000);
      const kitDate2: Date = new Date(946771199000);
      const kitText0: string = kit.format(kitDate0);
      const kitText1: string = kit.format(kitDate1);
      const kitText2: string = kit.format(kitDate2);
      const kitResolved: intl.DateTimeOptions = kit.resolvedOptions();
      const runtimeDate0: Date = new Date(946684799000);
      const runtimeDate1: Date = new Date(946598399000);
      const runtimeDate2: Date = new Date(946771199000);
      const runtimeText0: string = runtime.format(runtimeDate0);
      const runtimeText1: string = runtime.format(runtimeDate1);
      const runtimeText2: string = runtime.format(runtimeDate2);
      const runtimeResolved: Intl.ResolvedDateTimeFormatOptions = runtime.resolvedOptions();
      InterfaceTestLog.value(name, 'kitOptions.unchanged', kitOptionsSnapshot, JSON.stringify(kitOptions));
      expect(JSON.stringify(kitOptions)).assertEqual(kitOptionsSnapshot);
      InterfaceTestLog.value(name, 'runtimeOptions.unchanged', runtimeOptionsSnapshot, JSON.stringify(runtimeOptions));
      expect(JSON.stringify(runtimeOptions)).assertEqual(runtimeOptionsSnapshot);
      InterfaceTestLog.value(name, 'kit.format.0', 'Friday, December 31, 1999', kitText0);
      expect(kitText0).assertEqual('Friday, December 31, 1999');
      InterfaceTestLog.value(name, 'kit.format.1', 'Thursday, December 30, 1999', kitText1);
      expect(kitText1).assertEqual('Thursday, December 30, 1999');
      InterfaceTestLog.value(name, 'kit.format.2', 'Saturday, January 1, 2000', kitText2);
      expect(kitText2).assertEqual('Saturday, January 1, 2000');
      InterfaceTestLog.number(name, 'kit.inputUnchanged', 946684799000, kitDate0.getTime());
      expect(kitDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'kit.previousDayUnchanged', 946598399000, kitDate1.getTime());
      expect(kitDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'kit.nextDayUnchanged', 946771199000, kitDate2.getTime());
      expect(kitDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'kit.timeZone', 'UTC', String(kitResolved.timeZone));
      expect(kitResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.value(name, 'runtime.format.0', 'Friday, December 31, 1999', runtimeText0);
      expect(runtimeText0).assertEqual('Friday, December 31, 1999');
      InterfaceTestLog.value(name, 'runtime.format.1', 'Thursday, December 30, 1999', runtimeText1);
      expect(runtimeText1).assertEqual('Thursday, December 30, 1999');
      InterfaceTestLog.value(name, 'runtime.format.2', 'Saturday, January 1, 2000', runtimeText2);
      expect(runtimeText2).assertEqual('Saturday, January 1, 2000');
      InterfaceTestLog.number(name, 'runtime.inputUnchanged', 946684799000, runtimeDate0.getTime());
      expect(runtimeDate0.getTime()).assertEqual(946684799000);
      InterfaceTestLog.number(name, 'runtime.previousDayUnchanged', 946598399000, runtimeDate1.getTime());
      expect(runtimeDate1.getTime()).assertEqual(946598399000);
      InterfaceTestLog.number(name, 'runtime.nextDayUnchanged', 946771199000, runtimeDate2.getTime());
      expect(runtimeDate2.getTime()).assertEqual(946771199000);
      InterfaceTestLog.value(name, 'runtime.timeZone', 'UTC', String(runtimeResolved.timeZone));
      expect(runtimeResolved.timeZone).assertEqual('UTC');
      InterfaceTestLog.end(name);
    });
    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0052
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_INTL_DATETIME_0052
     * @tc.desc Check fixed UTC timestamps, previous/next day, leap-year and month/year boundaries.
     * @tc.type FUNCTION