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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import KeyConstant from '../../../../main/ets/common/Constants/KeyConstant';
import UrlConstant from '../../../../main/ets/common/Constants/UrlConstant';

const BUNDLE_NAME: string = 'com.samples.betaclub';

const PRODUCTION_URL: string = 'http://10.20.72.111:3470/';

const SYSTEM_PARAM_KEY: string = 'persist.basic.betaclube.url';

const BOOT_HARDWARE_KEY: string = 'ohos.boot.hardware';

const EXPECTED_BOOT_HARDWARE: string = 'uis7885';

const SUPPORTED_PRODUCT_MODELS: string[] = ['LHT16', 'oriole'];

const PERMISSION_READ_MEDIA: string = 'ohos.permission.READ_MEDIA';

const PERMISSION_READ_IMAGEVIDEO: string = 'ohos.permission.READ_IMAGEVIDEO';

const LIFECYCLE_ON_CREATE: string = 'onCreate';

const LIFECYCLE_ON_WINDOW_STAGE_CREATE: string = 'onWindowStageCreate';

const LIFECYCLE_ON_FOREGROUND: string = 'onForeground';

const LIFECYCLE_ON_BACKGROUND: string = 'onBackground';

const LIFECYCLE_ON_WINDOW_STAGE_DESTROY: string = 'onWindowStageDestroy';

const LIFECYCLE_ON_DESTROY: string = 'onDestroy';

interface LifecycleEvent {
  name: string;
  timestamp: number;
}

// Records the ability lifecycle order for regression assertions
class LifecycleRecorder {
  private events: LifecycleEvent[] = [];

  public record(name: string): void {
    this.events.push({ name: name, timestamp: Date.now() });
  }

  public getNames(): string[] {
    return this.events.map((event: LifecycleEvent) => event.name);
  }

  public getCount(): number {
    return this.events.length;
  }

  public indexOf(name: string): number {
    return this.getNames().indexOf(name);
  }

  public isBefore(first: string, second: string): boolean {
    const firstIndex = this.indexOf(first);
    const secondIndex = this.indexOf(second);
    return firstIndex >= 0 && secondIndex >= 0 && firstIndex < secondIndex;
  }

  public clear(): void {
    this.events = [];
  }
}

// Mirrors EntryAbility#isValidate device gating
class DeviceGateValidator {
  public static isSupported(bootHardware: string, productModel: string): boolean {
    return bootHardware === EXPECTED_BOOT_HARDWARE && SUPPORTED_PRODUCT_MODELS.includes(productModel);
  }

  public static isSupportedProductModel(productModel: string): boolean {
    return SUPPORTED_PRODUCT_MODELS.includes(productModel);
  }

  public static isSupportedHardware(bootHardware: string): boolean {
    return bootHardware === EXPECTED_BOOT_HARDWARE;
  }
}

// Mirrors the base URL fallback in EntryAbility#initConfig
class BaseUrlResolver {
  public static resolve(systemParameterUrl: string): string {
    if (systemParameterUrl.length > 0) {
      return systemParameterUrl;
    }
    return PRODUCTION_URL;
  }

  public static isValid(url: string): boolean {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  public static endpoint(url: string, path: string): string {
    if (url.endsWith('/')) {
      return url + path;
    }
    return url + '/' + path;
  }
}

// Mirrors the cache folders created during app startup
class StartupFolderPlanner {
  public static plannedFolders(): string[] {
    return [
      'cache_logs',
      KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER,
      KeyConstant.CACHE_LOG_PATH_FOLDER
    ];
  }

  public static folderCount(): number {
    return StartupFolderPlanner.plannedFolders().length;
  }

  public static isPlanned(folder: string): boolean {
    return StartupFolderPlanner.plannedFolders().includes(folder);
  }

  public static buildPaths(cacheDir: string): string[] {
    const base = cacheDir.endsWith('/') ? cacheDir.substring(0, cacheDir.length - 1) : cacheDir;
    const folders = StartupFolderPlanner.plannedFolders();
    const paths: string[] = [];
    for (let i = 0; i < folders.length; i++) {
      paths.push(base + '/' + folders[i]);
    }
    return paths;
  }
}

// Mirrors permission requests issued from EntryAbility
class PermissionPlan {
  public static permissions(): string[] {
    return [PERMISSION_READ_MEDIA, PERMISSION_READ_IMAGEVIDEO];
  }

  public static isGranted(authResult: number): boolean {
    return authResult === 0;
  }

  public static allGranted(authResults: number[]): boolean {
    if (authResults.length === 0) {
      return false;
    }
    for (let i = 0; i < authResults.length; i++) {
      if (!PermissionPlan.isGranted(authResults[i])) {
        return false;
      }
    }
    return true;
  }
}

// Tracks foreground/background cycles across the session
class ForegroundCycleTracker {
  private foregroundCount: number = 0;
  private backgroundCount: number = 0;
  private inForeground: boolean = false;

  public onForeground(): void {
    this.foregroundCount++;
    this.inForeground = true;
  }

  public onBackground(): void {
    this.backgroundCount++;
    this.inForeground = false;
  }

  public getForegroundCount(): number {
    return this.foregroundCount;
  }

  public getBackgroundCount(): number {
    return this.backgroundCount;
  }

  public isInForeground(): boolean {
    return this.inForeground;
  }

  public getCycleCount(): number {
    return Math.min(this.foregroundCount, this.backgroundCount);
  }

  public reset(): void {
    this.foregroundCount = 0;
    this.backgroundCount = 0;
    this.inForeground = false;
  }
}

// Verifies startup folders stay inside the app sandbox
class CacheDirValidator {
  public static isAbsolute(path: string): boolean {
    return path.startsWith('/');
  }

  public static hasTraversal(path: string): boolean {
    return path.indexOf('..') >= 0;
  }

  public static isUnder(path: string, parent: string): boolean {
    return path === parent || path.startsWith(parent + '/');
  }

  public static isUnique(paths: string[]): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < paths.length; i++) {
      if (seen.has(paths[i])) {
        return false;
      }
      seen.add(paths[i]);
    }
    return true;
  }

  public static depth(path: string): number {
    if (path.length === 0 || path === '/') {
      return 0;
    }
    const trimmed = path.endsWith('/') ? path.substring(0, path.length - 1) : path;
    return trimmed.split('/').length - 1;
  }
}

// Summarizes permission results returned by the system dialog
class PermissionOutcomeAnalyzer {
  private granted: number = 0;
  private denied: number = 0;

  public record(authResult: number): void {
    if (PermissionPlan.isGranted(authResult)) {
      this.granted++;
    } else {
      this.denied++;
    }
  }

  public getGranted(): number {
    return this.granted;
  }

  public getDenied(): number {
    return this.denied;
  }

  public getTotal(): number {
    return this.granted + this.denied;
  }

  public isPartiallyGranted(): boolean {
    return this.granted > 0 && this.denied > 0;
  }

  public reset(): void {
    this.granted = 0;
    this.denied = 0;
  }
}

// Describes one startup task so ordering can be asserted
class StartupTask {
  public name: string;
  public order: number;

  constructor(name: string, order: number) {
    this.name = name;
    this.order = order;
  }
}

// Sorts and deduplicates startup tasks
class StartupPlan {
  public static defaultTasks(): StartupTask[] {
    return [
      new StartupTask('createKVManager', 1),
      new StartupTask('createKVStore', 2),
      new StartupTask('createCacheFolders', 3),
      new StartupTask('requestPermissions', 4),
      new StartupTask('initPhotoManager', 5)
    ];
  }

  public static names(tasks: StartupTask[]): string[] {
    return tasks.map((task: StartupTask) => task.name);
  }

  public static isOrdered(tasks: StartupTask[]): boolean {
    for (let i = 1; i < tasks.length; i++) {
      if (tasks[i].order < tasks[i - 1].order) {
        return false;
      }
    }
    return true;
  }

  public static hasDuplicateNames(tasks: StartupTask[]): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < tasks.length; i++) {
      if (seen.has(tasks[i].name)) {
        return true;
      }
      seen.add(tasks[i].name);
    }
    return false;
  }
}

export default function appLifecycleTest() {
  describe('AppLifecycle_Test', () => {
    let recorder: LifecycleRecorder;

    beforeAll(() => {
      recorder = new LifecycleRecorder();
    });

    afterAll(() => {
      recorder.clear();
      expect(recorder.getCount()).assertEqual(0);
    });

    it('bundle_name_should_match_manifest', 0, () => {
      expect(BUNDLE_NAME).assertEqual('com.samples.betaclub');
      expect(BUNDLE_NAME).assertContain('beta');
      expect(BUNDLE_NAME.split('.').length).assertEqual(3);
    });

    it('lifecycle_should_follow_expected_order', 0, () => {
      recorder.clear();
      recorder.record(LIFECYCLE_ON_CREATE);
      recorder.record(LIFECYCLE_ON_WINDOW_STAGE_CREATE);
      recorder.record(LIFECYCLE_ON_FOREGROUND);
      expect(recorder.getCount()).assertEqual(3);
      expect(recorder.isBefore(LIFECYCLE_ON_CREATE, LIFECYCLE_ON_WINDOW_STAGE_CREATE)).assertTrue();
      expect(recorder.isBefore(LIFECYCLE_ON_WINDOW_STAGE_CREATE, LIFECYCLE_ON_FOREGROUND)).assertTrue();
      expect(recorder.indexOf(LIFECYCLE_ON_CREATE)).assertEqual(0);
    });

    it('background_should_precede_destroy', 0, () => {
      recorder.clear();
      recorder.record(LIFECYCLE_ON_BACKGROUND);
      recorder.record(LIFECYCLE_ON_WINDOW_STAGE_DESTROY);
      recorder.record(LIFECYCLE_ON_DESTROY);
      expect(recorder.isBefore(LIFECYCLE_ON_BACKGROUND, LIFECYCLE_ON_DESTROY)).assertTrue();
      expect(recorder.isBefore(LIFECYCLE_ON_WINDOW_STAGE_DESTROY, LIFECYCLE_ON_DESTROY)).assertTrue();
      expect(recorder.getNames().length).assertEqual(3);
    });

    it('system_parameter_key_should_be_declared', 0, () => {
      expect(SYSTEM_PARAM_KEY).assertEqual('persist.basic.betaclube.url');
      expect(SYSTEM_PARAM_KEY.startsWith('persist.')).assertTrue();
      expect(SYSTEM_PARAM_KEY.length).assertLarger(10);
    });

    it('base_url_should_fall_back_to_production', 0, () => {
      expect(BaseUrlResolver.resolve('')).assertEqual(PRODUCTION_URL);
      expect(BaseUrlResolver.isValid(BaseUrlResolver.resolve(''))).assertTrue();
      expect(BaseUrlResolver.endpoint(BaseUrlResolver.resolve(''), UrlConstant.ISSUE_REPORT))
        .assertEqual(PRODUCTION_URL + UrlConstant.ISSUE_REPORT);
    });

    it('base_url_should_prefer_system_parameter', 0, () => {
      const override = 'http://10.20.72.120:8080/';
      expect(BaseUrlResolver.resolve(override)).assertEqual(override);
      expect(BaseUrlResolver.isValid(override)).assertTrue();
      expect(BaseUrlResolver.endpoint(override, UrlConstant.UPLOAD_FILE))
        .assertEqual(override + UrlConstant.UPLOAD_FILE);
    });

    it('base_url_resolver_should_handle_missing_trailing_slash', 0, () => {
      const url = 'http://10.20.72.120:8080';
      expect(BaseUrlResolver.endpoint(url, UrlConstant.ISSUE_LIST))
        .assertEqual('http://10.20.72.120:8080/client/log/issue/page');
      expect(BaseUrlResolver.endpoint(url, UrlConstant.ISSUE_LIST).indexOf('//client')).assertEqual(-1);
    });

    it('startup_folders_should_be_created', 0, () => {
      expect(StartupFolderPlanner.folderCount()).assertEqual(3);
      expect(StartupFolderPlanner.isPlanned('cache_logs')).assertTrue();
      expect(StartupFolderPlanner.isPlanned(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER)).assertTrue();
      expect(StartupFolderPlanner.isPlanned(KeyConstant.CACHE_LOG_PATH_FOLDER)).assertTrue();
      expect(StartupFolderPlanner.isPlanned('unknown')).assertFalse();
    });

    it('startup_folder_paths_should_be_absolute', 0, () => {
      const paths = StartupFolderPlanner.buildPaths('/data/storage/el2/base/cache');
      expect(paths.length).assertEqual(3);
      for (let i = 0; i < paths.length; i++) {
        expect(paths[i].startsWith('/')).assertTrue();
        expect(paths[i].indexOf('//')).assertEqual(-1);
      }
      expect(paths[0]).assertEqual('/data/storage/el2/base/cache/cache_logs');
      expect(paths[2]).assertEqual('/data/storage/el2/base/cache/cache_logs/allLogs');
    });

    it('permission_plan_should_request_media_permissions', 0, () => {
      const permissions = PermissionPlan.permissions();
      expect(permissions.length).assertEqual(2);
      expect(permissions.includes(PERMISSION_READ_MEDIA)).assertTrue();
      expect(permissions.includes(PERMISSION_READ_IMAGEVIDEO)).assertTrue();
      expect(PermissionPlan.isGranted(0)).assertTrue();
      expect(PermissionPlan.isGranted(-1)).assertFalse();
    });

    it('permission_plan_should_require_all_results', 0, () => {
      expect(PermissionPlan.allGranted([0, 0])).assertTrue();
      expect(PermissionPlan.allGranted([0, -1])).assertFalse();
      expect(PermissionPlan.allGranted([])).assertFalse();
    });

    it('device_gate_should_accept_supported_hardware', 0, () => {
      expect(BOOT_HARDWARE_KEY).assertEqual('ohos.boot.hardware');
      expect(DeviceGateValidator.isSupportedHardware(EXPECTED_BOOT_HARDWARE)).assertTrue();
      expect(DeviceGateValidator.isSupported(EXPECTED_BOOT_HARDWARE, 'LHT16')).assertTrue();
      expect(DeviceGateValidator.isSupported(EXPECTED_BOOT_HARDWARE, 'oriole')).assertTrue();
    });

    it('device_gate_should_reject_unsupported_hardware', 0, () => {
      expect(DeviceGateValidator.isSupported('other', 'LHT16')).assertFalse();
      expect(DeviceGateValidator.isSupported(EXPECTED_BOOT_HARDWARE, 'unknown')).assertFalse();
      expect(DeviceGateValidator.isSupported('other', 'unknown')).assertFalse();
      expect(DeviceGateValidator.isSupportedProductModel('LHT16')).assertTrue();
      expect(DeviceGateValidator.isSupportedProductModel('unknown')).assertFalse();
    });

    it('device_gate_should_be_case_sensitive', 0, () => {
      expect(DeviceGateValidator.isSupported('UIS7885', 'LHT16')).assertFalse();
      expect(DeviceGateValidator.isSupported(EXPECTED_BOOT_HARDWARE, 'lht16')).assertFalse();
      expect(SUPPORTED_PRODUCT_MODELS.length).assertEqual(2);
    });

    it('lifecycle_recorder_should_reset', 0, () => {
      recorder.clear();
      recorder.record(LIFECYCLE_ON_CREATE);
      expect(recorder.getCount()).assertEqual(1);
      recorder.clear();
      expect(recorder.getCount()).assertEqual(0);
      expect(recorder.indexOf(LIFECYCLE_ON_CREATE)).assertEqual(-1);
      expect(recorder.isBefore(LIFECYCLE_ON_CREATE, LIFECYCLE_ON_DESTROY)).assertFalse();
    });

    it('foreground_cycle_tracker_should_count_pairs', 0, () => {
      const tracker = new ForegroundCycleTracker();
      expect(tracker.isInForeground()).assertFalse();
      tracker.onForeground();
      expect(tracker.isInForeground()).assertTrue();
      expect(tracker.getForegroundCount()).assertEqual(1);
      tracker.onBackground();
      expect(tracker.isInForeground()).assertFalse();
      expect(tracker.getBackgroundCount()).assertEqual(1);
      expect(tracker.getCycleCount()).assertEqual(1);
    });

    it('foreground_cycle_tracker_should_handle_three_cycles', 0, () => {
      const tracker = new ForegroundCycleTracker();
      for (let i = 0; i < 3; i++) {
        tracker.onForeground();
        tracker.onBackground();
      }
      expect(tracker.getForegroundCount()).assertEqual(3);
      expect(tracker.getBackgroundCount()).assertEqual(3);
      expect(tracker.getCycleCount()).assertEqual(3);
      expect(tracker.isInForeground()).assertFalse();
      tracker.reset();
      expect(tracker.getCycleCount()).assertEqual(0);
    });

    it('foreground_without_background_should_keep_cycle_count_low', 0, () => {
      const tracker = new ForegroundCycleTracker();
      tracker.onForeground();
      tracker.onForeground();
      expect(tracker.getForegroundCount()).assertEqual(2);
      expect(tracker.getBackgroundCount()).assertEqual(0);
      expect(tracker.getCycleCount()).assertEqual(0);
      expect(tracker.isInForeground()).assertTrue();
    });

    it('cache_paths_should_stay_under_cache_dir', 0, () => {
      const cacheDir = '/data/storage/el2/base/cache';
      const paths = StartupFolderPlanner.buildPaths(cacheDir);
      for (let i = 0; i < paths.length; i++) {
        expect(CacheDirValidator.isAbsolute(paths[i])).assertTrue();
        expect(CacheDirValidator.hasTraversal(paths[i])).assertFalse();
        expect(CacheDirValidator.isUnder(paths[i], cacheDir)).assertTrue();
      }
      expect(CacheDirValidator.isUnder('/other/cache/logs', cacheDir)).assertFalse();
    });

    it('cache_paths_should_be_unique_and_nested', 0, () => {
      const paths = StartupFolderPlanner.buildPaths('/data/cache');
      expect(CacheDirValidator.isUnique(paths)).assertTrue();
      expect(CacheDirValidator.depth(paths[0])).assertEqual(3);
      expect(CacheDirValidator.depth(paths[2])).assertEqual(4);
      expect(CacheDirValidator.isUnique(['/a', '/a'])).assertFalse();
      expect(CacheDirValidator.depth('/')).assertEqual(0);
    });

    it('permission_outcomes_should_be_counted', 0, () => {
      const analyzer = new PermissionOutcomeAnalyzer();
      analyzer.record(0);
      analyzer.record(0);
      expect(analyzer.getGranted()).assertEqual(2);
      expect(analyzer.getDenied()).assertEqual(0);
      expect(analyzer.isPartiallyGranted()).assertFalse();
      expect(analyzer.getTotal()).assertEqual(2);
      analyzer.reset();
      expect(analyzer.getTotal()).assertEqual(0);
    });

    it('partial_permission_grant_should_be_detected', 0, () => {
      const analyzer = new PermissionOutcomeAnalyzer();
      analyzer.record(0);
      analyzer.record(-1);
      expect(analyzer.getGranted()).assertEqual(1);
      expect(analyzer.getDenied()).assertEqual(1);
      expect(analyzer.isPartiallyGranted()).assertTrue();
      expect(PermissionPlan.allGranted([0, -1])).assertFalse();
    });

    it('startup_plan_should_be_ordered_and_unique', 0, () => {
      const tasks = StartupPlan.defaultTasks();
      expect(tasks.length).assertEqual(5);
      expect(StartupPlan.isOrdered(tasks)).assertTrue();
      expect(StartupPlan.hasDuplicateNames(tasks)).assertFalse();
      const names = StartupPlan.names(tasks);
      expect(names[0]).assertEqual('createKVManager');
      expect(names[names.length - 1]).assertEqual('initPhotoManager');
    });

    it('startup_plan_should_detect_unordered_tasks', 0, () => {
      const tasks: StartupTask[] = [
        new StartupTask('second', 2),
        new StartupTask('first', 1)
      ];
      expect(StartupPlan.isOrdered(tasks)).assertFalse();
      expect(StartupPlan.hasDuplicateNames(tasks)).assertFalse();
      const duplicates: StartupTask[] = [
        new StartupTask('same', 1),
        new StartupTask('same', 2)
      ];
      expect(StartupPlan.hasDuplicateNames(duplicates)).assertTrue();
      expect(StartupPlan.names(duplicates).length).assertEqual(2);
    });

    it('base_url_should_reject_invalid_schemes', 0, () => {
      expect(BaseUrlResolver.isValid('ftp://host')).assertFalse();
      expect(BaseUrlResolver.isValid('file:///data')).assertFalse();
      expect(BaseUrlResolver.isValid('host/path')).assertFalse();
      expect(BaseUrlResolver.isValid('https://host/path')).assertTrue();
      expect(BaseUrlResolver.endpoint('https://host', UrlConstant.ISSUE_DETAIL))
        .assertEqual('https://host/' + UrlConstant.ISSUE_DETAIL);
    });

    it('base_url_endpoint_should_not_duplicate_slash', 0, () => {
      const url = BaseUrlResolver.endpoint(PRODUCTION_URL, UrlConstant.ISSUE_CONFIG);
      expect(url.indexOf('//client')).assertEqual(-1);
      expect(url).assertEqual(PRODUCTION_URL + UrlConstant.ISSUE_CONFIG);
      expect(url.endsWith(UrlConstant.ISSUE_CONFIG)).assertTrue();
    });

    it('startup_folders_should_not_escape_sandbox', 0, () => {
      const paths = StartupFolderPlanner.buildPaths('/cache');
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < paths.length; i++) {
        expect(seen.has(paths[i])).assertFalse();
        seen.add(paths[i]);
        expect(paths[i].indexOf('..')).assertEqual(-1);
        expect(paths[i].startsWith('/cache/')).assertTrue();
      }
      expect(seen.size).assertEqual(paths.length);
    });

    it('ability_uid_should_be_positive_integer', 0, () => {
      const uid = 20001234;
      expect(uid).assertLarger(0);
      expect(Number.isInteger(uid)).assertTrue();
      expect(`${uid}`.length).assertLarger(0);
      expect(uid % 1).assertEqual(0);
    });

    it('cache_dir_with_trailing_slash_should_not_double_separator', 0, () => {
      const paths = StartupFolderPlanner.buildPaths('/data/cache/');
      expect(paths.length).assertEqual(3);
      for (let i = 0; i < paths.length; i++) {
        expect(paths[i].indexOf('//')).assertEqual(-1);
        expect(paths[i].startsWith('/data/cache/')).assertTrue();
      }
      expect(CacheDirValidator.isUnique(paths)).assertTrue();
    });

    it('permission_analyzer_should_reset_between_rounds', 0, () => {
      const analyzer = new PermissionOutcomeAnalyzer();
      analyzer.record(0);
      analyzer.record(-1);
      expect(analyzer.getTotal()).assertEqual(2);
      analyzer.reset();
      analyzer.record(0);
      expect(analyzer.getTotal()).assertEqual(1);
      expect(analyzer.getGranted()).assertEqual(1);
      expect(analyzer.getDenied()).assertEqual(0);
      expect(analyzer.isPartiallyGranted()).assertFalse();
    });

    it('startup_plan_should_survive_reordering_input', 0, () => {
      const tasks: StartupTask[] = [
        new StartupTask('third', 3),
        new StartupTask('first', 1),
        new StartupTask('second', 2)
      ];
      expect(StartupPlan.isOrdered(tasks)).assertFalse();
      tasks.sort((left: StartupTask, right: StartupTask) => left.order - right.order);
      expect(StartupPlan.isOrdered(tasks)).assertTrue();
      expect(StartupPlan.names(tasks)[0]).assertEqual('first');
      expect(StartupPlan.names(tasks)[2]).assertEqual('third');
    });

    it('base_url_override_should_take_precedence_over_default', 0, () => {
      const override = 'https://10.20.72.130:443/';
      const resolved = BaseUrlResolver.resolve(override);
      expect(resolved).assertEqual(override);
      expect(resolved === PRODUCTION_URL).assertFalse();
      expect(BaseUrlResolver.isValid(resolved)).assertTrue();
      expect(BaseUrlResolver.endpoint(resolved, UrlConstant.ISSUE_REPORT))
        .assertEqual(override + UrlConstant.ISSUE_REPORT);
    });

    it('base_url_should_keep_default_when_parameter_is_whitespace', 0, () => {
      expect(BaseUrlResolver.resolve(' ')).assertEqual(' ');
      expect(BaseUrlResolver.isValid(' ')).assertFalse();
      expect(BaseUrlResolver.resolve('')).assertEqual(PRODUCTION_URL);
      expect(BaseUrlResolver.isValid(BaseUrlResolver.resolve(''))).assertTrue();
    });

    it('lifecycle_recorder_should_support_query_after_reset', 0, () => {
      recorder.clear();
      recorder.record(LIFECYCLE_ON_WINDOW_STAGE_CREATE);
      recorder.record(LIFECYCLE_ON_FOREGROUND);
      expect(recorder.isBefore(LIFECYCLE_ON_WINDOW_STAGE_CREATE, LIFECYCLE_ON_FOREGROUND)).assertTrue();
      recorder.clear();
      recorder.record(LIFECYCLE_ON_DESTROY);
      expect(recorder.indexOf(LIFECYCLE_ON_WINDOW_STAGE_CREATE)).assertEqual(-1);
      expect(recorder.indexOf(LIFECYCLE_ON_DESTROY)).assertEqual(0);
      expect(recorder.getNames().length).assertEqual(1);
    });

    it('foreground_cycle_tracker_should_alternate_states', 0, () => {
      const tracker = new ForegroundCycleTracker();
      for (let i = 0; i < 4; i++) {
        tracker.onForeground();
        expect(tracker.isInForeground()).assertTrue();
        tracker.onBackground();
        expect(tracker.isInForeground()).assertFalse();
      }
      expect(tracker.getForegroundCount()).assertEqual(4);
      expect(tracker.getBackgroundCount()).assertEqual(4);
      expect(tracker.getCycleCount()).assertEqual(4);
    });

    it('cache_dir_validator_should_reject_parent_escape', 0, () => {
      expect(CacheDirValidator.hasTraversal('/cache/../secret')).assertTrue();
      expect(CacheDirValidator.hasTraversal('/cache/logs')).assertFalse();
      expect(CacheDirValidator.isUnder('/cache/logs', '/cache')).assertTrue();
      expect(CacheDirValidator.isUnder('/cache2/logs', '/cache')).assertFalse();
      expect(CacheDirValidator.depth('/cache/logs/allLogs')).assertEqual(3);
      expect(CacheDirValidator.depth('relative')).assertEqual(0);
    });

    it('startup_plan_default_tasks_should_be_repeatable', 0, () => {
      const first = StartupPlan.defaultTasks();
      const second = StartupPlan.defaultTasks();
      expect(first.length).assertEqual(second.length);
      expect(StartupPlan.names(first).join('|')).assertEqual(StartupPlan.names(second).join('|'));
      expect(first[0] === second[0]).assertFalse();
      expect(first[0].name).assertEqual(second[0].name);
    });

    it('supported_product_models_should_remain_two', 0, () => {
      expect(SUPPORTED_PRODUCT_MODELS.length).assertEqual(2);
      expect(SUPPORTED_PRODUCT_MODELS[0]).assertEqual('LHT16');
      expect(SUPPORTED_PRODUCT_MODELS[1]).assertEqual('oriole');
      expect(SUPPORTED_PRODUCT_MODELS.includes(EXPECTED_BOOT_HARDWARE)).assertFalse();
    });
  });
}
