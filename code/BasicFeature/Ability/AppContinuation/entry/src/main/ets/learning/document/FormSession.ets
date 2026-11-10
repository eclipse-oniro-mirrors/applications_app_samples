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

/** 字段填写状态。 */
export enum FieldState {
  EMPTY = '未填写',
  FILLED = '已填写',
  INVALID = '不合规',
  CONFIRMED = '已确认'
}

/** 表单阶段。 */
export enum FormStage {
  EDITING = '编辑中',
  REVIEWING = '待确认',
  CONFIRMED = '已确认',
  ARCHIVED = '已归档'
}

/** 一个字段。 */
export class FormField {
  key: string = '';
  label: string = '';
  required: boolean = false;
  state: FieldState = FieldState.EMPTY;
  value: string = '';
  /** 最大长度，0 表示不限。 */
  maxLength: number = 0;
  /** 该字段出现在哪些分支下；空数组表示始终可见。 */
  visibleWhen: string[] = [];

  constructor(key: string = '', label: string = '', required: boolean = false, maxLength: number = 0) {
    this.key = key;
    this.label = label;
    this.required = required;
    this.maxLength = maxLength;
  }

  /** 按当前值重算状态，不信任外部写入的 state。 */
  refresh(): void {
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
  blocking(): boolean {
    return this.required && (this.state === FieldState.EMPTY || this.state === FieldState.INVALID);
  }

  describe(): string {
    return `${this.label}${this.required ? '(必填)' : ''}＝${this.value.length === 0 ? '空' : this.value}｜${this.state as string}`;
  }
}

/** 一条可重复明细。 */
export class FormRow {
  /** 行标识，接续时用于对齐。 */
  id: string = '';
  /** 行内字段取值，按 key 顺序拼接，避免依赖映射类型。 */
  keys: string[] = [];
  values: string[] = [];

  constructor(id: string = '') {
    this.id = id;
  }

  valueOf(key: string): string {
    const index: number = this.keys.indexOf(key);
    return index < 0 ? '' : this.values[index];
  }

  set(key: string, value: string): void {
    const index: number = this.keys.indexOf(key);
    if (index < 0) {
      this.keys.push(key);
      this.values.push(value);
      return;
    }
    this.values[index] = value;
  }

  /** 该行是否有任何非空取值。 */
  filled(): boolean {
    return this.values.some((value: string): boolean => value.length > 0);
  }

  describe(): string {
    const parts: string[] = [];
    this.keys.forEach((key: string, index: number): void => {
      parts.push(`${key}=${this.values[index]}`);
    });
    return `${this.id}｜${parts.join(',')}`;
  }
}

/** 分支规则：某个选项被选中时，哪些字段转为可见。 */
export class BranchRule {
  code: string = '';
  /** 触发分支的字段。 */
  fieldKey: string = '';
  /** 触发值。 */
  triggerValue: string = '';
  /** 转为可见的字段 key。 */
  revealsFields: string[] = [];
  /** 该分支是否要求至少一行明细。 */
  requireRow: boolean = false;

  constructor(code: string = '', fieldKey: string = '', triggerValue: string = '',
    revealsFields: string[] = [], requireRow: boolean = false) {
    this.code = code;
    this.fieldKey = fieldKey;
    this.triggerValue = triggerValue;
    this.revealsFields = revealsFields;
    this.requireRow = requireRow;
  }

  describe(): string {
    return `${this.code}｜${this.fieldKey}=${this.triggerValue} 时显示 ${this.revealsFields.join('/')}${this.requireRow ? '，且需至少一行明细' : ''}`;
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
  formId: string = '';
  stage: FieldStageHolder = new FieldStageHolder();
  fieldKeys: string[] = [];
  fieldValues: string[] = [];
  rowIds: string[] = [];
  rowKeys: string[] = [];
  rowValues: string[] = [];
  revision: number = 0;

  /** 快照是否可用于恢复。 */
  usable(): boolean {
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

  id(): string {
    return this.formId;
  }

  currentStage(): FormStage {
    return this.stage;
  }

  currentRevision(): number {
    return this.revision;
  }

  addField(field: FormField): void {
    this.fields.push(field);
    this.revision++;
  }

  fields_(): FormField[] {
    return this.fields.slice();
  }

  rows_(): FormRow[] {
    return this.rows.slice();
  }

  /** 写入字段值并重算状态；已确认后拒绝修改。 */
  setValue(key: string, value: string): boolean {
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
  addRow(row: FormRow): boolean {
    if (this.stage === FormStage.CONFIRMED || this.stage === FormStage.ARCHIVED) {
      return false;
    }
    this.rows.push(row);
    this.revision++;
    return true;
  }

  /** 移除一行明细；空标识视为无操作。 */
  removeRow(id: string): boolean {
    const index: number = this.rows.findIndex((row: FormRow): boolean => row.id === id);
    if (index < 0) {
      return false;
    }
    this.rows.splice(index, 1);
    this.revision++;
    return true;
  }

  /** 当前值。 */
  valueOf(key: string): string {
    const field = this.fields.find((item: FormField): boolean => item.key === key);
    return field === undefined ? '' : field.value;
  }

  /** 命中的分支规则。 */
  activeBranches(): BranchRule[] {
    return BRANCH_RULES.filter((rule: BranchRule): boolean =>
      this.valueOf(rule.fieldKey) === rule.triggerValue);
  }

  /** 按分支重算可见字段。 */
  visibleFields(): FormField[] {
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
  blockingFields(): FormField[] {
    return this.visibleFields().filter((field: FormField): boolean => field.blocking());
  }

  /** 需要明细但还没有明细的分支。 */
  missingRows(): BranchRule[] {
    return this.activeBranches().filter((rule: BranchRule): boolean =>
      rule.requireRow && this.rows.filter((row: FormRow): boolean => row.filled()).length === 0);
  }

  /** 已填字段数。 */
  filledCount(): number {
    return this.visibleFields().filter((field: FormField): boolean => field.value.length > 0).length;
  }

  /** 填写进度百分比，取整。 */
  progressPercent(): number {
    const visible: FormField[] = this.visibleFields();
    if (visible.length === 0) {
      return 0;
    }
    const filled: number = visible.filter((field: FormField): boolean => field.value.length > 0).length;
    return Math.round(filled * 100 / visible.length);
  }

  /** 是否可提交。 */
  canSubmit(): boolean {
    if (this.stage === FormStage.CONFIRMED || this.stage === FormStage.ARCHIVED) {
      return false;
    }
    return this.blockingFields().length === 0 && this.missingRows().length === 0;
  }

  /** 进入待确认：仅在可提交时成立。 */
  review(): boolean {
    if (!this.canSubmit()) {
      return false;
    }
    this.stage = FormStage.REVIEWING;
    this.revision++;
    return true;
  }

  /** 确认提交：从待确认或编辑中直接确认都必须满足可提交条件。 */
  confirm(): boolean {
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
  reopen(): boolean {
    if (this.stage === FormStage.ARCHIVED) {
      return false;
    }
    this.stage = FormStage.EDITING;
    this.revision++;
    return true;
  }

  /** 归档为只读快照。 */
  archive(): boolean {
    if (this.stage !== FormStage.CONFIRMED) {
      return false;
    }
    this.stage = FormStage.ARCHIVED;
    this.revision++;
    return true;
  }

  /** 导出快照，用于接续通道传输。 */
  snapshot(): FormSnapshot {
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
  apply(snapshot: FormSnapshot): boolean {
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
    return '已归档：只读快照，不可再编辑';
  }
  if (blocking > 0) {
    return `${stage as string}｜还有 ${blocking} 个必填项未完成｜进度 ${session.progressPercent()}%`;
  }
  return `${stage as string}｜进度 ${session.progressPercent()}%｜${session.canSubmit() ? '可提交' : '待补明细'}`;
}
