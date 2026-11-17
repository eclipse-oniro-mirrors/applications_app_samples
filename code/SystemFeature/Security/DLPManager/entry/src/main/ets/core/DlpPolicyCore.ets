/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { encodeComponent, decodeComponent, UriDecodeResult } from './UriCore';

export enum DlpPermission {
  READ = 1,
  WRITE = 2,
  PRINT = 4,
  COPY = 8
}

export const PERMISSION_ALL: number = 15;
export const POLICY_VERSION: string = 'v1';
const MAX_TEXT_LENGTH: number = 64;

export class PermissionSet {
  public readonly mask: number;

  constructor(mask: number) {
    this.mask = mask & PERMISSION_ALL;
  }

  has(permission: DlpPermission): boolean {
    return (this.mask & permission) === permission;
  }

  grant(permission: DlpPermission): PermissionSet {
    return new PermissionSet(this.mask | permission);
  }

  revoke(permission: DlpPermission): PermissionSet {
    return new PermissionSet(this.mask & (PERMISSION_ALL ^ permission));
  }

  toggle(permission: DlpPermission): PermissionSet {
    if (this.has(permission)) {
      return this.revoke(permission);
    }
    return this.grant(permission);
  }

  isEmpty(): boolean {
    return this.mask === 0;
  }

  count(): number {
    let total: number = 0;
    if (this.has(DlpPermission.READ)) {
      total += 1;
    }
    if (this.has(DlpPermission.WRITE)) {
      total += 1;
    }
    if (this.has(DlpPermission.PRINT)) {
      total += 1;
    }
    if (this.has(DlpPermission.COPY)) {
      total += 1;
    }
    return total;
  }

  static fromActions(actions: Array<string>): PermissionSet {
    return new PermissionSet(maskOfActions(actions));
  }
}

export class DlpPolicy {
  public accountId: string;
  public accountName: string;
  public mask: number;
  public expiredAtSec: number;
  public watermark: string;
  public nickname: string;

  constructor(accountId: string, accountName: string, mask: number, expiredAtSec: number, watermark: string,
    nickname: string) {
    this.accountId = accountId;
    this.accountName = accountName;
    this.mask = mask & PERMISSION_ALL;
    this.expiredAtSec = expiredAtSec;
    this.watermark = watermark;
    this.nickname = nickname;
  }
}

export class PolicyIssue {
  public readonly field: string;
  public readonly code: string;
  public readonly message: string;

  constructor(field: string, code: string, message: string) {
    this.field = field;
    this.code = code;
    this.message = message;
  }
}

export class PolicyValidation {
  public readonly issues: Array<PolicyIssue>;

  constructor(issues: Array<PolicyIssue>) {
    this.issues = issues;
  }

  get valid(): boolean {
    return this.issues.length === 0;
  }
}

export class PolicyParseResult {
  public readonly policy: DlpPolicy | null;
  public readonly validation: PolicyValidation;

  constructor(policy: DlpPolicy | null, validation: PolicyValidation) {
    this.policy = policy;
    this.validation = validation;
  }

  get valid(): boolean {
    return this.policy !== null && this.validation.valid;
  }
}

export class PolicyTemplate {
  public readonly id: string;
  public readonly nameKey: string;
  public readonly mask: number;

  constructor(id: string, nameKey: string, mask: number) {
    this.id = id;
    this.nameKey = nameKey;
    this.mask = mask & PERMISSION_ALL;
  }
}

export function isValidMask(mask: number): boolean {
  if (mask !== Math.floor(mask)) {
    return false;
  }
  return mask >= 0 && mask <= PERMISSION_ALL;
}

export function actionsOfMask(mask: number): Array<string> {
  const actions: Array<string> = [];
  if ((mask & DlpPermission.READ) === DlpPermission.READ) {
    actions.push('read');
  }
  if ((mask & DlpPermission.WRITE) === DlpPermission.WRITE) {
    actions.push('write');
  }
  if ((mask & DlpPermission.PRINT) === DlpPermission.PRINT) {
    actions.push('print');
  }
  if ((mask & DlpPermission.COPY) === DlpPermission.COPY) {
    actions.push('copy');
  }
  return actions;
}

export function maskOfActions(actions: Array<string>): number {
  let mask: number = 0;
  for (let index = 0; index < actions.length; index++) {
    const action: string = actions[index].toLowerCase();
    if (action === 'read') {
      mask = mask | DlpPermission.READ;
    } else if (action === 'write') {
      mask = mask | DlpPermission.WRITE;
    } else if (action === 'print') {
      mask = mask | DlpPermission.PRINT;
    } else if (action === 'copy') {
      mask = mask | DlpPermission.COPY;
    }
  }
  return mask;
}

export function permissionLabels(mask: number): Array<string> {
  const labels: Array<string> = [];
  if ((mask & DlpPermission.READ) === DlpPermission.READ) {
    labels.push('读取');
  }
  if ((mask & DlpPermission.WRITE) === DlpPermission.WRITE) {
    labels.push('编辑');
  }
  if ((mask & DlpPermission.PRINT) === DlpPermission.PRINT) {
    labels.push('打印');
  }
  if ((mask & DlpPermission.COPY) === DlpPermission.COPY) {
    labels.push('复制');
  }
  return labels;
}

export function permissionSummary(mask: number): string {
  const labels: Array<string> = permissionLabels(mask);
  if (labels.length === 0) {
    return '无权限';
  }
  return labels.join('、');
}

export function defaultPolicy(accountId: string, accountName: string): DlpPolicy {
  return new DlpPolicy(accountId, accountName, DlpPermission.READ, 0, '', '');
}

export function withPermission(policy: DlpPolicy, permission: DlpPermission): DlpPolicy {
  return copyPolicyWithMask(policy, policy.mask | permission);
}

export function withoutPermission(policy: DlpPolicy, permission: DlpPermission): DlpPolicy {
  return copyPolicyWithMask(policy, policy.mask & (PERMISSION_ALL ^ permission));
}

export function togglePermission(policy: DlpPolicy, permission: DlpPermission): DlpPolicy {
  if (hasPermission(policy, permission)) {
    return withoutPermission(policy, permission);
  }
  return withPermission(policy, permission);
}

export function hasPermission(policy: DlpPolicy, permission: DlpPermission): boolean {
  return (policy.mask & permission) === permission;
}

function copyPolicyWithMask(policy: DlpPolicy, mask: number): DlpPolicy {
  return new DlpPolicy(policy.accountId, policy.accountName, mask, policy.expiredAtSec, policy.watermark,
    policy.nickname);
}

export function isExpired(policy: DlpPolicy, nowSec: number): boolean {
  if (policy.expiredAtSec <= 0) {
    return false;
  }
  return nowSec >= policy.expiredAtSec;
}

export function validatePolicy(policy: DlpPolicy): PolicyValidation {
  const issues: Array<PolicyIssue> = [];
  if (policy.accountId.trim().length === 0) {
    issues.push(new PolicyIssue('accountId', 'empty', '账号标识不能为空'));
  }
  if (policy.accountName.trim().length === 0) {
    issues.push(new PolicyIssue('accountName', 'empty', '账号名称不能为空'));
  }
  if (!isValidMask(policy.mask)) {
    issues.push(new PolicyIssue('mask', 'range', '权限掩码超出范围'));
  } else if (policy.mask === 0) {
    issues.push(new PolicyIssue('mask', 'empty', '至少需要保留一项权限'));
  }
  if (policy.expiredAtSec !== Math.floor(policy.expiredAtSec) || policy.expiredAtSec < 0) {
    issues.push(new PolicyIssue('expiredAtSec', 'range', '过期时间不合法'));
  }
  if (policy.watermark.length > MAX_TEXT_LENGTH) {
    issues.push(new PolicyIssue('watermark', 'length', '水印内容过长'));
  }
  if (policy.nickname.length > MAX_TEXT_LENGTH) {
    issues.push(new PolicyIssue('nickname', 'length', '昵称过长'));
  }
  return new PolicyValidation(issues);
}

export function mergePolicies(base: DlpPolicy, override: DlpPolicy): DlpPolicy {
  let expire: number = 0;
  if (base.expiredAtSec <= 0 && override.expiredAtSec <= 0) {
    expire = 0;
  } else if (base.expiredAtSec <= 0) {
    expire = override.expiredAtSec;
  } else if (override.expiredAtSec <= 0) {
    expire = base.expiredAtSec;
  } else {
    expire = Math.min(base.expiredAtSec, override.expiredAtSec);
  }
  const watermark: string = override.watermark.length > 0 ? override.watermark : base.watermark;
  const nickname: string = override.nickname.length > 0 ? override.nickname : base.nickname;
  return new DlpPolicy(base.accountId, base.accountName, override.mask, expire, watermark, nickname);
}

export function builtInTemplates(): Array<PolicyTemplate> {
  return [
    new PolicyTemplate('read-only', 'template_read_only', DlpPermission.READ),
    new PolicyTemplate('editable', 'template_editable', DlpPermission.READ | DlpPermission.WRITE),
    new PolicyTemplate('printable', 'template_printable', DlpPermission.READ | DlpPermission.PRINT),
    new PolicyTemplate('copyable', 'template_copyable', DlpPermission.READ | DlpPermission.COPY),
    new PolicyTemplate('full', 'template_full', PERMISSION_ALL)
  ];
}

export function findTemplate(id: string): PolicyTemplate | null {
  const templates: Array<PolicyTemplate> = builtInTemplates();
  for (let index = 0; index < templates.length; index++) {
    if (templates[index].id === id) {
      return templates[index];
    }
  }
  return null;
}

export function serializePolicy(policy: DlpPolicy): string {
  const fields: Array<string> = [];
  fields.push(POLICY_VERSION);
  fields.push('accountId=' + encodeComponent(policy.accountId, false));
  fields.push('accountName=' + encodeComponent(policy.accountName, false));
  fields.push('mask=' + policy.mask.toString());
  fields.push('expire=' + policy.expiredAtSec.toString());
  fields.push('watermark=' + encodeComponent(policy.watermark, false));
  fields.push('nickname=' + encodeComponent(policy.nickname, false));
  return fields.join(';');
}

export function parsePolicy(text: string): PolicyParseResult {
  const issues: Array<PolicyIssue> = [];
  const trimmed: string = text.trim();
  if (trimmed.length === 0) {
    issues.push(new PolicyIssue('version', 'missing', '缺少策略版本'));
    return new PolicyParseResult(null, new PolicyValidation(issues));
  }
  const fields: Array<string> = trimmed.split(';');
  if (fields[0] !== POLICY_VERSION) {
    issues.push(new PolicyIssue('version', 'unsupported', '不支持的策略版本'));
    return new PolicyParseResult(null, new PolicyValidation(issues));
  }
  let accountId: string = '';
  let accountName: string = '';
  let mask: number = 0;
  let expire: number = 0;
  let watermark: string = '';
  let nickname: string = '';
  for (let index = 1; index < fields.length; index++) {
    const field: string = fields[index];
    if (field.length === 0) {
      continue;
    }
    const equalsIndex: number = field.indexOf('=');
    if (equalsIndex <= 0) {
      issues.push(new PolicyIssue('field', 'malformed', '字段格式错误'));
      continue;
    }
    const key: string = field.substring(0, equalsIndex);
    const rawValue: string = field.substring(equalsIndex + 1);
    if (key === 'accountId') {
      accountId = decodeValue(rawValue, key, issues);
    } else if (key === 'accountName') {
      accountName = decodeValue(rawValue, key, issues);
    } else if (key === 'watermark') {
      watermark = decodeValue(rawValue, key, issues);
    } else if (key === 'nickname') {
      nickname = decodeValue(rawValue, key, issues);
    } else if (key === 'mask') {
      mask = parseInteger(rawValue, 'mask', issues);
    } else if (key === 'expire') {
      expire = parseInteger(rawValue, 'expire', issues);
    }
  }
  const policy: DlpPolicy = new DlpPolicy(accountId, accountName, mask, expire, watermark, nickname);
  const validation: PolicyValidation = validatePolicy(policy);
  for (let index = 0; index < validation.issues.length; index++) {
    issues.push(validation.issues[index]);
  }
  return new PolicyParseResult(policy, new PolicyValidation(issues));
}

function decodeValue(raw: string, field: string, issues: Array<PolicyIssue>): string {
  const decoded: UriDecodeResult = decodeComponent(raw, false);
  if (!decoded.valid) {
    issues.push(new PolicyIssue(field, 'encoding', '字段编码不合法'));
  }
  return decoded.text;
}

function parseInteger(raw: string, field: string, issues: Array<PolicyIssue>): number {
  if (raw.length === 0) {
    issues.push(new PolicyIssue(field, 'empty', '数值字段为空'));
    return 0;
  }
  for (let index = 0; index < raw.length; index++) {
    const code: number = raw.charCodeAt(index);
    if (code < 0x30 || code > 0x39) {
      issues.push(new PolicyIssue(field, 'format', '数值字段格式错误'));
      return 0;
    }
  }
  return Number.parseInt(raw, 10);
}
