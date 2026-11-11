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

import { appMemoryOptimizer, hyperSnapManager, bundleManager, common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { fileIo } from '@kit.CoreFileKit';
import { deviceInfo, systemDateTime, pasteboard } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';
import { image } from '@kit.ImageKit';
import { logWarn } from './Logger';

export interface DecodedImage { width: number; height: number; }

export interface BundleSnapshot {
  versionName: string;
  modules: string[];
}

export interface AppStateStore {
  read(): string;
  write(value: string): Promise<void>;
}

export interface AppPlatform {
  now(): number;
  wallNow(): number;
  randomId(): string;
  environment(): string;
  bundleInfo(): BundleSnapshot;
  listFiles(): string[];
  readConfig(): string;
  readResource(name?: string): Promise<Uint8Array>;
  decodeImage?(name: string): Promise<DecodedImage>;
  openStore(): AppStateStore;
  copyText(value: string): Promise<void>;
  canEvictFiles(): boolean;
  canEvictModules(): boolean;
  evictFiles(targets: string[]): Promise<void>;
  evictModules(targets: string[]): Promise<void>;
  canSetSnap(): boolean;
  setSnapEnabled(flag: boolean): void;
  canRebuildSnap(): boolean;
  rebuildSnap(): void;
  setTimeout(action: () => void, delay: number): number;
  clearTimeout(id: number): void;
  setInterval(action: () => void, delay: number): number;
  clearInterval(id: number): void;
}

export class NativeStateStore implements AppStateStore {
  private store: preferences.Preferences;

  constructor(context: common.Context, namespace: string = 'app_performance_v2') {
    this.store = preferences.getPreferencesSync(context, { name: namespace });
  }

  read(): string {
    const value = this.store.getSync('state', '');
    return typeof value === 'string' ? value : '';
  }

  async write(value: string): Promise<void> {
    this.store.putSync('state', value);
    await this.store.flush();
  }
}

export class NativeAppPlatform implements AppPlatform {
  private context: common.UIAbilityContext;

  constructor(context: common.UIAbilityContext) {
    this.context = context;
  }

  now(): number {
    return systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
  }

  wallNow(): number {
    return Date.now();
  }

  randomId(): string {
    return util.generateRandomUUID();
  }

  environment(): string {
    return `${deviceInfo.productModel || deviceInfo.deviceType} · ${deviceInfo.osFullName}`;
  }

  bundleInfo(): BundleSnapshot {
    const info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
    return {
      versionName: info.versionName,
      modules: info.hapModulesInfo.map((module: bundleManager.HapModuleInfo): string => module.name)
    };
  }

  listFiles(): string[] {
    try {
      return fileIo.listFileSync(this.context.bundleCodeDir, { recursion: true, listNum: 4096 });
    } catch (directoryError) {
      // Installed HAPs can be readable even when the parent denies directory enumeration.
      // Offer only files proven to exist; never fabricate targets from a module name alone.
      const installed: string[] = [];
      const names = this.bundleInfo().modules;
      names.forEach((name: string): void => {
        if (!/^[A-Za-z0-9_-]+$/.test(name)) {
          return;
        }
        const filename = `${name}.hap`;
        try {
          const stat = fileIo.statSync(`${this.context.bundleCodeDir}/${filename}`);
          if (stat.isFile()) {
            installed.push(filename);
          }
        } catch (fileError) {
          // Preserve manual input for a module whose installed file is not accessible.
          logWarn(`Installed target is not accessible: ${(fileError as Error).message}`);
        }
      });
      if (installed.length === 0) {
        throw directoryError as Error;
      }
      return installed;
    }
  }

  readConfig(): string {
    const bytes = this.context.resourceManager.getRawFileContentSync('memory_optimizer.json');
    return util.TextDecoder.create('utf-8').decodeToString(bytes);
  }

  readResource(name: string = 'sample.txt'): Promise<Uint8Array> {
    // The service resolves names only from the shipped workload catalog.
    return this.context.resourceManager.getRawFileContent(name);
  }

  async decodeImage(name: string): Promise<DecodedImage> {
    if (!/^[a-z0-9_-]+\.(svg|png|jpg|webp)$/.test(name)) { throw new Error('Invalid image resource identity'); }
    const bytes = await this.readResource(name);
    if (bytes.length === 0 || bytes.length > 1048576) { throw new Error('Invalid image resource size'); }
    let source: image.ImageSource | undefined = undefined;
    let pixels: image.PixelMap | undefined = undefined;
    try {
      source = image.createImageSource(bytes.buffer);
      const info = await source.getImageInfo();
      if (info.size.width * info.size.height > 16777216) { throw new Error('Image pixel count exceeds the limit'); }
      pixels = await source.createPixelMap();
      return { width: info.size.width, height: info.size.height };
    } finally {
      try { if (pixels !== undefined) { await pixels.release(); } } catch (error) { logWarn(`Image cleanup failed: ${(error as Error).message}`); }
      try { if (source !== undefined) { await source.release(); } } catch (error) { logWarn(`Image cleanup failed: ${(error as Error).message}`); }
    }
  }

  openStore(): AppStateStore {
    return new NativeStateStore(this.context);
  }

  async copyText(value: string): Promise<void> {
    await pasteboard.getSystemPasteboard().setData(pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, value));
  }

  canEvictFiles(): boolean {
    return typeof appMemoryOptimizer.evictFilePages === 'function';
  }

  canEvictModules(): boolean {
    return typeof appMemoryOptimizer.evictModuleFilePages === 'function';
  }

  evictFiles(targets: string[]): Promise<void> {
    return appMemoryOptimizer.evictFilePages(targets);
  }

  evictModules(targets: string[]): Promise<void> {
    return appMemoryOptimizer.evictModuleFilePages(targets);
  }

  canSetSnap(): boolean {
    return typeof hyperSnapManager.setHyperSnapEnabled === 'function';
  }

  setSnapEnabled(flag: boolean): void {
    hyperSnapManager.setHyperSnapEnabled(flag);
  }

  canRebuildSnap(): boolean {
    return typeof hyperSnapManager.requestRebuildHyperSnap === 'function';
  }

  rebuildSnap(): void {
    hyperSnapManager.requestRebuildHyperSnap();
  }

  setTimeout(action: () => void, delay: number): number {
    return setTimeout(action, delay);
  }

  clearTimeout(id: number): void {
    clearTimeout(id);
  }

  setInterval(action: () => void, delay: number): number {
    return setInterval(action, delay);
  }

  clearInterval(id: number): void {
    clearInterval(id);
  }
}
