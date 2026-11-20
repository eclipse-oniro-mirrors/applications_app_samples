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

import { resourceText } from '../i18n/Strings';

export enum PageKey {
  HOME = 'home',
  NOTE = 'note',
  TODO = 'todo',
  COLLECTION = 'collection',
  DETAIL = 'detail',
  CALL_LOG = 'calls'
}

export class FeatureInfo {
  public id: string;
  public page: PageKey;
  private titleValue: string = '';
  get title(): string { return resourceText(this.titleValue); }
  set title(value: string) { this.titleValue = value; }
  private descriptionValue: string = '';
  get description(): string { return resourceText(this.descriptionValue); }
  set description(value: string) { this.descriptionValue = value; }
  public icon: Resource;

  constructor(id: string, page: PageKey, title: string, description: string, icon: Resource) {
    this.id = id;
    this.page = page;
    this.title = title;
    this.description = description;
    this.icon = icon;
  }
}

export const FEATURES: FeatureInfo[] = [
  new FeatureInfo('sc.note.new', PageKey.NOTE, '@string/shortcut_text_0619', '@string/shortcut_text_0543', $r('app.media.shortcut_note')),
  new FeatureInfo('sc.todo.today', PageKey.TODO, '@string/shortcut_text_0334', '@string/shortcut_text_0164', $r('app.media.shortcut_todo')),
  new FeatureInfo('sc.collection.saved', PageKey.COLLECTION, '@string/shortcut_text_0523', '@string/shortcut_text_0148', $r('app.media.shortcut_collection'))
];

export function featureForId(id: string): FeatureInfo | undefined {
  return FEATURES.find((item: FeatureInfo) => item.id === id);
}

export function featureForPage(page: PageKey): FeatureInfo | undefined {
  return FEATURES.find((item: FeatureInfo) => item.page === page);
}
