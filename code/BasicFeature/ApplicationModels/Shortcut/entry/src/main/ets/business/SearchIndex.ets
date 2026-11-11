/**
 * 本地检索：分词、打分、摘要与高亮。
 *
 * 数据量不大，不需要倒排索引；把"怎么切词、怎么算分、摘要取哪一段"写清楚，
 * 结果就可以被逐项核对。打分规则用常量表固定，避免调参时到处改魔法数字。
 */

/** 检索文档。 */
export class SearchDoc {
  public id: string = '';
  public title: string = '';
  public body: string = '';
  public tags: string[] = [];
  public updatedAt: number = 0;

  constructor(id: string = '', title: string = '', body: string = '') {
    this.id = id;
    this.title = title;
    this.body = body;
  }

  text(): string {
    return `${this.title}｜${this.tags.join('/')}｜${this.body.length} 字`;
  }
}

/** 命中权重。 */
export const TITLE_WEIGHT: number = 5;
export const TAG_WEIGHT: number = 3;
export const BODY_WEIGHT: number = 1;
/** 最近更新的加成上限。 */
export const RECENCY_BONUS: number = 4;
/** 摘要长度。 */
export const SNIPPET_WIDTH: number = 48;

/** 是否为拉丁字母或数字。 */
function isLatin(code: number): boolean {
  return (code >= 48 && code <= 57) || (code >= 97 && code <= 122);
}

/** 是否为中日韩字符。 */
function isCjk(code: number): boolean {
  return code >= 0x4e00 && code <= 0x9fff;
}

/**
 * 切词。
 *
 * 拉丁词按空白与标点切开；中日韩没有空格，逐字切开，配合"命中任意一字的
 * 数量"作为打分依据，避免引入词典依赖。
 */
export function tokenize(text: string): string[] {
  const lowered: string = text.toLowerCase();
  const tokens: string[] = [];
  let buffer: string = '';
  for (let index = 0; index < lowered.length; index++) {
    const code: number = lowered.charCodeAt(index);
    if (isLatin(code)) {
      buffer += lowered.charAt(index);
      continue;
    }
    if (buffer.length > 0) {
      tokens.push(buffer);
      buffer = '';
    }
    if (isCjk(code)) {
      tokens.push(lowered.charAt(index));
    }
  }
  if (buffer.length > 0) {
    tokens.push(buffer);
  }
  return tokens;
}

/** 去重后的词表。 */
export function uniqueTokens(text: string): string[] {
  const tokens: string[] = [];
  tokenize(text).forEach((token: string): void => {
    if (tokens.indexOf(token) < 0) {
      tokens.push(token);
    }
  });
  return tokens;
}

/** 统计词在文本中出现的次数。 */
export function countOccurrences(text: string, token: string): number {
  if (token.length === 0) {
    return 0;
  }
  const lowered: string = text.toLowerCase();
  let count: number = 0;
  let cursor: number = lowered.indexOf(token);
  while (cursor >= 0) {
    count++;
    cursor = lowered.indexOf(token, cursor + token.length);
  }
  return count;
}

/** 单文档打分。 */
export function scoreDoc(doc: SearchDoc, tokens: string[], now: number): number {
  if (tokens.length === 0) {
    return 0;
  }
  let score: number = 0;
  tokens.forEach((token: string): void => {
    score += countOccurrences(doc.title, token) * TITLE_WEIGHT;
    score += countOccurrences(doc.body, token) * BODY_WEIGHT;
    doc.tags.forEach((tag: string): void => {
      score += countOccurrences(tag, token) * TAG_WEIGHT;
    });
  });
  if (score === 0) {
    return 0;
  }
  if (doc.updatedAt > 0 && now > 0) {
    const ageDays: number = Math.floor(Math.max(0, now - doc.updatedAt) / 86400000);
    if (ageDays <= 1) {
      score += RECENCY_BONUS;
    } else if (ageDays <= 7) {
      score += 2;
    }
  }
  return score;
}

/** 取摘要：以第一个命中词为中心，左右各取一半。 */
export function snippetOf(body: string, tokens: string[], width: number = SNIPPET_WIDTH): string {
  const flat: string = body.replace(/\s+/g, ' ').trim();
  if (flat.length === 0) {
    return '';
  }
  const limit: number = Math.max(8, width);
  let anchor: number = -1;
  const lowered: string = flat.toLowerCase();
  tokens.forEach((token: string): void => {
    if (anchor >= 0 || token.length === 0) {
      return;
    }
    const found: number = lowered.indexOf(token);
    if (found >= 0 && (anchor < 0 || found < anchor)) {
      anchor = found;
    }
  });
  if (anchor < 0) {
    return flat.length <= limit ? flat : `${flat.slice(0, limit)}…`;
  }
  const half: number = Math.floor(limit / 2);
  const start: number = Math.max(0, anchor - half);
  const end: number = Math.min(flat.length, start + limit);
  const prefix: string = start > 0 ? '…' : '';
  const suffix: string = end < flat.length ? '…' : '';
  return `${prefix}${flat.slice(start, end)}${suffix}`;
}

/** 命中文档。 */
export class SearchHit {
  public id: string = '';
  public title: string = '';
  public score: number = 0;
  public snippet: string = '';

  constructor(id: string = '', title: string = '', score: number = 0, snippet: string = '') {
    this.id = id;
    this.title = title;
    this.score = score;
    this.snippet = snippet;
  }

  text(): string {
    return `${this.title}（${this.score}）｜${this.snippet}`;
  }
}

/** 检索。分数为 0 的文档不返回。 */
export function search(docs: SearchDoc[], query: string, now: number, limit: number = 20): SearchHit[] {
  const tokens: string[] = uniqueTokens(query);
  if (tokens.length === 0) {
    return [];
  }
  const hits: SearchHit[] = [];
  docs.forEach((doc: SearchDoc): void => {
    const score: number = scoreDoc(doc, tokens, now);
    if (score <= 0) {
      return;
    }
    hits.push(new SearchHit(doc.id, doc.title, score, snippetOf(doc.body, tokens)));
  });
  hits.sort((left: SearchHit, right: SearchHit): number => {
    if (right.score !== left.score) {
      return right.score - left.score;
    }
    return left.id < right.id ? -1 : (left.id > right.id ? 1 : 0);
  });
  if (limit > 0 && hits.length > limit) {
    return hits.slice(0, limit);
  }
  return hits;
}

/** 高亮：把命中词包成方括号，便于纯文本展示。 */
export function highlight(text: string, tokens: string[]): string {
  if (tokens.length === 0 || text.length === 0) {
    return text;
  }
  let result: string = text;
  const present: string[] = tokens.filter((token: string): boolean => token.length > 0);
  present.forEach((token: string): void => {
    const pattern: string = token;
    let cursor: number = result.toLowerCase().indexOf(pattern);
    while (cursor >= 0) {
      const before: string = result.slice(0, cursor);
      const matched: string = result.slice(cursor, cursor + pattern.length);
      const after: string = result.slice(cursor + pattern.length);
      result = `${before}[${matched}]${after}`;
      cursor = result.toLowerCase().indexOf(pattern, cursor + pattern.length + 2);
    }
  });
  return result;
}

/** 词表去重后的展示文本。 */
export function tokenSummary(query: string): string {
  const tokens: string[] = uniqueTokens(query);
  if (tokens.length === 0) {
    return '没有可检索的词';
  }
  return `${tokens.length} 个词：${tokens.join(' ')}`;
}

/** 检索自检：空文档、重复 id、超长标题。 */
export class SearchAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '检索数据自洽' : this.findings.join('；');
  }
}

/** 校验文档集合。 */
export function auditDocs(docs: SearchDoc[]): SearchAudit {
  const audit: SearchAudit = new SearchAudit();
  const seen: string[] = [];
  docs.forEach((doc: SearchDoc): void => {
    if (doc.id.length === 0) {
      audit.findings.push('存在空 id 文档');
    }
    if (seen.indexOf(doc.id) >= 0) {
      audit.findings.push(`文档 id 重复：${doc.id}`);
    }
    seen.push(doc.id);
    if (doc.title.length === 0) {
      audit.findings.push(`缺少标题：${doc.id}`);
    }
    if (doc.title.length > 64) {
      audit.findings.push(`标题过长：${doc.id}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 示例查询词，页面占位提示用。 */
export const SAMPLE_QUERIES: string[] = ['便签', 'todo', '收藏', '今天', 'note'];
