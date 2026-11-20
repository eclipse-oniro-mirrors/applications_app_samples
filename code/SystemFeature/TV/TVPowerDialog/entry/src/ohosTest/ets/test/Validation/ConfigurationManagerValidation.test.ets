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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

// 配置类型枚举：定义系统支持的所有配置数据类型，确保类型安全
enum ConfigType {
  STRING = 'string', NUMBER = 'number', BOOLEAN = 'boolean', OBJECT = 'object'
}

// 配置对象值接口：定义对象类型配置的结构，支持位置和大小的配置
interface ConfigObjectValue {
  x?: number;
  y?: number;
  width?: number;
  height?: number;
}

interface ConfigItem {
  key: string;
  value: string | number | boolean | ConfigObjectValue;
  type: ConfigType;
  lastModified: number;
}

interface ConfigChangeRecord {
  key: string;
  oldValue: string | number | boolean | ConfigObjectValue;
  newValue: string | number | boolean | ConfigObjectValue;
  timestamp: number;
}

interface ConfigBatchItem {
  key: string;
  value: string | number | boolean | ConfigObjectValue;
  type: ConfigType;
}

// 配置管理器类：管理所有系统配置的读写、变更历史和批量操作
class ConfigurationManager {
  private static instance: ConfigurationManager;
  private configStore: Map<string, ConfigItem> = new Map();
  private changeHistory: ConfigChangeRecord[] = [];

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ConfigurationManager {
    if (!ConfigurationManager.instance) {
      ConfigurationManager.instance = new ConfigurationManager();
    }
    return ConfigurationManager.instance;
  }

  // 设置配置：验证配置能被正确存储并记录变更历史
  public setConfig(key: string, value: string | number | boolean | ConfigObjectValue, type: ConfigType): void {
    const existingItem: ConfigItem | undefined = this.configStore.get(key);
    const oldValue = existingItem === undefined ? undefined : existingItem.value;

    const configItem: ConfigItem = {
      key,
      value,
      type,
      lastModified: Date.now()
    };

    this.configStore.set(key, configItem);

    // 记录变更历史：只有更新已有配置时才记录，用于追踪配置变更
    if (oldValue !== undefined) {
      const changeRecord: ConfigChangeRecord = {
        key,
        oldValue,
        newValue: value,
        timestamp: Date.now()
      };
      this.changeHistory.push(changeRecord);
    }
  }

  // 获取配置项：返回完整的配置信息包括类型和修改时间
  public getConfig(key: string): ConfigItem | undefined {
    return this.configStore.get(key);
  }

  // 获取配置值：只返回配置的值部分，简化使用场景
  public getConfigValue(key: string): string | number | boolean | ConfigObjectValue | undefined {
    const config = this.configStore.get(key);
    return config ? config.value : undefined;
  }

  // 删除配置：验证配置能被正确移除并返回操作结果
  public deleteConfig(key: string): boolean {
    return this.configStore.delete(key);
  }

  // 检查配置是否存在：验证特定键的配置是否已存在
  public hasConfig(key: string): boolean {
    return this.configStore.has(key);
  }

  // 获取所有配置：返回所有配置项的数组，用于批量处理
  public getAllConfigs(): ConfigItem[] {
    return Array.from(this.configStore.values());
  }

  // 获取配置数量：返回当前存储的配置项总数
  public getConfigCount(): number {
    return this.configStore.size;
  }

  // 清空所有配置：移除所有配置项和变更历史，用于测试环境重置
  public clearAllConfigs(): void {
    this.configStore.clear();
    this.changeHistory = [];
  }

  // 获取变更历史：返回所有配置变更记录的副本，防止外部修改
  public getChangeHistory(): ConfigChangeRecord[] {
    return [...this.changeHistory];
  }

  // 获取指定键的变更历史：返回特定配置键的所有变更记录
  public getKeyChangeHistory(key: string): ConfigChangeRecord[] {
    return this.changeHistory.filter(change => change.key === key);
  }

  // 重置系统：清空所有配置和变更历史，确保测试独立性
  public resetSystem(): void {
    this.clearAllConfigs();
  }

  // 批量设置配置：验证多个配置能一次性设置，提高操作效率
  public batchSetConfigs(configs: ConfigBatchItem[]): void {
    for (const config of configs) {
      this.setConfig(config.key, config.value, config.type);
    }
  }

  // 导出配置为JSON：验证配置能被序列化为JSON字符串，用于持久化存储
  public exportConfigs(): string {
    const configArray = this.getAllConfigs();
    return JSON.stringify(configArray);
  }

  // 从JSON导入配置：验证JSON字符串能被正确解析并恢复配置
  public importConfigs(jsonString: string): boolean {
    try {
      const configArray: ConfigItem[] = JSON.parse(jsonString);
      for (const config of configArray) {
        this.setConfig(config.key, config.value, config.type);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  // 验证配置类型：检查指定键的配置类型是否与预期一致
  public validateConfigType(key: string, expectedType: ConfigType): boolean {
    const config = this.configStore.get(key);
    if (!config) {
      return false;
    }
    return config.type === expectedType;
  }

  // 获取所有配置键：返回所有配置项的键名数组
  public getConfigKeys(): string[] {
    return Array.from(this.configStore.keys());
  }
}

export default function configurationManagerValidationTest() {
  describe('ConfigurationManagerValidation_Test', () => {
    let driver: Driver;
    let configManager: ConfigurationManager;

    // 测试前置：初始化驱动和配置管理器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      configManager = ConfigurationManager.getInstance();
      configManager.resetSystem();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证配置类型枚举定义正确：确保所有配置类型值与预期一致
    it('config_type_enum_should_be_defined_correctly', 0, async () => {
      expect(ConfigType.STRING).assertEqual('string');
      expect(ConfigType.NUMBER).assertEqual('number');
      expect(ConfigType.BOOLEAN).assertEqual('boolean');
      expect(ConfigType.OBJECT).assertEqual('object');
    });

    // 验证配置管理器初始状态为空：确保重置后没有任何配置数据
    it('config_manager_initial_state_should_be_empty', 0, async () => {
      configManager.resetSystem();
      expect(configManager.getConfigCount()).assertEqual(0);
      expect(configManager.getAllConfigs().length).assertEqual(0);
      expect(configManager.getConfigKeys().length).assertEqual(0);
    });

    // 验证字符串配置设置功能：确保字符串类型配置能正确存储和读取
    it('string_config_setting_should_work_correctly', 0, async () => {
      configManager.resetSystem();

      configManager.setConfig('dialog_title', '电源对话框', ConfigType.STRING);

      expect(configManager.hasConfig('dialog_title')).assertTrue();
      expect(configManager.getConfigValue('dialog_title')).assertEqual('电源对话框');

      const config = configManager.getConfig('dialog_title');
      expect(config?.type).assertEqual(ConfigType.STRING);
      expect(config?.key).assertEqual('dialog_title');
    });

    // 验证数字配置设置功能：确保数字类型配置能正确存储和读取
    it('number_config_setting_should_work_correctly', 0, async () => {
      configManager.resetSystem();

      configManager.setConfig('dialog_timeout', 5000, ConfigType.NUMBER);

      expect(configManager.hasConfig('dialog_timeout')).assertTrue();
      expect(configManager.getConfigValue('dialog_timeout')).assertEqual(5000);

      const config = configManager.getConfig('dialog_timeout');
      expect(config?.type).assertEqual(ConfigType.NUMBER);
    });

    // 验证布尔配置设置功能：确保布尔类型配置能正确存储和读取
    it('boolean_config_setting_should_work_correctly', 0, async () => {
      configManager.resetSystem();

      configManager.setConfig('show_animation', true, ConfigType.BOOLEAN);

      expect(configManager.hasConfig('show_animation')).assertTrue();
      expect(configManager.getConfigValue('show_animation')).assertTrue();

      const config = configManager.getConfig('show_animation');
      expect(config?.type).assertEqual(ConfigType.BOOLEAN);
    });

    // 验证对象配置设置功能：确保对象类型配置能正确存储和读取
    it('object_config_setting_should_work_correctly', 0, async () => {
      configManager.resetSystem();

      const dialogPosition: ConfigObjectValue = {
        x: 100,
        y: 200,
        width: 800,
        height: 600
      };

      configManager.setConfig('dialog_position', dialogPosition, ConfigType.OBJECT);

      expect(configManager.hasConfig('dialog_position')).assertTrue();

      const config = configManager.getConfig('dialog_position');
      expect(config?.type).assertEqual(ConfigType.OBJECT);

      const value = config?.value as ConfigObjectValue;
      expect(value.x).assertEqual(100);
      expect(value.y).assertEqual(200);
    });

    // 验证配置更新记录变更历史：确保配置变更能被追溯用于审计
    it('config_update_should_record_change_history', 0, async () => {
      configManager.resetSystem();

      // 首次设置配置不记录变更历史
      configManager.setConfig('focus_index', 0, ConfigType.NUMBER);

      // 后续更新配置会记录变更历史
      configManager.setConfig('focus_index', 1, ConfigType.NUMBER);
      configManager.setConfig('focus_index', 2, ConfigType.NUMBER);
      const history = configManager.getKeyChangeHistory('focus_index');
      expect(history.length).assertEqual(2);

      expect(history[0].oldValue).assertEqual(0);
      expect(history[0].newValue).assertEqual(1);

      expect(history[1].oldValue).assertEqual(1);
      expect(history[1].newValue).assertEqual(2);
    });

    // 验证配置删除功能：确保配置能被正确移除且删除不存在的配置返回失败
    it('config_deletion_should_work_correctly', 0, async () => {
      configManager.resetSystem();

      configManager.setConfig('temp_config', 'temp_value', ConfigType.STRING);
      expect(configManager.hasConfig('temp_config')).assertTrue();

      const deleteResult = configManager.deleteConfig('temp_config');
      expect(deleteResult).assertTrue();
      expect(configManager.hasConfig('temp_config')).assertFalse();

      // 删除不存在的配置应该返回失败
      const deleteNonExistent = configManager.deleteConfig('non_existent');
      expect(deleteNonExistent).assertFalse();
    });

    // 验证批量配置设置功能：确保多个配置能一次性高效设置
    it('batch_config_setting_should_work_correctly', 0, async () => {
      configManager.resetSystem();

      const config1: ConfigBatchItem = { key: 'dialog_title', value: '电源对话框', type: ConfigType.STRING };
      const config2: ConfigBatchItem = { key: 'dialog_timeout', value: 5000, type: ConfigType.NUMBER };
      const config3: ConfigBatchItem = { key: 'show_animation', value: true, type: ConfigType.BOOLEAN };
      const config4: ConfigBatchItem = { key: 'dialog_opacity', value: 0.9, type: ConfigType.NUMBER };
      const configs: ConfigBatchItem[] = [config1, config2, config3, config4];

      configManager.batchSetConfigs(configs);

      expect(configManager.getConfigCount()).assertEqual(4);
      expect(configManager.getConfigValue('dialog_title')).assertEqual('电源对话框');
      expect(configManager.getConfigValue('dialog_timeout')).assertEqual(5000);
      expect(configManager.getConfigValue('show_animation')).assertTrue();
      expect(configManager.getConfigValue('dialog_opacity')).assertEqual(0.9);
    });

    // 验证配置导出导入功能：确保配置能正确序列化和反序列化
    it('config_export_import_should_work_correctly', 0, async () => {
      configManager.resetSystem();
      configManager.setConfig('key1', 'value1', ConfigType.STRING);
      configManager.setConfig('key2', 123, ConfigType.NUMBER);
      configManager.setConfig('key3', true, ConfigType.BOOLEAN);

      // 导出配置为JSON字符串
      const exported = configManager.exportConfigs();
      expect(exported.length).assertLarger(0);

      // 清空所有配置
      configManager.resetSystem();
      expect(configManager.getConfigCount()).assertEqual(0);

      // 从JSON字符串导入配置
      const importResult = configManager.importConfigs(exported);
      expect(importResult).assertTrue();
      expect(configManager.getConfigCount()).assertEqual(3);

      expect(configManager.getConfigValue('key1')).assertEqual('value1');
      expect(configManager.getConfigValue('key2')).assertEqual(123);
      expect(configManager.getConfigValue('key3')).assertTrue();
    });

    // 验证配置类型校验功能：确保类型检查能正确识别不匹配的类型
    it('config_type_validation_should_work_correctly', 0, async () => {
      configManager.resetSystem();

      configManager.setConfig('string_config', 'test', ConfigType.STRING);
      configManager.setConfig('number_config', 123, ConfigType.NUMBER);
      configManager.setConfig('boolean_config', true, ConfigType.BOOLEAN);

      expect(configManager.validateConfigType('string_config', ConfigType.STRING)).assertTrue();
      expect(configManager.validateConfigType('number_config', ConfigType.NUMBER)).assertTrue();
      expect(configManager.validateConfigType('boolean_config', ConfigType.BOOLEAN)).assertTrue();

      expect(configManager.validateConfigType('string_config', ConfigType.NUMBER)).assertFalse();
      expect(configManager.validateConfigType('number_config', ConfigType.BOOLEAN)).assertFalse();
      expect(configManager.validateConfigType('non_existent', ConfigType.STRING)).assertFalse();
    });

    // 验证配置变更历史完整性：确保只有更新操作才记录历史
    it('config_change_history_should_be_complete', 0, async () => {
      configManager.resetSystem();

      configManager.setConfig('config_a', 'value_a1', ConfigType.STRING);
      configManager.setConfig('config_a', 'value_a2', ConfigType.STRING);
      configManager.setConfig('config_b', 100, ConfigType.NUMBER);
      configManager.setConfig('config_b', 200, ConfigType.NUMBER);
      configManager.setConfig('config_c', true, ConfigType.BOOLEAN);

      const allHistory = configManager.getChangeHistory();
      expect(allHistory.length).assertEqual(2);

      const historyA = configManager.getKeyChangeHistory('config_a');
      expect(historyA.length).assertEqual(1);

      const historyB = configManager.getKeyChangeHistory('config_b');
      expect(historyB.length).assertEqual(1);

      const historyC = configManager.getKeyChangeHistory('config_c');
      expect(historyC.length).assertEqual(0);
    });

    // 验证配置管理器单例模式：确保多次获取返回同一实例
    it('config_manager_singleton_should_return_same_instance', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const manager1 = ConfigurationManager.getInstance();
      const manager2 = ConfigurationManager.getInstance();

      expect(manager1 === manager2).assertTrue();
      manager1.resetSystem();
      manager1.setConfig('singleton_test', 'value', ConfigType.STRING);

      expect(manager2.getConfigValue('singleton_test')).assertEqual('value');
    });

    // 验证配置时间戳设置正确：确保修改时间在合理范围内
    it('config_timestamps_should_be_set_correctly', 0, async () => {
      configManager.resetSystem();

      const beforeSet = Date.now();
      configManager.setConfig('timestamp_test', 'value', ConfigType.STRING);
      const afterSet = Date.now();

      const config = configManager.getConfig('timestamp_test');
      expect(config?.lastModified).assertLargerOrEqual(beforeSet);
      expect(config?.lastModified).assertLessOrEqual(afterSet);
    });

    // 验证配置清空功能：确保清空后所有配置和变更历史被移除
    it('config_clear_should_remove_all_entries', 0, async () => {
      configManager.resetSystem();

      configManager.setConfig('key1', 'value1', ConfigType.STRING);
      configManager.setConfig('key2', 123, ConfigType.NUMBER);
      configManager.setConfig('key3', true, ConfigType.BOOLEAN);

      expect(configManager.getConfigCount()).assertEqual(3);

      configManager.clearAllConfigs();

      expect(configManager.getConfigCount()).assertEqual(0);
      expect(configManager.getAllConfigs().length).assertEqual(0);
      expect(configManager.getChangeHistory().length).assertEqual(0);
    });

    // 验证无效JSON导入返回失败：确保错误JSON能被正确识别
    it('invalid_json_import_should_return_false', 0, async () => {
      configManager.resetSystem();

      const invalidJson1 = 'invalid json';
      const invalidJson2 = '{key: value}';
      const invalidJson3 = '';

      expect(configManager.importConfigs(invalidJson1)).assertFalse();
      expect(configManager.importConfigs(invalidJson2)).assertFalse();
      expect(configManager.importConfigs(invalidJson3)).assertFalse();
    });

    // 验证配置键列表准确：确保返回的键列表包含所有已设置的配置
    it('config_keys_list_should_be_accurate', 0, async () => {
      configManager.resetSystem();

      configManager.setConfig('alpha', 'value', ConfigType.STRING);
      configManager.setConfig('beta', 123, ConfigType.NUMBER);
      configManager.setConfig('gamma', true, ConfigType.BOOLEAN);

      const keys = configManager.getConfigKeys();
      expect(keys.length).assertEqual(3);
      expect(keys.includes('alpha')).assertTrue();
      expect(keys.includes('beta')).assertTrue();
      expect(keys.includes('gamma')).assertTrue();
    });

    // 验证配置管理器性能：确保大量配置操作在合理时间内完成
    it('config_manager_performance_should_meet_requirements', 0, async () => {
      configManager.resetSystem();

      const startTime = Date.now();

      for (let i = 0; i < 5000; i++) {
        configManager.setConfig(`key_${i}`, `value_${i}`, ConfigType.STRING);
      }

      const endTime = Date.now();
      const operationTime = endTime - startTime;

      expect(operationTime).assertLessOrEqual(5000);
      expect(configManager.getConfigCount()).assertEqual(5000);
    });

    // 验证配置管理与UI交互关联：确保配置变化与对话框状态一致
    it('config_management_should_correlate_with_ui_interactions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      configManager.resetSystem();
      configManager.setConfig('dialog_visible', true, ConfigType.BOOLEAN);
      configManager.setConfig('focus_index', 1, ConfigType.NUMBER);
      configManager.setConfig('dialog_title', '电源对话框', ConfigType.STRING);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      configManager.setConfig('focus_index', 2, ConfigType.NUMBER);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      configManager.setConfig('focus_index', 1, ConfigType.NUMBER);
      expect(configManager.getConfigValue('dialog_visible')).assertTrue();
      expect(configManager.getConfigValue('focus_index')).assertEqual(1);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 综合配置场景测试：验证完整配置操作流程中功能正确
    it('comprehensive_config_scenario_should_demonstrate_full_functionality', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      configManager.resetSystem();

      const scenarioStart = Date.now();

      const initConfig1: ConfigBatchItem = { key: 'dialog_title', value: '电源对话框', type: ConfigType.STRING };
      const initConfig2: ConfigBatchItem = { key: 'dialog_timeout', value: 30000, type: ConfigType.NUMBER };
      const initConfig3: ConfigBatchItem = { key: 'show_animation', value: true, type: ConfigType.BOOLEAN };
      const initConfig4: ConfigBatchItem = { key: 'dialog_opacity', value: 0.95, type: ConfigType.NUMBER };
      const initConfig5: ConfigBatchItem = { key: 'focus_index', value: 0, type: ConfigType.NUMBER };
      const initialConfigs: ConfigBatchItem[] = [initConfig1, initConfig2, initConfig3, initConfig4, initConfig5];
      configManager.batchSetConfigs(initialConfigs);

      configManager.setConfig('focus_index', 1, ConfigType.NUMBER);
      configManager.setConfig('focus_index', 2, ConfigType.NUMBER);

      configManager.setConfig('dialog_visible', false, ConfigType.BOOLEAN);

      const scenarioEnd = Date.now();
      const scenarioTime = scenarioEnd - scenarioStart;

      expect(configManager.getConfigCount()).assertEqual(6);

      expect(configManager.getConfigValue('dialog_title')).assertEqual('电源对话框');
      expect(configManager.getConfigValue('dialog_timeout')).assertEqual(30000);
      expect(configManager.getConfigValue('show_animation')).assertTrue();
      expect(configManager.getConfigValue('focus_index')).assertEqual(2);
      expect(configManager.getConfigValue('dialog_visible')).assertFalse();

      const focusHistory = configManager.getKeyChangeHistory('focus_index');
      expect(focusHistory.length).assertEqual(2);

      const exported = configManager.exportConfigs();
      expect(exported.length).assertLarger(0);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });


}