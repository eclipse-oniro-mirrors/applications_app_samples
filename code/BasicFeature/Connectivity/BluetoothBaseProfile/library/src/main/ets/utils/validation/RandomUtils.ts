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

/**
 * 随机工具类
 * 提供各种随机数据生成方法
 */
export class RandomUtils {
  /** 常用蓝牙设备名称前缀 */
  private static readonly DEVICE_PREFIXES: string[] = [
    'BT-Speaker', 'BT-Headphone', 'BT-Keyboard', 'BT-Mouse', 'BT-Watch',
    'BT-Health', 'BT-Car', 'BT-Phone', 'BT-Headset', 'BT-Gamepad'
  ];

  /** 常见蓝牙设备制造商 */
  private static readonly MANUFACTURERS: string[] = [
    'Sony', 'Bose', 'Samsung', 'Apple', 'JBL', 'Logitech',
    'Microsoft', 'Huawei', 'Xiaomi', 'Sennheiser'
  ];

  /**
   * 生成随机蓝牙MAC地址
   * @returns MAC地址字符串
   */
  static randomMacAddress(): string {
    const hex: string = '0123456789ABCDEF';
    let mac: string = '';
    for (let i: number = 0; i < 6; i++) {
      if (i > 0) mac += ':';
      mac += hex.charAt(Math.floor(Math.random() * 16));
      mac += hex.charAt(Math.floor(Math.random() * 16));
    }
    return mac;
  }

  /**
   * 生成随机蓝牙设备名称
   * @returns 设备名称
   */
  static randomDeviceName(): string {
    const prefix: string = RandomUtils.DEVICE_PREFIXES[Math.floor(Math.random() * RandomUtils.DEVICE_PREFIXES.length)];
    const num: number = Math.floor(Math.random() * 9000) + 1000;
    return prefix + '-' + num;
  }

  /**
   * 生成随机制造商名称
   * @returns 制造商名称
   */
  static randomManufacturer(): string {
    return RandomUtils.MANUFACTURERS[Math.floor(Math.random() * RandomUtils.MANUFACTURERS.length)];
  }

  /**
   * 生成随机UUID
   * @returns UUID字符串
   */
  static randomUuid(): string {
    const hex: string = '0123456789abcdef';
    let uuid: string = '';
    for (let i: number = 0; i < 32; i++) {
      if (i === 8 || i === 12 || i === 16 || i === 20) uuid += '-';
      uuid += hex.charAt(Math.floor(Math.random() * 16));
    }
    return uuid;
  }

  /**
   * 生成随机RSSI值
   * @param min - 最小值
   * @param max - 最大值
   * @returns RSSI值
   */
  static randomRssi(min: number = -100, max: number = -30): number {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  /**
   * 生成随机设备ID
   * @returns 设备ID
   */
  static randomDeviceId(): string {
    return 'dev_' + Date.now().toString(36) + '_' + Math.random().toString(36).substring(2, 8);
  }

  /**
   * 生成随机电话号码
   * @returns 电话号码
   */
  static randomPhoneNumber(): string {
    const prefixes: string[] = ['138', '139', '158', '159', '186', '187', '135', '136'];
    const prefix: string = prefixes[Math.floor(Math.random() * prefixes.length)];
    let suffix: string = '';
    for (let i: number = 0; i < 8; i++) {
      suffix += Math.floor(Math.random() * 10);
    }
    return prefix + suffix;
  }

  /**
   * 生成随机联系人名称
   * @returns 联系人名称
   */
  static randomContactName(): string {
    const firstNames: string[] = ['Alice', 'Bob', 'Charlie', 'Diana', 'Edward', 'Fiona', 'George', 'Helen'];
    const lastNames: string[] = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Davis', 'Miller', 'Wilson'];
    return firstNames[Math.floor(Math.random() * firstNames.length)] + ' ' +
      lastNames[Math.floor(Math.random() * lastNames.length)];
  }

  /**
   * 生成随机心率值
   * @returns 心率值
   */
  static randomHeartRate(): number {
    return Math.floor(Math.random() * 60) + 60;
  }

  /**
   * 生成随机血压值
   * @returns 血压对象
   */
  static randomBloodPressure(): { systolic: number; diastolic: number } {
    return {
      systolic: Math.floor(Math.random() * 40) + 100,
      diastolic: Math.floor(Math.random() * 20) + 60
    };
  }

  /**
   * 生成随机体温值
   * @returns 体温值
   */
  static randomTemperature(): number {
    return Math.round((Math.random() * 2 + 36) * 10) / 10;
  }

  /**
   * 生成随机血氧值
   * @returns 血氧百分比
   */
  static randomBloodOxygen(): number {
    return Math.floor(Math.random() * 8) + 92;
  }

  /**
   * 生成随机体重值
   * @returns 体重（kg）
   */
  static randomWeight(): number {
    return Math.round((Math.random() * 50 + 40) * 10) / 10;
  }

  /**
   * 从数组中随机选择元素
   * @param arr - 数组
   * @returns 随机元素
   */
  static randomChoice<T>(arr: T[]): T {
    return arr[Math.floor(Math.random() * arr.length)];
  }

  /**
   * 生成随机布尔值
   * @param probability - 为true的概率 (0-1)
   * @returns 随机布尔值
   */
  static randomBoolean(probability: number = 0.5): boolean {
    return Math.random() < probability;
  }

  /**
   * 生成随机IP地址
   * @returns IP地址
   */
  static randomIpAddress(): string {
    return Math.floor(Math.random() * 254 + 1) + '.' +
      Math.floor(Math.random() * 256) + '.' +
      Math.floor(Math.random() * 256) + '.' +
      Math.floor(Math.random() * 254 + 1);
  }
}
