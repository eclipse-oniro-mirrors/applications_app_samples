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
import { ScanConstraintKind, ScanOptionConstraint } from './ScanOptionConstraint';

/**
 * 参数列表的一项，直接绑定到 ListItem。
 */
export interface ScanOptionItem {
  optionIndex: number;
  optionName: string;
  title: string;
  detail: string;
  unitText: string;
  editable: boolean;
  kind: ScanConstraintKind;
}

/**
 * 把 ScannerParameter[] 转成界面可渲染的模型，并统一单位与取值文案。
 */
export class ScanOptionModel {
  public static readonly NO_DESCRIPTION_KEY: string = 'scan_option_no_description';
  public static readonly FIXED_DIGITS: number = 2;

  static getUnitText(unit: scan.PhysicalUnit): string {
    if (unit === scan.PhysicalUnit.SCAN_UNIT_PIXEL) {
      return 'px';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_BIT) {
      return 'bit';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_MM) {
      return 'mm';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_DPI) {
      return 'dpi';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_PERCENT) {
      return '%';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_MICROSECOND) {
      return 'us';
    }
    return '';
  }

  static roundFixed(value: number): number {
    const factor: number = 10 ** ScanOptionModel.FIXED_DIGITS;
    return Math.round(value * factor) / factor;
  }

  static trimZeros(text: string): string {
    let result: string = text;
    while (result.indexOf('.') >= 0 && (result.endsWith('0') || result.endsWith('.'))) {
      result = result.substring(0, result.length - 1);
    }
    return result;
  }

  static formatNumber(value: number, unit: scan.PhysicalUnit): string {
    const rounded: number = ScanOptionModel.roundFixed(value);
    const text: string = ScanOptionModel.trimZeros(rounded.toString());
    const suffix: string = ScanOptionModel.getUnitText(unit);
    if (suffix.length === 0) {
      return text;
    }
    return `${text} ${suffix}`;
  }

  /**
   * 按 valueType 取对应字段，缺失时返回空串而不是 undefined。
   */
  static formatValue(value: scan.ScannerOptionValue): string {
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_BOOL) {
      const boolValue: boolean | undefined = value.boolValue;
      return boolValue === true ? 'true' : 'false';
    }
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_INT) {
      const numValue: number | undefined = value.numValue;
      return numValue === undefined ? '' : Math.round(numValue).toString();
    }
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_FIXED) {
      const numValue: number | undefined = value.numValue;
      return numValue === undefined ? '' : ScanOptionModel.trimZeros(
        ScanOptionModel.roundFixed(numValue).toString());
    }
    const strValue: string | undefined = value.strValue;
    return strValue === undefined ? '' : strValue;
  }

  static getTitle(param: scan.ScannerParameter): string {
    return param.optionTitle.length > 0 ? param.optionTitle : param.optionName;
  }

  static getDetail(param: scan.ScannerParameter): string {
    return param.optionDesc.length > 0 ? param.optionDesc : ScanOptionModel.NO_DESCRIPTION_KEY;
  }

  static toItem(param: scan.ScannerParameter): ScanOptionItem {
    const item: ScanOptionItem = {
      optionIndex: param.optionIndex,
      optionName: param.optionName,
      title: ScanOptionModel.getTitle(param),
      detail: ScanOptionModel.getDetail(param),
      unitText: ScanOptionModel.getUnitText(param.optionUnit),
      editable: ScanOptionConstraint.isEditable(param),
      kind: ScanOptionConstraint.getKind(param)
    };
    return item;
  }

  static buildItems(params: scan.ScannerParameter[]): ScanOptionItem[] {
    const items: ScanOptionItem[] = [];
    for (let index = 0; index < params.length; index++) {
      items.push(ScanOptionModel.toItem(params[index]));
    }
    return items;
  }

  static findItem(items: ScanOptionItem[], optionIndex: number): ScanOptionItem | undefined {
    for (let index = 0; index < items.length; index++) {
      if (items[index].optionIndex === optionIndex) {
        return items[index];
      }
    }
    return undefined;
  }

  static countEditable(items: ScanOptionItem[]): number {
    let count: number = 0;
    for (let index = 0; index < items.length; index++) {
      if (items[index].editable) {
        count++;
      }
    }
    return count;
  }

  static toIndexList(items: ScanOptionItem[]): number[] {
    const indexes: number[] = [];
    for (let index = 0; index < items.length; index++) {
      indexes.push(items[index].optionIndex);
    }
    return indexes;
  }

  static filterByKind(items: ScanOptionItem[], kind: ScanConstraintKind): ScanOptionItem[] {
    const result: ScanOptionItem[] = [];
    for (let index = 0; index < items.length; index++) {
      if (items[index].kind === kind) {
        result.push(items[index]);
      }
    }
    return result;
  }

  /**
   * 按 optionIndex 升序排列，返回新数组，不改动入参。
   */
  static sortByIndex(items: ScanOptionItem[]): ScanOptionItem[] {
    const sorted: ScanOptionItem[] = items.slice(0);
    sorted.sort((left: ScanOptionItem, right: ScanOptionItem) => left.optionIndex - right.optionIndex);
    return sorted;
  }
}
