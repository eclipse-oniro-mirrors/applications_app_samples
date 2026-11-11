/**
 * 可组合的筛选链。
 *
 * 待办、收藏、便签三个列表的筛选项高度相似，但此前各写一套条件判断，容易出现
 * "待办能按标签筛、收藏不能"这类差异。这里把筛选项抽象成节点，链由节点组成，
 * 预设链声明在表里，页面只渲染预设名与结果，条件语义只有一份实现。
 */

/** 可筛选字段。 */
export enum FilterField {
  TITLE = 'title',
  STATE = 'state',
  TAG = 'tag',
  UPDATED = 'updatedAt',
  GROUP = 'group',
  PINNED = 'pinned'
}

/** 运算符。 */
export enum FilterOperator {
  CONTAINS = 'contains',
  EQUALS = 'equals',
  NOT_EQUALS = 'notEquals',
  HAS_TAG = 'hasTag',
  NOT_HAS_TAG = 'notHasTag',
  GREATER = 'greater',
  LESS = 'less',
  IS_TRUE = 'isTrue',
  IS_FALSE = 'isFalse'
}

/** 运算符标签。 */
export function operatorLabel(operator: FilterOperator): string {
  switch (operator) {
    case FilterOperator.CONTAINS:
      return '包含';
    case FilterOperator.EQUALS:
      return '等于';
    case FilterOperator.NOT_EQUALS:
      return '不等于';
    case FilterOperator.HAS_TAG:
      return '含标签';
    case FilterOperator.NOT_HAS_TAG:
      return '不含标签';
    case FilterOperator.GREATER:
      return '大于';
    case FilterOperator.LESS:
      return '小于';
    case FilterOperator.IS_TRUE:
      return '为真';
    default:
      return '为假';
  }
}

/** 字段标签。 */
export function fieldLabel(field: FilterField): string {
  switch (field) {
    case FilterField.TITLE:
      return '标题';
    case FilterField.STATE:
      return '状态';
    case FilterField.TAG:
      return '标签';
    case FilterField.UPDATED:
      return '更新时间';
    case FilterField.GROUP:
      return '分组';
    default:
      return '置顶';
  }
}

/** 一条筛选节点。 */
export class FilterNode {
  public nodeId: string = '';
  public field: FilterField = FilterField.TITLE;
  public operator: FilterOperator = FilterOperator.CONTAINS;
  /** 文本取值。 */
  public value: string = '';
  /** 数值取值；用于时间比较。 */
  public numeric: number = 0;
  /** 是否取反整条节点。 */
  public negate: boolean = false;

  constructor(nodeId: string = '', field: FilterField = FilterField.TITLE,
    operator: FilterOperator = FilterOperator.CONTAINS, value: string = '',
    numeric: number = 0, negate: boolean = false) {
    this.nodeId = nodeId;
    this.field = field;
    this.operator = operator;
    this.value = value;
    this.numeric = numeric;
    this.negate = negate;
  }

  /** 节点指纹，用于合并去重。 */
  signature(): string {
    return `${this.field as string}:${this.operator as string}:${this.value}:` +
      `${this.numeric}:${this.negate ? 1 : 0}`;
  }

  text(): string {
    const base: string = `${fieldLabel(this.field)}${operatorLabel(this.operator)}` +
      `${this.value.length > 0 ? this.value : this.numeric.toString()}`;
    return this.negate ? `非（${base}）` : base;
  }
}

/** 筛选对象。 */
export class FilterTarget {
  public id: string = '';
  public title: string = '';
  public state: string = '';
  public tags: string[] = [];
  public updatedAt: number = 0;
  public group: string = '';
  public pinned: boolean = false;

  constructor(id: string = '', title: string = '', state: string = '') {
    this.id = id;
    this.title = title;
    this.state = state;
  }

  /** 是否带有某个标签。 */
  hasTag(tag: string): boolean {
    return this.tags.indexOf(tag) >= 0;
  }

  text(): string {
    return `${this.title}｜${this.state}｜${this.group}｜${this.pinned ? '置顶' : '普通'}`;
  }
}

/** 单节点匹配。 */
export function matchNode(target: FilterTarget, node: FilterNode): boolean {
  let result: boolean = false;
  switch (node.operator) {
    case FilterOperator.CONTAINS:
      result = target.title.toLowerCase().indexOf(node.value.toLowerCase()) >= 0;
      break;
    case FilterOperator.EQUALS:
      result = target.state === node.value || target.group === node.value;
      break;
    case FilterOperator.NOT_EQUALS:
      result = target.state !== node.value;
      break;
    case FilterOperator.HAS_TAG:
      result = target.hasTag(node.value);
      break;
    case FilterOperator.NOT_HAS_TAG:
      result = !target.hasTag(node.value);
      break;
    case FilterOperator.GREATER:
      result = target.updatedAt > node.numeric;
      break;
    case FilterOperator.LESS:
      result = target.updatedAt < node.numeric;
      break;
    case FilterOperator.IS_TRUE:
      result = target.pinned;
      break;
    case FilterOperator.IS_FALSE:
      result = !target.pinned;
      break;
    default:
      result = false;
      break;
  }
  if (node.field === FilterField.PINNED &&
    node.operator !== FilterOperator.IS_TRUE && node.operator !== FilterOperator.IS_FALSE) {
    result = target.pinned === (node.value === 'true');
  }
  return node.negate ? !result : result;
}

/** 一条筛选链。 */
export class FilterChain {
  public chainId: string = '';
  public name: string = '';
  public nodes: FilterNode[] = [];

  constructor(chainId: string = '', name: string = '', nodes: FilterNode[] = []) {
    this.chainId = chainId;
    this.name = name;
    this.nodes = nodes;
  }

  /** 节点数。 */
  size(): number {
    return this.nodes.length;
  }

  /** 是否为空链（全部通过）。 */
  empty(): boolean {
    return this.nodes.length === 0;
  }

  /** 追加节点，返回自身便于串联。 */
  push(node: FilterNode): FilterChain {
    this.nodes.push(node);
    return this;
  }

  /** 说明文本。 */
  text(): string {
    if (this.empty()) {
      return `${this.name}：全部`;
    }
    return `${this.name}：${this.nodes.map((node: FilterNode): string => node.text()).join(' 且 ')}`;
  }
}

/** 链是否通过。空链恒通过。 */
export function evaluateChain(chain: FilterChain, target: FilterTarget): boolean {
  for (const node of chain.nodes) {
    if (!matchNode(target, node)) {
      return false;
    }
  }
  return true;
}

/** 应用链。 */
export function applyChain(targets: FilterTarget[], chain: FilterChain): FilterTarget[] {
  return targets.filter((target: FilterTarget): boolean => evaluateChain(chain, target));
}

/** 构造节点。 */
function node(nodeId: string, field: FilterField, operator: FilterOperator, value: string,
  numeric: number = 0, negate: boolean = false): FilterNode {
  return new FilterNode(nodeId, field, operator, value, numeric, negate);
}

/** 预设链。 */
export const PRESET_CHAINS: FilterChain[] = [
  new FilterChain('FC-01', '全部', []),
  new FilterChain('FC-02', '待处理', [node('n1', FilterField.STATE, FilterOperator.EQUALS, 'open')]),
  new FilterChain('FC-03', '进行中', [node('n1', FilterField.STATE, FilterOperator.EQUALS, 'doing')]),
  new FilterChain('FC-04', '已完成', [node('n1', FilterField.STATE, FilterOperator.EQUALS, 'done')]),
  new FilterChain('FC-05', '已置顶', [node('n1', FilterField.PINNED, FilterOperator.IS_TRUE, '')]),
  new FilterChain('FC-06', '未置顶', [node('n1', FilterField.PINNED, FilterOperator.IS_FALSE, '')]),
  new FilterChain('FC-07', '含便签标签',
    [node('n1', FilterField.TAG, FilterOperator.HAS_TAG, '便签')]),
  new FilterChain('FC-08', '不含收藏标签',
    [node('n1', FilterField.TAG, FilterOperator.NOT_HAS_TAG, '收藏')]),
  new FilterChain('FC-09', '标题含"整理"',
    [node('n1', FilterField.TITLE, FilterOperator.CONTAINS, '整理')]),
  new FilterChain('FC-10', '最近一天更新',
    [node('n1', FilterField.UPDATED, FilterOperator.GREATER, '', 86400000)]),
  new FilterChain('FC-11', '超过七天未更新',
    [node('n1', FilterField.UPDATED, FilterOperator.LESS, '', 7 * 86400000)]),
  new FilterChain('FC-12', '待处理且已置顶', [
    node('n1', FilterField.STATE, FilterOperator.EQUALS, 'open'),
    node('n2', FilterField.PINNED, FilterOperator.IS_TRUE, '')
  ]),
  new FilterChain('FC-13', '含便签标签且未完成', [
    node('n1', FilterField.TAG, FilterOperator.HAS_TAG, '便签'),
    node('n2', FilterField.STATE, FilterOperator.NOT_EQUALS, 'done')
  ]),
  new FilterChain('FC-14', '标题不含测试且未置顶', [
    node('n1', FilterField.TITLE, FilterOperator.CONTAINS, '测试', 0, true),
    node('n2', FilterField.PINNED, FilterOperator.IS_FALSE, '')
  ]),
  new FilterChain('FC-15', '分组为工作中', [
    node('n1', FilterField.GROUP, FilterOperator.EQUALS, '工作中')
  ])
];

/** 链编号列表。 */
export function chainIds(): string[] {
  return PRESET_CHAINS.map((chain: FilterChain): string => chain.chainId);
}

/** 按编号取链。 */
export function chainOf(chainId: string): FilterChain | undefined {
  return PRESET_CHAINS.find((chain: FilterChain): boolean => chain.chainId === chainId);
}

/** 按名字取链；找不到返回空链。 */
export function chainByName(name: string): FilterChain {
  const hit: FilterChain | undefined =
    PRESET_CHAINS.find((chain: FilterChain): boolean => chain.name === name);
  return hit === undefined ? new FilterChain('FC-01', '全部', []) : hit;
}

/** 链名列表，页面直接渲染标签。 */
export function chainNames(): string[] {
  return PRESET_CHAINS.map((chain: FilterChain): string => chain.name);
}

/** 合并两条链，按节点指纹去重，保持左侧在前。 */
export function mergeChains(left: FilterChain, right: FilterChain): FilterChain {
  const merged: FilterChain = new FilterChain(`${left.chainId}+${right.chainId}`,
    `${left.name} + ${right.name}`, left.nodes.slice());
  const signatures: string[] = left.nodes.map((item: FilterNode): string => item.signature());
  right.nodes.forEach((item: FilterNode): void => {
    if (signatures.indexOf(item.signature()) < 0) {
      signatures.push(item.signature());
      merged.nodes.push(item);
    }
  });
  return merged;
}

/** 取反一条链：只反转最后一个节点，便于"排除某项"。 */
export function negateLast(chain: FilterChain): FilterChain {
  const copy: FilterChain = new FilterChain(`${chain.chainId}-not`, `${chain.name}（排除）`,
    chain.nodes.map((item: FilterNode): FilterNode =>
      new FilterNode(item.nodeId, item.field, item.operator, item.value, item.numeric,
        item.negate)));
  if (copy.nodes.length > 0) {
    const last: FilterNode = copy.nodes[copy.nodes.length - 1];
    copy.nodes[copy.nodes.length - 1] =
      new FilterNode(last.nodeId, last.field, last.operator, last.value, last.numeric, !last.negate);
  }
  return copy;
}

/** 各链的命中数量，按预设顺序。 */
export function chainCounts(targets: FilterTarget[]): number[] {
  return PRESET_CHAINS.map((chain: FilterChain): number => applyChain(targets, chain).length);
}

/** 链自检。 */
export class ChainAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '筛选链自洽' : this.findings.join('；');
  }
}

/** 校验链：编号唯一、节点编号在同链内唯一、取值与运算符匹配。 */
export function auditChains(): ChainAudit {
  const audit: ChainAudit = new ChainAudit();
  const seen: string[] = [];
  PRESET_CHAINS.forEach((chain: FilterChain, index: number): void => {
    if (seen.indexOf(chain.chainId) >= 0) {
      audit.findings.push(`链编号重复：${chain.chainId}`);
    }
    seen.push(chain.chainId);
    const expected: string = `FC-${(index + 1).toString().padStart(2, '0')}`;
    if (chain.chainId !== expected) {
      audit.findings.push(`链编号不连续：期望 ${expected}，实际 ${chain.chainId}`);
    }
    if (chain.name.length === 0) {
      audit.findings.push(`链缺少名称：${chain.chainId}`);
    }
    const nodeIds: string[] = [];
    chain.nodes.forEach((item: FilterNode): void => {
      if (nodeIds.indexOf(item.nodeId) >= 0) {
        audit.findings.push(`节点编号重复：${chain.chainId}.${item.nodeId}`);
      }
      nodeIds.push(item.nodeId);
      const textOperator: boolean = item.operator === FilterOperator.CONTAINS ||
        item.operator === FilterOperator.EQUALS || item.operator === FilterOperator.NOT_EQUALS ||
        item.operator === FilterOperator.HAS_TAG || item.operator === FilterOperator.NOT_HAS_TAG;
      if (textOperator && item.value.length === 0) {
        audit.findings.push(`文本运算符缺少取值：${chain.chainId}.${item.nodeId}`);
      }
      const numberOperator: boolean = item.operator === FilterOperator.GREATER ||
        item.operator === FilterOperator.LESS;
      if (numberOperator && item.numeric <= 0) {
        audit.findings.push(`数值运算符缺少阈值：${chain.chainId}.${item.nodeId}`);
      }
    });
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 链摘要行。 */
export function chainLines(): string[] {
  return PRESET_CHAINS.map((chain: FilterChain): string => chain.text());
}

/** 字段与运算符的可用组合，供页面渲染筛选面板。 */
export function operatorOptions(field: FilterField): FilterOperator[] {
  switch (field) {
    case FilterField.TITLE:
      return [FilterOperator.CONTAINS, FilterOperator.EQUALS];
    case FilterField.STATE:
      return [FilterOperator.EQUALS, FilterOperator.NOT_EQUALS];
    case FilterField.TAG:
      return [FilterOperator.HAS_TAG, FilterOperator.NOT_HAS_TAG];
    case FilterField.UPDATED:
      return [FilterOperator.GREATER, FilterOperator.LESS];
    case FilterField.GROUP:
      return [FilterOperator.EQUALS];
    default:
      return [FilterOperator.IS_TRUE, FilterOperator.IS_FALSE];
  }
}
