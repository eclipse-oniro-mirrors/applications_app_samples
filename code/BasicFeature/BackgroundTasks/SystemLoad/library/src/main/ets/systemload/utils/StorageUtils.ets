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

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getObjectKeys } from './ObjectHelper';

/** 日志域ID */
const DOMAIN: number = 0xFF00;
/** 日志标签 */
const TAG: string = 'StorageUtils';

/**
 * 存储配置选项结构体
 * 用于配置存储操作的各种参数
 */
export class StorageOptions {
  /** 是否加密存储 */
  public encrypted: boolean = false;
  /** 数据过期时间（毫秒） */
  public expireTime: number = 0;
  /** 存储模式：sync/async */
  public mode: string = 'async';
}

/**
 * 存储条目结构体
 * 用于存储带元数据的数据项
 */
export class StorageEntry<T> {
  /** 数据值 */
  public value: T | null = null;
  /** 创建时间戳 */
  public createdAt: number = 0;
  /** 过期时间戳 */
  public expireAt: number = 0;
  /** 数据标签 */
  public tag: string = '';
}

/**
 * 存储工具类
 * 封装Preferences API，提供简单易用的本地持久化存储
 * 
 * @remarks
 * 该类提供同步和异步两种存储方式
 * 支持数据过期、加密等高级功能
 * 
 * @example
 * ```typescript
 * // 存储数据
 * StorageUtils.put(context, 'user_name', 'John');
 * 
 * // 读取数据
 * const name = StorageUtils.get<string>(context, 'user_name', 'default');
 * 
 * // 存储带过期时间的数据
 * StorageUtils.putWithExpire(context, 'token', 'xxx', 3600000);
 * ```
 */
export class StorageUtils {
  /** 默认Preferences文件名 */
  public static readonly DEFAULT_STORE_NAME: string = 'app_data';
  /** 默认值前缀 */
  public static readonly KEY_PREFIX: string = 'storage_';

  /**
   * 获取Preferences实例
   * 创建或获取指定名称的Preferences对象
   * 
   * @param context - 应用上下文
   * @param storeName - 存储文件名，默认为'app_data'
   * @returns Promise<preferences.Preferences> Preferences实例
   */
  static async getPreferences(
    context: common.Context,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<preferences.Preferences> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `getPreferences() called with storeName: ${storeName}`);
    try {
      // 获取Preferences实例
      const pref: preferences.Preferences = await preferences.getPreferences(context, storeName);
      hilog.info(DOMAIN, TAG, 'getPreferences() success');
      return pref;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getPreferences() failed: ${(error as Error).message}`);
      throw new Error(`getPreferences failed: ${(error as Error).message}`);
    }
  }

  /**
   * 同步获取Preferences实例
   * 同步方式创建或获取Preferences对象
   * 注意：由于preferences.Options类型在当前API版本中不可用，
   * 此方法使用异步getPreferences的同步包装
   * 
   * @param context - 应用上下文
   * @param storeName - 存储文件名
   * @returns Promise<preferences.Preferences> Preferences实例
   */
  static async getPreferencesByName(
    context: common.Context,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<preferences.Preferences> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `getPreferencesByName() called with storeName: ${storeName}`);
    try {
      // 使用字符串名称参数获取Preferences实例
      const pref: preferences.Preferences = await preferences.getPreferences(context, storeName);
      hilog.info(DOMAIN, TAG, 'getPreferencesByName() success');
      return pref;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getPreferencesByName() failed: ${(error as Error).message}`);
      throw new Error(`getPreferencesByName failed: ${(error as Error).message}`);
    }
  }

  /**
   * 存储字符串值
   * 将字符串数据保存到Preferences
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param value - 存储值
   * @param storeName - 存储文件名
   * @returns Promise<void>
   */
  static async putString(
    context: common.Context,
    key: string,
    value: string,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `putString() called with key: ${key}`);
    try {
      // 获取Preferences并存储
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      await pref.put(key, value);
      await pref.flush();
      hilog.info(DOMAIN, TAG, `putString() success for key: ${key}`);
    } catch (error) {
      // 记录存储失败
      hilog.error(DOMAIN, TAG, `putString() failed: ${(error as Error).message}`);
      throw new Error(`putString failed: ${(error as Error).message}`);
    }
  }

  /**
   * 存储数字值
   * 将数字数据保存到Preferences
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param value - 存储值
   * @param storeName - 存储文件名
   * @returns Promise<void>
   */
  static async putNumber(
    context: common.Context,
    key: string,
    value: number,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `putNumber() called with key: ${key}`);
    try {
      // 获取Preferences并存储
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      await pref.put(key, value);
      await pref.flush();
      hilog.info(DOMAIN, TAG, `putNumber() success for key: ${key}`);
    } catch (error) {
      // 记录存储失败
      hilog.error(DOMAIN, TAG, `putNumber() failed: ${(error as Error).message}`);
      throw new Error(`putNumber failed: ${(error as Error).message}`);
    }
  }

  /**
   * 存储布尔值
   * 将布尔数据保存到Preferences
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param value - 存储值
   * @param storeName - 存储文件名
   * @returns Promise<void>
   */
  static async putBoolean(
    context: common.Context,
    key: string,
    value: boolean,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `putBoolean() called with key: ${key}`);
    try {
      // 获取Preferences并存储
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      await pref.put(key, value);
      await pref.flush();
      hilog.info(DOMAIN, TAG, `putBoolean() success for key: ${key}`);
    } catch (error) {
      // 记录存储失败
      hilog.error(DOMAIN, TAG, `putBoolean() failed: ${(error as Error).message}`);
      throw new Error(`putBoolean failed: ${(error as Error).message}`);
    }
  }

  /**
   * 存储对象
   * 将JSON对象序列化后保存到Preferences
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param value - 存储对象
   * @param storeName - 存储文件名
   * @returns Promise<void>
   */
  static async putObject<T>(
    context: common.Context,
    key: string,
    value: T,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `putObject() called with key: ${key}`);
    try {
      // 序列化对象
      const jsonStr: string = JSON.stringify(value);
      // 获取Preferences并存储
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      await pref.put(key, jsonStr);
      await pref.flush();
      hilog.info(DOMAIN, TAG, `putObject() success for key: ${key}`);
    } catch (error) {
      // 记录存储失败
      hilog.error(DOMAIN, TAG, `putObject() failed: ${(error as Error).message}`);
      throw new Error(`putObject failed: ${(error as Error).message}`);
    }
  }

  /**
   * 存储带过期时间的数据
   * 保存数据并设置过期时间戳
   * 
   * @paramcontext - 应用上下文
   * @param key - 存储键名
   * @param value - 存储值
   * @param expireTime - 过期时间（毫秒）
   * @param storeName - 存储文件名
   * @returns Promise<void>
   */
  static async putWithExpire<T>(
    context: common.Context,
    key: string,
    value: T,
    expireTime: number,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `putWithExpire() called with key: ${key}, expireTime: ${expireTime}`);
    try {
      // 创建存储条目
      const entry: StorageEntry<T> = new StorageEntry<T>();
      entry.value = value;
      entry.createdAt = Date.now();
      entry.expireAt = Date.now() + expireTime;
      // 序列化并存储
      const jsonStr: string = JSON.stringify(entry);
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      await pref.put(key, jsonStr);
      await pref.flush();
      hilog.info(DOMAIN, TAG, `putWithExpire() success for key: ${key}`);
    } catch (error) {
      // 记录存储失败
      hilog.error(DOMAIN, TAG, `putWithExpire() failed: ${(error as Error).message}`);
      throw new Error(`putWithExpire failed: ${(error as Error).message}`);
    }
  }

  /**
   * 获取字符串值
   * 从Preferences读取字符串数据
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param defaultValue - 默认值
   * @param storeName - 存储文件名
   * @returns Promise<string> 存储的字符串或默认值
   */
  static async getString(
    context: common.Context,
    key: string,
    defaultValue: string = '',
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<string> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `getString() called with key: ${key}`);
    try {
      // 获取Preferences并读取
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      const value: preferences.ValueType = await pref.get(key, defaultValue);
      hilog.info(DOMAIN, TAG, `getString() success for key: ${key}`);
      return value as string;
    } catch (error) {
      // 记录读取失败
      hilog.error(DOMAIN, TAG, `getString() failed: ${(error as Error).message}`);
      return defaultValue;
    }
  }

  /**
   * 获取数字值
   * 从Preferences读取数字数据
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param defaultValue - 默认值
   * @param storeName - 存储文件名
   * @returns Promise<number> 存储的数字或默认值
   */
  static async getNumber(
    context: common.Context,
    key: string,
    defaultValue: number = 0,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<number> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `getNumber() called with key: ${key}`);
    try {
      // 获取Preferences并读取
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      const value: preferences.ValueType = await pref.get(key, defaultValue);
      hilog.info(DOMAIN, TAG, `getNumber() success for key: ${key}`);
      return value as number;
    } catch (error) {
      // 记录读取失败
      hilog.error(DOMAIN, TAG, `getNumber() failed: ${(error as Error).message}`);
      return defaultValue;
    }
  }

  /**
   * 获取布尔值
   * 从Preferences读取布尔数据
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param defaultValue - 默认值
   * @param storeName - 存储文件名
   * @returns Promise<boolean> 存储的布尔值或默认值
   */
  static async getBoolean(
    context: common.Context,
    key: string,
    defaultValue: boolean = false,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `getBoolean() called with key: ${key}`);
    try {
      // 获取Preferences并读取
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      const value: preferences.ValueType = await pref.get(key, defaultValue);
      hilog.info(DOMAIN, TAG, `getBoolean() success for key: ${key}`);
      return value as boolean;
    } catch (error) {
      // 记录读取失败
      hilog.error(DOMAIN, TAG, `getBoolean() failed: ${(error as Error).message}`);
      return defaultValue;
    }
  }

  /**
   * 获取对象
   * 从Preferences读取并反序列化JSON对象
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param defaultValue - 默认值
   * @param storeName - 存储文件名
   * @returns Promise<T> 反序列化后的对象或默认值
   */
  static async getObject<T>(
    context: common.Context,
    key: string,
    defaultValue: T,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<T> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `getObject() called with key: ${key}`);
    try {
      // 获取Preferences并读取
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      const jsonStr: string = await pref.get(key, '') as string;
      // 检查是否为空
      if (!jsonStr || jsonStr.length === 0) {
        return defaultValue;
      }
      // 反序列化对象
      const value: T = JSON.parse(jsonStr) as T;
      hilog.info(DOMAIN, TAG, `getObject() success for key: ${key}`);
      return value;
    } catch (error) {
      // 记录读取失败
      hilog.error(DOMAIN, TAG, `getObject() failed: ${(error as Error).message}`);
      return defaultValue;
    }
  }

  /**
   * 获取带过期检查的数据
   * 读取数据并检查是否已过期
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param defaultValue - 默认值
   * @param storeName - 存储文件名
   * @returns Promiseet<T> 未过期返回存储值，过期或不存在返回默认值
   */
  static async getWithExpireCheck<T>(
    context: common.Context,
    key: string,
    defaultValue: T,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<T> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `getWithExpireCheck() called with key: ${key}`);
    try {
      // 获取Preferences并读取
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      const jsonStr: string = await pref.get(key, '') as string;
      // 检查是否为空
      if (!jsonStr || jsonStr.length === 0) {
        return defaultValue;
      }
      // 反序列化条目
      const entry: StorageEntry<T> = JSON.parse(jsonStr) as StorageEntry<T>;
      // 检查是否过期
      if (entry.expireAt > 0 && Date.now() > entry.expireAt) {
        hilog.info(DOMAIN, TAG, `getWithExpireCheck() data expired for key: ${key}`);
        // 删除过期数据
        await StorageUtils.remove(context, key, storeName);
        return defaultValue;
      }
      hilog.info(DOMAIN, TAG, `getWithExpireCheck() success for key: ${key}`);
      return entry.value as T;
    } catch (error) {
      // 记录读取失败
      hilog.error(DOMAIN, TAG, `getWithExpireCheck() failed: ${(error as Error).message}`);
      return defaultValue;
    }
  }

  /**
   * 删除指定键的数据
   * 从Preferences中删除指定键值对
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param storeName - 存储文件名
   * @returns Promise<void>
   */
  static async remove(
    context: common.Context,
    key: string,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `remove() called with key: ${key}`);
    try {
      // 获取Preferences并删除
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      await pref.delete(key);
      await pref.flush();
      hilog.info(DOMAIN, TAG, `remove() success for key: ${key}`);
    } catch (error) {
      // 记录删除失败
      hilog.error(DOMAIN, TAG, `remove() failed: ${(error as Error).message}`);
      throw new Error(`remove failed: ${(error as Error).message}`);
    }
  }

  /**
   * 清空所有数据
   * 删除指定Preferences文件中的所有数据
   * 
   * @param context - 应用上下文
   * @param storeName - 存储文件名
   * @returns Promise<void>
   */
  static async clear(
    context: common.Context,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `clear() called with storeName: ${storeName}`);
    try {
      // 获取Preferences并清空
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      await pref.clear();
      await pref.flush();
      hilog.info(DOMAIN, TAG, 'clear() success');
    } catch (error) {
      // 记录清空失败
      hilog.error(DOMAIN, TAG, `clear() failed: ${(error as Error).message}`);
      throw new Error(`clear failed: ${(error as Error).message}`);
    }
  }

  /**
   * 检查键是否存在
   * 判断指定键在Preferences中是否存在
   * 
   * @param context - 应用上下文
   * @param key - 存储键名
   * @param storeName - 存储文件名
   * @returns Promise<boolean> 存在返回true，否则返回false
   */
  static async has(
    context: common.Context,
    key: string,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `has() called with key: ${key}`);
    try {
      // 获取Preferences并检查
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      const hasKey: boolean = await pref.has(key);
      hilog.info(DOMAIN, TAG, `has() result for key ${key}: ${hasKey}`);
      return hasKey;
    } catch (error) {
      // 记录检查失败
      hilog.error(DOMAIN, TAG, `has() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 获取所有键名
   * 返回Preferences中所有存储键的数组
   * 
   * @param context - 应用上下文
   * @param storeName - 存储文件名
   * @returns Promise<string[]> 键名数组
   */
  static async getAllKeys(
    context: common.Context,
    storeName: string = StorageUtils.DEFAULT_STORE_NAME
  ): Promise<string[]> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `getAllKeys() called with storeName: ${storeName}`);
    try {
      // 获取Preferences
      const pref: preferences.Preferences = await StorageUtils.getPreferences(context, storeName);
      // 获取所有键值对数据 - getAllSync()返回Object（包含所有键值对）
      const allData: Object = pref.getAllSync();
      // 由于ArkTS中无Object.keys，使用ts文件中的辅助方法获取键名
      const keys: string[] = getObjectKeys(allData);
      hilog.info(DOMAIN, TAG, `getAllKeys() found ${keys.length} keys`);
      return keys;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getAllKeys() failed: ${(error as Error).message}`);
      return [];
    }
  }
}
