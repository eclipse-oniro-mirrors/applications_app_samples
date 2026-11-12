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

import { DataStoreConstants } from '../constants/DataStoreConstants';
import {
  StoreConfig,
  StoreType,
  SecurityLevel,
  EncryptionMode,
  SyncMode,
  LogLevel
} from '../models/DataModels';
import { Logger } from '../utils/Logger';
import { ResultText } from '../utils/ResultText';

/**
 * Feature flag entry.
 */
export interface FeatureFlag {
  name: string;
  enabled: boolean;
  description: string;
}

/**
 * DataStoreConfig manages application configuration including environment-specific
 * settings, feature flags, and runtime configuration values.
 */
export class DataStoreConfig {
  private static currentConfig: StoreConfig | null = null;
  private static featureFlags: Map<string, FeatureFlag> = new Map();
  private static configValues: Map<string, string> = new Map();

  static getDefaultConfig(): StoreConfig {
    const config: StoreConfig = {
      name: DataStoreConstants.DEFAULT_STORE_NAME,
      storeType: StoreType.PREFERENCES,
      securityLevel: SecurityLevel.S3,
      encryptionMode: EncryptionMode.NONE,
      autoBackup: false,
      maxRetries: 3,
      syncMode: SyncMode.MANUAL,
      syncInterval: 300000,
      logLevel: LogLevel.INFO,
      debugMode: false
    };
    return config;
  }

  static getDevelopmentConfig(): StoreConfig {
    const config: StoreConfig = {
      name: DataStoreConstants.DEFAULT_STORE_NAME + '_dev',
      storeType: StoreType.PREFERENCES,
      securityLevel: SecurityLevel.S1,
      encryptionMode: EncryptionMode.NONE,
      autoBackup: false,
      maxRetries: 1,
      syncMode: SyncMode.MANUAL,
      syncInterval: 60000,
      logLevel: LogLevel.DEBUG,
      debugMode: true
    };
    return config;
  }

  static getProductionConfig(): StoreConfig {
    const config: StoreConfig = {
      name: DataStoreConstants.DEFAULT_STORE_NAME,
      storeType: StoreType.PREFERENCES,
      securityLevel: SecurityLevel.S4,
      encryptionMode: EncryptionMode.AES_256,
      autoBackup: true,
      maxRetries: 5,
      syncMode: SyncMode.REAL_TIME,
      syncInterval: 600000,
      logLevel: LogLevel.ERROR,
      debugMode: false
    };
    return config;
  }

  static getTestConfig(): StoreConfig {
    const config: StoreConfig = {
      name: DataStoreConstants.DEFAULT_STORE_NAME + '_test',
      storeType: StoreType.PREFERENCES,
      securityLevel: SecurityLevel.S1,
      encryptionMode: EncryptionMode.NONE,
      autoBackup: false,
      maxRetries: 1,
      syncMode: SyncMode.MANUAL,
      syncInterval: 0,
      logLevel: LogLevel.NONE,
      debugMode: false
    };
    return config;
  }

  static loadConfig(): StoreConfig {
    if (DataStoreConfig.currentConfig === null) {
      DataStoreConfig.currentConfig = DataStoreConfig.getDefaultConfig();
    }
    const config: StoreConfig = DataStoreConfig.currentConfig;
    const loaded: StoreConfig = {
      name: config.name,
      storeType: config.storeType,
      securityLevel: config.securityLevel,
      encryptionMode: config.encryptionMode,
      autoBackup: config.autoBackup,
      maxRetries: config.maxRetries,
      syncMode: config.syncMode,
      syncInterval: config.syncInterval,
      logLevel: config.logLevel,
      debugMode: config.debugMode
    };
    Logger.info(`Configuration loaded: ${loaded.name}`);
    return loaded;
  }

  static saveConfig(config: StoreConfig): void {
    const saved: StoreConfig = {
      name: config.name,
      storeType: config.storeType,
      securityLevel: config.securityLevel,
      encryptionMode: config.encryptionMode,
      autoBackup: config.autoBackup,
      maxRetries: config.maxRetries,
      syncMode: config.syncMode,
      syncInterval: config.syncInterval,
      logLevel: config.logLevel,
      debugMode: config.debugMode
    };
    DataStoreConfig.currentConfig = saved;
    Logger.info(`Configuration saved: ${saved.name}`);
  }

  static resetConfig(): void {
    DataStoreConfig.currentConfig = DataStoreConfig.getDefaultConfig();
    DataStoreConfig.configValues.clear();
    Logger.info('Configuration reset to defaults');
  }

  static getConfigValue(key: string): string | null {
    const value: string | undefined = DataStoreConfig.configValues.get(key);
    if (value === undefined) {
      return null;
    }
    return value;
  }

  static setConfigValue(key: string, value: string): void {
    DataStoreConfig.configValues.set(key, value);
  }

  static removeConfigValue(key: string): boolean {
    return DataStoreConfig.configValues.delete(key);
  }

  static getAllConfigValues(): Map<string, string> {
    const copy: Map<string, string> = new Map<string, string>();
    DataStoreConfig.configValues.forEach((val: string, key: string) => {
      copy.set(key, val);
    });
    return copy;
  }

  static isFeatureEnabled(feature: string): boolean {
    const flag: FeatureFlag | undefined = DataStoreConfig.featureFlags.get(feature);
    if (flag === undefined) {
      return false;
    }
    return flag.enabled;
  }

  static setFeatureFlag(feature: string, enabled: boolean, description: string): void {
    const flag: FeatureFlag = {
      name: feature,
      enabled: enabled,
      description: description
    };
    DataStoreConfig.featureFlags.set(feature, flag);
  }

  static removeFeatureFlag(feature: string): boolean {
    return DataStoreConfig.featureFlags.delete(feature);
  }

  static getAllFeatureFlags(): FeatureFlag[] {
    const result: FeatureFlag[] = [];
    DataStoreConfig.featureFlags.forEach((flag: FeatureFlag, key: string) => {
      const copy: FeatureFlag = {
        name: flag.name,
        enabled: flag.enabled,
        description: flag.description
      };
      result.push(copy);
    });
    return result;
  }

  static getEnabledFeatureFlags(): FeatureFlag[] {
    const result: FeatureFlag[] = [];
    DataStoreConfig.featureFlags.forEach((flag: FeatureFlag, key: string) => {
      if (flag.enabled) {
        const copy: FeatureFlag = {
          name: flag.name,
          enabled: flag.enabled,
          description: flag.description
        };
        result.push(copy);
      }
    });
    return result;
  }

  static enableDefaultFeatureFlags(): void {
    DataStoreConfig.setFeatureFlag('batchOperations', true, 'Enable batch put/get/delete');
    DataStoreConfig.setFeatureFlag('typedOperations', true, 'Enable typed put/get operations');
    DataStoreConfig.setFeatureFlag('prefixOperations', true, 'Enable prefix-based operations');
    DataStoreConfig.setFeatureFlag('multiTable', true, 'Enable multi-table RDB operations');
    DataStoreConfig.setFeatureFlag('transactions', true, 'Enable RDB transactions');
    DataStoreConfig.setFeatureFlag('collections', true, 'Enable Array/Map/Queue/Record');
    DataStoreConfig.setFeatureFlag('migration', true, 'Enable data migration');
    DataStoreConfig.setFeatureFlag('backup', true, 'Enable data backup/restore');
    DataStoreConfig.setFeatureFlag('encryption', false, 'Enable data encryption');
    DataStoreConfig.setFeatureFlag('distributed', false, 'Enable distributed data sync');
    DataStoreConfig.setFeatureFlag('performanceMonitor', true, 'Enable performance monitoring');
    DataStoreConfig.setFeatureFlag('errorHandling', true, 'Enable advanced error handling');
  }

  static getCurrentConfig(): StoreConfig | null {
    return DataStoreConfig.currentConfig;
  }

  static getConfigSummary(): string {
    const config: StoreConfig | null = DataStoreConfig.currentConfig;
    if (config === null) {
      return ResultText.of($r('app.string.result_config_none'), 'No configuration loaded');
    }
    const enabledFlags: FeatureFlag[] = DataStoreConfig.getEnabledFeatureFlags();
    return ResultText.ofArgs($r('app.string.result_config_summary'),
      [config.name, String(config.storeType), String(config.securityLevel), String(config.encryptionMode),
        String(config.autoBackup), config.maxRetries, String(config.syncMode), String(config.debugMode),
        enabledFlags.length, DataStoreConfig.featureFlags.size],
      `Config: ${config.name} [${config.storeType}] ` +
        `Security=${config.securityLevel} Encryption=${config.encryptionMode} ` +
        `AutoBackup=${config.autoBackup} MaxRetries=${config.maxRetries} ` +
        `SyncMode=${config.syncMode} Debug=${config.debugMode} ` +
        `Features=${enabledFlags.length}/${DataStoreConfig.featureFlags.size}`);
  }

  static validateConfig(config: StoreConfig): boolean {
    if (config.name === null || config.name === undefined || config.name.length === 0) {
      return false;
    }
    if (config.maxRetries < 0) {
      return false;
    }
    if (config.syncInterval < 0) {
      return false;
    }
    if (config.logLevel < LogLevel.DEBUG || config.logLevel > LogLevel.NONE) {
      return false;
    }
    return true;
  }

  static mergeConfig(base: StoreConfig, overrides: StoreConfig): StoreConfig {
    const merged: StoreConfig = {
      name: overrides.name.length > 0 ? overrides.name : base.name,
      storeType: overrides.storeType,
      securityLevel: overrides.securityLevel,
      encryptionMode: overrides.encryptionMode,
      autoBackup: overrides.autoBackup,
      maxRetries: overrides.maxRetries,
      syncMode: overrides.syncMode,
      syncInterval: overrides.syncInterval,
      logLevel: overrides.logLevel,
      debugMode: overrides.debugMode
    };
    return merged;
  }
}
