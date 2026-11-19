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