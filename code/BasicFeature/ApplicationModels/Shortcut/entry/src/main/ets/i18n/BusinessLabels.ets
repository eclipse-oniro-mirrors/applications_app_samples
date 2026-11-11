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

// Stable enum/filter values are not translated in storage or comparisons. Only display labels change.
const LABEL_KEYS: Record<string, string> = {
  "高": "shortcut_text_0244",
  "普通": "shortcut_text_0429",
  "低": "shortcut_text_0215",
  "不重复": "shortcut_text_0134",
  "每天": "shortcut_text_0398",
  "工作日": "shortcut_text_0249",
  "每周": "shortcut_text_0400",
  "每月": "shortcut_text_0399",
  "无截止": "shortcut_text_0598",
  "未到期": "shortcut_text_0574",
  "即将到期": "shortcut_text_0312",
  "已逾期": "shortcut_text_0688",
  "已完成": "shortcut_text_0679",
  "可直接保存": "shortcut_text_0362",
  "另存为新分支": "shortcut_text_0384",
  "需用户确认": "shortcut_text_0629",
  "保存被阻止": "shortcut_text_0045",
  "正常": "shortcut_text_0738",
  "回收站": "shortcut_text_0298",
  "已清除": "shortcut_text_0666",
  "标题": "shortcut_text_0120",
  "标签": "shortcut_text_0095",
  "正文摘要": "shortcut_text_0740",
  "标识": "shortcut_text_0115",
  "全部": "shortcut_text_0461",
  "未完成": "shortcut_text_0581",
  "效率": "shortcut_text_0615",
  "工作": "shortcut_text_0248",
  "阅读": "shortcut_text_0716",
  "今天": "shortcut_text_0337",
  "明天": "shortcut_text_0402",
  "本周": "shortcut_text_0069",
  "以后": "shortcut_text_0690",
  "待处理": "shortcut_text_0203",
  "进行中": "shortcut_text_0345",
  "已置顶": "shortcut_text_0689",
  "未置顶": "shortcut_text_0590",
  "含便签标签": "shortcut_text_0261",
  "不含收藏标签": "shortcut_text_0131",
  "标题含\"整理\"": "shortcut_text_0123",
  "最近一天更新": "shortcut_text_0792",
  "超过七天未更新": "shortcut_text_0158",
  "待处理且已置顶": "shortcut_text_0204",
  "含便签标签且未完成": "shortcut_text_0262",
  "标题不含测试且未置顶": "shortcut_text_0121",
  "分组为工作中": "shortcut_text_0240"
};

export function businessLabel(value: string): string {
  const key: string = LABEL_KEYS[value];
  return key === undefined ? value : uiText(key);
}
