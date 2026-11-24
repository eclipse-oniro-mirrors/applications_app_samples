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
import { scan } from '@kit.BasicServicesKit';

/**
 * 扫描参数与设备快照构造器。
 * 上层（页面、离线用例）用纯数字/字串描述形态，由本类统一换成 SDK 枚举，
 * 避免每个调用点各自维护枚举映射。
 */
export class ScanParameterBuilder {
  /** ConstraintType：0 无约束 / 1 区间 / 2 整数列表 / 3 字符串列表 */
  public static readonly CONSTRAINT_NONE: number = 0;
  public static readonly CONSTRAINT_RANGE: number = 1;
  public static readonly CONSTRAINT_WORD_LIST: number = 2;
  public static readonly CONSTRAINT_STRING_LIST: number = 3;

  /** OptionValueType：0 布尔 / 1 整数 / 2 定点 / 3 字符串 */
  public static readonly TYPE_BOOL: number = 0;
  public static readonly TYPE_INT: number = 1;
  public static readonly TYPE_FIXED: number = 2;
  public static readonly TYPE_STRING: number = 3;

  static toConstraintType(value: number): scan.ConstraintType {
    if (value === ScanParameterBuilder.CONSTRAINT_RANGE) {
      return scan.ConstraintType.SCAN_CONSTRAINT_RANGE;
    }
    if (value === ScanParameterBuilder.CONSTRAINT_WORD_LIST) {
      return scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST;
    }
    if (value === ScanParameterBuilder.CONSTRAINT_STRING_LIST) {
      return scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST;
    }
    return scan.ConstraintType.SCAN_CONSTRAINT_NONE;
  }

  static toOptionType(value: number): scan.OptionValueType {
    if (value === ScanParameterBuilder.TYPE_INT) {
      return scan.OptionValueType.SCAN_TYPE_INT;
    }
    if (value === ScanParameterBuilder.TYPE_FIXED) {
      return scan.OptionValueType.SCAN_TYPE_FIXED;
    }
    if (value === ScanParameterBuilder.TYPE_STRING) {
      return scan.OptionValueType.SCAN_TYPE_STRING;
    }
    return scan.OptionValueType.SCAN_TYPE_BOOL;
  }

  /**
   * 构造只有约束类型与值类型的参数，不带区间与列表。
   */
  static build(constraintType: number, optionType: number): scan.ScannerParameter {
    return ScanParameterBuilder.param(0, 'SCAN_OPTION', 'Scan option', 'scan option used by the sample',
      ScanParameterBuilder.TYPE_BOOL, constraintType, optionType);
  }

  /**
   * 完整参数：标题、描述、单位、约束与值类型均由调用方决定，空字串保留原样以验证降级分支。
   */
  static param(optionIndex: number, optionName: string, optionTitle: string, optionDesc: string,
    unit: number, constraintType: number, optionType: number): scan.ScannerParameter {
    const param: scan.ScannerParameter = {
      optionName: optionName,
      optionIndex: optionIndex,
      optionTitle: optionTitle,
      optionDesc: optionDesc,
      optionType: ScanParameterBuilder.toOptionType(optionType),
      optionUnit: ScanParameterBuilder.unit(unit),
      optionConstraintType: ScanParameterBuilder.toConstraintType(constraintType)
    };
    return param;
  }

  /**
   * 区间约束：仅在 CONSTRAINT_RANGE 下挂载 optionConstraintRange。
   */
  static range(constraintType: number, optionType: number, min: number, max: number,
    quantum: number): scan.ScannerParameter {
    const param: scan.ScannerParameter = ScanParameterBuilder.build(constraintType, optionType);
    if (constraintType === ScanParameterBuilder.CONSTRAINT_RANGE) {
      const range: scan.Range = {
        minValue: min,
        maxValue: max,
        quantValue: quantum
      };
      param.optionConstraintRange = range;
    }
    return param;
  }

  /** 整数取值的区间参数（optionType = INT） */
  static intRange(min: number, max: number, quantum: number): scan.ScannerParameter {
    return ScanParameterBuilder.range(
      ScanParameterBuilder.CONSTRAINT_RANGE, ScanParameterBuilder.TYPE_INT, min, max, quantum);
  }

  /** 定点取值的区间参数（optionType = FIXED） */
  static fixedRange(min: number, max: number, quantum: number): scan.ScannerParameter {
    return ScanParameterBuilder.range(
      ScanParameterBuilder.CONSTRAINT_RANGE, ScanParameterBuilder.TYPE_FIXED, min, max, quantum);
  }

  /** 整数列表约束参数，空数组等价于不挂载。 */
  static numberList(values: number[]): scan.ScannerParameter {
    const param: scan.ScannerParameter = ScanParameterBuilder.build(
      ScanParameterBuilder.CONSTRAINT_WORD_LIST, ScanParameterBuilder.TYPE_INT);
    if (values.length > 0) {
      param.optionConstraintInt = values;
    }
    return param;
  }

  /** 字符串列表约束参数，空数组等价于不挂载。 */
  static stringList(values: string[]): scan.ScannerParameter {
    const param: scan.ScannerParameter = ScanParameterBuilder.build(
      ScanParameterBuilder.CONSTRAINT_STRING_LIST, ScanParameterBuilder.TYPE_STRING);
    if (values.length > 0) {
      param.optionConstraintString = values;
    }
    return param;
  }

  /** 无约束参数，值类型由调用方指定 */
  static free(optionType: number): scan.ScannerParameter {
    return ScanParameterBuilder.build(ScanParameterBuilder.CONSTRAINT_NONE, optionType);
  }

  /**
   * 按非空内容挂载列表约束，空数组等价于不挂载。
   */
  static patchLists(param: scan.ScannerParameter, ints: number[], texts: string[]): void {
    if (ints.length > 0) {
      param.optionConstraintInt = ints;
    }
    if (texts.length > 0) {
      param.optionConstraintString = texts;
    }
  }

  /**
   * 物理单位按枚举序暴露，便于按数字索引遍历。
   */
  static units(): scan.PhysicalUnit[] {
    const list: scan.PhysicalUnit[] = [
      scan.PhysicalUnit.SCAN_UNIT_NONE,
      scan.PhysicalUnit.SCAN_UNIT_PIXEL,
      scan.PhysicalUnit.SCAN_UNIT_BIT,
      scan.PhysicalUnit.SCAN_UNIT_MM,
      scan.PhysicalUnit.SCAN_UNIT_DPI,
      scan.PhysicalUnit.SCAN_UNIT_PERCENT,
      scan.PhysicalUnit.SCAN_UNIT_MICROSECOND
    ];
    return list;
  }

  /**
   * 按数字取物理单位，越界回退到 NONE。
   */
  static unit(value: number): scan.PhysicalUnit {
    const list: scan.PhysicalUnit[] = ScanParameterBuilder.units();
    if (value < 0 || value >= list.length) {
      return scan.PhysicalUnit.SCAN_UNIT_NONE;
    }
    return list[value];
  }

  /**
   * 按文本取发现方式，非 USB 一律按 TCP 处理。
   */
  static discoveryMode(text: string): scan.ScannerDiscoveryMode {
    if (text === 'USB') {
      return scan.ScannerDiscoveryMode.USB_STR;
    }
    return scan.ScannerDiscoveryMode.TCP_STR;
  }

  /**
   * 按文本取同步模式，非 delete 一律按 update 处理。
   */
  static syncMode(text: string): scan.ScannerSyncMode {
    if (text === 'delete') {
      return scan.ScannerSyncMode.DELETE_STR;
    }
    return scan.ScannerSyncMode.UPDATE_STR;
  }

  static device(scannerId: string, uniqueId: string, manufacturer: string, model: string,
    deviceName: string, mode: string): scan.ScannerDevice {
    const device: scan.ScannerDevice = {
      scannerId: scannerId,
      discoveryMode: ScanParameterBuilder.discoveryMode(mode),
      uniqueId: uniqueId,
      manufacturer: manufacturer,
      model: model,
      deviceName: deviceName
    };
    return device;
  }

  /**
   * 同步事件：oldScannerId 为空字串时不挂载，保持“只改 id”分支的语义。
   */
  static sync(scannerId: string, uniqueId: string, mode: string,
    syncMode: string, oldScannerId: string): scan.ScannerSyncDevice {
    const event: scan.ScannerSyncDevice = {
      scannerId: scannerId,
      discoveryMode: ScanParameterBuilder.discoveryMode(mode),
      uniqueId: uniqueId,
      syncMode: ScanParameterBuilder.syncMode(syncMode)
    };
    if (oldScannerId.length > 0) {
      event.oldScannerId = oldScannerId;
    }
    return event;
  }

  /**
   * 设备列表：把散落的设备收成一个数组，调用点无需声明枚举类型。
   */
  static devices(...list: scan.ScannerDevice[]): scan.ScannerDevice[] {
    return list.slice(0);
  }

  /**
   * 同步事件列表：与 devices 对称，便于按脚本喂多个事件。
   */
  static syncList(...list: scan.ScannerSyncDevice[]): scan.ScannerSyncDevice[] {
    return list.slice(0);
  }

  /**
   * 固定三台样例设备：TCP 有厂商型号、USB 无厂商、TCP 只有型号。
   * 让合并类用例只写一行就能拿到同一样的初始目录。
   */
  static sampleDevices(): scan.ScannerDevice[] {
    return ScanParameterBuilder.devices(
      ScanParameterBuilder.device('1', 'U1', 'Acme', 'X100', 'Scanner A', 'TCP'),
      ScanParameterBuilder.device('2', 'U2', '', 'Y200', 'Scanner B', 'USB'),
      ScanParameterBuilder.device('3', 'U1', 'Acme', '', '', 'TCP'));
  }

  /**
   * 生成 count 台占位设备，用于容量边界与批量合并。
   */
  static fillDevices(count: number): scan.ScannerDevice[] {
    const list: scan.ScannerDevice[] = [];
    for (let index = 0; index < count; index++) {
      list.push(ScanParameterBuilder.device(`S${index}`, `U${index}`, 'Vendor', 'Model',
        `Scanner ${index}`, 'TCP'));
    }
    return list;
  }

  /**
   * 只挂 valueType 的空取值，用于验证缺字段时的降级文案。
   */
  static bareOptionValue(valueType: number): scan.ScannerOptionValue {
    const value: scan.ScannerOptionValue = {
      valueType: ScanParameterBuilder.toOptionType(valueType)
    };
    return value;
  }

  /**
   * 参数取值：按归一化后的值类型只挂载对应字段，便于验证缺字段时的降级。
   * 非法 valueType 会被 toOptionType 归一化到 BOOL，挂载判断须跟随归一化结果。
   */
  static optionValue(valueType: number, numValue: number, strValue: string,
    boolValue: boolean): scan.ScannerOptionValue {
    const value: scan.ScannerOptionValue = ScanParameterBuilder.bareOptionValue(valueType);
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_INT ||
      value.valueType === scan.OptionValueType.SCAN_TYPE_FIXED) {
      value.numValue = numValue;
    }
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_STRING) {
      value.strValue = strValue;
    }
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_BOOL) {
      value.boolValue = boolValue;
    }
    return value;
  }

  /**
   * 空参数列表，供“无参数”分支的用例复用，避免调用点自行声明枚举类型数组。
   */
  static noParams(): scan.ScannerParameter[] {
    const list: scan.ScannerParameter[] = [];
    return list;
  }

  /**
   * 调试摘要：约束类型 / 值类型 / 区间 / 列表长度，便于日志定位。
   */
  static describe(param: scan.ScannerParameter): string {
    const range: scan.Range | undefined = param.optionConstraintRange;
    const rangeText: string = range === undefined
      ? '-' : `${range.minValue}..${range.maxValue}/${range.quantValue}`;
    const texts: string[] = param.optionConstraintString === undefined ? [] : param.optionConstraintString;
    const ints: number[] = param.optionConstraintInt === undefined ? [] : param.optionConstraintInt;
    return `constraint=${param.optionConstraintType} type=${param.optionType} ` +
      `range=${rangeText} texts=${texts.length} ints=${ints.length}`;
  }
}
