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

export interface SortItemLike {
  id: number | string;
  selected: boolean;
  order: number;
}

/** Provides Tree Sort Utils helpers for the sample. */
export class TreeSortUtils {
  static countSelected(items: SortItemLike[]): number {
    let count = 0;
    for (let i = 0; i < items.length; i++) {
      if (items[i].selected) {
        count++;
      }
    }
    return count;
  }

  static sortSummary(selected: number, unselected: number): string {
    return `selected=${selected}, unselected=${unselected}`;
  }

  static refreshStatus(count: number, loading: boolean): string {
    return `count=${count}, loading=${loading}`;
  }

  static treeStatus(nodeId: number, title: string): string {
    return `node=${nodeId}, title=${title}`;
  }

  static spanStyle(dark: boolean): string {
    return `style=${dark ? 'dark' : 'light'}`;
  }

  static nextSpanStyle(dark: boolean): boolean {
    return !dark;
  }

  static formStatus(code: number, formId: string): string {
    return `code=${code}, formId=${formId.length > 0 ? formId : 'none'}`;
  }
}
