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
import { textOf } from '../core/TextCatalog';

const LOG_LEVELS: string[] = ['debug', 'info', 'warn', 'error'];
const THEMES: string[] = ['light', 'dark', 'auto'];
const MIN_PAGE_SIZE: number = 5;
const MAX_PAGE_SIZE: number = 50;

export function logLevelLabel(level: string): string {
  if (level === 'debug') {
    return textOf('dlp_level_debug');
  }
  if (level === 'info') {
    return textOf('dlp_level_info');
  }
  if (level === 'warn') {
    return textOf('dlp_level_warn');
  }
  if (level === 'error') {
    return textOf('dlp_level_error');
  }
  return textOf('dlp_level_info');
}

export function themeLabel(theme: string): string {
  if (theme === 'dark') {
    return textOf('dlp_theme_dark');
  }
  if (theme === 'auto') {
    return textOf('dlp_theme_auto');
  }
  return textOf('dlp_theme_light');
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

  validate(): string[] {
    const issues: string[] = [];
    if (LOG_LEVELS.indexOf(this.logLevel) < 0) {
      issues.push(textOf('dlp_settings_level_invalid'));
    }
    if (this.pageSize < MIN_PAGE_SIZE || this.pageSize > MAX_PAGE_SIZE) {
      issues.push(textOf('dlp_settings_pagesize_range'));
    }
    if (THEMES.indexOf(this.theme) < 0) {
      issues.push(textOf('dlp_settings_theme_invalid'));
    }
    if (this.defaultTemplateId.trim().length === 0) {
      issues.push(textOf('dlp_settings_template_empty'));
    }
    return issues;
  }

  serialize(): string {
    const fields: string[] = [];
    fields.push('logLevel=' + this.logLevel);
    fields.push('pageSize=' + this.pageSize.toString());
    fields.push('theme=' + this.theme);
    fields.push('template=' + this.defaultTemplateId);
    fields.push('confirm=' + (this.confirmBeforeDelete ? '1' : '0'));
    return fields.join(';');
  }

  summary(): string {
    return logLevelLabel(this.logLevel) + textOf('dlp_settings_summary_mid') + this.pageSize.toString() + textOf('dlp_settings_summary_tail') +
      themeLabel(this.theme);
  }

  static parse(text: string): SettingsModel {
    const model: SettingsModel = new SettingsModel();
    if (text.length === 0) {
      return model;
    }
    const fields: string[] = text.split(';');
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
