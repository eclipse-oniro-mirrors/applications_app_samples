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

/**
 * Typed mirror of the app.json5 content used by the sample.
 */
export interface AppConfig {
  bundleName: string;
  vendor: string;
  versionCode: number;
  versionName: string;
  icon: string;
  label: string;
}

/**
 * Typed mirror of one skills entry declared by an ability.
 */
export interface SkillConfig {
  entities: string[];
  actions: string[];
  uris: UriConfig[];
}

/**
 * Typed mirror of one uri entry declared inside a skill.
 */
export interface UriConfig {
  scheme: string;
  host: string;
  path: string;
}

/**
 * Typed mirror of one ability declared in module.json5.
 */
export interface AbilityConfig {
  name: string;
  srcEntry: string;
  description: string;
  icon: string;
  label: string;
  startWindowIcon: string;
  startWindowBackground: string;
  exported: boolean;
  launchType: string;
  orientation: string;
  skills: SkillConfig[];
}

/**
 * Typed mirror of one preload entry declared by atomicService.
 */
export interface PreloadConfig {
  moduleName: string;
}

/**
 * Typed mirror of the atomicService block declared in module.json5.
 */
export interface AtomicServiceConfig {
  preloads: PreloadConfig[];
  resizeable: boolean;
}

/**
 * Typed mirror of one extensionAbility declared in module.json5.
 */
export interface ExtensionAbilityConfig {
  name: string;
  srcEntry: string;
  type: string;
  exported: boolean;
}

/**
 * Typed mirror of module.json5 content.
 */
export interface ModuleConfig {
  name: string;
  type: string;
  description: string;
  mainElement: string;
  deviceTypes: string[];
  deliveryWithInstall: boolean;
  installationFree: boolean;
  pages: string;
  abilities: AbilityConfig[];
  extensionAbilities: ExtensionAbilityConfig[];
  atomicService: AtomicServiceConfig | null;
}

/**
 * Bundle level snapshot composed of app.json5 and all module.json5 files.
 */
export interface BundleSnapshot {
  app: AppConfig;
  modules: ModuleConfig[];
}
