/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { intl } from '@kit.LocalizationKit';
import { InterfaceTestLog } from '../utils/InterfaceTestLog';

const FIXED_TIMESTAMP: number = 1735660800000;
const SAMPLE_NUMBER: number = 12345.678;
const SAMPLE_INTEGER: number = 12345;
const COLLATOR_INPUT: Array<string> = ['b', 'a', 'c'];
const EXPECTED_SORTED: Array<string> = ['a', 'b', 'c'];

export default function intlInterfaceTest(): void {
  describe('IntlInterfaceTest', (): void => {

    /**
     * @tc.name   testRelativeTimeFormat0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_INTLINTERFACE_0100
     * @tc.desc   Test that intl.RelativeTimeFormat and Intl.RelativeTimeFormat format the same relative time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRelativeTimeFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testRelativeTimeFormat0001';
      InterfaceTestLog.begin(name, 'locale=zh-CN,numeric=auto,value=-1,unit=day');
      const kitFormat: intl.RelativeTimeFormat = new intl.RelativeTimeFormat('zh-CN', { numeric: 'auto' });
      const runtimeFormat: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat('zh-CN', { numeric: 'auto' });
      const kitResult: string = kitFormat.format(-1, 'day');
      const runtimeResult: string = runtimeFormat.format(-1, 'day');
      InterfaceTestLog.flag(name, 'kitResultNonEmpty expected=true', kitResult.length > 0);
      expect(kitResult.length > 0).assertTrue();
      InterfaceTestLog.value(name, 'relativeTimeResult', runtimeResult, kitResult);
      expect(kitResult).assertEqual(runtimeResult);
      InterfaceTestLog.flag(name, 'isUnformattedNumber expected=false', kitResult === '-1');
      expect(kitResult === '-1').assertFalse();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testLocale0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_INTLINTERFACE_0200
     * @tc.desc   Test that intl.Locale and Intl.Locale produce the same locale string zh-CN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLocale0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testLocale0001';
      InterfaceTestLog.begin(name, 'locale=zh-CN');
      const kitLocale: intl.Locale = new intl.Locale('zh-CN');
      const runtimeLocale: Intl.Locale = new Intl.Locale('zh-CN');
      const kitResult: string = kitLocale.toString();
      InterfaceTestLog.value(name, 'kitLocale', 'zh-CN', kitResult);
      expect(kitResult).assertEqual('zh-CN');
      const runtimeResult: string = runtimeLocale.toString();
      InterfaceTestLog.value(name, 'runtimeLocale', kitResult, runtimeResult);
      expect(runtimeResult).assertEqual(kitResult);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testDateTimeFormat0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_INTLINTERFACE_0300
     * @tc.desc   Test that intl.DateTimeFormat and Intl.DateTimeFormat format the same date identically.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDateTimeFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testDateTimeFormat0001';
      InterfaceTestLog.begin(name, `locale=zh-CN,dateStyle=full,timeStyle=medium,timestamp=${FIXED_TIMESTAMP}`);
      const date: Date = new Date(FIXED_TIMESTAMP);
      const kitFormat: intl.DateTimeFormat =
        new intl.DateTimeFormat('zh-CN', { dateStyle: 'full', timeStyle: 'medium' });
      const runtimeFormat: Intl.DateTimeFormat =
        new Intl.DateTimeFormat('zh-CN', { dateStyle: 'full', timeStyle: 'medium' });
      const kitResult: string = kitFormat.format(date);
      const runtimeResult: string = runtimeFormat.format(date);
      InterfaceTestLog.value(name, 'dateTimeResult', runtimeResult, kitResult);
      expect(kitResult).assertEqual(runtimeResult);
      InterfaceTestLog.flag(name, 'containsExpectedYear expected=true', kitResult.indexOf('2025') >= 0);
      expect(kitResult.indexOf('2025') >= 0).assertTrue();
      InterfaceTestLog.flag(name, 'isUnformattedTimestamp expected=false', kitResult === FIXED_TIMESTAMP.toString());
      expect(kitResult === FIXED_TIMESTAMP.toString()).assertFalse();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testNumberFormat0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_INTLINTERFACE_0400
     * @tc.desc   Test that intl.NumberFormat and Intl.NumberFormat format the same number identically.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNumberFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testNumberFormat0001';
      InterfaceTestLog.begin(name, `locale=en-GB,style=decimal,value=${SAMPLE_NUMBER}`);
      const kitFormat: intl.NumberFormat = new intl.NumberFormat('en-GB', { style: 'decimal' });
      const runtimeFormat: Intl.NumberFormat = new Intl.NumberFormat('en-GB', { style: 'decimal' });
      const kitResult: string = kitFormat.format(SAMPLE_NUMBER);
      const runtimeResult: string = runtimeFormat.format(SAMPLE_NUMBER);
      InterfaceTestLog.value(name, 'numberResult', runtimeResult, kitResult);
      expect(kitResult).assertEqual(runtimeResult);
      InterfaceTestLog.flag(name, 'isUnformattedNumber expected=false', kitResult === SAMPLE_NUMBER.toString());
      expect(kitResult === SAMPLE_NUMBER.toString()).assertFalse();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testNumberFormatScientific0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_INTLINTERFACE_0500
     * @tc.desc   Test that the scientific notation option takes effect in both implementations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNumberFormatScientific0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testNumberFormatScientific0001';
      InterfaceTestLog.begin(name, `locale=en-GB,style=decimal,notation=scientific,value=${SAMPLE_INTEGER}`);
      const kitFormat: intl.NumberFormat = new intl.NumberFormat('en-GB', { style: 'decimal', notation: 'scientific' });
      const runtimeFormat: Intl.NumberFormat =
        new Intl.NumberFormat('en-GB', { style: 'decimal', notation: 'scientific' });
      const kitResult: string = kitFormat.format(SAMPLE_INTEGER);
      const runtimeResult: string = runtimeFormat.format(SAMPLE_INTEGER);
      InterfaceTestLog.value(name, 'scientificNumberResult', runtimeResult, kitResult);
      expect(kitResult).assertEqual(runtimeResult);
      InterfaceTestLog.flag(name, 'containsExponent expected=true', kitResult.toUpperCase().indexOf('E') >= 0);
      expect(kitResult.toUpperCase().indexOf('E') >= 0).assertTrue();
      InterfaceTestLog.flag(name, 'isUnformattedNumber expected=false', kitResult === SAMPLE_INTEGER.toString());
      expect(kitResult === SAMPLE_INTEGER.toString()).assertFalse();
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testCollatorCompare0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_INTLINTERFACE_0600
     * @tc.desc   Test that intl.Collator and Intl.Collator compare two strings in the same direction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollatorCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testCollatorCompare0001';
      InterfaceTestLog.begin(name, 'locale=zh-CN,localeMatcher=lookup,usage=sort,pairs=a:b;b:a;a:a');
      const kitCollator: intl.Collator = new intl.Collator('zh-CN', { localeMatcher: 'lookup', usage: 'sort' });
      const runtimeCollator: Intl.Collator = new Intl.Collator('zh-CN', { localeMatcher: 'lookup', usage: 'sort' });
      const kitForward: number = kitCollator.compare('a', 'b');
      const runtimeForward: number = runtimeCollator.compare('a', 'b');
      const kitBackward: number = kitCollator.compare('b', 'a');
      const runtimeBackward: number = runtimeCollator.compare('b', 'a');
      InterfaceTestLog.number(name, 'kitForward upperBoundExclusive', 0, kitForward);
      InterfaceTestLog.flag(name, 'kitForwardNegative expected=true', kitForward < 0);
      expect(kitForward < 0).assertTrue();
      InterfaceTestLog.number(name, 'runtimeForward upperBoundExclusive', 0, runtimeForward);
      InterfaceTestLog.flag(name, 'runtimeForwardNegative expected=true', runtimeForward < 0);
      expect(runtimeForward < 0).assertTrue();
      InterfaceTestLog.number(name, 'kitBackward lowerBoundExclusive', 0, kitBackward);
      InterfaceTestLog.flag(name, 'kitBackwardPositive expected=true', kitBackward > 0);
      expect(kitBackward > 0).assertTrue();
      InterfaceTestLog.number(name, 'runtimeBackward lowerBoundExclusive', 0, runtimeBackward);
      InterfaceTestLog.flag(name, 'runtimeBackwardPositive expected=true', runtimeBackward > 0);
      expect(runtimeBackward > 0).assertTrue();
      const kitEqual: number = kitCollator.compare('a', 'a');
      InterfaceTestLog.number(name, 'equalComparison', 0, kitEqual);
      expect(kitEqual).assertEqual(0);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testCollatorSort0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_INTLINTERFACE_0700
     * @tc.desc   Test that the Collator can be used as a comparator to sort strings in dictionary order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollatorSort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testCollatorSort0001';
      InterfaceTestLog.begin(name, `locale=zh-CN,localeMatcher=lookup,usage=sort,input=${COLLATOR_INPUT.join(',')}`);
      const kitCollator: intl.Collator = new intl.Collator('zh-CN', { localeMatcher: 'lookup', usage: 'sort' });
      const sortedArray: Array<string> = COLLATOR_INPUT.slice();
      sortedArray.sort((first: string, second: string): number => kitCollator.compare(first, second));
      InterfaceTestLog.number(name, 'sortedLength', EXPECTED_SORTED.length, sortedArray.length);
      expect(sortedArray.length).assertEqual(EXPECTED_SORTED.length);
      for (let i: number = 0; i < sortedArray.length; i++) {
        InterfaceTestLog.value(name, `sortedItem[${i}]`, EXPECTED_SORTED[i], sortedArray[i]);
        expect(sortedArray[i]).assertEqual(EXPECTED_SORTED[i]);
      }
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testPluralRulesChinese0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_INTLINTERFACE_0800
     * @tc.desc   Test that the Chinese plural rule selects the other category in both implementations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPluralRulesChinese0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testPluralRulesChinese0001';
      InterfaceTestLog.begin(name, 'locale=zh-CN,localeMatcher=lookup,type=cardinal,value=1');
      const kitRules: intl.PluralRules = new intl.PluralRules('zh-CN', { localeMatcher: 'lookup', type: 'cardinal' });
      const runtimeRules: Intl.PluralRules =
        new Intl.PluralRules('zh-CN', { localeMatcher: 'lookup', type: 'cardinal' });
      const kitResult: string = kitRules.select(1);
      const runtimeResult: string = runtimeRules.select(1);
      InterfaceTestLog.value(name, 'pluralCategory', runtimeResult, kitResult);
      expect(kitResult).assertEqual(runtimeResult);
      InterfaceTestLog.value(name, 'chinesePluralCategory', 'other', kitResult);
      expect(kitResult).assertEqual('other');
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name   testPluralRulesEnglish0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_INTLINTERFACE_0900
     * @tc.desc   Test that the English plural rule selects one for 1 and other for 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPluralRulesEnglish0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'testPluralRulesEnglish0001';
      InterfaceTestLog.begin(name, 'locale=en-US,type=cardinal,values=1;2');
      const kitRules: intl.PluralRules = new intl.PluralRules('en-US', { type: 'cardinal' });
      const oneResult: string = kitRules.select(1);
      InterfaceTestLog.value(name, 'pluralCategoryForOne', 'one', oneResult);
      expect(oneResult).assertEqual('one');
      const twoResult: string = kitRules.select(2);
      InterfaceTestLog.value(name, 'pluralCategoryForTwo', 'other', twoResult);
      expect(twoResult).assertEqual('other');
      InterfaceTestLog.end(name);
    });
  });
}
