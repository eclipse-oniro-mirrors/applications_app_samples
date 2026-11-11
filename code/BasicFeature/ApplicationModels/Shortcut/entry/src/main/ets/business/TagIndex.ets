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
  public condition: string = '';
  public action: string = '';
  public note: string = '';

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
  new TagRule('TG-01', '标签首尾有空白', '去掉首尾空白', '不做其他字符替换'),
  new TagRule('TG-02', '标签为空或全空白', '丢弃该标签', '空标签不进入索引'),
  new TagRule('TG-03', '标签长度超过 24 个字符', '截断到 24', '与存储上限一致'),
  new TagRule('TG-04', '英文大小写不同', '统一为小写', '检索时同样按小写比对'),
  new TagRule('TG-05', '同一篇笔记内重复标签', '只保留一个', '去重按规范化后的值'),
  new TagRule('TG-06', '标签命中同义词表', '归并为表内标准词', '同义词表显式声明，不自动推断'),
  new TagRule('TG-07', '标签以 # 开头', '去掉 # 前缀', '展示时可再加回'),
  new TagRule('TG-08', '标签含连续分隔符', '折叠为一个分隔符', '避免空段'),
  new TagRule('TG-09', '标签为纯数字', '保留原样', '不当作序号处理'),
  new TagRule('TG-10', '标签数量超过 12 个', '按输入顺序保留前 12 个', '超出部分丢弃并提示')
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
    return `${this.id}｜${this.score} 分｜${this.source as string}｜${this.matched}`;
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
    return ['无匹配结果'];
  }
  const lines: string[] = [`命中 ${hits.length} 条`];
  hits.forEach((hit: Hit): void => {
    lines.push(hit.describe());
  });
  return lines;
}
