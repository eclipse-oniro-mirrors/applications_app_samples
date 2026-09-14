/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


// ===== use_esm_not_commonjs =====
// [Start use_esm_not_commonjs]
// 使用ES模块import代替CommonJS require
import { createProduct } from '../common/Service';
// [End use_esm_not_commonjs]

// ===== rename_import_alternative =====
// [Start rename_import_alternative]
import { version as riaVer } from '../common/Config';

console.info(`${riaVer}`); // 1.0
// [End rename_import_alternative]

// ===== empty_export =====
// [Start empty_export]
export {}
// [End empty_export]

// ===== named_export =====
// [Start named_export]
export const MAX_RETRY_COUNT: number = 3;

export let currentUserName: string = '';

export interface RequestConfig {
  url: string;
  timeout: number;
}

export type RequestStatus = 'idle' | 'loading' | 'success' | 'failed';

export function buildUrl(baseUrl: string, path: string): string {
  return baseUrl + path;
}

export class RequestTracker {
  private status: RequestStatus = 'idle';

  setStatus(status: RequestStatus): void {
    this.status = status;
  }

  getStatus(): RequestStatus {
    return this.status;
  }
}
// [End named_export]

// ===== export_list =====
// [Start export_list]
const DEFAULT_TIMEOUT: number = 5000;

interface ApiConfig {
  host: string;
  timeout: number;
}

function createApiConfig(host: string): ApiConfig {
  return {
    host: host,
    timeout: DEFAULT_TIMEOUT
  };
}

export { ApiConfig, DEFAULT_TIMEOUT, createApiConfig };
// [End export_list]

// ===== export_rename =====
// [Start export_rename]
class InternalUserService {
  getName(): string {
    return 'UserService';
  }
}

export { InternalUserService as RenamedUserService };
// [End export_rename]

// ===== dynamic_import =====
// [Start dynamic_import]
async function loadFeatureLabel(): Promise<string> {
  let moduleObject = await import('../common/Feature');
  return moduleObject.getFeatureLabel();
}
// [End dynamic_import]

// ===== conditional_dynamic_import =====
// [Start conditional_dynamic_import]
async function loadByName(name: string): Promise<string> {
  if (name === 'profile') {
    let profileModule = await import('../common/ProfileFeature');
    return profileModule.getProfileLabel();
  }

  if (name === 'settings') {
    let settingsModule = await import('../common/SettingsFeature');
    return settingsModule.getSettingsLabel();
  }

  return 'unknown';
}
// [End conditional_dynamic_import]

// ===== barrel_file_reexport =====
// [Start barrel_file_reexport]
export { User } from '../common/Types';
export { UserService } from '../common/Service';
// [End barrel_file_reexport]

// ===== module_definition =====
// [Start module_definition]
export interface Product {
  id: number;
  name: string;
}

export class ProductService {
  getName(product: Product): string {
    return product.name;
  }
}
// [End module_definition]

// ===== module_private_state =====
// [Start module_private_state]
let initialized: boolean = false;

export function initializeLogger(): void {
  initialized = true;
}

export function isLoggerInitialized(): boolean {
  return initialized;
}
// [End module_private_state]

// ===== domain_based_organization =====
// [Start domain_based_organization]
// 推荐：按领域聚合
// product/index.ts
// order/index.ts
// [End domain_based_organization]


// ===== top_level_statements =====
// [Start top_level_statements]
// 模块顶层语句
let appConfig: string = 'production';
const MAX_RETRIES: number = 3;

function logConfig(): void {
  console.info(`Config: ${appConfig}, Retries: ${MAX_RETRIES}`);
}

// 顶层表达式
console.info('Module loaded');
logConfig();
// [End top_level_statements]

// ===== export_import_default_class =====
// [Start export_import_default_class]
export default class EidcCalculator {
  add(a: number, b: number): number {
    return a + b;
  }
}

let eidcCalc: EidcCalculator = new EidcCalculator();
console.info(`${eidcCalc.add(1, 2)}`); // 3
// [End export_import_default_class]
