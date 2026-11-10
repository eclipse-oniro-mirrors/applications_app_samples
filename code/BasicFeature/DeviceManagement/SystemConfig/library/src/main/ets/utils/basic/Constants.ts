/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 应用级常量类
// ========================================

/**
 * 应用级常量类
 * 定义应用中通用的常量值，包括API版本、默认值、时间单位、字节单位、正则表达式等
 * 所有常量均为静态只读属性，确保在应用生命周期内不会改变
 */
export class Constants {
  // ========================================
  // API版本常量
  // ========================================

  /** API主版本号 */
  static readonly API_VERSION_MAJOR: number = 1;

  /** API次版本号 */
  static readonly API_VERSION_MINOR: number = 0;

  /** API修订版本号 */
  static readonly API_VERSION_PATCH: number = 0;

  /** 完整的API版本字符串 */
  static readonly API_VERSION_STRING: string = `${Constants.API_VERSION_MAJOR}.${Constants.API_VERSION_MINOR}.${Constants.API_VERSION_PATCH}`;

  /** API版本数字标识 */
  static readonly API_VERSION_CODE: number = 100;

  // ========================================
  // 默认值常量
  // ========================================

  /** 默认页面大小 */
  static readonly DEFAULT_PAGE_SIZE: number = 20;

  /** 默认超时时间（毫秒） */
  static readonly DEFAULT_TIMEOUT_MS: number = 30000;

  /** 默认重试次数 */
  static readonly DEFAULT_RETRY_COUNT: number = 3;

  /** 默认动画时长（毫秒） */
  static readonly DEFAULT_ANIMATION_DURATION: number = 300;

  /** 默认字体大小 */
  static readonly DEFAULT_FONT_SIZE: number = 14;

  /** 默认圆角半径 */
  static readonly DEFAULT_BORDER_RADIUS: number = 8;

  /** 默认间距 */
  static readonly DEFAULT_SPACING: number = 12;

  /** 默认最大缓存数量 */
  static readonly DEFAULT_MAX_CACHE_SIZE: number = 100;

  /** 默认日志级别 */
  static readonly DEFAULT_LOG_LEVEL: number = 2;

  // ========================================
  // 时间单位常量（毫秒）
  // ========================================

  /** 每秒的毫秒数 */
  static readonly MILLISECONDS_PER_SECOND: number = 1000;

  /** 每分钟的毫秒数 */
  static readonly MILLISECONDS_PER_MINUTE: number = 60000;

  /** 每小时的毫秒数 */
  static readonly MILLISECONDS_PER_HOUR: number = 3600000;

  /** 每天的毫秒数 */
  static readonly MILLISECONDS_PER_DAY: number = 86400000;

  /** 每周的毫秒数 */
  static readonly MILLISECONDS_PER_WEEK: number = 604800000;

  /** 每分钟的秒数 */
  static readonly SECONDS_PER_MINUTE: number = 60;

  /** 每小时的秒数 */
  static readonly SECONDS_PER_HOUR: number = 3600;

  /** 每天的秒数 */
  static readonly SECONDS_PER_DAY: number = 86400;

  // ========================================
  // 字节单位常量
  // ========================================

  /** 1 KB的字节数 */
  static readonly KB: number = 1024;

  /** 1 MB的字节数 */
  static readonly MB: number = 1048576;

  /** 1 GB的字节数 */
  static readonly GB: number = 1073741824;

  /** 1 TB的字节数 */
  static readonly TB: number = 1099511627776;

  // ========================================
  // 空字符串常量
  // ========================================

  /** 空字符串 */
  static readonly EMPTY_STRING: string = '';

  /** 空格字符串 */
  static readonly SPACE_STRING: string = ' ';

  /** 换行符 */
  static readonly NEWLINE: string = '\n';

  /** 制表符 */
  static readonly TAB: string = '\t';

  // ========================================
  // 常用正则表达式
  // ========================================

  /** 邮箱地址正则表达式 */
  static readonly EMAIL_REGEX: string = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';

  /** 手机号码正则表达式（中国大陆） */
  static readonly PHONE_REGEX: string = '^1[3-9]\\d{9}$';

  /** URL正则表达式 */
  static readonly URL_REGEX: string = '^https?:\\/\\/[\\w\\-]+(\\.[\\w\\-]+)+([\\/\\w\\-._~:?#\\[\\]@!$&\'()*+,;=%]*)*$';

  /** 身份证号码正则表达式 */
  static readonly ID_CARD_REGEX: string = '^[1-9]\\d{5}(18|19|20)\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\\d|3[01])\\d{3}[\\dXx]$';

  /** 中文名称正则表达式 */
  static readonly CHINESE_NAME_REGEX: string = '^[\\u4e00-\\u9fa5]{2,20}$';

  /** 密码强度正则表达式（至少8位，包含大小写字母和数字） */
  static readonly PASSWORD_REGEX: string = '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d!@#$%^&*]{8,}$';

  /** IPv4地址正则表达式 */
  static readonly IPV4_REGEX: string = '^((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$';

  /** 纯数字正则表达式 */
  static readonly NUMERIC_REGEX: string = '^\\d+$';

  /** 字母数字混合正则表达式 */
  static readonly ALPHANUMERIC_REGEX: string = '^[a-zA-Z0-9]+$';

  // ========================================
  // 初始化方法
  // ========================================

  /**
   * 初始化常量类
   * 记录常量加载完成的日志信息
   */
  static initialize(): void {
    hilog.info(DOMAIN, TAG, `常量类已初始化，API版本: ${Constants.API_VERSION_STRING}`);
  }

  /**
   * 获取完整的API版本信息对象
   * @returns 包含主版本号、次版本号、修订号的版本信息
   */
  static getVersionInfo(): VersionInfo {
    return {
      major: Constants.API_VERSION_MAJOR,
      minor: Constants.API_VERSION_MINOR,
      patch: Constants.API_VERSION_PATCH,
      versionString: Constants.API_VERSION_STRING,
      versionCode: Constants.API_VERSION_CODE,
    };
  }

  /**
   * 验证邮箱地址格式是否有效
   * @param email - 要验证的邮箱地址
   * @returns 邮箱格式是否有效
   */
  static isValidEmail(email: string): boolean {
    const regex: RegExp = new RegExp(Constants.EMAIL_REGEX);
    return regex.test(email);
  }

  /**
   * 验证手机号码格式是否有效
   * @param phone - 要验证的手机号码
   * @returns 手机号码格式是否有效
   */
  static isValidPhone(phone: string): boolean {
    const regex: RegExp = new RegExp(Constants.PHONE_REGEX);
    return regex.test(phone);
  }

  /**
   * 验证URL格式是否有效
   * @param url - 要验证的URL字符串
   * @returns URL格式是否有效
   */
  static isValidUrl(url: string): boolean {
    const regex: RegExp = new RegExp(Constants.URL_REGEX);
    return regex.test(url);
  }
}

// ========================================
// 版本信息接口
// ========================================

/**
 * 版本信息接口
 * 定义API版本信息的结构
 */
export interface VersionInfo {
  /** 主版本号 */
  major: number;
  /** 次版本号 */
  minor: number;
  /** 修订版本号 */
  patch: number;
  /** 版本字符串 */
  versionString: string;
  /** 版本数字代码 */
  versionCode: number;
}
