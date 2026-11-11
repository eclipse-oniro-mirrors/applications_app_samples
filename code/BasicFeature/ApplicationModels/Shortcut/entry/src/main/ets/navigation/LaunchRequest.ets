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

import { uiText } from '../i18n/Strings';
import { Want } from '@kit.AbilityKit';
import { PageKey } from '../model/ShortcutModels';

export class LaunchRequest {
  public page: PageKey;
  public source: string;
  public error: string;
  public filter: string;
  public id: string;

  constructor(page: PageKey, source: string, error: string = '', filter: string = '', id: string = '') {
    this.page = page;
    this.source = source;
    this.error = error;
    this.filter = filter;
    this.id = id;
  }

  key(): string {
    return `${this.page}:${this.filter}:${this.id}`;
  }
}

export function parseLaunchRequest(want: Want, cold: boolean): LaunchRequest {
  const source: string = cold ? uiText("shortcut_text_0377") : uiText("shortcut_text_0483");
  const params = want.parameters;
  const action = params === undefined ? undefined : params['sc.action'];
  const version = params === undefined ? undefined : params['sc.version'];
  const filter = params === undefined ? undefined : params['sc.filter'];
  if (action === undefined && version === undefined && filter === undefined) {
    return new LaunchRequest(PageKey.HOME, source);
  }
  if (version !== '1') {
    return new LaunchRequest(PageKey.HOME, source, uiText("shortcut_text_0366"));
  }
  if (action === 'note.new' && (filter === undefined || filter === '')) {
    return new LaunchRequest(PageKey.NOTE, source);
  }
  if (action === 'todo.list' && filter === 'todayOpen') {
    return new LaunchRequest(PageKey.TODO, source, '', 'todayOpen');
  }
  if (action === 'collection.list' && filter === 'saved') {
    return new LaunchRequest(PageKey.COLLECTION, source, '', 'saved');
  }
  return new LaunchRequest(PageKey.HOME, source, uiText("shortcut_text_0367"));
}
