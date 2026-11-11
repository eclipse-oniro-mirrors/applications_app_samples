/**
 * 文本差异：为版本比较提供行级 diff 与摘要。
 *
 * 只做确定性的最长公共子序列比较，输入有上限，超限时退化为“整体替换”的明确结论，
 * 不静默截断后假装比较完整。
 */

/** 差异行类型。 */
export enum DiffKind {
  EQUAL = 'equal',
  ADDED = 'added',
  REMOVED = 'removed'
}

/** 一行差异。 */
export class DiffLine {
  public kind: DiffKind = DiffKind.EQUAL;
  public text: string = '';
  /** 在旧文本中的行号；新增行为 -1。 */
  public oldLine: number = -1;
  /** 在新文本中的行号；删除行为 -1。 */
  public newLine: number = -1;

  constructor(kind: DiffKind = DiffKind.EQUAL, text: string = '', oldLine: number = -1,
    newLine: number = -1) {
    this.kind = kind;
    this.text = text;
    this.oldLine = oldLine;
    this.newLine = newLine;
  }

  marker(): string {
    if (this.kind === DiffKind.ADDED) {
      return '+';
    }
    if (this.kind === DiffKind.REMOVED) {
      return '-';
    }
    return ' ';
  }

  textOf(): string {
    return `${this.marker()} ${this.text}`;
  }
}

/** 比较摘要。 */
export class DiffSummary {
  public added: number = 0;
  public removed: number = 0;
  public equal: number = 0;
  /** 输入超限时无法逐行比较。 */
  public truncated: boolean = false;
  /** 文本完全相同。 */
  public identical: boolean = false;

  changed(): boolean {
    return !this.identical && !this.truncated;
  }

  text(): string {
    if (this.truncated) {
      return '文本行数超过比较上限，已按整体替换处理';
    }
    if (this.identical) {
      return '内容完全相同';
    }
    return `新增 ${this.added} 行，删除 ${this.removed} 行，共 ${this.equal} 行未变`;
  }
}

/** 一次比较结果。 */
export class DiffResult {
  public lines: DiffLine[] = [];
  public summary: DiffSummary = new DiffSummary();

  /** 逐行文本，供页面直接渲染。 */
  textLines(limit: number = 200): string[] {
    if (this.lines.length === 0) {
      return ['没有可比较的内容'];
    }
    return this.lines.slice(0, limit).map((line: DiffLine): string => line.textOf());
  }

  /** 只保留变化的行，便于快速定位。 */
  changeLines(limit: number = 60): string[] {
    const changes: DiffLine[] = this.lines.filter((line: DiffLine): boolean =>
      line.kind !== DiffKind.EQUAL);
    if (changes.length === 0) {
      return [this.summary.text()];
    }
    return changes.slice(0, limit).map((line: DiffLine): string => line.textOf());
  }
}

const LINE_LIMIT: number = 400;
const CHAR_LIMIT: number = 20000;

function splitLines(text: string): string[] {
  if (text.length === 0) {
    return [];
  }
  return text.replace(/\r\n/g, '\n').replace(/\r/g, '\n').split('\n');
}

/** 行级比较：LCS 动态规划，行数超限时标记 truncated。 */
export function diffLines(oldText: string, newText: string): DiffResult {
  const result: DiffResult = new DiffResult();
  const summary: DiffSummary = new DiffSummary();
  result.summary = summary;
  if (oldText.length > CHAR_LIMIT || newText.length > CHAR_LIMIT) {
    summary.truncated = true;
    result.lines.push(new DiffLine(DiffKind.REMOVED, oldText.slice(0, 200), 1, -1));
    result.lines.push(new DiffLine(DiffKind.ADDED, newText.slice(0, 200), -1, 1));
    return result;
  }
  if (oldText === newText) {
    summary.identical = true;
    splitLines(newText).forEach((line: string, index: number): void => {
      result.lines.push(new DiffLine(DiffKind.EQUAL, line, index + 1, index + 1));
    });
    summary.equal = result.lines.length;
    return result;
  }
  const before: string[] = splitLines(oldText);
  const after: string[] = splitLines(newText);
  if (before.length > LINE_LIMIT || after.length > LINE_LIMIT) {
    summary.truncated = true;
    result.lines.push(new DiffLine(DiffKind.REMOVED, `旧文本 ${before.length} 行`, 1, -1));
    result.lines.push(new DiffLine(DiffKind.ADDED, `新文本 ${after.length} 行`, -1, 1));
    return result;
  }
  // lcs[i][j] 表示 before[i..] 与 after[j..] 的最长公共子序列长度。
  const rows: number = before.length + 1;
  const columns: number = after.length + 1;
  const lcs: number[][] = [];
  for (let i: number = 0; i < rows; i++) {
    const row: number[] = [];
    for (let j: number = 0; j < columns; j++) {
      row.push(0);
    }
    lcs.push(row);
  }
  for (let i: number = before.length - 1; i >= 0; i--) {
    for (let j: number = after.length - 1; j >= 0; j--) {
      lcs[i][j] = before[i] === after[j] ? lcs[i + 1][j + 1] + 1 : Math.max(lcs[i + 1][j], lcs[i][j + 1]);
    }
  }
  let i: number = 0;
  let j: number = 0;
  while (i < before.length && j < after.length) {
    if (before[i] === after[j]) {
      result.lines.push(new DiffLine(DiffKind.EQUAL, before[i], i + 1, j + 1));
      summary.equal += 1;
      i += 1;
      j += 1;
    } else if (lcs[i + 1][j] >= lcs[i][j + 1]) {
      result.lines.push(new DiffLine(DiffKind.REMOVED, before[i], i + 1, -1));
      summary.removed += 1;
      i += 1;
    } else {
      result.lines.push(new DiffLine(DiffKind.ADDED, after[j], -1, j + 1));
      summary.added += 1;
      j += 1;
    }
  }
  while (i < before.length) {
    result.lines.push(new DiffLine(DiffKind.REMOVED, before[i], i + 1, -1));
    summary.removed += 1;
    i += 1;
  }
  while (j < after.length) {
    result.lines.push(new DiffLine(DiffKind.ADDED, after[j], -1, j + 1));
    summary.added += 1;
    j += 1;
  }
  return result;
}

/** 两侧并排行的展示模型：删除与新增尽量配对，便于阅读。 */
export class SideBySideLine {
  public left: string = '';
  public right: string = '';
  public leftKind: DiffKind = DiffKind.EQUAL;
  public rightKind: DiffKind = DiffKind.EQUAL;

  text(): string {
    const leftText: string = this.left.length === 0 ? ' ' : this.left;
    const rightText: string = this.right.length === 0 ? ' ' : this.right;
    return `${leftText}  →  ${rightText}`;
  }
}

/** 把逐行差异整理成并排结构。 */
export function sideBySide(result: DiffResult): SideBySideLine[] {
  const rows: SideBySideLine[] = [];
  let pendingRemoved: DiffLine[] = [];
  let pendingAdded: DiffLine[] = [];
  const flush = (): void => {
    const count: number = Math.max(pendingRemoved.length, pendingAdded.length);
    for (let index: number = 0; index < count; index++) {
      const row: SideBySideLine = new SideBySideLine();
      if (index < pendingRemoved.length) {
        row.left = pendingRemoved[index].text;
        row.leftKind = DiffKind.REMOVED;
      }
      if (index < pendingAdded.length) {
        row.right = pendingAdded[index].text;
        row.rightKind = DiffKind.ADDED;
      }
      rows.push(row);
    }
    pendingRemoved = [];
    pendingAdded = [];
  };
  result.lines.forEach((line: DiffLine): void => {
    if (line.kind === DiffKind.REMOVED) {
      pendingRemoved.push(line);
    } else if (line.kind === DiffKind.ADDED) {
      pendingAdded.push(line);
    } else {
      flush();
      const row: SideBySideLine = new SideBySideLine();
      row.left = line.text;
      row.right = line.text;
      rows.push(row);
    }
  });
  flush();
  return rows;
}

/** 字符级差异：用于短标题，超过上限直接判为不同。 */
export function diffCharacters(oldText: string, newText: string): string[] {
  if (oldText === newText) {
    return ['完全相同'];
  }
  if (oldText.length > 200 || newText.length > 200) {
    return ['文本过长，已按不同处理'];
  }
  const result: string[] = [];
  const limit: number = Math.min(oldText.length, newText.length);
  let prefix: number = 0;
  while (prefix < limit && oldText.charAt(prefix) === newText.charAt(prefix)) {
    prefix += 1;
  }
  let suffix: number = 0;
  while (suffix < limit - prefix &&
    oldText.charAt(oldText.length - 1 - suffix) === newText.charAt(newText.length - 1 - suffix)) {
    suffix += 1;
  }
  const oldMiddle: string = oldText.slice(prefix, oldText.length - suffix);
  const newMiddle: string = newText.slice(prefix, newText.length - suffix);
  if (prefix > 0) {
    result.push(`相同前缀：${oldText.slice(0, prefix)}`);
  }
  if (oldMiddle.length > 0) {
    result.push(`删除：${oldMiddle}`);
  }
  if (newMiddle.length > 0) {
    result.push(`新增：${newMiddle}`);
  }
  if (suffix > 0) {
    result.push(`相同后缀：${oldText.slice(oldText.length - suffix)}`);
  }
  return result;
}

/** 摘要行：供版本列表直接展示每条的改动量。 */
export function diffBadge(summary: DiffSummary): string {
  if (summary.identical) {
    return '无改动';
  }
  if (summary.truncated) {
    return '超限，未逐行比较';
  }
  return `+${summary.added} / -${summary.removed}`;
}
