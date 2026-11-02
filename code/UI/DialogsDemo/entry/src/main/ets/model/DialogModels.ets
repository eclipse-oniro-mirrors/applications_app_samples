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
export function buildPrimaryButton(content: string,
  action?: () => void): AdvancedDialogV2Button {
  const options: AdvancedDialogV2ButtonOptions = {
    content: content,
    action: action,
    buttonStyle: ButtonStyleMode.EMPHASIZED
  };
  return new AdvancedDialogV2Button(options);
}

/** 次按钮：TEXTUAL 文本样式 */
export function buildSecondaryButton(content: string,
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
  title: string;
  subtitle: string;
  titlePosition: TitlePosition;
  iconStyle: IconStyle;
  bottomOffsetType: BottomOffset;

  constructor(title: string, subtitle: string, titlePosition: TitlePosition,
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
  sceneId: number = 1;
  title: string = '';
  content: string = '';
  checkTips: string = '';
  primaryButton: AdvancedDialogV2Button | null = null;
  secondaryButton: AdvancedDialogV2Button | null = null;
}

/** 场景2 AlertDialogV2 载荷 */
export class AlertParams {
  sceneId: number = 2;
  primaryTitle: string = '';
  secondaryTitle: string = '';
  content: string = '';
  primaryButton: AdvancedDialogV2Button | null = null;
  secondaryButton: AdvancedDialogV2Button | null = null;
}

/** 场景3 SelectDialogV2 载荷 */
export class SelectParams {
  sceneId: number = 3;
  title: string = '';
  content: string = '';
  selectedIndex: number = 0;
  radioContent: SheetInfo[] = [];
  confirm: AdvancedDialogV2Button | null = null;
}

/** 场景4 TipsDialogV2 载荷 */
export class TipsParams {
  sceneId: number = 4;
  imageRes: ResourceStr = $r('app.media.startIcon');
  title: string = '';
  content: string = '';
  checkTips: string = '';
  primaryButton: AdvancedDialogV2Button | null = null;
  secondaryButton: AdvancedDialogV2Button | null = null;
}

/** 场景5 LoadingDialogV2 载荷 */
export class LoadingParams {
  sceneId: number = 5;
  content: string = '';
}

/** 场景6 CustomContentDialogV2 载荷 */
export class CustomParams {
  sceneId: number = 6;
  primaryTitle: string = '';
  secondaryTitle: string = '';
  buttons: AdvancedDialogV2Button[] = [];
}

/** 场景元数据：id、中文标题、核心 API、分组 */
export class ScenarioInfo {
  id: number;
  title: string;
  api: string;
  group: string;

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
    new ScenarioInfo(1, '确认对话框', 'ConfirmDialogV2', 'DialogV2'),
    new ScenarioInfo(2, '警告详情弹窗', 'AlertDialogV2', 'DialogV2'),
    new ScenarioInfo(3, '单选列表弹窗', 'SelectDialogV2', 'DialogV2'),
    new ScenarioInfo(4, '图示提示弹窗', 'TipsDialogV2', 'DialogV2'),
    new ScenarioInfo(5, '加载弹窗', 'LoadingDialogV2', 'DialogV2'),
    new ScenarioInfo(6, '自定义内容弹窗', 'CustomContentDialogV2', 'DialogV2'),
    new ScenarioInfo(7, '气泡弹窗', 'PopoverDialogV2', 'DialogV2'),
    new ScenarioInfo(8, '插屏弹窗', 'InterstitialDialogAction', 'Interstitial'),
    new ScenarioInfo(9, '操作列表弹窗', 'showActionSheet', 'SystemPrompt'),
    new ScenarioInfo(10, '日期选择弹窗', 'showDatePickerDialog', 'SystemPicker'),
    new ScenarioInfo(11, '时间选择弹窗', 'showTimePickerDialog', 'SystemPicker'),
    new ScenarioInfo(12, '文本选择弹窗', 'showTextPickerDialog', 'SystemPicker'),
    new ScenarioInfo(13, '轻提示', 'openToast', 'SystemPrompt'),
    new ScenarioInfo(14, '系统按钮弹窗', 'showDialog', 'SystemPrompt')
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
