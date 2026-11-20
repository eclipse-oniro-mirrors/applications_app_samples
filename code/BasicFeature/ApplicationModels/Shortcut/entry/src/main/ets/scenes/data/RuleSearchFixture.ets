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

import { FilterTarget } from '../../business/FilterChain';

/** Fixed filter/search contracts, not display translations or unit-test expectations. */
export const RULE_NOTE_QUERY: string = '便签 note';
export const RULE_WORK_QUERY: string = '工作';
export const RULE_TODO_QUERY: string = '待办';

export function sampleTargets(): FilterTarget[] {
  const open: FilterTarget = new FilterTarget('t1', '整理今日待办', 'open');
  open.tags = ['便签'];
  open.group = '工作中';
  open.pinned = true;
  open.updatedAt = 1700000000000;
  const done: FilterTarget = new FilterTarget('t2', '已完成事项', 'done');
  done.tags = ['收藏'];
  done.group = '归档';
  done.updatedAt = 1600000000000;
  const doing: FilterTarget = new FilterTarget('t3', '测试用例整理', 'doing');
  doing.tags = ['便签', '测试'];
  doing.group = '工作中';
  doing.updatedAt = 1690000000000;
  return [open, done, doing];
}
