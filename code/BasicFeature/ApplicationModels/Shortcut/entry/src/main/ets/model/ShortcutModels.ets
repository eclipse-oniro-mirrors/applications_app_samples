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

import { uiText, resourceText } from '../i18n/Strings';
import { shortcutManager } from '@kit.AbilityKit';
import { BatchPlan, BatchPreview } from '../services/VisibilityBatch';

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
  new FeatureInfo('sc.note.new', PageKey.NOTE, "@string/shortcut_text_0619", "@string/shortcut_text_0543", $r('app.media.shortcut_note')),
  new FeatureInfo('sc.todo.today', PageKey.TODO, "@string/shortcut_text_0334", "@string/shortcut_text_0164", $r('app.media.shortcut_todo')),
  new FeatureInfo('sc.collection.saved', PageKey.COLLECTION, "@string/shortcut_text_0523", "@string/shortcut_text_0148", $r('app.media.shortcut_collection'))
];

export function featureForId(id: string): FeatureInfo | undefined {
  return FEATURES.find((item: FeatureInfo) => item.id === id);
}

export function featureForPage(page: PageKey): FeatureInfo | undefined {
  return FEATURES.find((item: FeatureInfo) => item.page === page);
}

export function clockText(millis: number): string {
  const date: Date = new Date(millis);
  return `${two(date.getHours())}:${two(date.getMinutes())}:${two(date.getSeconds())}`;
}

function two(value: number): string {
  return value.toString().padStart(2, '0');
}

export class ShortcutItem {
  public id: string = '';
  public title: string = '';
  public visible: boolean = true;
  public visibleExplicit: boolean = true;
  public status: string = '';
  public error: string = '';
  public raw: shortcutManager.ShortcutInfo;

  constructor(info: shortcutManager.ShortcutInfo, title: string) {
    this.raw = info;
    this.id = info.id;
    this.title = title;
    this.visible = info.visible === undefined ? true : info.visible;
    this.visibleExplicit = info.visible !== undefined;
  }
}

export class CallRecord {
  public id: number;
  public time: string;
  public api: string;
  public target: string;
  public status: string;
  public message: string;

  constructor(id: number, time: string, api: string, target: string, status: string, message: string) {
    this.id = id;
    this.time = time;
    this.api = api;
    this.target = target;
    this.status = status;
    this.message = message;
  }
}

export class ShortcutView {
  public support: string = uiText("shortcut_text_0498");
  public supportError: string = '';
  public supported: boolean = false;
  public checking: boolean = false;
  public querying: boolean = false;
  public busy: boolean = false;
  public settingId: string = '';
  public batchMessage: string = '';
  public batchReady: boolean = false;
  public batchLoading: boolean = false;
  public batchError: string = '';
  public batches: BatchPlan[] = [];
  public batchPreview: BatchPreview | undefined = undefined;
  public queryError: string = '';
  public lastQuery: string = '';
  public items: ShortcutItem[] = [];
  public records: CallRecord[] = [];
}

export function sourceText(value: number): string {
  switch (value) {
    case 0: return uiText("shortcut_text_0790");
    case 1: return uiText("shortcut_text_0347");
    case 2: return uiText("shortcut_text_0219");
    default: return uiText("shortcut_text_0372", [String(value)]);
  }
}
