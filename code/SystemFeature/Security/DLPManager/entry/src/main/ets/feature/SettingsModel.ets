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

const LOG_LEVELS: Array<string> = ['debug', 'info', 'warn', 'error'];
const THEMES: Array<string> = ['light', 'dark', 'auto'];
const MIN_PAGE_SIZE: number = 5;
const MAX_PAGE_SIZE: number = 50;

export function logLevelLabel(level: string): string {
  if (level === 'debug') {
    return '调试';
  }
  if (level === 'info') {
    return '信息';
  }
  if (level === 'warn') {
    return '警告';
  }
  if (level === 'error') {
    return '错误';
  }
  return '信息';
}

export function themeLabel(theme: string): string {
  if (theme === 'dark') {
    return '深色';
  }
  if (theme === 'auto') {
    return '跟随系统';
  }
  return '浅色';
}

export class SettingsModel {
  public logLevel: string = 'info';
  public pageSize: number = 10;
  public theme: string = 'light';
  public defaultTemplateId: string = 'read-only';
  public confirmBeforeDelete: boolean = true;

  static createDefault(): SettingsModel {
    return new SettingsModel();
  }

  setLogLevel(level: string): boolean {
    if (LOG_LEVELS.indexOf(level) < 0) {
      return false;
    }
    this.logLevel = level;
    return true;
  }

  setPageSize(size: number): number {
    if (size < MIN_PAGE_SIZE) {
      this.pageSize = MIN_PAGE_SIZE;
    } else if (size > MAX_PAGE_SIZE) {
      this.pageSize = MAX_PAGE_SIZE;
    } else {
      this.pageSize = Math.floor(size);
    }
    return this.pageSize;
  }

  setTheme(theme: string): boolean {
    if (THEMES.indexOf(theme) < 0) {
      return false;
    }
    this.theme = theme;
    return true;
  }

  setDefaultTemplate(templateId: string): boolean {
    if (templateId.trim().length === 0) {
      return false;
    }
    this.defaultTemplateId = templateId;
    return true;
  }

  setConfirmBeforeDelete(confirm: boolean): void {
    this.confirmBeforeDelete = confirm;
  }

  reset(): void {
    this.logLevel = 'info';
    this.pageSize = 10;
    this.theme = 'light';
    this.defaultTemplateId = 'read-only';
    this.confirmBeforeDelete = true;
  }

  validate(): Array<string> {
    const issues: Array<string> = [];
    if (LOG_LEVELS.indexOf(this.logLevel) < 0) {
      issues.push('日志级别不合法');
    }
    if (this.pageSize < MIN_PAGE_SIZE || this.pageSize > MAX_PAGE_SIZE) {
      issues.push('每页数量超出范围');
    }
    if (THEMES.indexOf(this.theme) < 0) {
      issues.push('主题设置不合法');
    }
    if (this.defaultTemplateId.trim().length === 0) {
      issues.push('默认权限模板不能为空');
    }
    return issues;
  }

  serialize(): string {
    const fields: Array<string> = [];
    fields.push('logLevel=' + this.logLevel);
    fields.push('pageSize=' + this.pageSize.toString());
    fields.push('theme=' + this.theme);
    fields.push('template=' + this.defaultTemplateId);
    fields.push('confirm=' + (this.confirmBeforeDelete ? '1' : '0'));
    return fields.join(';');
  }

  summary(): string {
    return logLevelLabel(this.logLevel) + ' · 每页 ' + this.pageSize.toString() + ' 条 · ' +
      themeLabel(this.theme);
  }

  static parse(text: string): SettingsModel {
    const model: SettingsModel = new SettingsModel();
    if (text.length === 0) {
      return model;
    }
    const fields: Array<string> = text.split(';');
    for (let index = 0; index < fields.length; index++) {
      const field: string = fields[index];
      const equalsIndex: number = field.indexOf('=');
      if (equalsIndex <= 0) {
        continue;
      }
      const key: string = field.substring(0, equalsIndex);
      const value: string = field.substring(equalsIndex + 1);
      if (key === 'logLevel') {
        model.setLogLevel(value);
      } else if (key === 'pageSize') {
        const size: number = Number.parseInt(value, 10);
        if (Number.isFinite(size)) {
          model.setPageSize(size);
        }
      } else if (key === 'theme') {
        model.setTheme(value);
      } else if (key === 'template') {
        model.setDefaultTemplate(value);
      } else if (key === 'confirm') {
        model.setConfirmBeforeDelete(value === '1');
      }
    }
    return model;
  }
}
