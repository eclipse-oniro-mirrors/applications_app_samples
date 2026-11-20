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

import { uiText } from '../../i18n/Strings';
import { CollectionItem } from '../../business/CollectionRules';
import { SearchDoc } from '../../business/SearchIndex';
import { TodoItem, TodoState } from '../../business/TodoRules';

export function sampleCollections(now: number): CollectionItem[] {
  const recent: CollectionItem = new CollectionItem('c1', uiText('shortcut_text_0341'), uiText('shortcut_text_0644'));
  recent.source = 'note';
  recent.tags = ['便签'];
  recent.savedAt = now - 3600000;
  const duplicate: CollectionItem = new CollectionItem('c2', uiText('shortcut_text_0341'), uiText('shortcut_text_0768'));
  duplicate.source = 'note';
  duplicate.tags = ['便签'];
  duplicate.savedAt = now - 7200000;
  const old: CollectionItem = new CollectionItem('c3', uiText('shortcut_text_0459'), uiText('shortcut_text_0159'));
  old.source = 'web';
  old.tags = ['资料'];
  old.savedAt = now - 400 * 86400000;
  const messy: CollectionItem = new CollectionItem('c4', uiText('shortcut_text_0097'), uiText('shortcut_text_0108'));
  messy.source = 'web';
  messy.tags = ['a', 'b', 'c', 'd', 'e', 'f'];
  messy.savedAt = now - 86400000;
  const pinned: CollectionItem = new CollectionItem('c5', uiText('shortcut_text_0763'), uiText('shortcut_text_0528'));
  pinned.source = 'web';
  pinned.tags = ['资料'];
  pinned.savedAt = now - 10 * 86400000;
  pinned.pinned = true;
  return [recent, duplicate, old, messy, pinned];
}

export function sampleDocs(): SearchDoc[] {
  const note: SearchDoc = new SearchDoc('demo-note', uiText('shortcut_text_0086'), uiText('shortcut_text_0731'));
  note.tags = ['便签', 'note'];
  note.updatedAt = 1700000000000;
  const todo: SearchDoc = new SearchDoc('demo-todo', uiText('shortcut_text_0196'), uiText('shortcut_text_0335'));
  todo.tags = ['待办', 'todo'];
  todo.updatedAt = 1700000000000;
  const collection: SearchDoc = new SearchDoc('demo-collection', uiText('shortcut_text_0521'), uiText('shortcut_text_0517'));
  collection.tags = ['收藏', 'collection'];
  collection.updatedAt = 1700000000000;
  return [note, todo, collection];
}


export function sampleTodos(): TodoItem[] {
  const urgent: TodoItem = new TodoItem('demo-1', uiText('shortcut_text_0733'), 3);
  urgent.state = TodoState.DOING;
  urgent.dueAt = 1600000000000;
  urgent.estimateMinutes = 15;
  urgent.tags = ['待办'];
  const normal: TodoItem = new TodoItem('demo-2', uiText('shortcut_text_0127'), 2);
  normal.dueAt = 1900000000000;
  normal.estimateMinutes = 45;
  const later: TodoItem = new TodoItem('demo-3', uiText('shortcut_text_0736'), 1);
  later.state = TodoState.DEFERRED;
  later.estimateMinutes = 180;
  return [urgent, normal, later];
}
