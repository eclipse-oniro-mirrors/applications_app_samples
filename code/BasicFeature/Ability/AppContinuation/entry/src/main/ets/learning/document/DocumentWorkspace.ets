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

import { localize, legacyLabel, registerLocaleCatalog } from '../../common/LocaleStrings';
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

/** 可接续对象的类别。取值是稳定标识，不参与显示，显示经 legacyLabel 映射。 */
export enum DocKind {
  NOTE = 'note',
  FORM = 'form',
  READING = 'reading'
}

/** 一个可接续槽位。 */
export class DocumentSlot {
  /** 槽位标识，来自业务侧的文档标识。 */
  public id: string = '';
  public kind: DocKind = DocKind.NOTE;
  /** 展示用标题。 */
  public title: string = '';
  /** 修订号，单调递增；接续时必须匹配。 */
  public revision: number = 0;
  /** 产生该槽位的应用标识。 */
  public ownerApp: string = '';
  /** 最近更新时间。 */
  public updatedAt: number = 0;
  /** 是否已归档。 */
  public archived: boolean = false;

  constructor(id: string = '', kind: DocKind = DocKind.NOTE, title: string = '') {
    this.id = id;
    this.kind = kind;
    this.title = title;
  }

  /** 是否可用于接续：有标识、有标题、未归档。 */
  public usable(): boolean {
    return this.id.length > 0 && this.title.length > 0 && !this.archived;
  }

  /** 供页面一行展示。 */
  public describe(): string {
    const state: string = this.archived ? localize('ac_documentworkspace_004') : localize('ac_calldetailpage_012');
    return localize('ac_documentworkspace_006', [this.title, legacyLabel(this.kind as string), this.revision, state]);
  }
}

/** 一条隔离规则。 */
export class DocRule {
  public code: string = '';
  /** 规则约束的对象类别。 */
  public kind: DocKind = DocKind.NOTE;
  /** 切换离开时是否必须保留未提交内容。 */
  public keepDraft: boolean = true;
  /** 是否允许同时存在多份同类对象。 */
  public allowMultiple: boolean = true;
  /** 归档后是否可恢复。 */
  public restorable: boolean = true;
  public note: string = '';

  constructor(code: string = '', kind: DocKind = DocKind.NOTE, keepDraft: boolean = true,
    allowMultiple: boolean = true, restorable: boolean = true, note: string = '') {
    this.code = code;
    this.kind = kind;
    this.keepDraft = keepDraft;
    this.allowMultiple = allowMultiple;
    this.restorable = restorable;
    this.note = note;
  }

  public describe(): string {
    return `${this.code} ${legacyLabel(this.kind as string)}｜${this.keepDraft ? localize('ac_documentworkspace_007') : localize('ac_documentworkspace_008')}｜` +
      `${this.allowMultiple ? localize('ac_documentworkspace_009') : localize('ac_documentworkspace_010')}｜${this.restorable ? localize('ac_documentworkspace_011') : localize('ac_documentworkspace_012')}`;
  }
}

/**
 * 隔离规则表。
 *
 * 表单是最严格的一类：半填字段一旦丢失，用户要重新填一遍，
 * 所以离开必须保留草稿，且同类对象允许多份（不同表单实例互不干扰）。
 * 阅读进度允许覆盖，因为它本来就只表达"读到哪了"。
 */
function createDOC_RULES(): DocRule[] {
  return [
  new DocRule('DC-01', DocKind.NOTE, true, true, true, localize('ac_documentworkspace_013')),
  new DocRule('DC-02', DocKind.NOTE, true, true, true, localize('ac_documentworkspace_014')),
  new DocRule('DC-03', DocKind.NOTE, true, true, false, localize('ac_documentworkspace_015')),
  new DocRule('DC-04', DocKind.NOTE, false, true, true, localize('ac_documentworkspace_016')),
  new DocRule('DC-05', DocKind.FORM, true, true, true, localize('ac_documentworkspace_017')),
  new DocRule('DC-06', DocKind.FORM, true, true, false, localize('ac_documentworkspace_018')),
  new DocRule('DC-07', DocKind.FORM, true, true, true, localize('ac_documentworkspace_019')),
  new DocRule('DC-08', DocKind.FORM, true, false, false, localize('ac_documentworkspace_020')),
  new DocRule('DC-09', DocKind.READING, false, true, true, localize('ac_documentworkspace_021')),
  new DocRule('DC-10', DocKind.READING, false, true, true, localize('ac_documentworkspace_022')),
  new DocRule('DC-11', DocKind.READING, false, true, false, localize('ac_documentworkspace_023')),
  new DocRule('DC-12', DocKind.NOTE, true, true, true, localize('ac_documentworkspace_024'))
];
}

export const DOC_RULES: DocRule[] = createDOC_RULES();
registerLocaleCatalog((): void => {
  DOC_RULES.splice(0, DOC_RULES.length);
  createDOC_RULES().forEach((item: DocRule): void => { DOC_RULES.push(item); });
});

function ruleOf(kind: DocKind): DocRule | undefined {
  return DOC_RULES.find((rule: DocRule): boolean => rule.kind === kind);
}

/** 工作区校验结果。 */
export class WorkspaceAudit {
  public findings: string[] = [];
  /** 打开中的槽位数。 */
  public active: number = 0;
  /** 归档槽位数。 */
  public archived: number = 0;

  public ok(): boolean {
    return this.findings.length === 0;
  }

  public summary(): string {
    if (!this.ok()) {
      return localize('ac_documentworkspace_025', [this.findings.length]);
    }
    return localize('ac_documentworkspace_026', [this.active, this.archived]);
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
  public canOpen(kind: DocKind): boolean {
    const limited: boolean = DOC_RULES.some((rule: DocRule): boolean =>
      rule.kind === kind && !rule.allowMultiple);
    if (limited) {
      return this.slots.filter((slot: DocumentSlot): boolean =>
        slot.kind === kind && !slot.archived).length === 0;
    }
    return DOC_RULES.some((rule: DocRule): boolean => rule.kind === kind);
  }

  /** 打开一个槽位；同 id 已存在时更新标题与修订号。 */
  public open(slot: DocumentSlot): boolean {
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
  public switchTo(id: string): boolean {
    const found = this.slots.find((slot: DocumentSlot): boolean => slot.id === id && !slot.archived);
    if (found === undefined) {
      return false;
    }
    this.activeId = id;
    return true;
  }

  /** 归档当前槽位；成功后选中项清空。 */
  public archive(id: string): boolean {
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
  public restore(id: string): boolean {
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
  public close(id: string): boolean {
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
  public active(): DocumentSlot | undefined {
    return this.slots.find((slot: DocumentSlot): boolean => slot.id === this.activeId);
  }

  /** 当前选中槽位标识。 */
  public activeSlotId(): string {
    return this.activeId;
  }

  /** 进行中的槽位。 */
  public activeSlots(): DocumentSlot[] {
    return this.slots.filter((slot: DocumentSlot): boolean => !slot.archived);
  }

  /** 已归档的槽位。 */
  public archivedSlots(): DocumentSlot[] {
    return this.slots.filter((slot: DocumentSlot): boolean => slot.archived);
  }

  /** 全部槽位。 */
  public allSlots(): DocumentSlot[] {
    return this.slots.slice();
  }

  /** 按类别统计进行中的数量。 */
  public countOf(kind: DocKind): number {
    return this.slots.filter((slot: DocumentSlot): boolean => slot.kind === kind && !slot.archived).length;
  }

  /** 该类别切换时是否必须保留草稿。 */
  public keepsDraft(kind: DocKind): boolean {
    const rule = ruleOf(kind);
    return rule === undefined ? false : rule.keepDraft;
  }

  /** 校验整份工作区。 */
  public audit(): WorkspaceAudit {
    const audit: WorkspaceAudit = new WorkspaceAudit();
    audit.active = this.activeSlots().length;
    audit.archived = this.archivedSlots().length;
    const seen: string[] = [];
    this.slots.forEach((slot: DocumentSlot): void => {
      if (slot.id.length === 0) {
        audit.findings.push(localize('ac_documentworkspace_027'));
      }
      if (seen.indexOf(slot.id) >= 0) {
        audit.findings.push(localize('ac_documentworkspace_028', [slot.id]));
      } else {
        seen.push(slot.id);
      }
      if (slot.archived && !this.keepsDraftForArchived(slot.kind)) {
        audit.findings.push(localize('ac_documentworkspace_029', [slot.title]));
      }
    });
    DOC_RULES.forEach((rule: DocRule): void => {
      if (rule.allowMultiple) {
        return;
      }
      const count: number = this.slots.filter((slot: DocumentSlot): boolean =>
        slot.kind === rule.kind && !slot.archived).length;
      if (count > 1) {
        audit.findings.push(localize('ac_documentworkspace_030', [legacyLabel(rule.kind as string), count, rule.code]));
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
    reasons.push(localize('ac_documentworkspace_031', [legacyLabel(slot.kind as string), legacyLabel(payloadKind as string)]));
  }
  if (slot.ownerApp.length > 0 && payloadApp.length > 0 && slot.ownerApp !== payloadApp) {
    reasons.push(localize('ac_documentworkspace_032', [slot.ownerApp, payloadApp]));
  }
  if (payloadRevision < slot.revision) {
    reasons.push(localize('ac_documentworkspace_033', [slot.revision, payloadRevision]));
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
    lines.push(localize('ac_documentworkspace_034'));
  } else {
    active.forEach((slot: DocumentSlot): void => {
      lines.push(slot.describe());
    });
  }
  const archived: DocumentSlot[] = workspace.archivedSlots();
  if (archived.length > 0) {
    lines.push(localize('ac_documentworkspace_035', [archived.length, archived.map((slot: DocumentSlot): string => slot.title).join('、')]));
  }
  audit.findings.forEach((finding: string): void => {
    lines.push(localize('ac_documentworkspace_036', [finding]));
  });
  return lines;
}
