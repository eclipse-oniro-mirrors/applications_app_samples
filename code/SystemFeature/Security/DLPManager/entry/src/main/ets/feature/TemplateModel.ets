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

import { DlpPolicy, PERMISSION_ALL, PolicyTemplate, builtInTemplates, defaultPolicy, isValidMask,
  permissionSummary } from '../core/DlpPolicyCore';
import { encodeComponent, decodeComponent, UriDecodeResult } from '../core/UriCore';
import { textOf } from '../core/TextCatalog';

const MAX_NAME_LENGTH: number = 20;

export class CustomTemplate {
  public readonly id: string;
  public readonly name: string;
  public readonly mask: number;
  public readonly createdAtSec: number;

  constructor(id: string, name: string, mask: number, createdAtSec: number) {
    this.id = id;
    this.name = name;
    this.mask = mask;
    this.createdAtSec = createdAtSec;
  }
}

export class TemplateResult {
  public readonly ok: boolean;
  public readonly id: string;
  public readonly message: string;

  constructor(ok: boolean, id: string, message: string) {
    this.ok = ok;
    this.id = id;
    this.message = message;
  }
}

export function templateDisplayName(template: PolicyTemplate): string {
  if (template.id === 'read-only') {
    return textOf('dlp_template_read_only');
  }
  if (template.id === 'editable') {
    return textOf('dlp_template_editable');
  }
  if (template.id === 'printable') {
    return textOf('dlp_template_printable');
  }
  if (template.id === 'copyable') {
    return textOf('dlp_template_copyable');
  }
  if (template.id === 'full') {
    return textOf('dlp_template_full_control');
  }
  return template.nameKey;
}

export class TemplateModel {
  private customs: CustomTemplate[] = [];

  setCustoms(items: CustomTemplate[]): void {
    this.customs = [];
    for (let index = 0; index < items.length; index++) {
      this.customs.push(items[index]);
    }
  }

  customTemplates(): CustomTemplate[] {
    return this.customs;
  }

  allTemplates(): PolicyTemplate[] {
    const result: PolicyTemplate[] = [];
    const builtIn: PolicyTemplate[] = builtInTemplates();
    for (let index = 0; index < builtIn.length; index++) {
      result.push(builtIn[index]);
    }
    for (let index = 0; index < this.customs.length; index++) {
      const custom: CustomTemplate = this.customs[index];
      result.push(new PolicyTemplate(custom.id, custom.name, custom.mask));
    }
    return result;
  }

  customCount(): number {
    return this.customs.length;
  }

  totalCount(): number {
    return builtInTemplates().length + this.customs.length;
  }

  find(id: string): CustomTemplate | null {
    for (let index = 0; index < this.customs.length; index++) {
      if (this.customs[index].id === id) {
        return this.customs[index];
      }
    }
    return null;
  }

  validateName(name: string, exceptId: string): string {
    const trimmed: string = name.trim();
    if (trimmed.length === 0) {
      return textOf('dlp_template_name_empty');
    }
    if (trimmed.length > MAX_NAME_LENGTH) {
      return textOf('dlp_template_name_too_long');
    }
    for (let index = 0; index < this.customs.length; index++) {
      const existing: CustomTemplate = this.customs[index];
      if (existing.id !== exceptId && existing.name.toLowerCase() === trimmed.toLowerCase()) {
        return textOf('dlp_template_name_exists');
      }
    }
    return '';
  }

  validateMask(mask: number): string {
    if (!isValidMask(mask) || mask === 0) {
      return textOf('dlp_template_mask_empty');
    }
    if (mask > PERMISSION_ALL) {
      return textOf('dlp_template_mask_range');
    }
    return '';
  }

  add(name: string, mask: number, nowSec: number): TemplateResult {
    const nameError: string = this.validateName(name, '');
    if (nameError.length > 0) {
      return new TemplateResult(false, '', nameError);
    }
    const maskError: string = this.validateMask(mask);
    if (maskError.length > 0) {
      return new TemplateResult(false, '', maskError);
    }
    const id: string = this.nextId(nowSec);
    this.customs.push(new CustomTemplate(id, name.trim(), mask, nowSec));
    return new TemplateResult(true, id, textOf('dlp_template_created'));
  }

  update(id: string, name: string, mask: number): TemplateResult {
    const index: number = this.indexOf(id);
    if (index < 0) {
      return new TemplateResult(false, '', textOf('dlp_template_not_found'));
    }
    const nameError: string = this.validateName(name, id);
    if (nameError.length > 0) {
      return new TemplateResult(false, '', nameError);
    }
    const maskError: string = this.validateMask(mask);
    if (maskError.length > 0) {
      return new TemplateResult(false, '', maskError);
    }
    const previous: CustomTemplate = this.customs[index];
    this.customs[index] = new CustomTemplate(previous.id, name.trim(), mask, previous.createdAtSec);
    return new TemplateResult(true, id, textOf('dlp_template_updated'));
  }

  remove(id: string): boolean {
    const index: number = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    this.customs.splice(index, 1);
    return true;
  }

  maskOf(templateId: string): number {
    const all: PolicyTemplate[] = this.allTemplates();
    for (let index = 0; index < all.length; index++) {
      if (all[index].id === templateId) {
        return all[index].mask;
      }
    }
    return -1;
  }

  toPolicy(accountId: string, accountName: string, templateId: string): DlpPolicy | null {
    const mask: number = this.maskOf(templateId);
    if (mask <= 0) {
      return null;
    }
    const policy: DlpPolicy = defaultPolicy(accountId, accountName);
    policy.mask = mask & PERMISSION_ALL;
    return policy;
  }

  summaryOf(templateId: string): string {
    const mask: number = this.maskOf(templateId);
    if (mask <= 0) {
      return textOf('dlp_perm_none');
    }
    return permissionSummary(mask);
  }

  serialize(): string {
    const lines: string[] = [];
    for (let index = 0; index < this.customs.length; index++) {
      const custom: CustomTemplate = this.customs[index];
      lines.push(encodeComponent(custom.id, false) + '|' + encodeComponent(custom.name, false) + '|' +
        custom.mask.toString() + '|' + custom.createdAtSec.toString());
    }
    return lines.join('\n');
  }

  private indexOf(id: string): number {
    for (let index = 0; index < this.customs.length; index++) {
      if (this.customs[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  private nextId(nowSec: number): string {
    const base: string = 'custom-' + nowSec.toString();
    let candidate: string = base;
    let suffix: number = 1;
    while (this.indexOf(candidate) >= 0) {
      suffix += 1;
      candidate = base + '-' + suffix.toString();
    }
    return candidate;
  }
}

export function parseTemplateText(text: string): TemplateModel {
  const model: TemplateModel = new TemplateModel();
  if (text.length === 0) {
    return model;
  }
  const lines: string[] = text.split('\n');
  const items: CustomTemplate[] = [];
  for (let index = 0; index < lines.length; index++) {
    const fields: string[] = lines[index].split('|');
    if (fields.length !== 4) {
      continue;
    }
    const idResult: UriDecodeResult = decodeComponent(fields[0], false);
    const nameResult: UriDecodeResult = decodeComponent(fields[1], false);
    const mask: number = Number.parseInt(fields[2], 10);
    const created: number = Number.parseInt(fields[3], 10);
    if (idResult.text.length === 0 || nameResult.text.length === 0 || !Number.isFinite(mask) ||
      !Number.isFinite(created)) {
      continue;
    }
    items.push(new CustomTemplate(idResult.text, nameResult.text, mask, created));
  }
  model.setCustoms(items);
  return model;
}
