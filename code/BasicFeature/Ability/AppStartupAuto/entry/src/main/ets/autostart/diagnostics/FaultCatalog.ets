/**
 * 故障场景目录。
 *
 * 故障排查最容易出错的地方是"现象 -> 原因"的映射没有统一口径：同一条现象被
 * 两个人给出两种结论。这里把常见现象、可复现条件、判定依据与处置动作写成目录，
 * 页面只按编号引用，用例只遍历目录，避免各处自说自话。
 */

/** 故障归属。 */
export enum FaultOwner {
  SYSTEM = 'system',
  APP = 'app',
  USER = 'user',
  ENVIRONMENT = 'environment'
}

/** 归属标签。 */
export function ownerLabel(owner: FaultOwner): string {
  switch (owner) {
    case FaultOwner.SYSTEM:
      return '系统侧';
    case FaultOwner.APP:
      return '应用侧';
    case FaultOwner.USER:
      return '用户操作';
    default:
      return '运行环境';
  }
}

/** 故障等级。 */
export enum FaultSeverity {
  BLOCKER = 'blocker',
  MAJOR = 'major',
  MINOR = 'minor',
  INFO = 'info'
}

/** 等级标签。 */
export function severityLabel(level: FaultSeverity): string {
  switch (level) {
    case FaultSeverity.BLOCKER:
      return '阻断';
    case FaultSeverity.MAJOR:
      return '严重';
    case FaultSeverity.MINOR:
      return '轻微';
    default:
      return '提示';
  }
}

/** 等级序号，数值越大越严重。 */
export function severityRank(level: FaultSeverity): number {
  switch (level) {
    case FaultSeverity.BLOCKER:
      return 3;
    case FaultSeverity.MAJOR:
      return 2;
    case FaultSeverity.MINOR:
      return 1;
    default:
      return 0;
  }
}

/** 判定依据：先看哪一层。 */
export enum CheckLayer {
  CAPABILITY = 'capability',
  PERMISSION = 'permission',
  QUERY = 'query',
  STORAGE = 'storage',
  UI = 'ui'
}

/** 层标签。 */
export function layerLabel(layer: CheckLayer): string {
  switch (layer) {
    case CheckLayer.CAPABILITY:
      return '能力层';
    case CheckLayer.PERMISSION:
      return '权限层';
    case CheckLayer.QUERY:
      return '调用层';
    case CheckLayer.STORAGE:
      return '存储层';
    default:
      return '界面层';
  }
}

/** 一条故障场景。 */
export class FaultEntry {
  faultId: string = '';
  symptom: string = '';
  trigger: string = '';
  layer: CheckLayer = CheckLayer.CAPABILITY;
  owner: FaultOwner = FaultOwner.APP;
  severity: FaultSeverity = FaultSeverity.MINOR;
  /** 判定依据：出现什么就算命中。 */
  detection: string = '';
  /** 处置动作。 */
  action: string = '';
  /** 是否可通过重试自愈。 */
  recoverable: boolean = false;

  constructor(faultId: string = '', symptom: string = '', trigger: string = '',
    layer: CheckLayer = CheckLayer.CAPABILITY, owner: FaultOwner = FaultOwner.APP,
    severity: FaultSeverity = FaultSeverity.MINOR, detection: string = '',
    action: string = '', recoverable: boolean = false) {
    this.faultId = faultId;
    this.symptom = symptom;
    this.trigger = trigger;
    this.layer = layer;
    this.owner = owner;
    this.severity = severity;
    this.detection = detection;
    this.action = action;
    this.recoverable = recoverable;
  }

  /** 单行文本。 */
  text(): string {
    return `${this.faultId}｜${this.symptom}｜${layerLabel(this.layer)}｜` +
      `${severityLabel(this.severity)}`;
  }

  /** 详情文本，用于展开区。 */
  detail(): string {
    return `复现：${this.trigger}；判定：${this.detection}；处置：${this.action}`;
  }
}

/**
 * 故障目录。
 *
 * 顺序即页面展示顺序；编号连续，便于按段提交与引用。
 */
export const FAULT_CATALOG: FaultEntry[] = [
  new FaultEntry('FT-01', '查询结果一直显示"待调用"', '进入首页后未触发刷新',
    CheckLayer.QUERY, FaultOwner.APP, FaultSeverity.MAJOR,
    '记录条数为 0 且四路调用结果均为"待调用"', '触发一次手动刷新并确认回调', true),
  new FaultEntry('FT-02', '能力检测返回 false，但系统设置里能看到开关',
    '在 API 11 以下设备上调用 isAutoStartupSupported',
    CheckLayer.CAPABILITY, FaultOwner.SYSTEM, FaultSeverity.MAJOR,
    '能力检测 false 且 API 等级低于 9', '按系统版本判定为不支持，引导用户升级系统', false),
  new FaultEntry('FT-03', '查询抛 201 权限拒绝', '未授予分布式数据同步权限',
    CheckLayer.PERMISSION, FaultOwner.USER, FaultSeverity.MAJOR,
    '错误码为 201 且权限位为未授予', '引导到设置页授予权限后重试', true),
  new FaultEntry('FT-04', '查询抛 202 非系统应用', '调试包未使用系统签名',
    CheckLayer.PERMISSION, FaultOwner.SYSTEM, FaultSeverity.BLOCKER,
    '错误码为 202', '确认签名配置；该结论属确定性不支持，不再重试', false),
  new FaultEntry('FT-05', '查询抛 801 能力不支持', '在穿戴设备上调用接口',
    CheckLayer.CAPABILITY, FaultOwner.SYSTEM, FaultSeverity.MINOR,
    '错误码为 801 且设备形态为 wearable', '判定为设备不支持，展示手动设置指引', false),
  new FaultEntry('FT-06', '查询抛 16000050 内部错误', '系统服务瞬时异常',
    CheckLayer.QUERY, FaultOwner.SYSTEM, FaultSeverity.MAJOR,
    '错误码为 16000050 且连续两次出现', '等待 1 秒后自动重试一次，仍失败则记录', true),
  new FaultEntry('FT-07', '查询超时没有返回', '调用线程被阻塞超过阈值',
    CheckLayer.QUERY, FaultOwner.APP, FaultSeverity.BLOCKER,
    '超过约定超时时间仍无回调', '保留上次成功结果，标记超时并允许重试', true),
  new FaultEntry('FT-08', '设置页返回后结果没有更新', '从设置页返回但未触发前台刷新',
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MAJOR,
    '页面重新可见且距上次查询超过 1 秒', '在页面可见时合并触发一次刷新', true),
  new FaultEntry('FT-09', '重复点击刷新出现两次请求', '连点按钮未做单飞保护',
    CheckLayer.QUERY, FaultOwner.APP, FaultSeverity.MAJOR,
    '在飞请求数大于 1', '加入单飞保护，重复请求合并为一次', true),
  new FaultEntry('FT-10', '历史记录列表为空但内存里有数据', '落盘失败未回写',
    CheckLayer.STORAGE, FaultOwner.APP, FaultSeverity.MAJOR,
    '内存条数大于 0 且持久化条数为 0', '检查存储写入异常并在下次查询时重试落盘', true),
  new FaultEntry('FT-11', '历史记录出现重复序号', '并发写入未做序号分配保护',
    CheckLayer.STORAGE, FaultOwner.APP, FaultSeverity.MAJOR,
    '存在相同的记录序号', '按时间重建序号并在写入前校验唯一性', true),
  new FaultEntry('FT-12', '历史记录时间显示为 1970', '时间戳为 0 或非法',
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MINOR,
    '时间戳小于等于 0', '展示为"未记录时间"而非 1970', true),
  new FaultEntry('FT-13', '错误信息非常长，撑破卡片', '系统返回了超长附加信息',
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MINOR,
    '错误信息长度超过 512 字符', '落盘前截断并在界面按行省略', true),
  new FaultEntry('FT-14', '引导页步骤与当前系统版本不符', '指引目录未按版本区分',
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MAJOR,
    '指引条目要求的 API 区间与当前 API 不匹配', '按 API 与形态选择指引条目', true),
  new FaultEntry('FT-15', '点击"去设置"没有任何反应', '目标应用未声明设置入口',
    CheckLayer.UI, FaultOwner.SYSTEM, FaultSeverity.MAJOR,
    '跳转能力查询返回 false', '提示手动进入系统设置并提供路径', false),
  new FaultEntry('FT-16', '同一问题换一台设备结论不同', '设备形态或发行版不同',
    CheckLayer.CAPABILITY, FaultOwner.ENVIRONMENT, FaultSeverity.INFO,
    '两台设备的形态或发行版不一致', '结论随设备标注，不做跨设备合并', true),
  new FaultEntry('FT-17', '查询成功但开关仍然显示关闭', '状态结果与能力结果混用',
    CheckLayer.QUERY, FaultOwner.APP, FaultSeverity.MAJOR,
    '能力结果为 true 且状态结果为 false', '区分能力可查询与开关已开启两种语义', true),
  new FaultEntry('FT-18', '界面颜色与开关状态不一致', '状态取值未映射到颜色',
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MINOR,
    '状态为成功但界面使用中性色', '按状态枚举统一映射颜色', true),
  new FaultEntry('FT-19', '冷启动时短暂出现空白页', '首次渲染前未给占位内容',
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MINOR,
    '首帧前内容高度为 0', '提供骨架占位并延后动画', true),
  new FaultEntry('FT-20', '存储读取失败导致应用启动缓慢', '读取大文件未限制长度',
    CheckLayer.STORAGE, FaultOwner.APP, FaultSeverity.MAJOR,
    '读取耗时超过 200 ms 或内容超过上限', '限制单次读取长度并异步加载', true),
  new FaultEntry('FT-21', '导出内容出现乱码或多出一列', '字段内含分隔符未转义',
    CheckLayer.STORAGE, FaultOwner.APP, FaultSeverity.MAJOR,
    '导出行的列数与表头不一致', '导出前转义分隔符并校验列数', true),
  new FaultEntry('FT-22', '多次进入页面后回调被重复触发', '订阅未在页面销毁时解除',
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MAJOR,
    '同一页面的订阅计数大于 1', '在销毁时解除订阅并校验计数归零', true)
];

/** 编号列表。 */
export function faultIds(): string[] {
  return FAULT_CATALOG.map((item: FaultEntry): string => item.faultId);
}

/** 按编号取条目。 */
export function faultOf(faultId: string): FaultEntry | undefined {
  return FAULT_CATALOG.find((item: FaultEntry): boolean => item.faultId === faultId);
}

/** 按层筛选。 */
export function faultsOfLayer(layer: CheckLayer): FaultEntry[] {
  return FAULT_CATALOG.filter((item: FaultEntry): boolean => item.layer === layer);
}

/** 按归属筛选。 */
export function faultsOfOwner(owner: FaultOwner): FaultEntry[] {
  return FAULT_CATALOG.filter((item: FaultEntry): boolean => item.owner === owner);
}

/** 按归属计数，顺序固定。 */
export function ownerCounts(): number[] {
  const owners: FaultOwner[] = [FaultOwner.SYSTEM, FaultOwner.APP, FaultOwner.USER,
    FaultOwner.ENVIRONMENT];
  return owners.map((owner: FaultOwner): number => faultsOfOwner(owner).length);
}

/** 按层计数。 */
export function layerCounts(): number[] {
  const layers: CheckLayer[] = [CheckLayer.CAPABILITY, CheckLayer.PERMISSION,
    CheckLayer.QUERY, CheckLayer.STORAGE, CheckLayer.UI];
  return layers.map((layer: CheckLayer): number => faultsOfLayer(layer).length);
}

/** 需要优先处理的条目：阻断与严重，按严重度降序、编号升序。 */
export function criticalFaults(): FaultEntry[] {
  const list: FaultEntry[] = FAULT_CATALOG.filter((item: FaultEntry): boolean =>
    severityRank(item.severity) >= severityRank(FaultSeverity.MAJOR));
  list.sort((left: FaultEntry, right: FaultEntry): number => {
    const diff: number = severityRank(right.severity) - severityRank(left.severity);
    if (diff !== 0) {
      return diff;
    }
    return left.faultId < right.faultId ? -1 : (left.faultId > right.faultId ? 1 : 0);
  });
  return list;
}

/** 可重试自愈的条目。 */
export function recoverableFaults(): FaultEntry[] {
  return FAULT_CATALOG.filter((item: FaultEntry): boolean => item.recoverable);
}

/** 结论行。 */
export class FaultSummary {
  total: number = 0;
  blockers: number = 0;
  majors: number = 0;
  recoverable: number = 0;

  /** 一句话摘要。 */
  text(): string {
    return `共 ${this.total} 条，阻断 ${this.blockers} 条，严重 ${this.majors} 条，` +
      `可自愈 ${this.recoverable} 条`;
  }

  /** 是否需要立即处理。 */
  urgent(): boolean {
    return this.blockers > 0 || this.majors > 0;
  }
}

/** 统计故障目录。 */
export function summarizeFaults(): FaultSummary {
  const summary: FaultSummary = new FaultSummary();
  summary.total = FAULT_CATALOG.length;
  summary.blockers = FAULT_CATALOG.filter((item: FaultEntry): boolean =>
    item.severity === FaultSeverity.BLOCKER).length;
  summary.majors = FAULT_CATALOG.filter((item: FaultEntry): boolean =>
    item.severity === FaultSeverity.MAJOR).length;
  summary.recoverable = recoverableFaults().length;
  return summary;
}

/** 处置计划中的一步。 */
export class FaultAction {
  seq: number = 0;
  faultId: string = '';
  action: string = '';
  owner: FaultOwner = FaultOwner.APP;

  constructor(seq: number = 0, faultId: string = '', action: string = '',
    owner: FaultOwner = FaultOwner.APP) {
    this.seq = seq;
    this.faultId = faultId;
    this.action = action;
    this.owner = owner;
  }

  text(): string {
    return `${this.seq}. [${ownerLabel(this.owner)}] ${this.action}`;
  }
}

/** 根据命中编号生成处置顺序：先阻断后严重，同级按编号。 */
export function planActions(faultIdsHit: string[]): FaultAction[] {
  const hits: FaultEntry[] = [];
  faultIdsHit.forEach((faultId: string): void => {
    const entry: FaultEntry | undefined = faultOf(faultId);
    if (entry !== undefined && hits.indexOf(entry) < 0) {
      hits.push(entry);
    }
  });
  hits.sort((left: FaultEntry, right: FaultEntry): number => {
    const diff: number = severityRank(right.severity) - severityRank(left.severity);
    if (diff !== 0) {
      return diff;
    }
    return left.faultId < right.faultId ? -1 : (left.faultId > right.faultId ? 1 : 0);
  });
  return hits.map((entry: FaultEntry, index: number): FaultAction =>
    new FaultAction(index + 1, entry.faultId, entry.action, entry.owner));
}

/** 目录自检。 */
export class FaultAudit {
  ok: boolean = false;
  findings: string[] = [];

  summary(): string {
    return this.ok ? '故障目录自洽' : this.findings.join('；');
  }
}

/** 校验目录：编号唯一且连续、字段完整、层与归属都有取值。 */
export function auditFaults(): FaultAudit {
  const audit: FaultAudit = new FaultAudit();
  const seen: string[] = [];
  FAULT_CATALOG.forEach((item: FaultEntry, index: number): void => {
    if (seen.indexOf(item.faultId) >= 0) {
      audit.findings.push(`编号重复：${item.faultId}`);
    }
    seen.push(item.faultId);
    const expected: string = `FT-${(index + 1).toString().padStart(2, '0')}`;
    if (item.faultId !== expected) {
      audit.findings.push(`编号不连续：期望 ${expected}，实际 ${item.faultId}`);
    }
    if (item.symptom.length === 0) {
      audit.findings.push(`缺少现象：${item.faultId}`);
    }
    if (item.detection.length === 0) {
      audit.findings.push(`缺少判定依据：${item.faultId}`);
    }
    if (item.action.length === 0) {
      audit.findings.push(`缺少处置动作：${item.faultId}`);
    }
    if ((item.owner as string).length === 0) {
      audit.findings.push(`缺少归属：${item.faultId}`);
    }
  });
  if (seen.length !== FAULT_CATALOG.length) {
    audit.findings.push(`编号数量异常：${seen.length}`);
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 目录摘要行。 */
export function faultLines(): string[] {
  return FAULT_CATALOG.map((item: FaultEntry): string => item.text());
}

/** 目录详情行。 */
export function faultDetailLines(): string[] {
  return FAULT_CATALOG.map((item: FaultEntry): string => `${item.faultId} ${item.detail()}`);
}
