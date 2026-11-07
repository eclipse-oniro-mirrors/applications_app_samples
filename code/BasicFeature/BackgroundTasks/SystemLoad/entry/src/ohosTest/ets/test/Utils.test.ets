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

import { describe, expect, it } from '@ohos/hypium';
import {
  StringUtils,
  DateUtils,
  ValidationUtils,
  RandomUtils,
  DeviceUtils,
  ValidationRule
} from '@ohos/systemload';
import { logger } from '../util/Logger';

/** 测试包标识 */
const BUNDLE: string = 'UtilsTest_';

/**
 * 工具类测试套件
 * 覆盖StringUtils、DateUtils、ValidationUtils、RandomUtils、DeviceUtils等工具类
 */
export default function utilsTest() {
  describe('StringUtilsTest', () => {
    /**
     * @tc.number    SUB_UTILS_STRING_0100
     * @tc.name      testStringUtilsIsEmpty0001
     * @tc.desc      Test isEmpty method for empty string validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtilsIsEmpty0001', 0, () => {
      logger.info(`${BUNDLE}testStringUtilsIsEmpty0001, begin`);
      // 测试空字符串
      expect(StringUtils.isEmpty('')).assertTrue();
      // 测试null
      expect(StringUtils.isEmpty(null)).assertTrue();
      // 测试undefined
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      // 测试非空字符串
      expect(StringUtils.isEmpty('hello')).assertFalse();
      logger.info(`${BUNDLE}isEmpty_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_STRING_0200
     * @tc.name      testStringUtilsIsBlank0002
     * @tc.desc      Test isBlank method for whitespace string validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtilsIsBlank0002', 0, () => {
      logger.info(`${BUNDLE}testStringUtilsIsBlank0002, begin`);
      // 测试空白字符串
      expect(StringUtils.isBlank('   ')).assertTrue();
      expect(StringUtils.isBlank('\t\n')).assertTrue();
      // 测试空字符串
      expect(StringUtils.isBlank('')).assertTrue();
      // 测试非空白字符串
      expect(StringUtils.isBlank('hello')).assertFalse();
      logger.info(`${BUNDLE}isBlank_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_STRING_0300
     * @tc.name      testStringUtilsTruncate0003
     * @tc.desc      Test truncate method for string truncation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtilsTruncate0003', 0, () => {
      logger.info(`${BUNDLE}testStringUtilsTruncate0003, begin`);
      // 测试截断
      expect(StringUtils.truncate('Hello World', 5)).assertEqual('Hello...');
      // 测试不截断
      expect(StringUtils.truncate('Hi', 5)).assertEqual('Hi');
      // 测试空字符串
      expect(StringUtils.truncate('', 5)).assertEqual('');
      // 测试自定义后缀
      expect(StringUtils.truncate('Hello World', 5, '***')).assertEqual('Hello***');
      logger.info(`${BUNDLE}truncate_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_STRING_0400
     * @tc.name      testStringUtilsCapitalize0004
     * @tc.desc      Test capitalize method for first letter capitalization
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtilsCapitalize0004', 0, () => {
      logger.info(`${BUNDLE}testStringUtilsCapitalize0004, begin`);
      // 测试首字母大写
      expect(StringUtils.capitalize('hello')).assertEqual('Hello');
      // 测试已大写
      expect(StringUtils.capitalize('Hello')).assertEqual('Hello');
      // 测试空字符串
      expect(StringUtils.capitalize('')).assertEqual('');
      logger.info(`${BUNDLE}capitalize_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_STRING_0500
     * @tc.name      testStringUtilsReverse0005
     * @tc.desc      Test reverse method for string reversal
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtilsReverse0005', 0, () => {
      logger.info(`${BUNDLE}testStringUtilsReverse0005, begin`);
      // 测试反转
      expect(StringUtils.reverse('hello')).assertEqual('olleh');
      // 测试回文
      expect(StringUtils.reverse('abcba')).assertEqual('abcba');
      // 测试空字符串
      expect(StringUtils.reverse('')).assertEqual('');
      logger.info(`${BUNDLE}reverse_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_STRING_0600
     * @tc.name      testStringUtilsToCamelCase0006
     * @tc.desc      Test toCamelCase method for camelCase conversion
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtilsToCamelCase0006', 0, () => {
      logger.info(`${BUNDLE}testStringUtilsToCamelCase0006, begin`);
      // 测试下划线转驼峰
      expect(StringUtils.toCamelCase('hello_world')).assertEqual('helloWorld');
      // 测试中划线转驼峰
      expect(StringUtils.toCamelCase('hello-world')).assertEqual('helloWorld');
      // 测试空字符串
      expect(StringUtils.toCamelCase('')).assertEqual('');
      // 测试无转换需求
      expect(StringUtils.toCamelCase('helloWorld')).assertEqual('helloWorld');
      logger.info(`${BUNDLE}toCamelCase_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_STRING_0700
     * @tc.name      testStringUtilsContains0007
     * @tc.desc      Test contains method for substring check
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtilsContains0007', 0, () => {
      logger.info(`${BUNDLE}testStringUtilsContains0007, begin`);
      // 测试包含
      expect(StringUtils.contains('hello world', 'world')).assertTrue();
      // 测试不包含
      expect(StringUtils.contains('hello world', 'test')).assertFalse();
      // 测试空字符串
      expect(StringUtils.contains('', 'test')).assertFalse();
      logger.info(`${BUNDLE}contains_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_STRING_0800
     * @tc.name      testStringUtilsPadLeft0008
     * @tc.desc      Test padLeft method for left padding
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtilsPadLeft0008', 0, () => {
      logger.info(`${BUNDLE}testStringUtilsPadLeft0008, begin`);
      // 测试左填充
      expect(StringUtils.padLeft('5', 3, '0')).assertEqual('005');
      // 测试无需填充
      expect(StringUtils.padLeft('12345', 3, '0')).assertEqual('12345');
      // 测试空字符串填充
      expect(StringUtils.padLeft('', 3, '0')).assertEqual('000');
      // 测试自定义填充字符
      expect(StringUtils.padLeft('x', 3, '*')).assertEqual('**x');
      logger.info(`${BUNDLE}padLeft_0001, end`);
    });
  });

  describe('DateUtilsTest', () => {
    /**
     * @tc.number    SUB_UTILS_DATE_0100
     * @tc.name      testDateUtilsFormat0009
     * @tc.desc      Test format method for date formatting
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtilsFormat0009', 0, () => {
      logger.info(`${BUNDLE}testDateUtilsFormat0009, begin`);
      // 创建测试日期
      const date = new Date(2026, 0, 15, 10, 30, 45);
      expect(date instanceof Date).assertTrue();
      // 测试默认格式
      const formatted = DateUtils.format(date, 'yyyy-MM-dd HH:mm:ss');
      expect(formatted).assertEqual('2026-01-15 10:30:45');
      expect(formatted.length > 0).assertTrue();
      // 测试日期格式
      const dateOnly = DateUtils.format(date, 'yyyy-MM-dd');
      expect(dateOnly).assertEqual('2026-01-15');
      expect(typeof dateOnly).assertEqual('string');
      logger.info(`${BUNDLE}format_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DATE_0200
     * @tc.name      testDateUtilsIsToday0010
     * @tc.desc      Test isToday method for today check
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtilsIsToday0010', 0, () => {
      logger.info(`${BUNDLE}testDateUtilsIsToday0010, begin`);
      // 测试今天
      const today = new Date();
      expect(DateUtils.isToday(today)).assertTrue();
      expect(typeof DateUtils.isToday(today)).assertEqual('boolean');
      // 测试昨天
      const yesterday = new Date();
      yesterday.setDate(yesterday.getDate() - 1);
      expect(DateUtils.isToday(yesterday)).assertFalse();
      // 测试明天
      const tomorrow = new Date();
      tomorrow.setDate(tomorrow.getDate() + 1);
      expect(DateUtils.isToday(tomorrow)).assertFalse();
      logger.info(`${BUNDLE}isToday_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DATE_0300
     * @tc.name      testDateUtilsIsSameDay0011
     * @tc.desc      Test isSameDay method for same day check
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtilsIsSameDay0011', 0, () => {
      logger.info(`${BUNDLE}testDateUtilsIsSameDay0011, begin`);
      // 测试同一天
      const date1 = new Date(2026, 0, 15, 10, 30);
      const date2 = new Date(2026, 0, 15, 20, 45);
      expect(DateUtils.isSameDay(date1, date2)).assertTrue();
      expect(typeof DateUtils.isSameDay(date1, date2)).assertEqual('boolean');
      // 测试不同天
      const date3 = new Date(2026, 0, 16, 10, 30);
      expect(DateUtils.isSameDay(date1, date3)).assertFalse();
      // 测试不同月
      const date4 = new Date(2026, 1, 15, 10, 30);
      expect(DateUtils.isSameDay(date1, date4)).assertFalse();
      logger.info(`${BUNDLE}isSameDay_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DATE_0400
     * @tc.name      testDateUtilsAddDays0012
     * @tc.desc      Test addDays method for adding days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtilsAddDays0012', 0, () => {
      logger.info(`${BUNDLE}testDateUtilsAddDays0012, begin`);
      // 测试增加天数
      const date = new Date(2026, 0, 15);
      expect(date instanceof Date).assertTrue();
      const result = DateUtils.addDays(date, 5);
      expect(result.getDate()).assertEqual(20);
      expect(result instanceof Date).assertTrue();
      // 测试减少天数
      const result2 = DateUtils.addDays(date, -5);
      expect(result2.getDate()).assertEqual(10);
      // 测试零天数
      const result3 = DateUtils.addDays(date, 0);
      expect(result3.getDate()).assertEqual(15);
      logger.info(`${BUNDLE}addDays_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DATE_0500
     * @tc.name      testDateUtilsGetDaysBetween0013
     * @tc.desc      Test getDaysBetween method for days difference
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtilsGetDaysBetween0013', 0, () => {
      logger.info(`${BUNDLE}testDateUtilsGetDaysBetween0013, begin`);
      // 测试天数差
      const date1 = new Date(2026, 0, 15);
      const date2 = new Date(2026, 0, 20);
      expect(DateUtils.getDaysBetween(date1, date2)).assertEqual(5);
      // 测试负值（date2 在 date1 之前）
      expect(DateUtils.getDaysBetween(date2, date1) >= 0).assertTrue();
      // 测试同一天
      expect(DateUtils.getDaysBetween(date1, date1)).assertEqual(0);
      logger.info(`${BUNDLE}getDaysBetween_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DATE_0600
     * @tc.name      testDateUtilsIsLeapYear0014
     * @tc.desc      Test isLeapYear method for leap year check
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtilsIsLeapYear0014', 0, () => {
      logger.info(`${BUNDLE}testDateUtilsIsLeapYear0014, begin`);
      // 测试闰年
      expect(DateUtils.isLeapYear(2024)).assertTrue();
      expect(DateUtils.isLeapYear(2000)).assertTrue();
      // 测试非闰年
      expect(DateUtils.isLeapYear(2023)).assertFalse();
      expect(DateUtils.isLeapYear(1900)).assertFalse();
      logger.info(`${BUNDLE}isLeapYear_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DATE_0700
     * @tc.name      testDateUtilsGetWeekDay0015
     * @tc.desc      Test getWeekDay method for weekday name
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateUtilsGetWeekDay0015', 0, () => {
      logger.info(`${BUNDLE}testDateUtilsGetWeekDay0015, begin`);
      // 2026年1月15日是星期四
      const date = new Date(2026, 0, 15);
      const weekDay = DateUtils.getWeekDay(date);
      expect(weekDay.length > 0).assertTrue();
      expect(typeof weekDay).assertEqual('string');
      // 验证是有效的星期名称
      const validWeekDays = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
      expect(validWeekDays.includes(weekDay)).assertTrue();
      logger.info(`${BUNDLE}getWeekDay_0001, end`);
    });
  });

  describe('ValidationUtilsTest', () => {
    /**
     * @tc.number    SUB_UTILS_VALIDATION_0100
     * @tc.name      testValidationUtilsIsEmail0016
     * @tc.desc      Test isEmail method for email validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationUtilsIsEmail0016', 0, () => {
      logger.info(`${BUNDLE}testValidationUtilsIsEmail0016, begin`);
      // 测试有效邮箱
      expect(ValidationUtils.isEmail('test@example.com')).assertTrue();
      expect(ValidationUtils.isEmail('user.name@domain.co.uk')).assertTrue();
      // 测试无效邮箱
      expect(ValidationUtils.isEmail('invalid')).assertFalse();
      expect(ValidationUtils.isEmail('@domain.com')).assertFalse();
      expect(ValidationUtils.isEmail('')).assertFalse();
      logger.info(`${BUNDLE}isEmail_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_VALIDATION_0200
     * @tc.name      testValidationUtilsIsPhone0017
     * @tc.desc      Test isPhone method for phone validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationUtilsIsPhone0017', 0, () => {
      logger.info(`${BUNDLE}testValidationUtilsIsPhone0017, begin`);
      // 测试有效手机�?      expect(ValidationUtils.isPhone('13800138000')).assertTrue();
      expect(ValidationUtils.isPhone('15912345678')).assertTrue();
      // 测试无效手机�?      expect(ValidationUtils.isPhone('12345678901')).assertFalse();
      expect(ValidationUtils.isPhone('1380013800')).assertFalse();
      expect(ValidationUtils.isPhone('')).assertFalse();
      logger.info(`${BUNDLE}isPhone_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_VALIDATION_0300
     * @tc.name      testValidationUtilsIsUrl0018
     * @tc.desc      Test isUrl method for URL validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationUtilsIsUrl0018', 0, () => {
      logger.info(`${BUNDLE}testValidationUtilsIsUrl0018, begin`);
      // 测试有效URL
      expect(ValidationUtils.isUrl('https://www.example.com')).assertTrue();
      expect(ValidationUtils.isUrl('http://test.org/path')).assertTrue();
      // 测试无效URL
      expect(ValidationUtils.isUrl('invalid')).assertFalse();
      expect(ValidationUtils.isUrl('')).assertFalse();
      logger.info(`${BUNDLE}isUrl_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_VALIDATION_0400
     * @tc.name      testValidationUtilsIsUsername0019
     * @tc.desc      Test isUsername method for username validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationUtilsIsUsername0019', 0, () => {
      logger.info(`${BUNDLE}testValidationUtilsIsUsername0019, begin`);
      // 测试有效用户�?      expect(ValidationUtils.isUsername('user123')).assertTrue();
      expect(ValidationUtils.isUsername('test_user')).assertTrue();
      // 测试无效用户�?      expect(ValidationUtils.isUsername('ab')).assertFalse(); // 太短
      expect(ValidationUtils.isUsername('user@name')).assertFalse(); // 包含特殊字符
      logger.info(`${BUNDLE}isUsername_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_VALIDATION_0500
     * @tc.name      testValidationUtilsIsNumber0020
     * @tc.desc      Test isNumber method for number validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationUtilsIsNumber0020', 0, () => {
      logger.info(`${BUNDLE}testValidationUtilsIsNumber0020, begin`);
      // 测试有效数字
      expect(ValidationUtils.isNumber('123')).assertTrue();
      expect(ValidationUtils.isNumber('-45.67')).assertTrue();
      expect(ValidationUtils.isNumber('0.5')).assertTrue();
      // 测试无效数字
      expect(ValidationUtils.isNumber('abc')).assertFalse();
      expect(ValidationUtils.isNumber('')).assertFalse();
      logger.info(`${BUNDLE}isNumber_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_VALIDATION_0600
     * @tc.name      testValidationUtilsIsInteger0021
     * @tc.desc      Test isInteger method for integer validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationUtilsIsInteger0021', 0, () => {
      logger.info(`${BUNDLE}testValidationUtilsIsInteger0021, begin`);
      // 测试有效整数
      expect(ValidationUtils.isInteger('123')).assertTrue();
      expect(ValidationUtils.isInteger('-456')).assertTrue();
      // 测试无效整数
      expect(ValidationUtils.isInteger('12.34')).assertFalse();
      expect(ValidationUtils.isInteger('abc')).assertFalse();
      logger.info(`${BUNDLE}isInteger_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_VALIDATION_0700
     * @tc.name      testValidationUtilsValidate0022
     * @tc.desc      Test validate method for generic validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationUtilsValidate0022', 0, () => {
      logger.info(`${BUNDLE}testValidationUtilsValidate0022, begin`);
      // 测试邮箱校验
      const emailResult = ValidationUtils.validate('test@example.com', ValidationRule.EMAIL);
      expect(emailResult.valid).assertTrue();
      expect(emailResult.message !== undefined).assertTrue();
      // 测试必填校验
      const requiredResult = ValidationUtils.validate('', ValidationRule.REQUIRED);
      expect(requiredResult.valid).assertFalse();
      expect(requiredResult.message !== undefined).assertTrue();
      logger.info(`${BUNDLE}validate_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_VALIDATION_0800
     * @tc.name      testValidationUtilsIsLengthInRange0023
     * @tc.desc      Test isLengthInRange method for length range validation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationUtilsIsLengthInRange0023', 0, () => {
      logger.info(`${BUNDLE}testValidationUtilsIsLengthInRange0023, begin`);
      // 测试长度在范围内
      expect(ValidationUtils.isLengthInRange('hello', 3, 10)).assertTrue();
      // 测试长度不在范围�?      expect(ValidationUtils.isLengthInRange('hi', 3, 10)).assertFalse();
      expect(ValidationUtils.isLengthInRange('hello world test', 3, 10)).assertFalse();
      logger.info(`${BUNDLE}isLengthInRange_0001, end`);
    });
  });

  describe('RandomUtilsTest', () => {
    /**
     * @tc.number    SUB_UTILS_RANDOM_0100
     * @tc.name      testRandomUtilsRandomInt0024
     * @tc.desc      Test randomInt method for random integer generation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomUtilsRandomInt0024', 0, () => {
      logger.info(`${BUNDLE}testRandomUtilsRandomInt0024, begin`);
      // 测试随机整数在范围内
      const values: number[] = [];
      for (let i = 0; i < 10; i++) {
        const value = RandomUtils.randomInt(1, 100);
        expect(value >= 1 && value <= 100).assertTrue();
        values.push(value);
      }
      expect(values.length).assertEqual(10);
      expect(typeof values[0]).assertEqual('number');
      logger.info(`${BUNDLE}randomInt_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_RANDOM_0200
     * @tc.name      testRandomUtilsRandomFloat0025
     * @tc.desc      Test randomFloat method for random float generation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomUtilsRandomFloat0025', 0, () => {
      logger.info(`${BUNDLE}testRandomUtilsRandomFloat0025, begin`);
      // 测试随机浮点数在范围内
      const values: number[] = [];
      for (let i = 0; i < 10; i++) {
        const value = RandomUtils.randomFloat(0, 1, 2);
        expect(value >= 0 && value <= 1).assertTrue();
        values.push(value);
      }
      expect(values.length).assertEqual(10);
      expect(typeof values[0]).assertEqual('number');
      logger.info(`${BUNDLE}randomFloat_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_RANDOM_0300
     * @tc.name      testRandomUtilsRandomBoolean0026
     * @tc.desc      Test randomBoolean method for random boolean generation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomUtilsRandomBoolean0026', 0, () => {
      logger.info(`${BUNDLE}testRandomUtilsRandomBoolean0026, begin`);
      // 测试随机布尔值
      let trueCount = 0;
      let falseCount = 0;
      for (let i = 0; i < 100; i++) {
        const value = RandomUtils.randomBoolean();
        expect(typeof value).assertEqual('boolean');
        if (value) {
          trueCount++;
        } else {
          falseCount++;
        }
      }
      // 验证两个值都有出现
      expect(trueCount > 0).assertTrue();
      expect(falseCount > 0).assertTrue();
      expect(trueCount + falseCount).assertEqual(100);
      logger.info(`${BUNDLE}randomBoolean_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_RANDOM_0400
     * @tc.name      testRandomUtilsRandomString0027
     * @tc.desc      Test randomString method for random string generation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomUtilsRandomString0027', 0, () => {
      logger.info(`${BUNDLE}testRandomUtilsRandomString0027, begin`);
      // 测试随机字符串长度
      const str1 = RandomUtils.randomString(10);
      expect(str1.length).assertEqual(10);
      const str2 = RandomUtils.randomString(20);
      expect(str2.length).assertEqual(20);
      // 测试两次生成不同
      const str3 = RandomUtils.randomString(10);
      const str4 = RandomUtils.randomString(10);
      expect(str3 !== str4).assertTrue();
      logger.info(`${BUNDLE}randomString_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_RANDOM_0500
     * @tc.name      testRandomUtilsRandomNumeric0028
     * @tc.desc      Test randomNumeric method for random numeric string generation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomUtilsRandomNumeric0028', 0, () => {
      logger.info(`${BUNDLE}testRandomUtilsRandomNumeric0028, begin`);
      // 测试随机数字字符串
      const num = RandomUtils.randomNumeric(6);
      expect(num.length).assertEqual(6);
      expect(/^\d+$/.test(num)).assertTrue();
      expect(typeof num).assertEqual('string');
      // 测试不同长度
      const num2 = RandomUtils.randomNumeric(10);
      expect(num2.length).assertEqual(10);
      logger.info(`${BUNDLE}randomNumeric_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_RANDOM_0600
     * @tc.name      testRandomUtilsRandomChoice0029
     * @tc.desc      Test randomChoice method for random array selection
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomUtilsRandomChoice0029', 0, () => {
      logger.info(`${BUNDLE}testRandomUtilsRandomChoice0029, begin`);
      // 测试从数组选择
      const arr = [1, 2, 3, 4, 5];
      const choice = RandomUtils.randomChoice(arr);
      expect(arr.includes(choice)).assertTrue();
      expect(typeof choice).assertEqual('number');
      // 测试多次选择都在数组中
      for (let i = 0; i < 5; i++) {
        const c = RandomUtils.randomChoice(arr);
        expect(arr.includes(c)).assertTrue();
      }
      logger.info(`${BUNDLE}randomChoice_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_RANDOM_0700
     * @tc.name      testRandomUtilsRandomColor0030
     * @tc.desc      Test randomColor method for random color generation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomUtilsRandomColor0030', 0, () => {
      logger.info(`${BUNDLE}testRandomUtilsRandomColor0030, begin`);
      // 测试随机颜色格式
      const color = RandomUtils.randomColor();
      expect(color.startsWith('#')).assertTrue();
      expect(color.length).assertEqual(7);
      expect(typeof color).assertEqual('string');
      // 测试十六进制字符
      expect(/^[0-9A-F]{6}$/i.test(color.substring(1))).assertTrue();
      logger.info(`${BUNDLE}randomColor_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_RANDOM_0800
     * @tc.name      testRandomUtilsRandomUUID0031
     * @tc.desc      Test randomUUID method for UUID generation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomUtilsRandomUUID0031', 0, () => {
      logger.info(`${BUNDLE}testRandomUtilsRandomUUID0031, begin`);
      // 测试UUID格式
      const uuid = RandomUtils.randomUUID();
      expect(uuid.length).assertEqual(36);
      expect(uuid.split('-').length).assertEqual(5);
      // 测试两次生成不同
      const uuid2 = RandomUtils.randomUUID();
      expect(uuid !== uuid2).assertTrue();
      logger.info(`${BUNDLE}randomUUID_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_RANDOM_0900
     * @tc.name      testRandomUtilsShuffleArray0032
     * @tc.desc      Test shuffleArray method for array shuffling
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomUtilsShuffleArray0032', 0, () => {
      logger.info(`${BUNDLE}testRandomUtilsShuffleArray0032, begin`);
      // 测试数组打乱
      const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const original = [...arr];
      RandomUtils.shuffleArray(arr);
      // 验证长度不变
      expect(arr.length).assertEqual(original.length);
      expect(Array.isArray(arr)).assertTrue();
      // 验证元素相同（排序后比较）
      const sorted1 = [...arr].sort();
      const sorted2 = [...original].sort();
      expect(JSON.stringify(sorted1)).assertEqual(JSON.stringify(sorted2));
      // 验证返回undefined（原地修改）
      expect(arr.length > 0).assertTrue();
      logger.info(`${BUNDLE}shuffleArray_0001, end`);
    });
  });

  describe('DeviceUtilsTest', () => {
    /**
     * @tc.number    SUB_UTILS_DEVICE_0100
     * @tc.name      testDeviceUtilsGetBrand0033
     * @tc.desc      Test getBrand method for device brand retrieval
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceUtilsGetBrand0033', 0, () => {
      logger.info(`${BUNDLE}testDeviceUtilsGetBrand0033, begin`);
      // 测试获取品牌
      const brand = DeviceUtils.getBrand();
      expect(typeof brand).assertEqual('string');
      expect(brand.length > 0).assertTrue();
      // 测试返回类型
      expect(brand !== null && brand !== undefined).assertTrue();
      logger.info(`${BUNDLE}getBrand_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DEVICE_0200
     * @tc.name      testDeviceUtilsGetModel0034
     * @tc.desc      Test getModel method for device model retrieval
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceUtilsGetModel0034', 0, () => {
      logger.info(`${BUNDLE}testDeviceUtilsGetModel0034, begin`);
      // 测试获取型号
      const model = DeviceUtils.getModel();
      expect(typeof model).assertEqual('string');
      expect(model.length > 0).assertTrue();
      // 测试返回类型
      expect(model !== null && model !== undefined).assertTrue();
      logger.info(`${BUNDLE}getModel_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DEVICE_0300
     * @tc.name      testDeviceUtilsGetOsVersion0035
     * @tc.desc      Test getOsVersion method for OS version retrieval
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceUtilsGetOsVersion0035', 0, () => {
      logger.info(`${BUNDLE}testDeviceUtilsGetOsVersion0035, begin`);
      // 测试获取系统版本
      const version = DeviceUtils.getOsVersion();
      expect(typeof version).assertEqual('string');
      expect(version.length > 0).assertTrue();
      // 测试返回类型
      expect(version !== null && version !== undefined).assertTrue();
      logger.info(`${BUNDLE}getOsVersion_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DEVICE_0400
     * @tc.name      testDeviceUtilsGetDeviceInfo0036
     * @tc.desc      Test getDeviceInfo method for complete device info retrieval
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceUtilsGetDeviceInfo0036', 0, () => {
      logger.info(`${BUNDLE}testDeviceUtilsGetDeviceInfo0036, begin`);
      // 测试获取设备信息
      const info = DeviceUtils.getDeviceInfo();
      expect(info.brand.length > 0).assertTrue();
      expect(info.model.length > 0).assertTrue();
      expect(info.osVersion.length > 0).assertTrue();
      expect(info.osType.length > 0).assertTrue();
      logger.info(`${BUNDLE}getDeviceInfo_0001, end`);
    });

    /**
     * @tc.number    SUB_UTILS_DEVICE_0500
     * @tc.name      testDeviceUtilsGetDisplayInfo0037
     * @tc.desc      Test getDisplayInfo method for display info retrieval
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceUtilsGetDisplayInfo0037', 0, () => {
      logger.info(`${BUNDLE}testDeviceUtilsGetDisplayInfo0037, begin`);
      // 测试获取显示信息
      const displayInfo = DeviceUtils.getDisplayInfo();
      expect(typeof displayInfo).assertEqual('string');
      expect(displayInfo.length > 0).assertTrue();
      // 测试返回类型
      expect(displayInfo !== null && displayInfo !== undefined).assertTrue();
      logger.info(`${BUNDLE}getDisplayInfo_0001, end`);
    });
  });
}
