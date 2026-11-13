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

import { uiText } from './Strings';

interface BuiltinCollectionText {
  readonly title: string;
  readonly content: string;
  readonly titleKey: string;
  readonly contentKey: string;
}

// Canonical fingerprints are compatibility data, not display text or replacement storage values.
const COLLECTION_TEXT: Record<string, BuiltinCollectionText> = {
  'planning': {
    title: '每日计划清单',
    content: '1. 写下今天最重要的一件事。\n2. 为任务留出完整时间。\n' +
      '3. 完成后勾选今日待办。\n4. 下班前整理明日计划。',
    titleKey: 'shortcut_text_0397',
    contentKey: 'shortcut_text_0033'
  },
  'meeting': {
    title: '会议记录模板',
    content: '会议主题：\n会议时间：\n参会人员：\n\n讨论事项：\n\n已定结论：\n\n' +
      '后续行动：负责人 / 截止日期',
    titleKey: 'shortcut_text_0307',
    contentKey: 'shortcut_text_0308'
  },
  'reading': {
    title: '阅读摘录模板',
    content: '书名 / 文章：\n作者：\n阅读日期：\n\n重点摘录：\n\n我的想法：\n\n下一步行动：',
    titleKey: 'shortcut_text_0717',
    contentKey: 'shortcut_text_0530'
  }
};

/** Only the exact built-in catalogue value is localized; modified or unknown data stays verbatim. */
export function collectionTitleText(id: string, value: string): string {
  const builtin: BuiltinCollectionText | undefined = COLLECTION_TEXT[id];
  return builtin !== undefined && value === builtin.title ? uiText(builtin.titleKey) : value;
}

export function collectionContentText(id: string, value: string): string {
  const builtin: BuiltinCollectionText | undefined = COLLECTION_TEXT[id];
  return builtin !== undefined && value === builtin.content ? uiText(builtin.contentKey) : value;
}

/** Never rewrite persisted or edited titles. Stable default IDs alone are insufficient. */
export function todoTitleText(id: string, value: string, date: string): string {
  if (id === `${date}-plan` && value === '整理今日计划') {
    return uiText('shortcut_text_0735');
  }
  if (id === `${date}-focus` && value === '完成一项重要任务') {
    return uiText('shortcut_text_0570');
  }
  if (id === `${date}-review` && value === '回顾今日进度') {
    return uiText('shortcut_text_0295');
  }
  return value;
}
