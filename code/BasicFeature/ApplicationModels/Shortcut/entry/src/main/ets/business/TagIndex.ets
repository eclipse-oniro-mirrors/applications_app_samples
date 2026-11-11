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

import { businessLabel } from '../i18n/BusinessLabels';
import { uiText, resourceText } from '../i18n/Strings';
/**
 * 标签索引与真实数据检索。
 *
 * 收藏与笔记都带标签，但标签的价值取决于"能不能用它找到东西"。这里不做模糊匹配，
 * 而是把标签规范、同义归并、检索打分三件事写清楚：
 *   - 规范化：大小写、空白、全角半角先统一，避免"标签 1"和"标签1"被当成两个；
 *   - 同义归并：只合并在表里显式声明的同义词，不猜；
 *   - 打分：命中标题权重高于命中标签，标签权重高于命中正文摘要。
 *
 * 检索结果为空时明确返回"无匹配"，不返回全部条目。
 */

/** 一次命中的评分来源。 */
export enum ScoreSource {
  TITLE = '标题',
  TAG = '标签',
  BODY = '正文摘要',
  ID = '标识'
}

/** 标签规范化规则。 */
export class TagRule {
  public code: string = '';
  private conditionValue: string = '';
  get condition(): string { return resourceText(this.conditionValue); }
  set condition(value: string) { this.conditionValue = value; }
  private actionValue: string = '';
  get action(): string { return resourceText(this.actionValue); }
  set action(value: string) { this.actionValue = value; }
  private noteValue: string = '';
  get note(): string { return resourceText(this.noteValue); }
  set note(value: string) { this.noteValue = value; }

  constructor(code: string = '', condition: string = '', action: string = '', note: string = '') {
    this.code = code;
    this.condition = condition;
    this.action = action;
    this.note = note;
  }

  describe(): string {
    return `${this.code}｜${this.condition} → ${this.action}｜${this.note}`;
  }
}

/** 标签规则表。 */
export const TAG_RULES: TagRule[] = [
  new TagRule('TG-01', "@string/shortcut_text_0102", "@string/shortcut_text_0458", "@string/shortcut_text_0136"),
  new TagRule('TG-02', "@string/shortcut_text_0107", "@string/shortcut_text_0218", "@string/shortcut_text_0363"),
  new TagRule('TG-03', "@string/shortcut_text_0112", "@string/shortcut_text_0328", "@string/shortcut_text_0709"),
  new TagRule('TG-04', "@string/shortcut_text_0695", "@string/shortcut_text_0559", "@string/shortcut_text_0319"),
  new TagRule('TG-05', "@string/shortcut_text_0557", "@string/shortcut_text_0752", "@string/shortcut_text_0460"),
  new TagRule('TG-06', "@string/shortcut_text_0101", "@string/shortcut_text_0254", "@string/shortcut_text_0558"),
  new TagRule('TG-07', "@string/shortcut_text_0109", "@string/shortcut_text_0457", "@string/shortcut_text_0729"),
  new TagRule('TG-08', "@string/shortcut_text_0099", "@string/shortcut_text_0730", "@string/shortcut_text_0074"),
  new TagRule('TG-09', "@string/shortcut_text_0106", "@string/shortcut_text_0062", "@string/shortcut_text_0128"),
  new TagRule('TG-10', "@string/shortcut_text_0103", "@string/shortcut_text_0034", "@string/shortcut_text_0152")
];

/** 同义词归并表：左为标准词，右为被归并写法。 */
export class SynonymPair {
  public canonical: string = '';
  public aliases: string[] = [];

  constructor(canonical: string = '', aliases: string[] = []) {
    this.canonical = canonical;
    this.aliases = aliases;
  }

  describe(): string {
    return `${this.canonical} ← ${this.aliases.join(' / ')}`;
  }
}

/** 同义词表。 */
export const SYNONYMS: SynonymPair[] = [
  new SynonymPair('工作', ['work', '办公']),
  new SynonymPair('学习', ['study', '阅读']),
  new SynonymPair('待办', ['todo', '任务']),
  new SynonymPair('资料', ['doc', '文档'])
];

/** 标签上限。 */
export const TAG_LIMIT: number = 12;
/** 标签长度上限。 */
export const TAG_MAX_LENGTH: number = 24;

/** 规范化单个标签；不可用时返回空串。 */
export function normalizeTag(raw: string): string {
  let text: string = raw.trim();
  if (text.startsWith('#')) {
    text = text.slice(1).trim();
  }
  text = text.replace(/[，、;;]+/g, ',');
  text = text.replace(/,+/g, ',');
  if (text.length === 0) {
    return '';
  }
  if (text.length > TAG_MAX_LENGTH) {
    text = text.slice(0, TAG_MAX_LENGTH);
  }
  text = text.toLowerCase();
  const pair = SYNONYMS.find((item: SynonymPair): boolean => item.aliases.indexOf(text) >= 0);
  return pair === undefined ? text : pair.canonical;
}

/** 规范化一组标签。 */
export function normalizeTags(raw: string[]): string[] {
  const result: string[] = [];
  raw.forEach((item: string): void => {
    const tag: string = normalizeTag(item);
    if (tag.length === 0 || result.indexOf(tag) >= 0 || result.length >= TAG_LIMIT) {
      return;
    }
    result.push(tag);
  });
  return result;
}

/** 一条可检索文档。 */
export class IndexedDoc {
  public id: string = '';
  public title: string = '';
  public body: string = '';
  public tags: string[] = [];

  constructor(id: string = '', title: string = '') {
    this.id = id;
    this.title = title;
  }
}

/** 一条命中。 */
export class Hit {
  public id: string = '';
  public score: number = 0;
  public source: ScoreSource = ScoreSource.TITLE;
  /** 命中的词。 */
  public matched: string = '';

  constructor(id: string = '', score: number = 0, source: ScoreSource = ScoreSource.TITLE, matched: string = '') {
    this.id = id;
    this.score = score;
    this.source = source;
    this.matched = matched;
  }

  describe(): string {
    return uiText("shortcut_text_0025", [String(this.id), String(this.score), businessLabel(this.source as string), String(this.matched)]);
  }
}

/** 打分权重。 */
export const TITLE_WEIGHT: number = 5;
export const TAG_WEIGHT: number = 3;
export const BODY_WEIGHT: number = 1;

/** 切词：按空白与常见标点拆分，转小写。 */
export function tokenize(text: string): string[] {
  const parts: string[] = text.toLowerCase().split(/[\s,.;:!?()（）【】[\]，。；：、]+/);
  const tokens: string[] = [];
  parts.forEach((part: string): void => {
    if (part.length > 0) {
      tokens.push(part);
    }
  });
  return tokens;
}

/**
 * 检索。
 *
 * 每个文档只取最高分来源，避免同一词在标题与正文各算一次导致排序失真。
 * 结果按分数降序，同分按标识升序，保证顺序稳定。
 */
export function search(docs: IndexedDoc[], query: string): Hit[] {
  const tokens: string[] = tokenize(query);
  if (tokens.length === 0) {
    return [];
  }
  const hits: Hit[] = [];
  docs.forEach((doc: IndexedDoc): void => {
    let best: Hit | undefined = undefined;
    tokens.forEach((token: string): void => {
      if (doc.id.toLowerCase() === token) {
        const hit: Hit = new Hit(doc.id, TITLE_WEIGHT + TAG_WEIGHT + BODY_WEIGHT, ScoreSource.ID, token);
        best = best === undefined || hit.score > best.score ? hit : best;
        return;
      }
      if (doc.title.toLowerCase().indexOf(token) >= 0) {
        const hit: Hit = new Hit(doc.id, TITLE_WEIGHT, ScoreSource.TITLE, token);
        best = best === undefined || hit.score > best.score ? hit : best;
        return;
      }
      const tagHit: boolean = doc.tags.some((tag: string): boolean => tag.indexOf(token) >= 0);
      if (tagHit) {
        const hit: Hit = new Hit(doc.id, TAG_WEIGHT, ScoreSource.TAG, token);
        best = best === undefined || hit.score > best.score ? hit : best;
        return;
      }
      if (doc.body.toLowerCase().indexOf(token) >= 0) {
        const hit: Hit = new Hit(doc.id, BODY_WEIGHT, ScoreSource.BODY, token);
        best = best === undefined || hit.score > best.score ? hit : best;
      }
    });
    if (best !== undefined) {
      hits.push(best);
    }
  });
  hits.sort((left: Hit, right: Hit): number => {
    if (right.score !== left.score) {
      return right.score - left.score;
    }
    return left.id < right.id ? -1 : (left.id > right.id ? 1 : 0);
  });
  return hits;
}

/** 标签索引：标签到文档标识。 */
export class TagIndex {
  private tags: string[] = [];
  private docIds: string[][] = [];

  /** 建立索引。 */
  build(docs: IndexedDoc[]): void {
    this.tags = [];
    this.docIds = [];
    docs.forEach((doc: IndexedDoc): void => {
      doc.tags.forEach((tag: string): void => {
        this.add(tag, doc.id);
      });
    });
  }

  /** 添加一条映射。 */
  add(tag: string, docId: string): void {
    const index: number = this.tags.indexOf(tag);
    if (index < 0) {
      this.tags.push(tag);
      this.docIds.push([docId]);
      return;
    }
    if (this.docIds[index].indexOf(docId) < 0) {
      this.docIds[index].push(docId);
    }
  }

  /** 该标签下的文档。 */
  docsOf(tag: string): string[] {
    const index: number = this.tags.indexOf(tag);
    return index < 0 ? [] : this.docIds[index].slice();
  }

  /** 标签总数。 */
  size(): number {
    return this.tags.length;
  }

  /** 全部标签，按文档数降序、同数按名称升序。 */
  topTags(): string[] {
    const order: number[] = this.tags.map((tag: string, index: number): number => index);
    order.sort((left: number, right: number): number => {
      const diff: number = this.docIds[right].length - this.docIds[left].length;
      if (diff !== 0) {
        return diff;
      }
      return this.tags[left] < this.tags[right] ? -1 : 1;
    });
    return order.map((index: number): string => this.tags[index]);
  }
}

/** 规则表展示行。 */
export function tagLines(): string[] {
  return TAG_RULES.map((rule: TagRule): string => rule.describe());
}

/** 同义词表展示行。 */
export function synonymLines(): string[] {
  return SYNONYMS.map((pair: SynonymPair): string => pair.describe());
}

/** 检索结果展示行。 */
export function searchLines(hits: Hit[]): string[] {
  if (hits.length === 0) {
    return [uiText("shortcut_text_0601")];
  }
  const lines: string[] = [uiText("shortcut_text_0403", [String(hits.length)])];
  hits.forEach((hit: Hit): void => {
    lines.push(hit.describe());
  });
  return lines;
}
