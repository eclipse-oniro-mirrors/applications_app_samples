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
 * 约束类型：把 SDK 的 4 个枚举收敛成便于判定的 4 种形态。
 */
export enum ScanConstraintKind {
  NONE = 'none',
  RANGE = 'range',
  NUMBER_LIST = 'numberList',
  STRING_LIST = 'stringList'
}

/**
 * 数值入参的校验结果，value 为按步长对齐后的建议值。
 */
export interface ScanNumberCheck {
  valid: boolean;
  reasonKey: string;
  value: number;
}

/**
 * 字符串入参的校验结果。
 */
export interface ScanTextCheck {
  valid: boolean;
  reasonKey: string;
  value: string;
}

/**
 * 扫描仪参数约束的解析与校验。
 * 规则：RANGE 用 [minValue, maxValue] + quantValue 步长；列表类用逐项匹配；NONE 不做限制。
 */
export class ScanOptionConstraint {
  static readonly REASON_OK: string = 'scan_option_valid';
  static readonly REASON_OUT_OF_RANGE: string = 'scan_option_out_of_range';
  static readonly REASON_TYPE_MISMATCH: string = 'scan_option_type_mismatch';
  static readonly REASON_NOT_LISTED: string = 'scan_option_not_listed';
  static readonly REASON_EMPTY: string = 'scan_option_empty';

  static getKind(param: scan.ScannerParameter): ScanConstraintKind {
    if (param.optionConstraintType === scan.ConstraintType.SCAN_CONSTRAINT_RANGE) {
      return ScanConstraintKind.RANGE;
    }
    if (param.optionConstraintType === scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST) {
      return ScanConstraintKind.NUMBER_LIST;
    }
    if (param.optionConstraintType === scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST) {
      return ScanConstraintKind.STRING_LIST;
    }
    return ScanConstraintKind.NONE;
  }

  static isNumericType(optionType: scan.OptionValueType): boolean {
    return optionType === scan.OptionValueType.SCAN_TYPE_INT
      || optionType === scan.OptionValueType.SCAN_TYPE_FIXED;
  }

  static isEditable(param: scan.ScannerParameter): boolean {
    return param.optionConstraintType !== scan.ConstraintType.SCAN_CONSTRAINT_NONE;
  }

  static hasRange(param: scan.ScannerParameter): boolean {
    return param.optionConstraintRange !== undefined;
  }

  static getMin(param: scan.ScannerParameter): number {
    const range: scan.Range | undefined = param.optionConstraintRange;
    if (range === undefined) {
      return 0;
    }
    return range.minValue;
  }

  static getMax(param: scan.ScannerParameter): number {
    const range: scan.Range | undefined = param.optionConstraintRange;
    if (range === undefined) {
      return 0;
    }
    return range.maxValue;
  }

  /**
   * quantValue 缺省或非正时按 1 处理，避免除零。
   */
  static getStep(param: scan.ScannerParameter): number {
    const range: scan.Range | undefined = param.optionConstraintRange;
    if (range === undefined || range.quantValue <= 0) {
      return 1;
    }
    return range.quantValue;
  }

  /**
   * 区间本身非法（max < min）时退化为下界。
   */
  static clamp(param: scan.ScannerParameter, value: number): number {
    const min: number = ScanOptionConstraint.getMin(param);
    const max: number = ScanOptionConstraint.getMax(param);
    if (max < min) {
      return min;
    }
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  /**
   * 以 min 为基准把数值对齐到步长整数倍，并对齐结果再次夹取。
   */
  static alignToStep(param: scan.ScannerParameter, value: number): number {
    const step: number = ScanOptionConstraint.getStep(param);
    const min: number = ScanOptionConstraint.getMin(param);
    const clamped: number = ScanOptionConstraint.clamp(param, value);
    if (step <= 1) {
      return Math.round(clamped);
    }
    const steps: number = Math.round((clamped - min) / step);
    return ScanOptionConstraint.clamp(param, min + steps * step);
  }

  static checkNumber(param: scan.ScannerParameter, value: number): ScanNumberCheck {
    const kind: ScanConstraintKind = ScanOptionConstraint.getKind(param);
    if (!ScanOptionConstraint.isNumericType(param.optionType)) {
      const mismatch: ScanNumberCheck = {
        valid: false, reasonKey: ScanOptionConstraint.REASON_TYPE_MISMATCH, value: value
      };
      return mismatch;
    }
    if (Number.isNaN(value)) {
      const nan: ScanNumberCheck = {
        valid: false, reasonKey: ScanOptionConstraint.REASON_TYPE_MISMATCH, value: value
      };
      return nan;
    }
    if (kind === ScanConstraintKind.RANGE) {
      const min: number = ScanOptionConstraint.getMin(param);
      const max: number = ScanOptionConstraint.getMax(param);
      if (value < min || value > max) {
        const outOfRange: ScanNumberCheck = {
          valid: false,
          reasonKey: ScanOptionConstraint.REASON_OUT_OF_RANGE,
          value: ScanOptionConstraint.clamp(param, value)
        };
        return outOfRange;
      }
      const ok: ScanNumberCheck = {
        valid: true, reasonKey: ScanOptionConstraint.REASON_OK, value: value
      };
      return ok;
    }
    if (kind === ScanConstraintKind.NUMBER_LIST) {
      const list: number[] | undefined = param.optionConstraintInt;
      if (list === undefined || list.length === 0) {
        const empty: ScanNumberCheck = {
          valid: false, reasonKey: ScanOptionConstraint.REASON_EMPTY, value: value
        };
        return empty;
      }
      if (list.indexOf(value) >= 0) {
        const listed: ScanNumberCheck = {
          valid: true, reasonKey: ScanOptionConstraint.REASON_OK, value: value
        };
        return listed;
      }
      const notListed: ScanNumberCheck = {
        valid: false, reasonKey: ScanOptionConstraint.REASON_NOT_LISTED, value: value
      };
      return notListed;
    }
    if (kind === ScanConstraintKind.STRING_LIST) {
      const wrongType: ScanNumberCheck = {
        valid: false, reasonKey: ScanOptionConstraint.REASON_TYPE_MISMATCH, value: value
      };
      return wrongType;
    }
    const free: ScanNumberCheck = {
      valid: true, reasonKey: ScanOptionConstraint.REASON_OK, value: value
    };
    return free;
  }

  static checkString(param: scan.ScannerParameter, value: string): ScanTextCheck {
    const kind: ScanConstraintKind = ScanOptionConstraint.getKind(param);
    if (ScanOptionConstraint.isNumericType(param.optionType)) {
      const mismatch: ScanTextCheck = {
        valid: false, reasonKey: ScanOptionConstraint.REASON_TYPE_MISMATCH, value: value
      };
      return mismatch;
    }
    if (value.length === 0) {
      const empty: ScanTextCheck = {
        valid: false, reasonKey: ScanOptionConstraint.REASON_EMPTY, value: value
      };
      return empty;
    }
    if (kind === ScanConstraintKind.STRING_LIST) {
      const list: string[] | undefined = param.optionConstraintString;
      if (list === undefined || list.length === 0) {
        const missing: ScanTextCheck = {
          valid: false, reasonKey: ScanOptionConstraint.REASON_EMPTY, value: value
        };
        return missing;
      }
      if (list.indexOf(value) >= 0) {
        const listed: ScanTextCheck = {
          valid: true, reasonKey: ScanOptionConstraint.REASON_OK, value: value
        };
        return listed;
      }
      const notListed: ScanTextCheck = {
        valid: false, reasonKey: ScanOptionConstraint.REASON_NOT_LISTED, value: value
      };
      return notListed;
    }
    if (kind === ScanConstraintKind.RANGE || kind === ScanConstraintKind.NUMBER_LIST) {
      const wrongType: ScanTextCheck = {
        valid: false, reasonKey: ScanOptionConstraint.REASON_TYPE_MISMATCH, value: value
      };
      return wrongType;
    }
    const free: ScanTextCheck = {
      valid: true, reasonKey: ScanOptionConstraint.REASON_OK, value: value
    };
    return free;
  }

  /**
   * 约束中可选项总数：字符串列表与整数列表长度之和。
   */
  static countOptions(param: scan.ScannerParameter): number {
    let count: number = 0;
    const strings: string[] | undefined = param.optionConstraintString;
    const ints: number[] | undefined = param.optionConstraintInt;
    if (strings !== undefined) {
      count += strings.length;
    }
    if (ints !== undefined) {
      count += ints.length;
    }
    return count;
  }

  /**
   * 生成可读的约束摘要，用于日志与详情面板。
   */
  static describe(param: scan.ScannerParameter): string {
    const kind: ScanConstraintKind = ScanOptionConstraint.getKind(param);
    if (kind === ScanConstraintKind.RANGE) {
      const min: number = ScanOptionConstraint.getMin(param);
      const max: number = ScanOptionConstraint.getMax(param);
      const step: number = ScanOptionConstraint.getStep(param);
      return `RANGE[${min},${max},${step}]`;
    }
    if (kind === ScanConstraintKind.NUMBER_LIST) {
      return `NUMBER_LIST[${ScanOptionConstraint.countOptions(param)}]`;
    }
    if (kind === ScanConstraintKind.STRING_LIST) {
      return `STRING_LIST[${ScanOptionConstraint.countOptions(param)}]`;
    }
    return 'NONE';
  }
}
