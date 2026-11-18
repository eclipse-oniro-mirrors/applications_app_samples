/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { FileKind } from '../core/FileKindCore';
import { FileEntry, QueryOptions, QueryResult, SortField, filterEntries, sortEntries,
  queryEntries } from '../core/FileQueryCore';
import { textOf } from '../core/TextCatalog';

export const DEFAULT_PAGE_SIZE: number = 10;
const MAX_PAGE_SIZE: number = 50;

export class SearchModel {
  private entries: FileEntry[] = [];
  private selectedIds: string[] = [];
  private pageIndex: number = 0;
  private pageSize: number = DEFAULT_PAGE_SIZE;
  private keyword: string = '';
  private kinds: FileKind[] = [];
  private onlyDlp: boolean = false;
  private onlyFavorite: boolean = false;
  private sortField: SortField = SortField.NAME;
  private descending: boolean = false;

  setEntries(entries: FileEntry[]): void {
    this.entries = [];
    for (let index = 0; index < entries.length; index++) {
      this.entries.push(entries[index]);
    }
    this.pageIndex = 0;
    this.selectedIds = [];
  }

  getEntries(): FileEntry[] {
    return this.entries;
  }

  setKeyword(keyword: string): void {
    this.keyword = keyword;
    this.pageIndex = 0;
  }

  getKeyword(): string {
    return this.keyword;
  }

  toggleKind(kind: FileKind): void {
    const target: number = this.indexOfKind(kind);
    if (target >= 0) {
      this.kinds.splice(target, 1);
    } else {
      this.kinds.push(kind);
    }
    this.pageIndex = 0;
  }

  setKind(kind: FileKind): void {
    this.kinds = [kind];
    this.pageIndex = 0;
  }

  clearKinds(): void {
    this.kinds = [];
    this.pageIndex = 0;
  }

  getKinds(): FileKind[] {
    return this.kinds;
  }

  setOnlyDlp(onlyDlp: boolean): void {
    this.onlyDlp = onlyDlp;
    this.pageIndex = 0;
  }

  isOnlyDlp(): boolean {
    return this.onlyDlp;
  }

  setOnlyFavorite(onlyFavorite: boolean): void {
    this.onlyFavorite = onlyFavorite;
    this.pageIndex = 0;
  }

  isOnlyFavorite(): boolean {
    return this.onlyFavorite;
  }

  setSort(field: SortField, descending: boolean): void {
    this.sortField = field;
    this.descending = descending;
    this.pageIndex = 0;
  }

  getSortField(): SortField {
    return this.sortField;
  }

  isDescending(): boolean {
    return this.descending;
  }

  setPageSize(size: number): void {
    if (size < 1) {
      this.pageSize = 1;
    } else if (size > MAX_PAGE_SIZE) {
      this.pageSize = MAX_PAGE_SIZE;
    } else {
      this.pageSize = size;
    }
    this.pageIndex = 0;
  }

  getPageSize(): number {
    return this.pageSize;
  }

  resetFilters(): void {
    this.keyword = '';
    this.kinds = [];
    this.onlyDlp = false;
    this.onlyFavorite = false;
    this.sortField = SortField.NAME;
    this.descending = false;
    this.pageIndex = 0;
  }

  hasActiveFilters(): boolean {
    return this.keyword.trim().length > 0 || this.kinds.length > 0 || this.onlyDlp || this.onlyFavorite;
  }

  activeFilterCount(): number {
    let count: number = 0;
    if (this.keyword.trim().length > 0) {
      count += 1;
    }
    count += this.kinds.length;
    if (this.onlyDlp) {
      count += 1;
    }
    if (this.onlyFavorite) {
      count += 1;
    }
    return count;
  }

  private buildOptions(): QueryOptions {
    const options: QueryOptions = new QueryOptions();
    options.keyword = this.keyword;
    options.kinds = this.kinds;
    options.onlyDlp = this.onlyDlp;
    options.onlyFavorite = this.onlyFavorite;
    options.sortField = this.sortField;
    options.descending = this.descending;
    return options;
  }

  results(): FileEntry[] {
    const filtered: FileEntry[] = filterEntries(this.entries, this.buildOptions());
    return sortEntries(filtered, this.sortField, this.descending);
  }

  total(): number {
    return this.results().length;
  }

  pageCount(): number {
    const total: number = this.total();
    if (total === 0) {
      return 0;
    }
    return Math.ceil(total / this.pageSize);
  }

  page(): QueryResult {
    const options: QueryOptions = this.buildOptions();
    options.offset = this.pageIndex * this.pageSize;
    options.limit = this.pageSize;
    return queryEntries(this.entries, options);
  }

  currentPageIndex(): number {
    return this.pageIndex;
  }

  setPageIndex(index: number): void {
    const pages: number = this.pageCount();
    if (index < 0) {
      this.pageIndex = 0;
    } else if (index >= pages) {
      this.pageIndex = pages > 0 ? pages - 1 : 0;
    } else {
      this.pageIndex = index;
    }
  }

  nextPage(): boolean {
    if (this.pageIndex + 1 >= this.pageCount()) {
      return false;
    }
    this.pageIndex += 1;
    return true;
  }

  previousPage(): boolean {
    if (this.pageIndex <= 0) {
      return false;
    }
    this.pageIndex -= 1;
    return true;
  }

  toggleSelection(id: string): void {
    const target: number = this.selectedIds.indexOf(id);
    if (target >= 0) {
      this.selectedIds.splice(target, 1);
    } else {
      this.selectedIds.push(id);
    }
  }

  select(id: string): void {
    if (this.selectedIds.indexOf(id) < 0) {
      this.selectedIds.push(id);
    }
  }

  unselect(id: string): void {
    const target: number = this.selectedIds.indexOf(id);
    if (target >= 0) {
      this.selectedIds.splice(target, 1);
    }
  }

  isSelected(id: string): boolean {
    return this.selectedIds.indexOf(id) >= 0;
  }

  selectAllResults(): void {
    const results: FileEntry[] = this.results();
    for (let index = 0; index < results.length; index++) {
      this.select(results[index].id);
    }
  }

  clearSelection(): void {
    this.selectedIds = [];
  }

  selectedCount(): number {
    return this.selectedIds.length;
  }

  getSelectedIds(): string[] {
    return this.selectedIds;
  }

  selectedEntries(): FileEntry[] {
    const result: FileEntry[] = [];
    for (let index = 0; index < this.entries.length; index++) {
      if (this.isSelected(this.entries[index].id)) {
        result.push(this.entries[index]);
      }
    }
    return result;
  }

  selectionSummary(): string {
    return textOf('dlp_search_selected_prefix') + this.selectedIds.length.toString() +
      textOf('dlp_search_selected_suffix');
  }

  private indexOfKind(kind: FileKind): number {
    for (let index = 0; index < this.kinds.length; index++) {
      if (this.kinds[index] === kind) {
        return index;
      }
    }
    return -1;
  }
}
