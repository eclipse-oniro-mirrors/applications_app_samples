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

import { hilog } from '@kit.PerformanceAnalysisKit';

/** 日志域ID */
const DOMAIN: number = 0xF811;
/** 日志标签 */
const TAG: string = 'ValidationUtils';

/**
 * 校验规则枚举
 * 定义常用的校验规则类型
 */
export enum ValidationRule {
  /** 必填项 */
  REQUIRED = 'required',
  /** 邮箱格式 */
  EMAIL = 'email',
  /** 手机号格式 */
  PHONE = 'phone',
  /** URL格式 */
  URL = 'url',
  /** 身份证号 */
  ID_CARD = 'idCard',
  /** 用户名格式 */
  USERNAME = 'username',
  /** 密码强度 */
  PASSWORD = 'password',
  /** 数字 */
  NUMBER = 'number',
  /** 整数 */
  INTEGER = 'integer',
  /** 字母 */
  ALPHA = 'alpha',
  /** 字母数字 */
  ALPHANUMERIC = 'alphanumeric'
}

/**
 * 校验结果结构体
 * 用于存储校验操作的返回结果
 */
export class ValidationResult {
  /** 是否通过校验 */
  public valid: boolean = false;
  /** 校验规则，调用方可据此映射本地化错误消息 */
  public rule: ValidationRule = ValidationRule.REQUIRED;
}

/**
 * 校验条目结构体
 * 用于批量校验时存储字段值和规则的映射
 */
export class ValidationEntry {
  /** 字段值 */
  public value: string = '';
  /** 校验规则 */
  public rule: ValidationRule = ValidationRule.REQUIRED;
}

/**
 * 校验工具类
 * 提供常用的数据校验功能，包括邮箱、手机号、身份证等格式校验
 * 
 * @remarks
 * 该类为静态工具类，无需实例化
 * 支持正则表达式校验和自定义规则
 * 
 * @example
 * ```typescript
 * // 校验邮箱
 * const isEmail = ValidationUtils.isEmail('test@example.com');
 * 
 * // 校验手机号
 * const isPhone = ValidationUtils.isPhone('13800138000');
 * 
 * // 通用校验
 * const result = ValidationUtils.validate('test', ValidationRule.EMAIL);
 * ```
 */
export class ValidationUtils {
  /** 邮箱正则表达式 */
  private static readonly EMAIL_REGEX: RegExp =
    /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

  /** 手机号正则表达式（中国大陆） */
  private static readonly PHONE_REGEX: RegExp =
    /^1[3-9]\d{9}$/;

  /** URL正则表达式 */
  private static readonly URL_REGEX: RegExp =
    /^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*\/?$/;

  /** 身份证号正则表达式（中国大陆） */
  private static readonly ID_CARD_REGEX: RegExp =
    /^[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}[\dXx]$/;

  /** 用户名正则表达式（4-16位字母数字下划线） */
  private static readonly USERNAME_REGEX: RegExp =
    /^[a-zA-Z0-9_]{4,16}$/;

  /** 密码正则表达式（至少8位，包含大小写字母和数字） */
  private static readonly PASSWORD_REGEX: RegExp =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d!@#$%^&*]{8,}$/;

  /** 纯数字正则表达式 */
  private static readonly NUMBER_REGEX: RegExp =
    /^-?\d+\.?\d*$/;

  /** 整数正则表达式 */
  private static readonly INTEGER_REGEX: RegExp =
    /^-?\d+$/;

  /** 纯字母正则表达式 */
  private static readonly ALPHA_REGEX: RegExp =
    /^[a-zA-Z]+$/;

  /** 字母数字正则表达式 */
  private static readonly ALPHANUMERIC_REGEX: RegExp =
    /^[a-zA-Z0-9]+$/;

  /**
   * 校验邮箱格式
   * 检查字符串是否符合邮箱格式
   * 
   * @param email - 待校验的邮箱字符串
   * @returns boolean 格式正确返回true，否则返回false
   */
  static isEmail(email: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isEmail() called with: ${email}`);
    // 检查空值
    if (!email || email.length === 0) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.EMAIL_REGEX.test(email);
    hilog.info(DOMAIN, TAG, `isEmail() result: ${result}`);
    return result;
  }

  /**
   * 校验手机号格式
   * 检查字符串是否符合中国大陆手机号格式
   * 
   * @param phone - 待校验的手机号字符串
   * @returns boolean 格式正确返回true，否则返回false
   */
  static isPhone(phone: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isPhone() called');
    // 检查空值
    if (!phone || phone.length === 0) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.PHONE_REGEX.test(phone);
    hilog.info(DOMAIN, TAG, `isPhone() result: ${result}`);
    return result;
  }

  /**
   * 校验URL格式
   * 检查字符串是否符合URL格式
   * 
   * @param url - 待校验的URL字符串
   * @returns boolean 格式正确返回true，否则返回false
   */
  static isUrl(url: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isUrl() called with: ${url}`);
    // 检查空值
    if (!url || url.length === 0) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.URL_REGEX.test(url);
    hilog.info(DOMAIN, TAG, `isUrl() result: ${result}`);
    return result;
  }

  /**
   * 校验身份证号格式
   * 检查字符串是否符合中国大陆身份证号格式
   * 
   * @param idCard - 待校验的身份证号字符串
   * @returns boolean 格式正确返回true，否则返回false
   */
  static isIdCard(idCard: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isIdCard() called');
    // 检查空值和长度
    if (!idCard || idCard.length !== 18) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.ID_CARD_REGEX.test(idCard);
    hilog.info(DOMAIN, TAG, `isIdCard() result: ${result}`);
    return result;
  }

  /**
   * 校验用户名格式
   * 检查字符串是否符合用户名格式（4-16位字母数字下划线）
   * 
   * @param username - 待校验的用户名字符串
   * @returns boolean 格式正确返回true，否则返回false
   */
  static isUsername(username: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isUsername() called with: ${username}`);
    // 检查空值
    if (!username || username.length === 0) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.USERNAME_REGEX.test(username);
    hilog.info(DOMAIN, TAG, `isUsername() result: ${result}`);
    return result;
  }

  /**
   * 校验密码强度
   * 检查密码是否满足强密码要求（至少8位，包含大小写字母和数字）
   * 
   * @param password - 待校验的密码字符串
   * @returns boolean 满足要求返回true，否则返回false
   */
  static isStrongPassword(password: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isStrongPassword() called');
    // 检查空值
    if (!password || password.length === 0) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.PASSWORD_REGEX.test(password);
    hilog.info(DOMAIN, TAG, `isStrongPassword() result: ${result}`);
    return result;
  }

  /**
   * 校验是否为数字
   * 检查字符串是否为有效的数字（包括小数和负数）
   * 
   * @param value - 待校验的字符串
   * @returns boolean 是数字返回true，否则返回false
   */
  static isNumber(value: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isNumber() called with: ${value}`);
    // 检查空值
    if (!value || value.length === 0) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.NUMBER_REGEX.test(value);
    hilog.info(DOMAIN, TAG, `isNumber() result: ${result}`);
    return result;
  }

  /**
   * 校验是否为整数
   * 检查字符串是否为有效的整数
   * 
   * @param value - 待校验的字符串
   * @returns boolean 是整数返回true，否则返回false
   */
  static isInteger(value: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isInteger() called with: ${value}`);
    // 检查空值
    if (!value || value.length === 0) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.INTEGER_REGEX.test(value);
    hilog.info(DOMAIN, TAG, `isInteger() result: ${result}`);
    return result;
  }

  /**
   * 校验是否为纯字母
   * 检查字符串是否只包含字母
   * 
   * @param value - 待校验的字符串
   * @returns boolean 是纯字母返回true，否则返回false
   */
  static isAlpha(value: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isAlpha() called with: ${value}`);
    // 检查空值
    if (!value || value.length === 0) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.ALPHA_REGEX.test(value);
    hilog.info(DOMAIN, TAG, `isAlpha() result: ${result}`);
    return result;
  }

  /**
   * 校验是否为字母数字组合
   * 检查字符串是否只包含字母和数字
   * 
   * @param value - 待校验的字符串
   * @returns boolean 是字母数字返回true，否则返回false
   */
  static isAlphanumeric(value: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isAlphanumeric() called with: ${value}`);
    // 检查空值
    if (!value || value.length === 0) {
      return false;
    }
    // 执行正则校验
    const result = ValidationUtils.ALPHANUMERIC_REGEX.test(value);
    hilog.info(DOMAIN, TAG, `isAlphanumeric() result: ${result}`);
    return result;
  }

  /**
   * 校验字符串长度
   * 检查字符串长度是否在指定范围内
   * 
   * @param value - 待校验的字符串
   * @param min - 最小长度
   * @param max - 最大长度
   * @returns boolean 长度在范围内返回true，否则返回false
   */
  static isLengthInRange(value: string, min: number, max: number): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isLengthInRange() called with min: ${min}, max: ${max}`);
    // 检查空值
    if (!value) {
      return min === 0;
    }
    // 检查长度范围
    const result = value.length >= min && value.length <= max;
    hilog.info(DOMAIN, TAG, `isLengthInRange() result: ${result}`);
    return result;
  }

  /**
   * 校验数值范围
   * 检查数值是否在指定范围内
   * 
   * @param value - 待校验的数值
   * @param min - 最小值
   * @param max - 最大值
   * @returns boolean 数值在范围内返回true，否则返回false
   */
  static isNumberInRange(value: number, min: number, max: number): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isNumberInRange() called with value: ${value}`);
    // 检查数值范围
    const result = value >= min && value <= max;
    hilog.info(DOMAIN, TAG, `isNumberInRange() result: ${result}`);
    return result;
  }

  /**
   * 通用校验方法
   * 根据指定的校验规则进行校验
   * 
   * @param value - 待校验的值
   * @param rule - 校验规则
   * @returns ValidationResult 校验结果
   */
  static validate(value: string, rule: ValidationRule): ValidationResult {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `validate() called with rule: ${rule}`);
    // 根据规则进行校验
    let valid = false;
    switch (rule) {
      case ValidationRule.REQUIRED:
        valid = value !== null && value !== undefined && value.length > 0;
        break;
      case ValidationRule.EMAIL:
        valid = ValidationUtils.isEmail(value);
        break;
      case ValidationRule.PHONE:
        valid = ValidationUtils.isPhone(value);
        break;
      case ValidationRule.URL:
        valid = ValidationUtils.isUrl(value);
        break;
      case ValidationRule.ID_CARD:
        valid = ValidationUtils.isIdCard(value);
        break;
      case ValidationRule.USERNAME:
        valid = ValidationUtils.isUsername(value);
        break;
      case ValidationRule.PASSWORD:
        valid = ValidationUtils.isStrongPassword(value);
        break;
      case ValidationRule.NUMBER:
        valid = ValidationUtils.isNumber(value);
        break;
      case ValidationRule.INTEGER:
        valid = ValidationUtils.isInteger(value);
        break;
      case ValidationRule.ALPHA:
        valid = ValidationUtils.isAlpha(value);
        break;
      case ValidationRule.ALPHANUMERIC:
        valid = ValidationUtils.isAlphanumeric(value);
        break;
      default:
        valid = false;
    }
    // 返回校验结果，展示文案由调用方根据规则进行本地化
    const result: ValidationResult = new ValidationResult();
    result.valid = valid;
    result.rule = rule;
    hilog.info(DOMAIN, TAG, `validate() result: valid=${result.valid}, rule=${result.rule}`);
    return result;
  }

  /**
   * 批量校验
   * 对多个值进行校验
   * 
   * @param values - 待校验的值和规则映射
   * @returns Map<string, ValidationResult> 字段名到校验结果的映射
   */
  static validateAll(values: Map<string, ValidationEntry>): Map<string, ValidationResult> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `validateAll() called with ${values.size} fields`);
    // 创建结果映射
    const results: Map<string, ValidationResult> = new Map<string, ValidationResult>();
    // 遍历校验每个字段（ArkTS不支持解构变量声明）
    const keys: string[] = Array.from(values.keys());
    for (let i: number = 0; i < keys.length; i++) {
      const field: string = keys[i];
      const config: ValidationEntry | undefined = values.get(field);
      if (config) {
        const result: ValidationResult = ValidationUtils.validate(config.value, config.rule);
        results.set(field, result);
      }
    }
    hilog.info(DOMAIN, TAG, `validateAll() completed for ${results.size} fields`);
    return results;
  }

  /**
   * 检查是否全部校验通过
   * 判断批量校验结果是否全部有效
   * 
   * @param results - 校验结果映射
   * @returns boolean 全部通过返回true，否则返回false
   */
  static isAllValid(results: Map<string, ValidationResult>): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isAllValid() called');
    // 检查所有结果（ArkTS不支持解构变量声明）
    const keys: string[] = Array.from(results.keys());
    for (let i: number = 0; i < keys.length; i++) {
      const result: ValidationResult | undefined = results.get(keys[i]);
      if (result && !result.valid) {
        hilog.info(DOMAIN, TAG, 'isAllValid() result: false');
        return false;
      }
    }
    hilog.info(DOMAIN, TAG, 'isAllValid() result: true');
    return true;
  }

  /**
   * 获取第一个校验错误
   * 从批量校验结果中获取第一个错误信息
   * 
   * @param results - 校验结果映射
   * @returns ValidationResult | null 第一个错误结果或null
   */
  static getFirstError(results: Map<string, ValidationResult>): ValidationResult | null {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getFirstError() called');
    // 查找第一个错误（ArkTS不支持解构变量声明）
    const keys: string[] = Array.from(results.keys());
    for (let i: number = 0; i < keys.length; i++) {
      const result: ValidationResult | undefined = results.get(keys[i]);
      if (result && !result.valid) {
        hilog.info(DOMAIN, TAG, `getFirstError() found rule: ${result.rule}`);
        return result;
      }
    }
    hilog.info(DOMAIN, TAG, 'getFirstError() no errors found');
    return null;
  }
}
