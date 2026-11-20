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

import { localize, legacyLabel } from '../../common/LocaleStrings';
/**
 * 可中断的表单业务。
 *
 * 接续最难的场景不是文本，而是表单：用户填了一半、页面被系统回收、从另一个设备接续回来，
 * 要继续填还不能丢已填内容。表单比文本多三件事：
 *   1. 字段有校验状态，半填也得分清"没填"和"填错"；
 *   2. 有条件分支，选了某个选项才会出现后续字段；
 *   3. 有可重复明细，条数与内容都要能接续。
 *
 * 这里把字段、阶段、分支写成可序列化的结构，恢复时按同一套规则重算可见字段，
 * 而不是把界面状态整体粘贴回来。
 */

/** 字段填写状态。取值是稳定标识，显示经 legacyLabel 映射。 */
export enum FieldState {
  EMPTY = 'empty',
  FILLED = 'filled',
  INVALID = 'invalid',
  CONFIRMED = 'confirmed'
}

/** 表单阶段。取值是稳定标识，显示经 legacyLabel 映射。 */
export enum FormStage {
  EDITING = 'editing',
  REVIEWING = 'reviewing',
  CONFIRMED = 'confirmed',
  ARCHIVED = 'archived'
}

/** 一个字段。 */
export class FormField {
  public key: string = '';
  public label: string = '';
  public required: boolean = false;
  public state: FieldState = FieldState.EMPTY;
  public value: string = '';
  /** 最大长度，0 表示不限。 */
  public maxLength: number = 0;
  /** 该字段出现在哪些分支下；空数组表示始终可见。 */
  public visibleWhen: string[] = [];

  constructor(key: string = '', label: string = '', required: boolean = false, maxLength: number = 0) {
    this.key = key;
    this.label = label;
    this.required = required;
    this.maxLength = maxLength;
  }

  /** 按当前值重算状态，不信任外部写入的 state。 */
  public refresh(): void {
    if (this.value.length === 0) {
      this.state = FieldState.EMPTY;
      return;
    }
    if (this.maxLength > 0 && this.value.length > this.maxLength) {
      this.state = FieldState.INVALID;
      return;
    }
    this.state = FieldState.FILLED;
  }

  /** 是否阻断提交。 */
  public blocking(): boolean {
    return this.required && (this.state === FieldState.EMPTY || this.state === FieldState.INVALID);
  }

  public describe(): string {
    return `${this.label}${this.required ? localize('ac_formsession_009') : ''}＝` +
      `${this.value.length === 0 ? localize('ac_formsession_010') : this.value}｜${legacyLabel(this.state as string)}`;
  }
}

/** 一条可重复明细。 */
export class FormRow {
  /** 行标识，接续时用于对齐。 */
  public id: string = '';
  /** 行内字段取值，按 key 顺序拼接，避免依赖映射类型。 */
  public keys: string[] = [];
  public values: string[] = [];

  constructor(id: string = '') {
    this.id = id;
  }

  public valueOf(key: string): string {
    const index: number = this.keys.indexOf(key);
    return index < 0 ? '' : this.values[index];
  }

  public set(key: string, value: string): void {
    const index: number = this.keys.indexOf(key);
    if (index < 0) {
      this.keys.push(key);
      this.values.push(value);
      return;
    }
    this.values[index] = value;
  }

  /** 该行是否有任何非空取值。 */
  public filled(): boolean {
    return this.values.some((value: string): boolean => value.length > 0);
  }

  public describe(): string {
    const parts: string[] = [];
    this.keys.forEach((key: string, index: number): void => {
      parts.push(`${key}=${this.values[index]}`);
    });
    return `${this.id}｜${parts.join(',')}`;
  }
}

/** 分支规则：某个选项被选中时，哪些字段转为可见。 */
export class BranchRule {
  public code: string = '';
  /** 触发分支的字段。 */
  public fieldKey: string = '';
  /** 触发值。 */
  public triggerValue: string = '';
  /** 转为可见的字段 key。 */
  public revealsFields: string[] = [];
  /** 该分支是否要求至少一行明细。 */
  public requireRow: boolean = false;

  constructor(code: string = '', fieldKey: string = '', triggerValue: string = '',
    revealsFields: string[] = [], requireRow: boolean = false) {
    this.code = code;
    this.fieldKey = fieldKey;
    this.triggerValue = triggerValue;
    this.revealsFields = revealsFields;
    this.requireRow = requireRow;
  }

  public describe(): string {
    return localize('ac_formsession_011', [this.code, this.fieldKey, this.triggerValue, this.revealsFields.join('/')]) +
      `${this.requireRow ? localize('ac_formsession_012') : ''}`;
  }
}

/** 分支规则表。 */
export const BRANCH_RULES: BranchRule[] = [
  new BranchRule('FB-01', 'kind', '报销', ['amount', 'invoiceNo'], false),
  new BranchRule('FB-02', 'kind', '请假', ['startDate', 'endDate'], false),
  new BranchRule('FB-03', 'kind', '采购', ['items', 'budget'], true),
  new BranchRule('FB-04', 'urgent', '是', ['reason'], false),
  new BranchRule('FB-05', 'kind', '其他', ['remark'], false)
];

/** 表单快照：可序列化，用于接续与恢复。 */
export class FormSnapshot {
  public formId: string = '';
  public stage: FieldStageHolder = new FieldStageHolder();
  public fieldKeys: string[] = [];
  public fieldValues: string[] = [];
  public rowIds: string[] = [];
  public rowKeys: string[] = [];
  public rowValues: string[] = [];
  public revision: number = 0;

  /** 快照是否可用于恢复。 */
  public usable(): boolean {
    return this.formId.length > 0 && this.fieldKeys.length === this.fieldValues.length;
  }
}

/** 阶段持有者：把枚举包一层，避免快照直接持有界面对象。 */
export class FieldStageHolder {
  public stage: FormStage = FormStage.EDITING;
}

/**
 * 表单会话。
 *
 * 所有状态变化都走同一组方法，页面只读结果；恢复通过 apply(snapshot) 整体落回，
 * 落回后立即重算校验，避免把已失效的"已确认"状态带回来。
 */
export class FormSession {
  private formId: string = '';
  private fields: FormField[] = [];
  private rows: FormRow[] = [];
  private stage: FormStage = FormStage.EDITING;
  private revision: number = 0;

  constructor(formId: string = '') {
    this.formId = formId;
  }

  public id(): string {
    return this.formId;
  }

  public currentStage(): FormStage {
    return this.stage;
  }

  public currentRevision(): number {
    return this.revision;
  }

  public addField(field: FormField): void {
    this.fields.push(field);
    this.revision++;
  }

  public fields_(): FormField[] {
    return this.fields.slice();
  }

  public rows_(): FormRow[] {
    return this.rows.slice();
  }

  /** 写入字段值并重算状态；已确认后拒绝修改。 */
  public setValue(key: string, value: string): boolean {
    if (this.stage === FormStage.CONFIRMED || this.stage === FormStage.ARCHIVED) {
      return false;
    }
    const field = this.fields.find((item: FormField): boolean => item.key === key);
    if (field === undefined) {
      return false;
    }
    field.value = value;
    field.refresh();
    this.revision++;
    return true;
  }

  /** 追加一行明细。 */
  public addRow(row: FormRow): boolean {
    if (this.stage === FormStage.CONFIRMED || this.stage === FormStage.ARCHIVED) {
      return false;
    }
    this.rows.push(row);
    this.revision++;
    return true;
  }

  /** 移除一行明细；空标识视为无操作。 */
  public removeRow(id: string): boolean {
    const index: number = this.rows.findIndex((row: FormRow): boolean => row.id === id);
    if (index < 0) {
      return false;
    }
    this.rows.splice(index, 1);
    this.revision++;
    return true;
  }

  /** 当前值。 */
  public valueOf(key: string): string {
    const field = this.fields.find((item: FormField): boolean => item.key === key);
    return field === undefined ? '' : field.value;
  }

  /** 命中的分支规则。 */
  public activeBranches(): BranchRule[] {
    return BRANCH_RULES.filter((rule: BranchRule): boolean =>
      this.valueOf(rule.fieldKey) === rule.triggerValue);
  }

  /** 按分支重算可见字段。 */
  public visibleFields(): FormField[] {
    const branches: BranchRule[] = this.activeBranches();
    const revealed: string[] = [];
    branches.forEach((rule: BranchRule): void => {
      rule.revealsFields.forEach((key: string): void => {
        if (revealed.indexOf(key) < 0) {
          revealed.push(key);
        }
      });
    });
    return this.fields.filter((field: FormField): boolean =>
      field.visibleWhen.length === 0 || field.visibleWhen.some((key: string): boolean => revealed.indexOf(key) >= 0));
  }

  /** 可见字段中阻断提交的项。 */
  public blockingFields(): FormField[] {
    return this.visibleFields().filter((field: FormField): boolean => field.blocking());
  }

  /** 需要明细但还没有明细的分支。 */
  public missingRows(): BranchRule[] {
    return this.activeBranches().filter((rule: BranchRule): boolean =>
      rule.requireRow && this.rows.filter((row: FormRow): boolean => row.filled()).length === 0);
  }

  /** 已填字段数。 */
  public filledCount(): number {
    return this.visibleFields().filter((field: FormField): boolean => field.value.length > 0).length;
  }

  /** 填写进度百分比，取整。 */
  public progressPercent(): number {
    const visible: FormField[] = this.visibleFields();
    if (visible.length === 0) {
      return 0;
    }
    const filled: number = visible.filter((field: FormField): boolean => field.value.length > 0).length;
    return Math.round(filled * 100 / visible.length);
  }

  /** 是否可提交。 */
  public canSubmit(): boolean {
    if (this.stage === FormStage.CONFIRMED || this.stage === FormStage.ARCHIVED) {
      return false;
    }
    return this.blockingFields().length === 0 && this.missingRows().length === 0;
  }

  /** 进入待确认：仅在可提交时成立。 */
  public review(): boolean {
    if (!this.canSubmit()) {
      return false;
    }
    this.stage = FormStage.REVIEWING;
    this.revision++;
    return true;
  }

  /** 确认提交：从待确认或编辑中直接确认都必须满足可提交条件。 */
  public confirm(): boolean {
    if (!this.canSubmit()) {
      return false;
    }
    this.stage = FormStage.CONFIRMED;
    this.fields.forEach((field: FormField): void => {
      if (field.value.length > 0) {
        field.state = FieldState.CONFIRMED;
      }
    });
    this.revision++;
    return true;
  }

  /** 回到编辑：已归档不可退回。 */
  public reopen(): boolean {
    if (this.stage === FormStage.ARCHIVED) {
      return false;
    }
    this.stage = FormStage.EDITING;
    this.revision++;
    return true;
  }

  /** 归档为只读快照。 */
  public archive(): boolean {
    if (this.stage !== FormStage.CONFIRMED) {
      return false;
    }
    this.stage = FormStage.ARCHIVED;
    this.revision++;
    return true;
  }

  /** 导出快照，用于接续通道传输。 */
  public snapshot(): FormSnapshot {
    const copy: FormSnapshot = new FormSnapshot();
    copy.formId = this.formId;
    copy.stage.stage = this.stage;
    copy.revision = this.revision;
    this.fields.forEach((field: FormField): void => {
      copy.fieldKeys.push(field.key);
      copy.fieldValues.push(field.value);
    });
    this.rows.forEach((row: FormRow): void => {
      copy.rowIds.push(row.id);
      row.keys.forEach((key: string, index: number): void => {
        copy.rowKeys.push(key);
        copy.rowValues.push(row.values[index]);
      });
    });
    return copy;
  }

  /**
   * 从快照恢复。
   *
   * 只恢复字段值、明细与修订号，阶段一律回到编辑中：
   * 已确认状态需要用户重新确认，不能因为一次接续就替用户提交。
   */
  public apply(snapshot: FormSnapshot): boolean {
    if (!snapshot.usable()) {
      return false;
    }
    this.formId = snapshot.formId;
    this.fields = [];
    this.rows = [];
    snapshot.fieldKeys.forEach((key: string, index: number): void => {
      const field: FormField = new FormField(key, key, false, 0);
      field.value = snapshot.fieldValues[index];
      field.refresh();
      this.fields.push(field);
    });
    this.revision = snapshot.revision;
    this.stage = FormStage.EDITING;
    return true;
  }
}

/** 分支规则展示行。 */
export function branchLines(): string[] {
  return BRANCH_RULES.map((rule: BranchRule): string => rule.describe());
}

/** 表单状态一句话。 */
export function formSummary(session: FormSession): string {
  const stage: FormStage = session.currentStage();
  const blocking: number = session.blockingFields().length;
  if (stage === FormStage.ARCHIVED) {
    return localize('ac_formsession_018');
  }
  if (blocking > 0) {
    return localize('ac_formsession_019', [legacyLabel(stage as string), blocking, session.progressPercent()]);
  }
  return localize('ac_formsession_020', [legacyLabel(stage as string), session.progressPercent(), session.canSubmit() ? localize('ac_formsession_021') : localize('ac_formsession_022')]);
}
