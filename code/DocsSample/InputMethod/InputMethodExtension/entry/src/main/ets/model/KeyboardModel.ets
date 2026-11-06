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
 * 软键盘面板的纯数据模型：按键行、输入缓冲编辑、模式切换。
 * 真实输入法面板由 inputMethodEngine.createPanel + setUiContent 加载独立页面渲染；
 * 这里把布局与编辑逻辑抽成纯函数，页面只管画，用例可以逐条断言。
 */

export enum KeyboardMode {
  LETTER = 'letter',
  NUMBER = 'number'
}

export const ACTION_CHAR: string = 'char';
export const ACTION_DELETE: string = 'delete';
export const ACTION_SPACE: string = 'space';
export const ACTION_MODE: string = 'mode';
export const ACTION_ENTER: string = 'enter';

export class KeySpec {
  label: string;
  action: string;
  wide: boolean;

  constructor(label: string, action: string, wide: boolean = false) {
    this.label = label;
    this.action = action;
    this.wide = wide;
  }
}

export const LETTER_ROWS: string[][] = [
  ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
  ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
  ['z', 'x', 'c', 'v', 'b', 'n', 'm']
];

export const NUMBER_ROWS: string[][] = [
  ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
  ['-', '/', ':', ';', '(', ')', '¥', '&', '@', '"'],
  ['.', ',', '?', '!', '\'', '#', '%', '*', '+', '=']
];

export function rowsOf(mode: KeyboardMode): string[][] {
  return mode === KeyboardMode.NUMBER ? NUMBER_ROWS : LETTER_ROWS;
}

/** 一行字符 → 按键列表；空格与模式/删除等功能键挂在第三行末尾 */
export function buildRows(mode: KeyboardMode): KeySpec[][] {
  const rows = rowsOf(mode);
  return rows.map((chars: string[], index: number) => {
    const keys = chars.map((label: string) => new KeySpec(label, ACTION_CHAR));
    if (index === rows.length - 1) {
      keys.push(new KeySpec('⌫', ACTION_DELETE, true));
    }
    return keys;
  });
}

/** 功能键行：切换模式、空格、回车 */
export function buildFunctionRow(mode: KeyboardMode): KeySpec[] {
  return [
    new KeySpec(mode === KeyboardMode.NUMBER ? 'abc' : '123', ACTION_MODE, true),
    new KeySpec('空格', ACTION_SPACE, true),
    new KeySpec('↵', ACTION_ENTER, true)
  ];
}

export function appendChar(text: string, char: string, limit: number): string {
  if (charCount(text) >= limit) {
    return text;
  }
  return text + char;
}

/** 删除末尾一个字符：emoji 这类代理对占两个 code unit，必须一起删，不能留下半个字符 */
export function deleteLast(text: string): string {
  if (text.length === 0) {
    return text;
  }
  const last = text.charCodeAt(text.length - 1);
  const cut = last >= 0xDC00 && last <= 0xDFFF && text.length >= 2 ? 2 : 1;
  return text.substring(0, text.length - cut);
}

export function switchMode(mode: KeyboardMode): KeyboardMode {
  return mode === KeyboardMode.LETTER ? KeyboardMode.NUMBER : KeyboardMode.LETTER;
}

export function modeName(mode: KeyboardMode): string {
  return mode === KeyboardMode.NUMBER ? '数字与符号' : '字母';
}

/** 演示用候选：不做词库，只把已输入文本拼上常用后缀，保证候选栏有可观测内容 */
export function candidatesFor(text: string): string[] {
  if (text.length === 0) {
    return [];
  }
  return [text, `${text}好`, `${text}的`];
}

/** 按 Unicode 码点计数：缓冲额度与页面上显示的 n/64 都走这里，emoji 算 1 个 */
export function charCount(text: string): number {
  let count = 0;
  for (let i = 0; i < text.length; i++) {
    const code = text.charCodeAt(i);
    if (code >= 0xD800 && code <= 0xDBFF) {
      i++;
    }
    count++;
  }
  return count;
}

/**
 * 一次按键带来的全部变化：本地缓冲、模式、以及需要转发给编辑框的内容。
 * 页面据此先改本地状态再决定是否调 insertText/deleteBackward，
 * 两个使用方（系统面板页、演示页预览）共用同一份规则。
 */
export class KeyEdit {
  text: string;
  mode: KeyboardMode;
  inserted: string;
  deleted: number;

  constructor(text: string, mode: KeyboardMode, inserted: string, deleted: number) {
    this.text = text;
    this.mode = mode;
    this.inserted = inserted;
    this.deleted = deleted;
  }
}

export function applyKey(text: string, mode: KeyboardMode, key: KeySpec, limit: number): KeyEdit {
  if (key.action === ACTION_MODE) {
    return new KeyEdit(text, switchMode(mode), '', 0);
  }
  if (key.action === ACTION_DELETE) {
    if (text.length === 0) {
      return new KeyEdit(text, mode, '', 0);
    }
    return new KeyEdit(deleteLast(text), mode, '', 1);
  }
  const piece = key.action === ACTION_SPACE ? ' ' : (key.action === ACTION_ENTER ? '\n' : key.label);
  const next = appendChar(text, piece, limit);
  // 缓冲已满时不能把未上屏的字符报成 inserted，否则会往编辑框里多写一次
  return new KeyEdit(next, mode, next === text ? '' : piece, 0);
}
