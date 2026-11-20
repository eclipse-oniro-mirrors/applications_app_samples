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

/** Platform boundaries shared by the controller and deterministic tests. */
import { abilityAccessCtrl, common, continueManager, Permissions } from '@kit.AbilityKit';
import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';
import { preferences } from '@kit.ArkData';

export type ContinueNativeCallback = (error: BusinessError | undefined | null,
  info: continueManager.ContinueResultInfo | undefined | null) => void;

export interface ContinueNativePort {
  on(callback: ContinueNativeCallback): void;
  off(callback: ContinueNativeCallback): void;
}

export interface LearningClock {
  now(): number;
  setTimeout(callback: () => void, delayMillis: number): number;
  clearTimeout(id: number): void;
}

export class SystemLearningClock implements LearningClock {
  public now(): number {
    return Date.now();
  }

  public setTimeout(callback: () => void, delayMillis: number): number {
    return setTimeout(callback, delayMillis);
  }

  public clearTimeout(id: number): void {
    clearTimeout(id);
  }
}

export interface LearningStore {
  getSync(key: string, defaultValue: string): Object;
  putSync(key: string, value: string): void;
  deleteSync(key: string): void;
  flushSync(): void;
}

export interface PublicEnvironment {
  apiVersion: number;
  deviceType: string;
  osFullName: string;
}

export interface LearningEnvironmentPort {
  readPublic(): PublicEnvironment;
  supportsMission(): boolean;
  checkPermission(): number;
  requestPermission(): Promise<number[]>;
}

export interface LearningDependencies {
  clock: LearningClock;
  native: ContinueNativePort;
  environment: LearningEnvironmentPort;
  openStore(): LearningStore;
}

class PlatformContinueNative implements ContinueNativePort {
  private readonly context: common.UIAbilityContext;

  constructor(context: common.UIAbilityContext) {
    this.context = context;
  }

  public on(callback: ContinueNativeCallback): void {
    continueManager.on('prepareContinue', this.context, callback);
  }

  public off(callback: ContinueNativeCallback): void {
    continueManager.off('prepareContinue', this.context, callback);
  }
}

class PlatformLearningEnvironment implements LearningEnvironmentPort {
  private readonly context: common.UIAbilityContext;
  private readonly permission: Permissions = 'ohos.permission.DISTRIBUTED_DATASYNC';

  constructor(context: common.UIAbilityContext) {
    this.context = context;
  }

  public readPublic(): PublicEnvironment {
    return {
      apiVersion: deviceInfo.sdkApiVersion,
      deviceType: deviceInfo.deviceType,
      osFullName: deviceInfo.osFullName
    };
  }

  public supportsMission(): boolean {
    return canIUse('SystemCapability.Ability.AbilityRuntime.Mission');
  }

  public checkPermission(): number {
    return abilityAccessCtrl.createAtManager().checkAccessTokenSync(this.context.applicationInfo.accessTokenId,
      this.permission);
  }

  public requestPermission(): Promise<number[]> {
    return abilityAccessCtrl.createAtManager().requestPermissionsFromUser(this.context, [this.permission])
      .then((result): number[] => result.authResults);
  }
}

export class PlatformLearningStore implements LearningStore {
  private readonly store: preferences.Preferences;

  constructor(context: common.Context, namespace: string = 'continuation_learning_text_v1') {
    if (!/^[A-Za-z0-9_-]{1,80}$/.test(namespace)) { throw new Error('Invalid Preferences namespace'); }
    this.store = preferences.getPreferencesSync(context, { name: namespace });
  }

  public getSync(key: string, defaultValue: string): Object {
    return this.store.getSync(key, defaultValue);
  }

  public putSync(key: string, value: string): void {
    this.store.putSync(key, value);
  }

  public deleteSync(key: string): void {
    this.store.deleteSync(key);
  }

  public flushSync(): void {
    this.store.flushSync();
  }
}

class PlatformLearningDependencies implements LearningDependencies {
  public readonly clock: LearningClock = new SystemLearningClock();
  public readonly native: ContinueNativePort;
  public readonly environment: LearningEnvironmentPort;
  private readonly context: common.UIAbilityContext;

  constructor(context: common.UIAbilityContext) {
    this.context = context;
    this.native = new PlatformContinueNative(context);
    this.environment = new PlatformLearningEnvironment(context);
  }

  public openStore(): LearningStore {
    return new PlatformLearningStore(this.context);
  }
}

export function platformLearningDependencies(context: common.UIAbilityContext | undefined): LearningDependencies {
  if (context === undefined) {
    throw new Error('UIAbilityContext is required when platform dependencies are used.');
  }
  return new PlatformLearningDependencies(context);
}
