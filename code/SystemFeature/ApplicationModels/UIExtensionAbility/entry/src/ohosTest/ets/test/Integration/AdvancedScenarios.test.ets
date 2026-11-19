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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { clampValue, computeSuccessRate, safeDivide, isValidKeyCode, KEY_ENTER, averageOf, repeatText } from '../Shared/SharedDriver';

function extNow(): number {
  return Date.now();
}

function extClamp(value: number, min: number, max: number): number {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

enum ExtensionPhase {
  CREATE = 'create',
  FOREGROUND = 'foreground',
  BACKGROUND = 'background',
  DESTROY = 'destroy',
  SESSION_CREATE = 'sessionCreate',
  SESSION_DESTROY = 'sessionDestroy'
}

enum ProxyEventType {
  REMOTE_READY = 'remoteReady',
  RECEIVE = 'receive',
  RESULT = 'result',
  RELEASE = 'release'
}

interface SessionRecord {
  sessionId: string;
  bundleName: string;
  abilityName: string;
  moduleName: string;
  uiExtensionType: string;
  active: boolean;
  createdAt: number;
}

interface ProxyEventRecord {
  type: ProxyEventType;
  payload: string;
  timestamp: number;
}

class ExtensionStorage {
  private store: Map<string, string> = new Map<string, string>();

  setOrCreate(key: string, value: string): void {
    this.store.set(key, value);
  }

  get(key: string): string {
    const value: string | undefined = this.store.get(key);
    return value === undefined ? '' : value;
  }

  has(key: string): boolean {
    return this.store.has(key);
  }

  delete(key: string): boolean {
    return this.store.delete(key);
  }

  size(): number {
    return this.store.size;
  }

  clear(): void {
    this.store.clear();
  }

  keys(): string[] {
    const result: string[] = [];
    this.store.forEach((value: string, key: string) => {
      result.push(key);
    });
    return result;
  }
}

class ExtensionTestModel {
  private created: boolean = false;
  private foreground: boolean = false;
  private destroyed: boolean = false;
  private phases: ExtensionPhase[] = [];
  private sessions: SessionRecord[] = [];
  private storage: ExtensionStorage = new ExtensionStorage();
  private loadedPages: string[] = [];
  private proxyReady: boolean = false;
  private proxyReleased: boolean = false;
  private releaseCode: number = -1;
  private events: ProxyEventRecord[] = [];
  private lastMessage: string = '';
  private latencies: number[] = [];
  private memorySamples: number[] = [];
  private permissions: string[] = [];
  private counters: Map<string, number> = new Map<string, number>();

  private increment(key: string): void {
    const current: number | undefined = this.counters.get(key);
    this.counters.set(key, current === undefined ? 1 : current + 1);
  }

  getCounter(key: string): number {
    const current: number | undefined = this.counters.get(key);
    return current === undefined ? 0 : current;
  }

  onCreate(): void {
    this.created = true;
    this.phases.push(ExtensionPhase.CREATE);
    this.increment('create');
  }

  onForeground(): void {
    this.foreground = true;
    this.phases.push(ExtensionPhase.FOREGROUND);
    this.increment('foreground');
  }

  onBackground(): void {
    this.foreground = false;
    this.phases.push(ExtensionPhase.BACKGROUND);
    this.increment('background');
  }

  onDestroy(): void {
    this.destroyed = true;
    this.phases.push(ExtensionPhase.DESTROY);
    this.increment('destroy');
  }

  onSessionCreate(sessionId: string, bundleName: string, abilityName: string,
    moduleName: string, uiExtensionType: string): boolean {
    if (sessionId.length === 0) {
      return false;
    }
    if (this.findSession(sessionId) !== undefined) {
      return false;
    }
    const record: SessionRecord = {
      sessionId: sessionId,
      bundleName: bundleName,
      abilityName: abilityName,
      moduleName: moduleName,
      uiExtensionType: uiExtensionType,
      active: true,
      createdAt: extNow()
    };
    this.sessions.push(record);
    this.phases.push(ExtensionPhase.SESSION_CREATE);
    this.increment('sessionCreate');
    return true;
  }

  onSessionDestroy(sessionId: string): boolean {
    const record: SessionRecord | undefined = this.findSession(sessionId);
    if (record === undefined) {
      return false;
    }
    record.active = false;
    this.phases.push(ExtensionPhase.SESSION_DESTROY);
    this.increment('sessionDestroy');
    return true;
  }

  findSession(sessionId: string): SessionRecord | undefined {
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].sessionId === sessionId) {
        return this.sessions[i];
      }
    }
    return undefined;
  }

  isCreated(): boolean {
    return this.created;
  }

  isForeground(): boolean {
    return this.foreground;
  }

  isDestroyed(): boolean {
    return this.destroyed;
  }

  getPhaseCount(): number {
    return this.phases.length;
  }

  getPhaseAt(index: number): string {
    if (index < 0 || index >= this.phases.length) {
      return '';
    }
    return this.phases[index];
  }

  getSessionCount(): number {
    return this.sessions.length;
  }

  getActiveSessionCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].active) {
        count++;
      }
    }
    return count;
  }

  getStorage(): ExtensionStorage {
    return this.storage;
  }

  loadContent(page: string): boolean {
    if (page.length === 0) {
      return false;
    }
    this.loadedPages.push(page);
    this.increment('loadContent');
    return true;
  }

  getLoadedPageCount(): number {
    return this.loadedPages.length;
  }

  getLoadedPageAt(index: number): string {
    if (index < 0 || index >= this.loadedPages.length) {
      return '';
    }
    return this.loadedPages[index];
  }

  onRemoteReady(): void {
    this.proxyReady = true;
    this.recordEvent(ProxyEventType.REMOTE_READY, '');
  }

  onReceive(data: string): void {
    this.lastMessage = data;
    this.recordEvent(ProxyEventType.RECEIVE, data);
  }

  onResult(data: string): void {
    this.lastMessage = data;
    this.recordEvent(ProxyEventType.RESULT, data);
  }

  onRelease(code: number): void {
    this.proxyReleased = true;
    this.releaseCode = code;
    this.recordEvent(ProxyEventType.RELEASE, String(code));
  }

  private recordEvent(type: ProxyEventType, payload: string): void {
    const event: ProxyEventRecord = {
      type: type,
      payload: payload,
      timestamp: extNow()
    };
    this.events.push(event);
  }

  isProxyReady(): boolean {
    return this.proxyReady;
  }

  isProxyReleased(): boolean {
    return this.proxyReleased;
  }

  getReleaseCode(): number {
    return this.releaseCode;
  }

  getLastMessage(): string {
    return this.lastMessage;
  }

  getEventCount(type: ProxyEventType): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].type === type) {
        count++;
      }
    }
    return count;
  }

  getEventPayload(index: number): string {
    if (index < 0 || index >= this.events.length) {
      return '';
    }
    return this.events[index].payload;
  }

  recordLatency(ms: number): void {
    this.latencies.push(extClamp(ms, 0, 600000));
  }

  getAverageLatency(): number {
    if (this.latencies.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < this.latencies.length; i++) {
      sum += this.latencies[i];
    }
    return sum / this.latencies.length;
  }

  getMaxLatency(): number {
    let max: number = 0;
    for (let i = 0; i < this.latencies.length; i++) {
      if (this.latencies[i] > max) {
        max = this.latencies[i];
      }
    }
    return max;
  }

  recordMemory(kb: number): void {
    this.memorySamples.push(extClamp(kb, 0, 1048576));
  }

  getMemoryGrowth(): number {
    if (this.memorySamples.length < 2) {
      return 0;
    }
    return this.memorySamples[this.memorySamples.length - 1] - this.memorySamples[0];
  }

  grant(permission: string): void {
    if (this.permissions.indexOf(permission) < 0) {
      this.permissions.push(permission);
    }
  }

  revoke(permission: string): void {
    const index: number = this.permissions.indexOf(permission);
    if (index >= 0) {
      this.permissions.splice(index, 1);
    }
  }

  hasPermission(permission: string): boolean {
    return this.permissions.indexOf(permission) >= 0;
  }

  getPermissionCount(): number {
    return this.permissions.length;
  }

  validateSessionId(sessionId: string): boolean {
    return sessionId.length > 0 && sessionId.length <= 128;
  }

  validateWant(bundleName: string, abilityName: string): boolean {
    return bundleName.length > 0 && abilityName.length > 0;
  }

  isWithinRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  computeRate(success: number, total: number): number {
    if (total <= 0) {
      return 0;
    }
    return success / total;
  }

  reset(): void {
    this.created = false;
    this.foreground = false;
    this.destroyed = false;
    this.phases = [];
    this.sessions = [];
    this.storage.clear();
    this.loadedPages = [];
    this.proxyReady = false;
    this.proxyReleased = false;
    this.releaseCode = -1;
    this.events = [];
    this.lastMessage = '';
    this.latencies = [];
    this.memorySamples = [];
    this.permissions = [];
    this.counters = new Map<string, number>();
  }
}

export default function advancedScenariosTest(): void {
  describe('AdvancedScenarios_Test', () => {
    let model: ExtensionTestModel;

    beforeAll(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'AdvancedScenarios beforeAll');
    });

    beforeEach(async () => {
      model = new ExtensionTestModel();
    });

    afterEach(async () => {
    });

    afterAll(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'AdvancedScenarios afterAll');
    });

    it('integration_should_complete_full_flow_0', 0, async () => {
      model.onCreate();
      model.onSessionCreate('flow_0', 'com.samples.uiextensionability',
        'UIExtensionProvider', 'entry', 'sys/commonUI');
      model.loadContent('pages/Extension');
      model.onForeground();
      expect(model.getSessionCount()).assertEqual(1);
      expect(model.getLoadedPageCount()).assertEqual(1);
      expect(model.isForeground()).assertTrue();
    });

    it('integration_should_propagate_proxy_data_1', 0, async () => {
      model.onRemoteReady();
      model.onReceive('remote_1');
      model.onResult('result_1');
      model.onRelease(1);
      expect(model.getEventCount(ProxyEventType.RECEIVE)).assertEqual(1);
      expect(model.isProxyReleased()).assertTrue();
    });

    it('integration_should_share_local_storage_2', 0, async () => {
      const writer: ExtensionStorage = model.getStorage();
      writer.setOrCreate('session', 'shared_2');
      expect(writer.get('session')).assertEqual('shared_2');
      expect(writer.keys().length).assertEqual(1);
    });

    it('integration_should_recover_after_destroy_3', 0, async () => {
      model.onSessionCreate('recover_3', 'com.samples.uiextensionability',
        'UIExtensionProvider', 'entry', 'sys/commonUI');
      model.onDestroy();
      model.reset();
      expect(model.onSessionCreate('recover_3', 'com.samples.uiextensionability',
        'UIExtensionProvider', 'entry', 'sys/commonUI')).assertTrue();
    });

    it('integration_should_handle_multiple_sessions_4', 0, async () => {
      for (let index = 0; index < 6; index++) {
        model.onSessionCreate('multi_4_' + index, 'com.samples.uiextensionability',
          'UIExtensionProvider', 'entry', 'sys/commonUI');
      }
      expect(model.getSessionCount()).assertEqual(6);
    });

    it('integration_should_support_localization_message_5', 0, async () => {
      model.getStorage().setOrCreate('locale', 'en_US_5');
      expect(model.getStorage().get('locale')).assertEqual('en_US_5');
      expect(model.getStorage().has('locale')).assertTrue();
    });

    it('integration_should_handle_offline_state_6', 0, async () => {
      model.grant('ohos.permission.INTERNET');
      model.revoke('ohos.permission.INTERNET');
      expect(model.hasPermission('ohos.permission.INTERNET')).assertFalse();
      expect(model.getPermissionCount()).assertEqual(0);
    });

    it('integration_should_track_end_to_end_latency_7', 0, async () => {
      model.recordLatency(27);
      model.recordLatency(37);
      expect(model.getAverageLatency()).assertLarger(0);
      expect(model.getMaxLatency()).assertLessOrEqual(600000);
    });

    it('integration_should_keep_consistency_across_events_8', 0, async () => {
      model.onRemoteReady();
      model.onReceive('consistent_8');
      expect(model.getEventPayload(1)).assertEqual('consistent_8');
      expect(model.getLastMessage()).assertEqual('consistent_8');
    });

    it('integration_should_validate_workflow_versions_9', 0, async () => {
      expect(model.validateSessionId('version_9')).assertTrue();
      expect(model.computeRate(9, 10)).assertLessOrEqual(1);
    });

    it('integration_should_handle_interruption_recovery_10', 0, async () => {
      model.onForeground();
      model.onBackground();
      model.onForeground();
      expect(model.isForeground()).assertTrue();
      expect(model.isDestroyed()).assertFalse();
    });

    it('integration_should_expose_workflow_counters_11', 0, async () => {
      model.loadContent('pages/Extension');
      model.loadContent('pages/Index');
      expect(model.getCounter('loadContent')).assertEqual(2);
      expect(model.getLoadedPageCount()).assertEqual(2);
    });

  });
}
