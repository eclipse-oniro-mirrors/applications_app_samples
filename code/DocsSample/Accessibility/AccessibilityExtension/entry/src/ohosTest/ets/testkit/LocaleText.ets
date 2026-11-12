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

import { i18n } from '@kit.LocalizationKit';

const CHINESE_LANGUAGE: string = 'zh';
const NUMBER_SEPARATOR: string = ':';

let chineseTexts: Map<string, string> | undefined = undefined;
let chineseLocale: boolean | undefined = undefined;

/**
 * 与 resources/zh_CN/element/string.json 保持一致的文案映射。
 * 用例统一以英文基准文案书写期望值，真机语言为中文时由 localizeText 转换为中文期望值，
 * 未登记的非资源文案（如负向用例的 fakeText）原样返回，两种语言下行为一致。
 */
function getChineseTexts(): Map<string, string> {
  if (chineseTexts !== undefined) {
    return chineseTexts;
  }
  const texts: Map<string, string> = new Map<string, string>();
  texts.set('Accessibility Sample', '无障碍扩展示例');
  texts.set('Basic Interaction', '基础交互');
  texts.set('Click Me', '点击我');
  texts.set('Button to trigger click accessibility event', '用于触发点击无障碍事件的按钮');
  texts.set('Long Press', '长按');
  texts.set('Button to trigger long click accessibility event', '用于触发长按无障碍事件的按钮');
  texts.set('Counter', '点击次数');
  texts.set('Text Input', '文本输入');
  texts.set('Please input text...', '请输入文本');
  texts.set('Text input field', '文本输入框');
  texts.set('Input field that triggers text update accessibility event', '用于触发文本更新无障碍事件的输入框');
  texts.set('Toggle Switch', '开关控件');
  texts.set('Switch toggle', '开关');
  texts.set('Toggle switch that triggers select accessibility event', '用于触发选择无障碍事件的开关控件');
  texts.set('Scrollable List', '可滚动列表');
  texts.set('Scrollable list of items', '可滚动的列表项集合');
  texts.set('List item 1', '列表项 1');
  texts.set('List item 2', '列表项 2');
  texts.set('List item 3', '列表项 3');
  texts.set('List item 4', '列表项 4');
  texts.set('List item 5', '列表项 5');
  texts.set('Slider Control', '滑块控件');
  texts.set('Volume slider', '音量滑块');
  texts.set('Slider that demonstrates valueNow valueMax valueMin accessibility properties',
    '用于演示 valueNow、valueMax、valueMin 无障碍属性的滑块');
  texts.set('Value', '当前值');
  texts.set('Checkbox Control', '复选框控件');
  texts.set('Enable notifications', '开启通知');
  texts.set('Checkbox that demonstrates checkable and checked accessibility properties',
    '用于演示 checkable 与 checked 无障碍属性的复选框');
  texts.set('Swiper Pages', '轮播页面');
  texts.set('Page swiper', '页面轮播');
  texts.set('Swiper that demonstrates page content update accessibility events',
    '用于演示页面内容更新无障碍事件的轮播组件');
  texts.set('Page 1', '第 1 页');
  texts.set('Page 2', '第 2 页');
  texts.set('Page 3', '第 3 页');
  chineseTexts = texts;
  return chineseTexts;
}

/**
 * 当前系统语言是否为中文（zh_CN 资源生效）。
 * 英文及其他语言使用 base/en_US 资源，期望值与英文基准文案一致。
 */
export function isChineseLocale(): boolean {
  if (chineseLocale === undefined) {
    const language: string = i18n.System.getSystemLanguage().toLowerCase();
    chineseLocale = language.startsWith(CHINESE_LANGUAGE);
  }
  return chineseLocale;
}

/**
 * 将英文基准文案转换为当前系统语言下的期望文案。
 */
export function localizeText(englishText: string): string {
  if (!isChineseLocale()) {
    return englishText;
  }
  const localized: string | undefined = getChineseTexts().get(englishText);
  return localized === undefined ? englishText : localized;
}

/**
 * 计数器文本的期望值，如 Counter: 0 / 点击次数: 0。
 */
export function expectedCounterText(value: number): string {
  return `${localizeText('Counter')}${NUMBER_SEPARATOR} ${value}`;
}

/**
 * 滑块数值文本的期望值，如 Value: 50 / 当前值: 50。
 */
export function expectedSliderValueText(value: number): string {
  return `${localizeText('Value')}${NUMBER_SEPARATOR} ${value}`;
}

/**
 * 从「标签: 数值」形式的文本中提取数值，与标签语言无关；无分隔符时直接按数值解析。
 */
export function parseTrailingNumber(text: string): number {
  const separatorIndex: number = text.lastIndexOf(NUMBER_SEPARATOR);
  const numberPart: string = separatorIndex >= 0 ? text.substring(separatorIndex + 1) : text;
  return Number(numberPart.trim());
}
