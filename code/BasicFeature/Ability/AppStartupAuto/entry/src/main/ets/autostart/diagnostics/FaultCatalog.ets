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

import { formatResource, localText, registerTextRefresh } from '../text/LocalizedText';

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
      return localText('startup_text_0293');
    case FaultOwner.APP:
      return localText('startup_text_0294');
    case FaultOwner.USER:
      return localText('startup_text_0235');
    default:
      return localText('startup_text_0295');
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
      return localText('startup_text_0296');
    case FaultSeverity.MAJOR:
      return localText('startup_text_0297');
    case FaultSeverity.MINOR:
      return localText('startup_text_0298');
    default:
      return localText('startup_text_0299');
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
      return localText('startup_text_0300');
    case CheckLayer.PERMISSION:
      return localText('startup_text_0301');
    case CheckLayer.QUERY:
      return localText('startup_text_0302');
    case CheckLayer.STORAGE:
      return localText('startup_text_0303');
    default:
      return localText('startup_text_0304');
  }
}

/** 一条故障场景。 */
export class FaultEntry {
  public faultId: string = '';
  public symptom: string = '';
  public trigger: string = '';
  public layer: CheckLayer = CheckLayer.CAPABILITY;
  public owner: FaultOwner = FaultOwner.APP;
  public severity: FaultSeverity = FaultSeverity.MINOR;
  /** 判定依据：出现什么就算命中。 */
  public detection: string = '';
  /** 处置动作。 */
  public action: string = '';
  /** 是否可通过重试自愈。 */
  public recoverable: boolean = false;

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
    return formatResource('startup_format_5c2ba0ac6074', [String(this.trigger), String(this.detection), String(this.action)]);
  }
}

/**
 * 故障目录。
 *
 * 顺序即页面展示顺序；编号连续，便于按段提交与引用。
 */
function createFAULT_CATALOG(): FaultEntry[] {
  return [
  new FaultEntry('FT-01', localText('startup_text_0308'), localText('startup_text_0309'),
    CheckLayer.QUERY, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0310'), localText('startup_text_0311'), true),
  new FaultEntry('FT-02', localText('startup_text_0312'),
    localText('startup_text_0313'),
    CheckLayer.CAPABILITY, FaultOwner.SYSTEM, FaultSeverity.MAJOR,
    localText('startup_text_0314'), localText('startup_text_0315'), false),
  new FaultEntry('FT-03', localText('startup_text_0316'), localText('startup_text_0317'),
    CheckLayer.PERMISSION, FaultOwner.USER, FaultSeverity.MAJOR,
    localText('startup_text_0318'), localText('startup_text_0319'), true),
  new FaultEntry('FT-04', localText('startup_text_0320'), localText('startup_text_0321'),
    CheckLayer.PERMISSION, FaultOwner.SYSTEM, FaultSeverity.BLOCKER,
    localText('startup_text_0322'), localText('startup_text_0323'), false),
  new FaultEntry('FT-05', localText('startup_text_0324'), localText('startup_text_0325'),
    CheckLayer.CAPABILITY, FaultOwner.SYSTEM, FaultSeverity.MINOR,
    localText('startup_text_0326'), localText('startup_text_0327'), false),
  new FaultEntry('FT-06', localText('startup_text_0328'), localText('startup_text_0329'),
    CheckLayer.QUERY, FaultOwner.SYSTEM, FaultSeverity.MAJOR,
    localText('startup_text_0330'), localText('startup_text_0331'), true),
  new FaultEntry('FT-07', localText('startup_text_0332'), localText('startup_text_0333'),
    CheckLayer.QUERY, FaultOwner.APP, FaultSeverity.BLOCKER,
    localText('startup_text_0334'), localText('startup_text_0335'), true),
  new FaultEntry('FT-08', localText('startup_text_0336'), localText('startup_text_0337'),
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0338'), localText('startup_text_0339'), true),
  new FaultEntry('FT-09', localText('startup_text_0340'), localText('startup_text_0341'),
    CheckLayer.QUERY, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0342'), localText('startup_text_0343'), true),
  new FaultEntry('FT-10', localText('startup_text_0344'), localText('startup_text_0345'),
    CheckLayer.STORAGE, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0346'), localText('startup_text_0347'), true),
  new FaultEntry('FT-11', localText('startup_text_0348'), localText('startup_text_0349'),
    CheckLayer.STORAGE, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0350'), localText('startup_text_0351'), true),
  new FaultEntry('FT-12', localText('startup_text_0352'), localText('startup_text_0353'),
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MINOR,
    localText('startup_text_0354'), localText('startup_text_0355'), true),
  new FaultEntry('FT-13', localText('startup_text_0356'), localText('startup_text_0357'),
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MINOR,
    localText('startup_text_0358'), localText('startup_text_0359'), true),
  new FaultEntry('FT-14', localText('startup_text_0360'), localText('startup_text_0361'),
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0362'), localText('startup_text_0363'), true),
  new FaultEntry('FT-15', localText('startup_text_0364'), localText('startup_text_0365'),
    CheckLayer.UI, FaultOwner.SYSTEM, FaultSeverity.MAJOR,
    localText('startup_text_0366'), localText('startup_text_0367'), false),
  new FaultEntry('FT-16', localText('startup_text_0368'), localText('startup_text_0369'),
    CheckLayer.CAPABILITY, FaultOwner.ENVIRONMENT, FaultSeverity.INFO,
    localText('startup_text_0370'), localText('startup_text_0371'), true),
  new FaultEntry('FT-17', localText('startup_text_0372'), localText('startup_text_0373'),
    CheckLayer.QUERY, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0374'), localText('startup_text_0375'), true),
  new FaultEntry('FT-18', localText('startup_text_0376'), localText('startup_text_0377'),
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MINOR,
    localText('startup_text_0378'), localText('startup_text_0379'), true),
  new FaultEntry('FT-19', localText('startup_text_0380'), localText('startup_text_0381'),
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MINOR,
    localText('startup_text_0382'), localText('startup_text_0383'), true),
  new FaultEntry('FT-20', localText('startup_text_0384'), localText('startup_text_0385'),
    CheckLayer.STORAGE, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0386'), localText('startup_text_0387'), true),
  new FaultEntry('FT-21', localText('startup_text_0388'), localText('startup_text_0389'),
    CheckLayer.STORAGE, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0390'), localText('startup_text_0391'), true),
  new FaultEntry('FT-22', localText('startup_text_0392'), localText('startup_text_0393'),
    CheckLayer.UI, FaultOwner.APP, FaultSeverity.MAJOR,
    localText('startup_text_0394'), localText('startup_text_0395'), true)
];
}
export const FAULT_CATALOG: FaultEntry[] = createFAULT_CATALOG();
registerTextRefresh((): void => {
  FAULT_CATALOG.splice(0, FAULT_CATALOG.length);
  createFAULT_CATALOG().forEach((item: FaultEntry): void => { FAULT_CATALOG.push(item); });
});

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
  public total: number = 0;
  public blockers: number = 0;
  public majors: number = 0;
  public recoverable: number = 0;

  /** 一句话摘要。 */
  text(): string {
    return formatResource('startup_format_5f0a9f432572', [String(this.total), String(this.blockers), String(this.majors)]) +
      formatResource('startup_format_aea3aa4d9ff5', [String(this.recoverable)]);
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
  public seq: number = 0;
  public faultId: string = '';
  public action: string = '';
  public owner: FaultOwner = FaultOwner.APP;

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
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? localText('startup_text_0401') : this.findings.join('；');
  }
}

/** 校验目录：编号唯一且连续、字段完整、层与归属都有取值。 */
export function auditFaults(): FaultAudit {
  const audit: FaultAudit = new FaultAudit();
  const seen: string[] = [];
  FAULT_CATALOG.forEach((item: FaultEntry, index: number): void => {
    if (seen.indexOf(item.faultId) >= 0) {
      audit.findings.push(formatResource('startup_format_daba46044ae2', [String(item.faultId)]));
    }
    seen.push(item.faultId);
    const expected: string = `FT-${(index + 1).toString().padStart(2, '0')}`;
    if (item.faultId !== expected) {
      audit.findings.push(formatResource('startup_format_6d97c27e58d7', [String(expected), String(item.faultId)]));
    }
    if (item.symptom.length === 0) {
      audit.findings.push(formatResource('startup_format_66ea333bee9f', [String(item.faultId)]));
    }
    if (item.detection.length === 0) {
      audit.findings.push(formatResource('startup_format_31569c094481', [String(item.faultId)]));
    }
    if (item.action.length === 0) {
      audit.findings.push(formatResource('startup_format_420fc3713114', [String(item.faultId)]));
    }
    if ((item.owner as string).length === 0) {
      audit.findings.push(formatResource('startup_format_c64da49b4fc9', [String(item.faultId)]));
    }
  });
  if (seen.length !== FAULT_CATALOG.length) {
    audit.findings.push(formatResource('startup_format_72b8ae4cc35b', [String(seen.length)]));
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
