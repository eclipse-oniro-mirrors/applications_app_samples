'use static';

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

export const TAG_COUNT: int = 12;
export const CONTENT_PER_TAG: int = 10;

/** Plain mirror of the CustomDataType record consumed by the cascade list. */
export class CascadeItem {
  public desc: string;
  public tag: string;

  constructor(desc: string, tag: string) {
    this.desc = desc;
    this.tag = tag;
  }
}

/** Pure mirror of the ListIndexPosition pair used by onScrollIndex. */
export class VisibleRange {
  public start: int;
  public end: int;

  constructor(start: int, end: int) {
    this.start = start;
    this.end = end;
  }

  public span(): int {
    return this.end - this.start + 1;
  }

  public contains(index: int): boolean {
    return index >= this.start && index <= this.end;
  }
}

/**
 * Mirrors the index bookkeeping inside SecondaryLinkExample.ets. The real
 * page struct drives Scroller objects; this model records the exact target
 * the page would request so the rules can be asserted without a device.
 */
export class CascadeModel {
  public records: int[] = [];
  public tagLabels: string[] = [];
  public items: CascadeItem[] = [];
  public currentTagIndex: int = 0;
  public tagStart: int = 0;
  public tagEnd: int = 0;
  public itemScrollTarget: int = -1;
  public tagScrollTarget: int = -1;
  public clickOnTagList: boolean = false;

  constructor() {
    for (let index = 0; index < TAG_COUNT; index++) {
      this.tagLabels.push('类别' + (index + 1).toString());
      this.records.push(index * CONTENT_PER_TAG);
      for (let offset = 0; offset < CONTENT_PER_TAG; offset++) {
        this.items.push(new CascadeItem('内容数据', '类别' + (index + 1).toString()));
      }
    }
    this.records.push(CONTENT_PER_TAG * TAG_COUNT);
  }

  public findItemIndex(index: int): int {
    return this.records[index];
  }

  public findClassIndex(index: int): int {
    let classIndex: int = 0;
    for (let cursor = 0; cursor < this.records.length; cursor++) {
      if (index >= this.records[cursor] && index < this.records[cursor + 1]) {
        classIndex = cursor;
        break;
      }
    }
    return classIndex;
  }

  /** Simulates a tap on the first level list. */
  public selectTag(index: int): void {
    this.currentTagIndex = index;
    this.itemScrollTarget = this.findItemIndex(index);
    this.clickOnTagList = true;
  }

  /** Simulates a scroll of the second level list. */
  public scrollContent(start: int): void {
    const classIndex: int = this.findClassIndex(start);
    if (classIndex !== this.currentTagIndex && this.clickOnTagList !== true) {
      this.currentTagIndex = classIndex;
      this.tagScrollTarget = classIndex;
    }
  }

  /** Simulates the @Watch handler that keeps the focused tag visible. */
  public onIndexChange(): void {
    if (this.currentTagIndex === this.tagEnd || this.currentTagIndex === this.tagEnd - 1) {
      let left: int = this.currentTagIndex + 1;
      left = left >= this.tagLabels.length - 1 ? this.tagLabels.length - 1 : left;
      this.tagScrollTarget = left;
    }
    if (this.currentTagIndex === this.tagStart || this.currentTagIndex === this.tagStart + 1) {
      let right: int = this.currentTagIndex - 1;
      right = right <= 0 ? 0 : right;
      this.tagScrollTarget = right;
    }
  }

  public lastClassOf(index: int): int {
    let found: int = 0;
    for (let cursor = 0; cursor < TAG_COUNT; cursor++) {
      if (this.records[cursor] <= index) {
        found = cursor;
      }
    }
    return found;
  }

  public itemsOfTag(tagIndex: int): CascadeItem[] {
    const result: CascadeItem[] = [];
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].tag === this.tagLabels[tagIndex]) {
        result.push(this.items[index]);
      }
    }
    return result;
  }
}

/**
 * Layout metrics mirrored from ComponentStyle in DataType.ets. The values are
 * restated here as an independent table; a mismatch with the production enum
 * would fail the style suites instead of silently passing.
 */
export class StyleTable {
  public static readonly ITEM_GUTTER: int = 12;
  public static readonly TAG_TEXT_HEIGHT: int = 75;
  public static readonly SUB_ITEM_GUTTER: int = 7;
  public static readonly SUB_ITEM_HEIGHT: int = 96;
  public static readonly SUB_ITEM_TEXT_WIDTH_TITLE: int = 56;
  public static readonly SUB_ITEM_TEXT_HEIGHT: int = 12;
  public static readonly SUB_ITEM_TEXT_WIDTH_BODY: int = 120;
  public static readonly BOTTOM_TOAST_TEXT_MAX_HEIGHT: int = 200;

  public static all(): int[] {
    return [
      StyleTable.ITEM_GUTTER,
      StyleTable.TAG_TEXT_HEIGHT,
      StyleTable.SUB_ITEM_GUTTER,
      StyleTable.SUB_ITEM_HEIGHT,
      StyleTable.SUB_ITEM_TEXT_WIDTH_TITLE,
      StyleTable.SUB_ITEM_TEXT_HEIGHT,
      StyleTable.SUB_ITEM_TEXT_WIDTH_BODY,
      StyleTable.BOTTOM_TOAST_TEXT_MAX_HEIGHT,
    ];
  }

  public static isMonotonicExceptGutters(): boolean {
    return (
      StyleTable.TAG_TEXT_HEIGHT > StyleTable.ITEM_GUTTER &&
      StyleTable.SUB_ITEM_HEIGHT > StyleTable.SUB_ITEM_GUTTER &&
      StyleTable.SUB_ITEM_TEXT_WIDTH_BODY > StyleTable.SUB_ITEM_TEXT_WIDTH_TITLE
    );
  }
}
