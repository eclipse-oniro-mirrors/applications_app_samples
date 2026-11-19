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

import type { AppConfig, BundleSnapshot, ModuleConfig } from './ConfigModels';

/**
 * Serializer used to verify that the typed configuration model survives JSON round trips.
 */
export class ConfigSerializer {
  /**
   * Serializes a bundle snapshot into JSON text.
   */
  public static serialize(snapshot: BundleSnapshot): string {
    return JSON.stringify(snapshot);
  }

  /**
   * Serializes an application configuration into JSON text.
   */
  public static serializeApp(config: AppConfig): string {
    return JSON.stringify(config);
  }

  /**
   * Serializes a module configuration into JSON text.
   */
  public static serializeModule(moduleConfig: ModuleConfig): string {
    return JSON.stringify(moduleConfig);
  }

  /**
   * Parses a bundle snapshot from JSON text, returning null when invalid.
   */
  public static deserialize(text: string): BundleSnapshot | null {
    if (text === undefined || text === null || text.trim().length === 0) {
      return null;
    }
    try {
      const parsed: BundleSnapshot = JSON.parse(text) as BundleSnapshot;
      if (!ConfigSerializer.isSnapshot(parsed)) {
        return null;
      }
      return parsed;
    } catch (error) {
      return null;
    }
  }

  /**
   * Parses an application configuration from JSON text, returning null when invalid.
   */
  public static deserializeApp(text: string): AppConfig | null {
    if (text === undefined || text === null || text.trim().length === 0) {
      return null;
    }
    try {
      const parsed: AppConfig = JSON.parse(text) as AppConfig;
      if (!ConfigSerializer.isAppConfig(parsed)) {
        return null;
      }
      return parsed;
    } catch (error) {
      return null;
    }
  }

  /**
   * Parses a module configuration from JSON text, returning null when invalid.
   */
  public static deserializeModule(text: string): ModuleConfig | null {
    if (text === undefined || text === null || text.trim().length === 0) {
      return null;
    }
    try {
      const parsed: ModuleConfig = JSON.parse(text) as ModuleConfig;
      if (!ConfigSerializer.isModuleConfig(parsed)) {
        return null;
      }
      return parsed;
    } catch (error) {
      return null;
    }
  }

  /**
   * Returns true when the snapshot survives a JSON round trip unchanged.
   */
  public static roundTripEquals(snapshot: BundleSnapshot): boolean {
    const text: string = ConfigSerializer.serialize(snapshot);
    const parsed: BundleSnapshot | null = ConfigSerializer.deserialize(text);
    if (parsed === null) {
      return false;
    }
    return ConfigSerializer.serialize(parsed) === text;
  }

  /**
   * Returns true when the application configuration survives a JSON round trip.
   */
  public static appRoundTripEquals(config: AppConfig): boolean {
    const text: string = ConfigSerializer.serializeApp(config);
    const parsed: AppConfig | null = ConfigSerializer.deserializeApp(text);
    if (parsed === null) {
      return false;
    }
    return ConfigSerializer.serializeApp(parsed) === text;
  }

  /**
   * Returns true when the module configuration survives a JSON round trip.
   */
  public static moduleRoundTripEquals(moduleConfig: ModuleConfig): boolean {
    const text: string = ConfigSerializer.serializeModule(moduleConfig);
    const parsed: ModuleConfig | null = ConfigSerializer.deserializeModule(text);
    if (parsed === null) {
      return false;
    }
    return ConfigSerializer.serializeModule(parsed) === text;
  }

  /**
   * Returns the serialized length of a snapshot in characters.
   */
  public static serializedLength(snapshot: BundleSnapshot): number {
    return ConfigSerializer.serialize(snapshot).length;
  }

  /**
   * Returns true when the serialized snapshot contains the requested key.
   */
  public static containsKey(snapshot: BundleSnapshot, key: string): boolean {
    return ConfigSerializer.serialize(snapshot).indexOf(`"${key}"`) >= 0;
  }

  /**
   * Returns true when the text looks like a serialized bundle snapshot.
   */
  public static isSnapshot(value: BundleSnapshot): boolean {
    if (value === undefined || value === null) {
      return false;
    }
    if (value.app === undefined || value.app === null) {
      return false;
    }
    if (!ConfigSerializer.isAppConfig(value.app)) {
      return false;
    }
    if (value.modules === undefined || value.modules === null || !Array.isArray(value.modules)) {
      return false;
    }
    for (let index: number = 0; index < value.modules.length; index++) {
      if (!ConfigSerializer.isModuleConfig(value.modules[index])) {
        return false;
      }
    }
    return true;
  }

  /**
   * Returns true when the value looks like an application configuration.
   */
  public static isAppConfig(value: AppConfig): boolean {
    if (value === undefined || value === null) {
      return false;
    }
    return typeof value.bundleName === 'string' && typeof value.vendor === 'string' &&
      typeof value.versionCode === 'number' && typeof value.versionName === 'string' &&
      typeof value.icon === 'string' && typeof value.label === 'string';
  }

  /**
   * Returns true when the value looks like a module configuration.
   */
  public static isModuleConfig(value: ModuleConfig): boolean {
    if (value === undefined || value === null) {
      return false;
    }
    if (typeof value.name !== 'string' || typeof value.type !== 'string') {
      return false;
    }
    if (typeof value.description !== 'string' || typeof value.mainElement !== 'string') {
      return false;
    }
    if (!Array.isArray(value.deviceTypes) || !Array.isArray(value.abilities)) {
      return false;
    }
    if (typeof value.deliveryWithInstall !== 'boolean' || typeof value.installationFree !== 'boolean') {
      return false;
    }
    return typeof value.pages === 'string';
  }

  /**
   * Builds a minimal serialized snapshot with the requested module name.
   */
  public static minimalSnapshotText(moduleName: string): string {
    return `{"app":{"bundleName":"com.example.moduleconfigurationfile04","vendor":"example","versionCode":1000000,` +
      `"versionName":"1.0.0","icon":"$media:layered_image","label":"$string:app_name"},` +
      `"modules":[{"name":"${moduleName}","type":"entry","description":"$string:module_desc",` +
      `"mainElement":"EntryAbility","deviceTypes":["tablet"],"deliveryWithInstall":true,` +
      `"installationFree":false,"pages":"$profile:main_pages","abilities":[],"extensionAbilities":[],` +
      `"atomicService":null}]}`;
  }
}
