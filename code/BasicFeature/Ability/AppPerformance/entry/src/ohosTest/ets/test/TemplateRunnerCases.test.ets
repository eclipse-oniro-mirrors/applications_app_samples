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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
import { AppService } from '../../../main/ets/core/AppService';
import { AppPlatform, AppStateStore, BundleSnapshot } from '../../../main/ets/core/AppPlatform';

/** 内存状态存储：真机与主机都不落盘，避免测试互相污染。 */
class FakeStore implements AppStateStore {
  private text: string = '';

  read(): string {
    return this.text;
  }

  write(value: string): Promise<void> {
    this.text = value;
    return Promise.resolve();
  }
}

class FakeBundle implements BundleSnapshot {
  public versionName: string = '1.0.0';
  /** 空模块列表让目标发现失败，流程在第一步就停下：执行路径短且确定。 */
  public modules: string[] = [];
}

/** 只提供事实、不做任何设备操作平台实现。 */
class FakePlatform implements AppPlatform {
  private store: FakeStore = new FakeStore();
  private clock: number = 1700000000000;
  private serial: number = 0;
  private timers: number = 0;
  private copied: string = '';
  private snapFlag: boolean = false;
  private rebuilds: number = 0;

  now(): number {
    return this.clock;
  }

  wallNow(): number {
    return this.clock;
  }

  randomId(): string {
    this.serial = this.serial + 1;
    return `fake-${this.serial}`;
  }

  environment(): string {
    return 'fake-device';
  }

  bundleInfo(): BundleSnapshot {
    return new FakeBundle();
  }

  listFiles(): string[] {
    return [];
  }

  readConfig(): string {
    return '';
  }

  readResource(name?: string): Promise<Uint8Array> {
    return Promise.resolve(new Uint8Array(3));
  }

  openStore(): AppStateStore {
    return this.store;
  }

  copyText(value: string): Promise<void> {
    this.copied = value;
    return Promise.resolve();
  }

  canEvictFiles(): boolean {
    return false;
  }

  canEvictModules(): boolean {
    return false;
  }

  evictFiles(targets: string[]): Promise<void> {
    return Promise.resolve();
  }

  evictModules(targets: string[]): Promise<void> {
    return Promise.resolve();
  }

  canSetSnap(): boolean {
    return true;
  }

  setSnapEnabled(flag: boolean): void {
    this.snapFlag = flag;
  }

  canRebuildSnap(): boolean {
    return true;
  }

  rebuildSnap(): void {
    this.rebuilds = this.rebuilds + 1;
  }

  setTimeout(action: () => void, delay: number): number {
    this.timers = this.timers + 1;
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

  copiedText(): string {
    return this.copied;
  }

  snapEnabled(): boolean {
    return this.snapFlag;
  }

  rebuildCount(): number {
    return this.rebuilds;
  }

  timerCount(): number {
    return this.timers;
  }
}

function serviceOf(): AppService {
  return AppService.fromPlatform(new FakePlatform());
}

export default function templateRunnerCasesTest(): void {
  describe('TemplateRunnerCases', (): void => {

    /**
     * @tc.number    SUB_PERFORMANCE_TEMPLATERUNNERCASES_2500
     * @tc.name      testTemplateRunnerCases0025
     * @tc.desc      Verify fake platform stays inert
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTemplateRunnerCases0025', 0, (): void => {
      const platform: FakePlatform = new FakePlatform();
      expect(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:176 assertFalse actual', platform.canEvictFiles())).assertFalse();
      expect(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:177 assertFalse actual', platform.canEvictModules())).assertFalse();
      expect(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:178 assertEqual actual', platform.listFiles().length)).assertEqual(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:178 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:179 assertFalse actual', platform.snapEnabled())).assertFalse();
      platform.setSnapEnabled(true);
      expect(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:181 assertTrue actual', platform.snapEnabled())).assertTrue();
      platform.rebuildSnap();
      expect(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:183 assertEqual actual', platform.rebuildCount())).assertEqual(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:183 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:184 assertEqual actual', platform.randomId())).assertEqual(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:184 assertEqual expected', 'fake-1'));
      expect(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:185 assertEqual actual', platform.randomId())).assertEqual(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:185 assertEqual expected', 'fake-2'));
      expect(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:186 assertEqual actual', platform.copiedText())).assertEqual(traceParameter('com.samples.appperformance_TemplateRunnerCases_0025 TemplateRunnerCases.test:186 assertEqual expected', ''));
    });
  });
}
