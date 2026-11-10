/**
 * 多文档接续工作区。
 *
 * 接续示例原来只有一个文本示例，接续内容天然是"唯一的一份"。真实业务里同时存在
 * 多个可接续对象：一篇笔记、一张半填的表单、一段阅读进度。它们共用同一套接续通道，
 * 但状态必须彼此隔离——把表单的字段灌进笔记，或把阅读进度写成笔记正文，
 * 都是用户无法接受的数据事故。
 *
 * 这里把"哪些对象可以同时存在""切换时哪些状态必须保留""归档后能否恢复"
 * 写成一张规则表，工作区只做增删切换，隔离校验单独可测。
 */

/** 可接续对象的类别。 */
export enum DocKind {
  NOTE = '笔记',
  FORM = '表单',
  READING = '阅读进度'
}

/** 一个可接续槽位。 */
export class DocumentSlot {
  /** 槽位标识，来自业务侧的文档标识。 */
  id: string = '';
  kind: DocKind = DocKind.NOTE;
  /** 展示用标题。 */
  title: string = '';
  /** 修订号，单调递增；接续时必须匹配。 */
  revision: number = 0;
  /** 产生该槽位的应用标识。 */
  ownerApp: string = '';
  /** 最近更新时间。 */
  updatedAt: number = 0;
  /** 是否已归档。 */
  archived: boolean = false;

  constructor(id: string = '', kind: DocKind = DocKind.NOTE, title: string = '') {
    this.id = id;
    this.kind = kind;
    this.title = title;
  }

  /** 是否可用于接续：有标识、有标题、未归档。 */
  usable(): boolean {
    return this.id.length > 0 && this.title.length > 0 && !this.archived;
  }

  /** 供页面一行展示。 */
  describe(): string {
    const state: string = this.archived ? '已归档' : '进行中';
    return `${this.title}（${this.kind as string}）｜修订 ${this.revision}｜${state}`;
  }
}

/** 一条隔离规则。 */
export class DocRule {
  code: string = '';
  /** 规则约束的对象类别。 */
  kind: DocKind = DocKind.NOTE;
  /** 切换离开时是否必须保留未提交内容。 */
  keepDraft: boolean = true;
  /** 是否允许同时存在多份同类对象。 */
  allowMultiple: boolean = true;
  /** 归档后是否可恢复。 */
  restorable: boolean = true;
  note: string = '';

  constructor(code: string = '', kind: DocKind = DocKind.NOTE, keepDraft: boolean = true,
    allowMultiple: boolean = true, restorable: boolean = true, note: string = '') {
    this.code = code;
    this.kind = kind;
    this.keepDraft = keepDraft;
    this.allowMultiple = allowMultiple;
    this.restorable = restorable;
    this.note = note;
  }

  describe(): string {
    return `${this.code} ${this.kind as string}｜${this.keepDraft ? '保留草稿' : '不保留'}｜${this.allowMultiple ? '允许多份' : '仅一份'}｜${this.restorable ? '可恢复' : '不可恢复'}`;
  }
}

/**
 * 隔离规则表。
 *
 * 表单是最严格的一类：半填字段一旦丢失，用户要重新填一遍，
 * 所以离开必须保留草稿，且同类对象允许多份（不同表单实例互不干扰）。
 * 阅读进度允许覆盖，因为它本来就只表达"读到哪了"。
 */
export const DOC_RULES: DocRule[] = [
  new DocRule('DC-01', DocKind.NOTE, true, true, true, '笔记切换保留未保存正文'),
  new DocRule('DC-02', DocKind.NOTE, true, true, true, '笔记归档后可从归档区恢复'),
  new DocRule('DC-03', DocKind.NOTE, true, true, false, '正文超过上限的笔记只读，不接受接续写入'),
  new DocRule('DC-04', DocKind.NOTE, false, true, true, '已保存且无改动的笔记不占草稿槽'),
  new DocRule('DC-05', DocKind.FORM, true, true, true, '表单离开必须保留半填字段'),
  new DocRule('DC-06', DocKind.FORM, true, true, false, '已确认提交的表单不再接受编辑'),
  new DocRule('DC-07', DocKind.FORM, true, true, true, '表单归档为只读快照，仍可查看'),
  new DocRule('DC-08', DocKind.FORM, true, false, false, '同一表单实例只允许一个活动槽位，避免重复提交'),
  new DocRule('DC-09', DocKind.READING, false, true, true, '阅读进度允许被新进度覆盖'),
  new DocRule('DC-10', DocKind.READING, false, true, true, '阅读进度不产生草稿，不占用半填额度'),
  new DocRule('DC-11', DocKind.READING, false, true, false, '已读完的对象不再记录进度'),
  new DocRule('DC-12', DocKind.NOTE, true, true, true, '不同来源应用的槽位互不覆盖，按 ownerApp 隔离')
];

function ruleOf(kind: DocKind): DocRule | undefined {
  return DOC_RULES.find((rule: DocRule): boolean => rule.kind === kind);
}

/** 工作区校验结果。 */
export class WorkspaceAudit {
  findings: string[] = [];
  /** 打开中的槽位数。 */
  active: number = 0;
  /** 归档槽位数。 */
  public archived: number = 0;

  ok(): boolean {
    return this.findings.length === 0;
  }

  summary(): string {
    if (!this.ok()) {
      return `工作区有 ${this.findings.length} 处问题`;
    }
    return `工作区正常：${this.active} 个进行中，${this.archived} 个已归档`;
  }
}

/**
 * 多文档工作区。
 *
 * 只管理槽位集合与当前选中项，不做任何落盘：落盘由调用方负责，
 * 这样同一份逻辑既能跑在页面里，也能在主机上直接用例验证。
 */
export class DocumentWorkspace {
  private slots: DocumentSlot[] = [];
  private activeId: string = '';

  /** 依据规则表判断该类对象能否再打开一份。存在“仅一份”规则时按条数限制。 */
  canOpen(kind: DocKind): boolean {
    const limited: boolean = DOC_RULES.some((rule: DocRule): boolean =>
      rule.kind === kind && !rule.allowMultiple);
    if (limited) {
      return this.slots.filter((slot: DocumentSlot): boolean =>
        slot.kind === kind && !slot.archived).length === 0;
    }
    return DOC_RULES.some((rule: DocRule): boolean => rule.kind === kind);
  }

  /** 打开一个槽位；同 id 已存在时更新标题与修订号。 */
  open(slot: DocumentSlot): boolean {
    if (slot.id.length === 0) {
      return false;
    }
    const existing = this.slots.find((item: DocumentSlot): boolean => item.id === slot.id);
    if (existing !== undefined) {
      existing.title = slot.title;
      existing.revision = slot.revision;
      existing.updatedAt = slot.updatedAt;
      existing.archived = false;
      this.activeId = slot.id;
      return true;
    }
    if (!this.canOpen(slot.kind)) {
      return false;
    }
    this.slots.push(slot);
    this.activeId = slot.id;
    return true;
  }

  /** 切换到指定槽位；不存在或已归档时返回 false。 */
  switchTo(id: string): boolean {
    const found = this.slots.find((slot: DocumentSlot): boolean => slot.id === id && !slot.archived);
    if (found === undefined) {
      return false;
    }
    this.activeId = id;
    return true;
  }

  /** 归档当前槽位；成功后选中项清空。 */
  archive(id: string): boolean {
    const found = this.slots.find((slot: DocumentSlot): boolean => slot.id === id);
    if (found === undefined || found.archived) {
      return false;
    }
    found.archived = true;
    if (this.activeId === id) {
      this.activeId = '';
    }
    return true;
  }

  /** 从归档恢复；该类不可恢复时返回 false。 */
  restore(id: string): boolean {
    const found = this.slots.find((slot: DocumentSlot): boolean => slot.id === id);
    if (found === undefined || !found.archived) {
      return false;
    }
    const rule = ruleOf(found.kind);
    if (rule === undefined || !rule.restorable) {
      return false;
    }
    found.archived = false;
    this.activeId = id;
    return true;
  }

  /** 关闭并移除槽位。 */
  close(id: string): boolean {
    const index: number = this.slots.findIndex((slot: DocumentSlot): boolean => slot.id === id);
    if (index < 0) {
      return false;
    }
    this.slots.splice(index, 1);
    if (this.activeId === id) {
      this.activeId = '';
    }
    return true;
  }

  /** 当前选中槽位。 */
  active(): DocumentSlot | undefined {
    return this.slots.find((slot: DocumentSlot): boolean => slot.id === this.activeId);
  }

  /** 当前选中槽位标识。 */
  activeSlotId(): string {
    return this.activeId;
  }

  /** 进行中的槽位。 */
  activeSlots(): DocumentSlot[] {
    return this.slots.filter((slot: DocumentSlot): boolean => !slot.archived);
  }

  /** 已归档的槽位。 */
  archivedSlots(): DocumentSlot[] {
    return this.slots.filter((slot: DocumentSlot): boolean => slot.archived);
  }

  /** 全部槽位。 */
  allSlots(): DocumentSlot[] {
    return this.slots.slice();
  }

  /** 按类别统计进行中的数量。 */
  countOf(kind: DocKind): number {
    return this.slots.filter((slot: DocumentSlot): boolean => slot.kind === kind && !slot.archived).length;
  }

  /** 该类别切换时是否必须保留草稿。 */
  keepsDraft(kind: DocKind): boolean {
    const rule = ruleOf(kind);
    return rule === undefined ? false : rule.keepDraft;
  }

  /** 校验整份工作区。 */
  audit(): WorkspaceAudit {
    const audit: WorkspaceAudit = new WorkspaceAudit();
    audit.active = this.activeSlots().length;
    audit.archived = this.archivedSlots().length;
    const seen: string[] = [];
    this.slots.forEach((slot: DocumentSlot): void => {
      if (slot.id.length === 0) {
        audit.findings.push('存在没有标识的槽位');
      }
      if (seen.indexOf(slot.id) >= 0) {
        audit.findings.push(`槽位标识重复：${slot.id}`);
      } else {
        seen.push(slot.id);
      }
      if (slot.archived && !this.keepsDraftForArchived(slot.kind)) {
        audit.findings.push(`${slot.title} 归档后不可恢复，但仍留在归档区`);
      }
    });
    DOC_RULES.forEach((rule: DocRule): void => {
      if (rule.allowMultiple) {
        return;
      }
      const count: number = this.slots.filter((slot: DocumentSlot): boolean =>
        slot.kind === rule.kind && !slot.archived).length;
      if (count > 1) {
        audit.findings.push(`${rule.kind as string} 只允许一份，实际 ${count} 份（${rule.code}）`);
      }
    });
    return audit;
  }

  private keepsDraftForArchived(kind: DocKind): boolean {
    const rule = ruleOf(kind);
    return rule === undefined ? true : rule.restorable;
  }
}

/**
 * 隔离校验：判断一份接续载荷能否落到指定槽位。
 *
 * 三个条件全部满足才允许写入：类别一致、应用一致、修订号不小于槽位当前值。
 * 修订号回退意味着载荷比槽位旧，写入会让用户看到已丢弃的内容。
 */
export function checkIsolation(slot: DocumentSlot, payloadKind: DocKind, payloadApp: string,
  payloadRevision: number): string[] {
  const reasons: string[] = [];
  if (slot.kind !== payloadKind) {
    reasons.push(`类别不一致：槽位 ${slot.kind as string}，载荷 ${payloadKind as string}`);
  }
  if (slot.ownerApp.length > 0 && payloadApp.length > 0 && slot.ownerApp !== payloadApp) {
    reasons.push(`来源应用不一致：槽位 ${slot.ownerApp}，载荷 ${payloadApp}`);
  }
  if (payloadRevision < slot.revision) {
    reasons.push(`修订号回退：槽位 ${slot.revision}，载荷 ${payloadRevision}`);
  }
  return reasons;
}

/** 规则表展示行。 */
export function docLines(): string[] {
  return DOC_RULES.map((rule: DocRule): string => rule.describe());
}

/** 允许多份并存的类别。 */
export function multiSlotKinds(): DocKind[] {
  const kinds: DocKind[] = [];
  DOC_RULES.forEach((rule: DocRule): void => {
    if (rule.allowMultiple && kinds.indexOf(rule.kind) < 0) {
      kinds.push(rule.kind);
    }
  });
  return kinds;
}

/** 工作区展示行。 */
export function workspaceLines(workspace: DocumentWorkspace): string[] {
  const lines: string[] = [];
  const audit: WorkspaceAudit = workspace.audit();
  lines.push(audit.summary());
  const active: DocumentSlot[] = workspace.activeSlots();
  if (active.length === 0) {
    lines.push('没有进行中的可接续对象');
  } else {
    active.forEach((slot: DocumentSlot): void => {
      lines.push(slot.describe());
    });
  }
  const archived: DocumentSlot[] = workspace.archivedSlots();
  if (archived.length > 0) {
    lines.push(`归档 ${archived.length} 项：${archived.map((slot: DocumentSlot): string => slot.title).join('、')}`);
  }
  audit.findings.forEach((finding: string): void => {
    lines.push(`问题：${finding}`);
  });
  return lines;
}
