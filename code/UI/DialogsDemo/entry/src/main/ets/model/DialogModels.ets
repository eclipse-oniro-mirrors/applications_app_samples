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
 
import { AdvancedDialogV2Button, AdvancedDialogV2ButtonOptions } from '@kit.ArkUI';
import { IconStyle, TitlePosition, BottomOffset } from '@kit.ArkUI';

/** 事件日志容量上限 */
const LOG_CAP: number = 60;

export class DialogEventLog {
  private events: string[] = [];

  /** 打开事件行 */
  static formatOpen(sceneId: number, name: string): string {
    return `open#${sceneId} ${name}`;
  }

  /** 关闭事件行 */
  static formatClose(sceneId: number, name: string): string {
    return `close#${sceneId} ${name}`;
  }

  /** 单选选中行 */
  static formatSelect(sceneId: number, index: number): string {
    return `select#${sceneId} index=${index}`;
  }

  /** 复选框勾选行 */
  static formatCheck(sceneId: number, checked: boolean): string {
    return `check#${sceneId} checked=${checked}`;
  }

  /** 点击弹窗主体行 */
  static formatClick(sceneId: number): string {
    return `click#${sceneId}`;
  }

  /** 错误行 */
  static formatError(sceneId: number, message: string): string {
    return `error#${sceneId} ${message}`;
  }

  /** 记录一行事件（超出容量丢弃最旧） */
  record(line: string): void {
    this.events.push(line);
    if (this.events.length > LOG_CAP) {
      this.events.shift();
    }
  }

  /** 全部事件行快照（副本） */
  toLines(): string[] {
    return this.events.slice(0);
  }

  /** 最近一行；无事件返回空串 */
  last(): string {
    if (this.events.length === 0) {
      return '';
    }
    return this.events[this.events.length - 1];
  }

  /** 是否包含指定前缀的记录（如 'open#1'） */
  hasPrefix(prefix: string): boolean {
    for (const e of this.events) {
      if (e.startsWith(prefix)) {
        return true;
      }
    }
    return false;
  }

  count(): number {
    return this.events.length;
  }

  clear(): void {
    this.events = [];
  }
}

/** 主按钮：EMPHASIZED 强调样式 */
export function buildPrimaryButton(content: ResourceStr,
  action?: () => void): AdvancedDialogV2Button {
  const options: AdvancedDialogV2ButtonOptions = {
    content: content,
    action: action,
    buttonStyle: ButtonStyleMode.EMPHASIZED
  };
  return new AdvancedDialogV2Button(options);
}

/** 次按钮：TEXTUAL 文本样式 */
export function buildSecondaryButton(content: ResourceStr,
  action?: () => void): AdvancedDialogV2Button {
  const options: AdvancedDialogV2ButtonOptions = {
    content: content,
    action: action,
    buttonStyle: ButtonStyleMode.TEXTUAL
  };
  return new AdvancedDialogV2Button(options);
}

/** SelectDialogV2 单选数据：action 经下标闭包回传选中项 */
export function buildSheetInfos(labels: string[], onPick: (index: number) => void): SheetInfo[] {
  const sheets: SheetInfo[] = [];
  for (let i = 0; i < labels.length; i++) {
    const idx: number = i;
    const info: SheetInfo = {
      title: labels[i],
      action: (): void => {
        onPick(idx);
      }
    };
    sheets.push(info);
  }
  return sheets;
}

/** 插屏弹窗配置描述（不含 UIContext，页面组装 DialogOptions 时注入） */
export class InterstitialConfig {
  public title: ResourceStr;
  public subtitle: ResourceStr;
  public titlePosition: TitlePosition;
  public iconStyle: IconStyle;
  public bottomOffsetType: BottomOffset;

  constructor(title: ResourceStr, subtitle: ResourceStr, titlePosition: TitlePosition,
    iconStyle: IconStyle, bottomOffsetType: BottomOffset) {
    this.title = title;
    this.subtitle = subtitle;
    this.titlePosition = titlePosition;
    this.iconStyle = iconStyle;
    this.bottomOffsetType = bottomOffsetType;
  }
}

/** 场景1 ConfirmDialogV2 载荷 */
export class ConfirmParams {
  public sceneId: number = 1;
  public title: ResourceStr = '';
  public content: ResourceStr = '';
  public checkTips: ResourceStr = '';
  public primaryButton: AdvancedDialogV2Button | null = null;
  public secondaryButton: AdvancedDialogV2Button | null = null;
}

/** 场景2 AlertDialogV2 载荷 */
export class AlertParams {
  public sceneId: number = 2;
  public primaryTitle: ResourceStr = '';
  public secondaryTitle: ResourceStr = '';
  public content: ResourceStr = '';
  public primaryButton: AdvancedDialogV2Button | null = null;
  public secondaryButton: AdvancedDialogV2Button | null = null;
}

/** 场景3 SelectDialogV2 载荷 */
export class SelectParams {
  public sceneId: number = 3;
  public title: ResourceStr = '';
  public content: ResourceStr = '';
  public selectedIndex: number = 0;
  public radioContent: SheetInfo[] = [];
  public confirm: AdvancedDialogV2Button | null = null;
}

/** 场景4 TipsDialogV2 载荷 */
export class TipsParams {
  public sceneId: number = 4;
  public imageRes: ResourceStr = $r('app.media.startIcon');
  public title: ResourceStr = '';
  public content: ResourceStr = '';
  public checkTips: ResourceStr = '';
  public primaryButton: AdvancedDialogV2Button | null = null;
  public secondaryButton: AdvancedDialogV2Button | null = null;
}

/** 场景5 LoadingDialogV2 载荷 */
export class LoadingParams {
  public sceneId: number = 5;
  public content: ResourceStr = '';
}

/** 场景6 CustomContentDialogV2 载荷 */
export class CustomParams {
  public sceneId: number = 6;
  public primaryTitle: ResourceStr = '';
  public secondaryTitle: ResourceStr = '';
  public buttons: AdvancedDialogV2Button[] = [];
}

/** 场景元数据：id、中文标题、核心 API、分组 */
export class ScenarioInfo {
  public id: number;
  public title: string;
  public api: string;
  public group: string;

  constructor(id: number, title: string, api: string, group: string) {
    this.id = id;
    this.title = title;
    this.api = api;
    this.group = group;
  }
}

/** 全部场景目录（1-14），供页面与测试共用 */
export function listScenarios(): ScenarioInfo[] {
  return [
    new ScenarioInfo(1, 'Confirm dialog', 'ConfirmDialogV2', 'DialogV2'),
    new ScenarioInfo(2, 'Alert detail dialog', 'AlertDialogV2', 'DialogV2'),
    new ScenarioInfo(3, 'Single-select dialog', 'SelectDialogV2', 'DialogV2'),
    new ScenarioInfo(4, 'Tips dialog', 'TipsDialogV2', 'DialogV2'),
    new ScenarioInfo(5, 'Loading dialog', 'LoadingDialogV2', 'DialogV2'),
    new ScenarioInfo(6, 'Custom content dialog', 'CustomContentDialogV2', 'DialogV2'),
    new ScenarioInfo(7, 'Popover dialog', 'PopoverDialogV2', 'DialogV2'),
    new ScenarioInfo(8, 'Interstitial dialog', 'InterstitialDialogAction', 'Interstitial'),
    new ScenarioInfo(9, 'Action sheet', 'showActionSheet', 'SystemPrompt'),
    new ScenarioInfo(10, 'Date picker dialog', 'showDatePickerDialog', 'SystemPicker'),
    new ScenarioInfo(11, 'Time picker dialog', 'showTimePickerDialog', 'SystemPicker'),
    new ScenarioInfo(12, 'Text picker dialog', 'showTextPickerDialog', 'SystemPicker'),
    new ScenarioInfo(13, 'Toast', 'openToast', 'SystemPrompt'),
    new ScenarioInfo(14, 'System button dialog', 'showDialog', 'SystemPrompt')
  ];
}

/** 按 id 查场景；不存在返回 null */
export function getScenario(id: number): ScenarioInfo | null {
  const all: ScenarioInfo[] = listScenarios();
  for (const item of all) {
    if (item.id === id) {
      return item;
    }
  }
  return null;
}

function pad2(value: number): string {
  return value < 10 ? `0${value}` : `${value}`;
}

/** 日期选择结果格式：YYYY-MM-DD */
export function formatDateValue(date: Date): string {
  const year: number = date.getFullYear();
  const month: string = pad2(date.getMonth() + 1);
  const day: string = pad2(date.getDate());
  return `${year}-${month}-${day}`;
}

/** 时间选择结果格式：HH:mm */
export function formatTimeValue(hour: number, minute: number): string {
  return `${pad2(hour)}:${pad2(minute)}`;
}

/** 文本选择结果格式：index=n value=xxx */
export function formatTextValue(value: string, index: number): string {
  return `index=${index} value=${value}`;
}
