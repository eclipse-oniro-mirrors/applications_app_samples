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
 * random utility class
 * provides various random number data generate method method
 */
export class RandomUtils {
  /** constant use Bluetooth device name name prefix */
  private static readonly DEVICE_PREFIXES: string[] = [
    'BT-Speaker', 'BT-Headphone', 'BT-Keyboard', 'BT-Mouse', 'BT-Watch',
    'BT-Health', 'BT-Car', 'BT-Phone', 'BT-Headset', 'BT-Gamepad'
  ];

  /** constant see Bluetooth device control build vendor */
  private static readonly MANUFACTURERS: string[] = [
    'Sony', 'Bose', 'Samsung', 'Apple', 'JBL', 'Logitech',
    'Microsoft', 'DemoVendor', 'Xiaomi', 'Sennheiser'
  ];

  /**
   * generate random blue tooth MAC ground address
   * @returns MAC ground address string
   */
  static randomMacAddress(): string {
    const hex: string = '0123456789ABCDEF';
    let mac: string = '';
    for (let i: number = 0; i < 6; i++) {
      if (i > 0) {
        mac += ':';
      }
      mac += hex.charAt(Math.floor(Math.random() * 16));
      mac += hex.charAt(Math.floor(Math.random() * 16));
    }
    return mac;
  }

  /**
   * generate random Bluetooth device name name
   * @returns device name
   */
  static randomDeviceName(): string {
    const prefix: string = RandomUtils.DEVICE_PREFIXES[Math.floor(Math.random() * RandomUtils.DEVICE_PREFIXES.length)];
    const num: number = Math.floor(Math.random() * 9000) + 1000;
    return prefix + '-' + num;
  }

  /**
   * generate random control build vendor name name
   * @returns control build vendor name name
   */
  static randomManufacturer(): string {
    return RandomUtils.MANUFACTURERS[Math.floor(Math.random() * RandomUtils.MANUFACTURERS.length)];
  }

  /**
   * generate random UUID
   * @returns UUID string
   */
  static randomUuid(): string {
    const hex: string = '0123456789abcdef';
    let uuid: string = '';
    for (let i: number = 0; i < 32; i++) {
      if (i === 8 || i === 12 || i === 16 || i === 20) {
        uuid += '-';
      }
      uuid += hex.charAt(Math.floor(Math.random() * 16));
    }
    return uuid;
  }

  /**
   * generate random RSSI value
   * @param min - min value
   * @param max - max value
   * @returns RSSI value
   */
  static randomRssi(min: number = -100, max: number = -30): number {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  /**
   * generate random device ID
   * @returns device ID
   */
  static randomDeviceId(): string {
    return 'dev_' + Date.now().toString(36) + '_' + Math.random().toString(36).substring(2, 8);
  }

  /**
   * generate random electric talk number
   * @returns electric talk number
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
   * generate random contact name
   * @returns contact name
   */
  static randomContactName(): string {
    const firstNames: string[] = ['Alice', 'Bob', 'Charlie', 'Diana', 'Edward', 'Fiona', 'George', 'Helen'];
    const lastNames: string[] = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Davis', 'Miller', 'Wilson'];
    return firstNames[Math.floor(Math.random() * firstNames.length)] + ' ' +
      lastNames[Math.floor(Math.random() * lastNames.length)];
  }

  /**
   * generate random heart rate value
   * @returns heart rate value
   */
  static randomHeartRate(): number {
    return Math.floor(Math.random() * 60) + 60;
  }

  /**
   * generate random blood pressure value
   * @returns blood pressure against object
   */
  static randomBloodPressure(): { systolic: number; diastolic: number } {
    return {
      systolic: Math.floor(Math.random() * 40) + 100,
      diastolic: Math.floor(Math.random() * 20) + 60
    };
  }

  /**
   * generate random body temperature value
   * @returns body temperature value
   */
  static randomTemperature(): number {
    return Math.round((Math.random() * 2 + 36) * 10) / 10;
  }

  /**
   * generate random blood oxygen value
   * @returns blood oxygen percentage
   */
  static randomBloodOxygen(): number {
    return Math.floor(Math.random() * 8) + 92;
  }

  /**
   * generate random body weight value
   * @returns body weight (kg)
   */
  static randomWeight(): number {
    return Math.round((Math.random() * 50 + 40) * 10) / 10;
  }

  /**
   * from array in follow machine select element
   * @param arr - array
   * @returns follow machine element
   */
  static randomChoice<T>(arr: T[]): T {
    return arr[Math.floor(Math.random() * arr.length)];
  }

  /**
   * generate random layout er value
   * @param probability - for true overview rate (0-1)
   * @returns follow machine layout er value
   */
  static randomBoolean(probability: number = 0.5): boolean {
    return Math.random() < probability;
  }

  /**
   * generate random IP ground address
   * @returns IP ground address
   */
  static randomIpAddress(): string {
    return Math.floor(Math.random() * 254 + 1) + '.' +
      Math.floor(Math.random() * 256) + '.' +
      Math.floor(Math.random() * 256) + '.' +
      Math.floor(Math.random() * 254 + 1);
  }
}
