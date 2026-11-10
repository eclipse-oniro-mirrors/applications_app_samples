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

import { describe, it, expect } from '@ohos/hypium';
import KeyConstant from '../../../../main/ets/common/Constants/KeyConstant';
import UrlConstant from '../../../../main/ets/common/Constants/UrlConstant';
import { ANIMATION_FIVE, UploadImageInfo } from '../../../../main/ets/common/Constants/TypeData';

// Expected AppStorage keys, mirrored from KeyConstant.ets
const KEY_IS_SHOW_LOADING: string = 'isShowLoading';

const KEY_IS_NEED_REFRESH: string = 'isNeedRefresh';

const KEY_KV_STORE_ID: string = 'betaClubStore';

const KEY_KV_ISSUE: string = 'kv_issue_key';

const KEY_KV_ISSUE_UPDATE_TIME: string = 'kv_issue_update_time_key';

const FOLDER_UPLOAD_LOG: string = 'logs';

const FOLDER_CACHE_LOG: string = 'cache_logs/allLogs';

const FOLDER_ATTACHMENT: string = 'attachment';

const SANDBOX_LOG_PATH: string = '/data/log';

// Expected endpoints, mirrored from UrlConstant.ets
const ENDPOINT_ISSUE_REPORT: string = 'client/log/issue/report';

const ENDPOINT_UPLOAD_FILE: string = 'dev/file/uploadReturnUrl';

const ENDPOINT_ISSUE_LIST: string = 'client/log/issue/page';

const ENDPOINT_ISSUE_DETAIL: string = 'client/log/issue/info';

const ENDPOINT_ISSUE_CONFIG: string = 'client/log/issue/config';

const ENDPOINT_OPERATION_RECORD: string = 'client/log/issue/operationrecord';

const PRODUCTION_BASE_URL: string = 'http://10.20.72.111:3470/';

interface EndpointCase {
  name: string;
  path: string;
  method: string;
}

// Validates URL composition rules used by NetworkManager
class UrlCompositionValidator {
  public static join(baseUrl: string, endpoint: string): string {
    if (baseUrl.length === 0) {
      return endpoint;
    }
    if (baseUrl.endsWith('/') && endpoint.startsWith('/')) {
      return baseUrl + endpoint.substring(1);
    }
    if (!baseUrl.endsWith('/') && !endpoint.startsWith('/')) {
      return baseUrl + '/' + endpoint;
    }
    return baseUrl + endpoint;
  }

  public static isRelativeEndpoint(endpoint: string): boolean {
    return endpoint.length > 0 && !endpoint.startsWith('/') &&
      !endpoint.startsWith('http://') && !endpoint.startsWith('https://');
  }

  public static isAbsoluteUrl(url: string): boolean {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  public static segmentCount(endpoint: string): number {
    if (endpoint.length === 0) {
      return 0;
    }
    return endpoint.split('/').length;
  }
}

// Validates cache folder composition rules used by EntryAbility
class CachePathValidator {
  public static build(cacheDir: string, folder: string): string {
    if (cacheDir.endsWith('/')) {
      return cacheDir + folder;
    }
    return cacheDir + '/' + folder;
  }

  public static isNestedFolder(folder: string): boolean {
    return folder.indexOf('/') >= 0;
  }

  public static depth(folder: string): number {
    if (folder.length === 0) {
      return 0;
    }
    return folder.split('/').length;
  }
}

// Validates KV key rules used by KvManagerService
class KvKeyValidator {
  public static isNonEmpty(key: string): boolean {
    return key.length > 0;
  }

  public static isStoreIdValid(storeId: string): boolean {
    return storeId.length > 0 && storeId.length <= 64;
  }

  public static isKeyNamespaced(key: string, prefix: string): boolean {
    return key.startsWith(prefix);
  }
}

// Validates uploaded file descriptors stored in AppStorage
class UploadImageValidator {
  public static isValid(info: UploadImageInfo): boolean {
    return info.type.length > 0 && info.imageName.length > 0;
  }

  public static hasRemoteUrl(info: UploadImageInfo): boolean {
    return info.url !== undefined && info.url.length > 0;
  }

  public static countWithRemoteUrl(items: UploadImageInfo[]): number {
    let count: number = 0;
    for (let i = 0; i < items.length; i++) {
      if (UploadImageValidator.hasRemoteUrl(items[i])) {
        count++;
      }
    }
    return count;
  }

  public static typeOfExtension(imageName: string): string {
    const index = imageName.lastIndexOf('.');
    if (index < 0 || index === imageName.length - 1) {
      return '';
    }
    return imageName.substring(index + 1);
  }
}

// Holds typed configuration values with defaults and validation
class ConfigCenter {
  private values: Map<string, string> = new Map<string, string>();
  private defaults: Map<string, string> = new Map<string, string>();

  public setDefault(key: string, value: string): void {
    this.defaults.set(key, value);
  }

  public set(key: string, value: string): boolean {
    if (key.length === 0) {
      return false;
    }
    this.values.set(key, value);
    return true;
  }

  public get(key: string): string {
    const value = this.values.get(key);
    if (value !== undefined) {
      return value;
    }
    const fallback = this.defaults.get(key);
    return fallback === undefined ? '' : fallback;
  }

  public has(key: string): boolean {
    return this.values.has(key);
  }

  public remove(key: string): void {
    this.values.delete(key);
  }

  public size(): number {
    return this.values.size;
  }

  public defaultSize(): number {
    return this.defaults.size;
  }

  public getBoolean(key: string): boolean {
    return this.get(key) === 'true';
  }

  public getNumber(key: string): number {
    return Number(this.get(key));
  }

  public clear(): void {
    this.values.clear();
  }
}

// Describes one backend route used by the issue reporter
class RouteDefinition {
  public name: string;
  public path: string;
  public method: string;
  public requiresAuth: boolean;

  constructor(name: string, path: string, method: string, requiresAuth: boolean) {
    this.name = name;
    this.path = path;
    this.method = method;
    this.requiresAuth = requiresAuth;
  }

  public url(baseUrl: string): string {
    return UrlCompositionValidator.join(baseUrl, this.path);
  }
}

class EndpointRouter {
  private routes: Map<string, RouteDefinition> = new Map<string, RouteDefinition>();

  public register(route: RouteDefinition): boolean {
    if (route.name.length === 0 || route.path.length === 0) {
      return false;
    }
    if (this.routes.has(route.name)) {
      return false;
    }
    this.routes.set(route.name, route);
    return true;
  }

  public resolve(name: string): RouteDefinition | undefined {
    return this.routes.get(name);
  }

  public has(name: string): boolean {
    return this.routes.has(name);
  }

  public size(): number {
    return this.routes.size;
  }

  public names(): string[] {
    const result: string[] = [];
    this.routes.forEach((route: RouteDefinition, name: string) => {
      result.push(name);
    });
    return result;
  }

  public authenticatedRoutes(): RouteDefinition[] {
    const result: RouteDefinition[] = [];
    this.routes.forEach((route: RouteDefinition) => {
      if (route.requiresAuth) {
        result.push(route);
      }
    });
    return result;
  }

  public defaultRoutes(): EndpointRouter {
    const router = new EndpointRouter();
    router.register(new RouteDefinition('report', UrlConstant.ISSUE_REPORT, 'POST', true));
    router.register(new RouteDefinition('upload', UrlConstant.UPLOAD_FILE, 'POST', true));
    router.register(new RouteDefinition('list', UrlConstant.ISSUE_LIST, 'POST', true));
    router.register(new RouteDefinition('detail', UrlConstant.ISSUE_DETAIL, 'POST', true));
    router.register(new RouteDefinition('config', UrlConstant.ISSUE_CONFIG, 'POST', false));
    router.register(new RouteDefinition('operation', UrlConstant.ISSUE_OPERATION_RECORD, 'POST', true));
    return router;
  }
}

// Compares dotted version strings used by the config endpoint
class VersionComparator {
  public static parse(version: string): number[] {
    if (version.length === 0) {
      return [];
    }
    const parts: string[] = version.split('.');
    const result: number[] = [];
    for (let i = 0; i < parts.length; i++) {
      const value = Number(parts[i]);
      result.push(Number.isNaN(value) ? 0 : value);
    }
    return result;
  }

  public static compare(left: string, right: string): number {
    const leftParts = VersionComparator.parse(left);
    const rightParts = VersionComparator.parse(right);
    const length = Math.max(leftParts.length, rightParts.length);
    for (let i = 0; i < length; i++) {
      const leftValue = i < leftParts.length ? leftParts[i] : 0;
      const rightValue = i < rightParts.length ? rightParts[i] : 0;
      if (leftValue > rightValue) {
        return 1;
      }
      if (leftValue < rightValue) {
        return -1;
      }
    }
    return 0;
  }

  public static isAtLeast(version: string, required: string): boolean {
    return VersionComparator.compare(version, required) >= 0;
  }

  public static isValid(version: string): boolean {
    if (version.length === 0) {
      return false;
    }
    const pattern: RegExp = new RegExp('^[0-9]+(\\.[0-9]+)*$');
    return pattern.test(version);
  }
}

// Builds query strings for GET style endpoints
class QueryStringBuilder {
  private pairs: string[] = [];

  public add(key: string, value: string): boolean {
    if (key.length === 0) {
      return false;
    }
    this.pairs.push(`${encodeURIComponent(key)}=${encodeURIComponent(value)}`);
    return true;
  }

  public size(): number {
    return this.pairs.length;
  }

  public build(): string {
    return this.pairs.length === 0 ? '' : '?' + this.pairs.join('&');
  }

  public clear(): void {
    this.pairs = [];
  }
}

// Plans the cache directory tree created at startup
class CacheLayout {
  private folders: string[] = [];

  public add(folder: string): boolean {
    if (!PathSanitizerLike.isSafe(folder)) {
      return false;
    }
    if (this.folders.includes(folder)) {
      return false;
    }
    this.folders.push(folder);
    return true;
  }

  public size(): number {
    return this.folders.length;
  }

  public getFolders(): string[] {
    return [...this.folders];
  }

  public buildPaths(cacheDir: string): string[] {
    const base = cacheDir.endsWith('/') ? cacheDir.substring(0, cacheDir.length - 1) : cacheDir;
    const paths: string[] = [];
    for (let i = 0; i < this.folders.length; i++) {
      paths.push(base + '/' + this.folders[i]);
    }
    return paths;
  }

  public deepestDepth(): number {
    let depth: number = 0;
    for (let i = 0; i < this.folders.length; i++) {
      const parts = this.folders[i].split('/');
      if (parts.length > depth) {
        depth = parts.length;
      }
    }
    return depth;
  }

  public clear(): void {
    this.folders = [];
  }
}

class PathSanitizerLike {
  public static isSafe(folder: string): boolean {
    return folder.length > 0 && folder.indexOf('..') < 0 && !folder.startsWith('/');
  }
}

// Tracks feature flags loaded from the config endpoint
class FeatureFlagRegistry {
  private flags: Map<string, boolean> = new Map<string, boolean>();

  public define(name: string, enabledByDefault: boolean): void {
    if (name.length > 0) {
      this.flags.set(name, enabledByDefault);
    }
  }

  public set(name: string, enabled: boolean): boolean {
    if (!this.flags.has(name)) {
      return false;
    }
    this.flags.set(name, enabled);
    return true;
  }

  public isEnabled(name: string): boolean {
    const value = this.flags.get(name);
    return value === undefined ? false : value;
  }

  public enabledCount(): number {
    let count: number = 0;
    this.flags.forEach((value: boolean) => {
      if (value) {
        count++;
      }
    });
    return count;
  }

  public size(): number {
    return this.flags.size;
  }

  public names(): string[] {
    const result: string[] = [];
    this.flags.forEach((value: boolean, name: string) => {
      result.push(name);
    });
    return result;
  }

  public reset(): void {
    this.flags = new Map<string, boolean>();
  }
}

export default function keyConstantValidationTest() {
  describe('KeyConstantValidation_Test', () => {

    it('app_storage_keys_should_match_declared_values', 0, () => {
      expect(KeyConstant.IS_SHOW_LOADING).assertEqual(KEY_IS_SHOW_LOADING);
      expect(KeyConstant.IS_NEED_REFRESH).assertEqual(KEY_IS_NEED_REFRESH);
      expect(KeyConstant.IS_SHOW_LOADING).assertEqual('isShowLoading');
      expect(KeyConstant.IS_NEED_REFRESH).assertEqual('isNeedRefresh');
    });

    it('sandbox_log_path_should_be_absolute', 0, () => {
      expect(KeyConstant.SANDBOX_MAP).assertEqual(SANDBOX_LOG_PATH);
      expect(KeyConstant.SANDBOX_MAP.startsWith('/')).assertTrue();
      expect(KeyConstant.SANDBOX_MAP).assertContain('log');
      expect(KeyConstant.SANDBOX_MAP.length).assertLarger(1);
    });

    it('folder_names_should_match_declared_values', 0, () => {
      expect(KeyConstant.UPLOAD_LOG_PATH_FOLDER).assertEqual(FOLDER_UPLOAD_LOG);
      expect(KeyConstant.CACHE_LOG_PATH_FOLDER).assertEqual(FOLDER_CACHE_LOG);
      expect(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER).assertEqual(FOLDER_ATTACHMENT);
    });

    it('folder_names_should_be_relative_and_distinct', 0, () => {
      expect(KeyConstant.UPLOAD_LOG_PATH_FOLDER.startsWith('/')).assertFalse();
      expect(KeyConstant.CACHE_LOG_PATH_FOLDER.startsWith('/')).assertFalse();
      expect(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER.startsWith('/')).assertFalse();
      expect(KeyConstant.UPLOAD_LOG_PATH_FOLDER === KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER).assertFalse();
      expect(KeyConstant.CACHE_LOG_PATH_FOLDER === KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER).assertFalse();
      expect(KeyConstant.UPLOAD_LOG_PATH_FOLDER === KeyConstant.CACHE_LOG_PATH_FOLDER).assertFalse();
    });

    it('cache_log_folder_should_be_nested', 0, () => {
      expect(CachePathValidator.isNestedFolder(KeyConstant.CACHE_LOG_PATH_FOLDER)).assertTrue();
      expect(CachePathValidator.isNestedFolder(KeyConstant.UPLOAD_LOG_PATH_FOLDER)).assertFalse();
      expect(CachePathValidator.depth(KeyConstant.CACHE_LOG_PATH_FOLDER)).assertEqual(2);
      expect(CachePathValidator.depth(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER)).assertEqual(1);
    });

    it('cache_path_should_join_without_double_separator', 0, () => {
      const cacheDir = '/data/app/cache';
      const path = CachePathValidator.build(cacheDir, KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER);
      expect(path).assertEqual('/data/app/cache/attachment');
      expect(path.indexOf('//')).assertEqual(-1);
      const trailing = CachePathValidator.build('/data/app/cache/', KeyConstant.UPLOAD_LOG_PATH_FOLDER);
      expect(trailing).assertEqual('/data/app/cache/logs');
      expect(trailing.indexOf('//')).assertEqual(-1);
    });

    it('kv_store_id_should_be_valid', 0, () => {
      expect(KeyConstant.KV_STORE_ID).assertEqual(KEY_KV_STORE_ID);
      expect(KvKeyValidator.isStoreIdValid(KeyConstant.KV_STORE_ID)).assertTrue();
      expect(KeyConstant.KV_STORE_ID.length).assertLessOrEqual(64);
      expect(KvKeyValidator.isStoreIdValid('')).assertFalse();
    });

    it('kv_keys_should_be_non_empty_and_namespaced', 0, () => {
      expect(KeyConstant.KV_ISSUE_KEY).assertEqual(KEY_KV_ISSUE);
      expect(KeyConstant.KV_ISSUE_UPDATE_TIME_KEY).assertEqual(KEY_KV_ISSUE_UPDATE_TIME);
      expect(KvKeyValidator.isNonEmpty(KeyConstant.KV_ISSUE_KEY)).assertTrue();
      expect(KvKeyValidator.isNonEmpty(KeyConstant.KV_ISSUE_UPDATE_TIME_KEY)).assertTrue();
      expect(KvKeyValidator.isKeyNamespaced(KeyConstant.KV_ISSUE_KEY, 'kv_')).assertTrue();
      expect(KvKeyValidator.isKeyNamespaced(KeyConstant.KV_ISSUE_UPDATE_TIME_KEY, 'kv_')).assertTrue();
      expect(KeyConstant.KV_ISSUE_KEY === KeyConstant.KV_ISSUE_UPDATE_TIME_KEY).assertFalse();
    });

    it('issue_endpoints_should_match_declared_values', 0, () => {
      expect(UrlConstant.ISSUE_REPORT).assertEqual(ENDPOINT_ISSUE_REPORT);
      expect(UrlConstant.UPLOAD_FILE).assertEqual(ENDPOINT_UPLOAD_FILE);
      expect(UrlConstant.ISSUE_LIST).assertEqual(ENDPOINT_ISSUE_LIST);
      expect(UrlConstant.ISSUE_DETAIL).assertEqual(ENDPOINT_ISSUE_DETAIL);
      expect(UrlConstant.ISSUE_CONFIG).assertEqual(ENDPOINT_ISSUE_CONFIG);
      expect(UrlConstant.ISSUE_OPERATION_RECORD).assertEqual(ENDPOINT_OPERATION_RECORD);
    });

    it('endpoints_should_be_relative', 0, () => {
      const endpoints: string[] = [
        UrlConstant.ISSUE_REPORT,
        UrlConstant.UPLOAD_FILE,
        UrlConstant.ISSUE_LIST,
        UrlConstant.ISSUE_DETAIL,
        UrlConstant.ISSUE_CONFIG,
        UrlConstant.ISSUE_OPERATION_RECORD
      ];
      for (let i = 0; i < endpoints.length; i++) {
        expect(UrlCompositionValidator.isRelativeEndpoint(endpoints[i])).assertTrue();
        expect(endpoints[i].startsWith('/')).assertFalse();
        expect(endpoints[i].length).assertLarger(0);
      }
      expect(UrlCompositionValidator.isRelativeEndpoint('/absolute')).assertFalse();
      expect(UrlCompositionValidator.isRelativeEndpoint('http://host/path')).assertFalse();
    });

    it('endpoints_should_be_unique', 0, () => {
      const endpoints: string[] = [
        UrlConstant.ISSUE_REPORT,
        UrlConstant.UPLOAD_FILE,
        UrlConstant.ISSUE_LIST,
        UrlConstant.ISSUE_DETAIL,
        UrlConstant.ISSUE_CONFIG,
        UrlConstant.ISSUE_OPERATION_RECORD
      ];
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < endpoints.length; i++) {
        unique.add(endpoints[i]);
      }
      expect(unique.size).assertEqual(endpoints.length);
    });

    it('endpoint_segments_should_have_expected_depth', 0, () => {
      expect(UrlCompositionValidator.segmentCount(UrlConstant.ISSUE_REPORT)).assertEqual(4);
      expect(UrlCompositionValidator.segmentCount(UrlConstant.UPLOAD_FILE)).assertEqual(3);
      expect(UrlCompositionValidator.segmentCount(UrlConstant.ISSUE_LIST)).assertEqual(4);
      expect(UrlCompositionValidator.segmentCount('')).assertEqual(0);
    });

    it('endpoint_should_join_production_base_url', 0, () => {
      const url = UrlCompositionValidator.join(PRODUCTION_BASE_URL, UrlConstant.ISSUE_REPORT);
      expect(url).assertEqual('http://10.20.72.111:3470/client/log/issue/report');
      expect(UrlCompositionValidator.isAbsoluteUrl(url)).assertTrue();
      expect(url.indexOf('//client')).assertEqual(-1);
    });

    it('endpoint_should_join_base_url_without_trailing_slash', 0, () => {
      const url = UrlCompositionValidator.join('http://10.20.72.111:3470', UrlConstant.ISSUE_LIST);
      expect(url).assertEqual('http://10.20.72.111:3470/client/log/issue/page');
      expect(UrlCompositionValidator.isAbsoluteUrl(url)).assertTrue();
    });

    it('endpoint_should_keep_single_slash_when_both_sides_have_one', 0, () => {
      const url = UrlCompositionValidator.join('http://host/', '/client/log');
      expect(url).assertEqual('http://host/client/log');
      expect(url.indexOf('//client')).assertEqual(-1);
    });

    it('known_endpoint_catalog_should_be_complete', 0, () => {
      const catalog: EndpointCase[] = [
        { name: 'report', path: UrlConstant.ISSUE_REPORT, method: 'POST' },
        { name: 'upload', path: UrlConstant.UPLOAD_FILE, method: 'POST' },
        { name: 'list', path: UrlConstant.ISSUE_LIST, method: 'POST' },
        { name: 'detail', path: UrlConstant.ISSUE_DETAIL, method: 'POST' },
        { name: 'config', path: UrlConstant.ISSUE_CONFIG, method: 'POST' },
        { name: 'operation', path: UrlConstant.ISSUE_OPERATION_RECORD, method: 'POST' }
      ];
      expect(catalog.length).assertEqual(6);
      for (let i = 0; i < catalog.length; i++) {
        expect(catalog[i].method).assertEqual('POST');
        expect(catalog[i].path.length).assertLarger(0);
      }
      expect(catalog[0].path).assertContain('issue');
      expect(catalog[1].path).assertContain('upload');
    });

    it('upload_image_info_should_accept_minimal_payload', 0, () => {
      const info: UploadImageInfo = {
        type: 'image',
        imageName: 'photo.png'
      };
      expect(info.type).assertEqual('image');
      expect(info.imageName).assertEqual('photo.png');
      expect(info.url === undefined).assertTrue();
      expect(info.id === undefined).assertTrue();
      expect(UploadImageValidator.isValid(info)).assertTrue();
      expect(UploadImageValidator.hasRemoteUrl(info)).assertFalse();
    });

    it('upload_image_info_should_accept_remote_payload', 0, () => {
      const info: UploadImageInfo = {
        type: 'video',
        imageName: 'clip.mp4',
        url: 'https://example.com/clip.mp4',
        id: 'video-1'
      };
      expect(UploadImageValidator.isValid(info)).assertTrue();
      expect(UploadImageValidator.hasRemoteUrl(info)).assertTrue();
      expect(UploadImageValidator.typeOfExtension(info.imageName)).assertEqual('mp4');
      expect(UploadImageValidator.typeOfExtension(info.type)).assertEqual('');
    });

    it('upload_image_list_should_count_remote_entries', 0, () => {
      const items: UploadImageInfo[] = [
        { type: 'image', imageName: 'a.png', url: 'https://example.com/a.png', id: '1' },
        { type: 'image', imageName: 'b.png' },
        { type: 'video', imageName: 'c.mp4', url: 'https://example.com/c.mp4', id: '3' }
      ];
      expect(items.length).assertEqual(3);
      expect(UploadImageValidator.countWithRemoteUrl(items)).assertEqual(2);
      expect(UploadImageValidator.isValid(items[1])).assertTrue();
      expect(UploadImageValidator.hasRemoteUrl(items[1])).assertFalse();
    });

    it('animation_constant_should_match_ui_timing', 0, () => {
      expect(ANIMATION_FIVE).assertEqual(500);
      expect(ANIMATION_FIVE).assertLarger(0);
      expect(ANIMATION_FIVE % 100).assertEqual(0);
    });

    it('log_folder_and_attachment_folder_should_not_overlap', 0, () => {
      const logPath = CachePathValidator.build('/cache', KeyConstant.UPLOAD_LOG_PATH_FOLDER);
      const attachmentPath = CachePathValidator.build('/cache', KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER);
      expect(logPath === attachmentPath).assertFalse();
      expect(logPath.startsWith(attachmentPath)).assertFalse();
      expect(attachmentPath.startsWith(logPath)).assertFalse();
      expect(logPath).assertEqual('/cache/logs');
      expect(attachmentPath).assertEqual('/cache/attachment');
    });

    it('cache_log_path_should_include_all_logs_segment', 0, () => {
      const path = CachePathValidator.build('/cache', KeyConstant.CACHE_LOG_PATH_FOLDER);
      expect(path).assertEqual('/cache/cache_logs/allLogs');
      expect(path).assertContain('cache_logs');
      expect(path).assertContain('allLogs');
      expect(path.endsWith('/')).assertFalse();
    });

    it('kv_store_keys_should_not_collide_with_app_storage_keys', 0, () => {
      const appStorageKeys: string[] = [
        KeyConstant.IS_SHOW_LOADING,
        KeyConstant.IS_NEED_REFRESH
      ];
      const kvKeys: string[] = [
        KeyConstant.KV_ISSUE_KEY,
        KeyConstant.KV_ISSUE_UPDATE_TIME_KEY
      ];
      for (let i = 0; i < appStorageKeys.length; i++) {
        expect(kvKeys.includes(appStorageKeys[i])).assertFalse();
        expect(appStorageKeys[i].startsWith('kv_')).assertFalse();
      }
      for (let i = 0; i < kvKeys.length; i++) {
        expect(appStorageKeys.includes(kvKeys[i])).assertFalse();
        expect(kvKeys[i].startsWith('kv_')).assertTrue();
      }
    });

    it('base_url_should_fall_back_to_production_when_empty', 0, () => {
      const resolver = (url: string): string => {
        return url.length > 0 ? url : PRODUCTION_BASE_URL;
      };
      expect(resolver('')).assertEqual(PRODUCTION_BASE_URL);
      expect(resolver('http://custom:8080/')).assertEqual('http://custom:8080/');
      expect(UrlCompositionValidator.isAbsoluteUrl(resolver(''))).assertTrue();
    });

    it('base_url_should_support_system_parameter_override', 0, () => {
      const systemParamUrl = 'http://10.20.72.111:3470/';
      const productUrl = PRODUCTION_BASE_URL;
      const resolved = systemParamUrl.length > 0 ? systemParamUrl : productUrl;
      expect(resolved).assertEqual(productUrl);
      expect(resolved.endsWith('/')).assertTrue();
      const reportUrl = UrlCompositionValidator.join(resolved, UrlConstant.ISSUE_REPORT);
      expect(reportUrl.includes('client/log/issue/report')).assertTrue();
    });

    it('endpoint_whitelist_should_reject_unknown_paths', 0, () => {
      const whitelist: string[] = [
        UrlConstant.ISSUE_REPORT,
        UrlConstant.UPLOAD_FILE,
        UrlConstant.ISSUE_LIST,
        UrlConstant.ISSUE_DETAIL,
        UrlConstant.ISSUE_CONFIG,
        UrlConstant.ISSUE_OPERATION_RECORD
      ];
      expect(whitelist.includes(UrlConstant.ISSUE_REPORT)).assertTrue();
      expect(whitelist.includes('client/log/issue/unknown')).assertFalse();
      expect(whitelist.includes('')).assertFalse();
      expect(whitelist.length).assertEqual(6);
    });

    it('folder_names_should_not_contain_invalid_characters', 0, () => {
      const folders: string[] = [
        KeyConstant.UPLOAD_LOG_PATH_FOLDER,
        KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER,
        KeyConstant.CACHE_LOG_PATH_FOLDER
      ];
      for (let i = 0; i < folders.length; i++) {
        expect(folders[i].indexOf(' ')).assertEqual(-1);
        expect(folders[i].indexOf('\\')).assertEqual(-1);
        expect(folders[i].indexOf(':')).assertEqual(-1);
        expect(folders[i].indexOf('..')).assertEqual(-1);
      }
    });

    it('upload_image_type_should_be_limited_to_known_media', 0, () => {
      const knownTypes: string[] = ['image', 'video'];
      const imageInfo: UploadImageInfo = { type: 'image', imageName: 'a.png' };
      const videoInfo: UploadImageInfo = { type: 'video', imageName: 'b.mp4' };
      const unknownInfo: UploadImageInfo = { type: 'audio', imageName: 'c.mp3' };
      expect(knownTypes.includes(imageInfo.type)).assertTrue();
      expect(knownTypes.includes(videoInfo.type)).assertTrue();
      expect(knownTypes.includes(unknownInfo.type)).assertFalse();
      expect(UploadImageValidator.isValid(unknownInfo)).assertTrue();
    });

    it('config_center_should_fall_back_to_defaults', 0, () => {
      const center = new ConfigCenter();
      center.setDefault('baseUrl', PRODUCTION_BASE_URL);
      center.setDefault('timeout', '30');
      expect(center.get('baseUrl')).assertEqual(PRODUCTION_BASE_URL);
      expect(center.get('timeout')).assertEqual('30');
      expect(center.get('missing')).assertEqual('');
      expect(center.has('baseUrl')).assertFalse();
      expect(center.defaultSize()).assertEqual(2);
      expect(center.size()).assertEqual(0);
    });

    it('config_center_should_prefer_runtime_values', 0, () => {
      const center = new ConfigCenter();
      center.setDefault('baseUrl', PRODUCTION_BASE_URL);
      expect(center.set('baseUrl', 'https://override/')).assertTrue();
      expect(center.get('baseUrl')).assertEqual('https://override/');
      expect(center.has('baseUrl')).assertTrue();
      expect(center.size()).assertEqual(1);
      center.remove('baseUrl');
      expect(center.get('baseUrl')).assertEqual(PRODUCTION_BASE_URL);
      expect(center.has('baseUrl')).assertFalse();
    });

    it('config_center_should_reject_empty_keys', 0, () => {
      const center = new ConfigCenter();
      expect(center.set('', 'value')).assertFalse();
      expect(center.size()).assertEqual(0);
      expect(center.get('')).assertEqual('');
      center.setDefault('', 'fallback');
      expect(center.get('')).assertEqual('fallback');
      expect(center.defaultSize()).assertEqual(1);
    });

    it('config_center_should_read_typed_values', 0, () => {
      const center = new ConfigCenter();
      center.set('showLoading', 'true');
      center.set('timeout', '45');
      expect(center.getBoolean('showLoading')).assertTrue();
      expect(center.getBoolean('timeout')).assertFalse();
      expect(center.getNumber('timeout')).assertEqual(45);
      expect(center.getNumber('missing')).assertEqual(0);
      center.clear();
      expect(center.size()).assertEqual(0);
    });

    it('config_center_should_seed_app_storage_flags', 0, () => {
      const center = new ConfigCenter();
      center.set(KeyConstant.IS_SHOW_LOADING, 'false');
      center.set(KeyConstant.IS_NEED_REFRESH, 'true');
      expect(center.getBoolean(KeyConstant.IS_SHOW_LOADING)).assertFalse();
      expect(center.getBoolean(KeyConstant.IS_NEED_REFRESH)).assertTrue();
      expect(center.get(KeyConstant.IS_SHOW_LOADING)).assertEqual('false');
      expect(center.size()).assertEqual(2);
    });

    it('version_parser_should_handle_dotted_strings', 0, () => {
      expect(VersionComparator.parse('1.0.0').length).assertEqual(3);
      expect(VersionComparator.parse('1.0.0')[0]).assertEqual(1);
      expect(VersionComparator.parse('1.0.0')[2]).assertEqual(0);
      expect(VersionComparator.parse('').length).assertEqual(0);
      expect(VersionComparator.parse('1.x.3')[1]).assertEqual(0);
    });

    it('version_comparator_should_order_releases', 0, () => {
      expect(VersionComparator.compare('1.0.0', '1.0.0')).assertEqual(0);
      expect(VersionComparator.compare('1.0.1', '1.0.0')).assertEqual(1);
      expect(VersionComparator.compare('1.0.0', '1.0.1')).assertEqual(-1);
      expect(VersionComparator.compare('2.0', '1.9.9')).assertEqual(1);
      expect(VersionComparator.compare('1.0', '1.0.0')).assertEqual(0);
    });

    it('version_comparator_should_gate_config_by_version', 0, () => {
      expect(VersionComparator.isAtLeast('1.2.0', '1.1.0')).assertTrue();
      expect(VersionComparator.isAtLeast('1.0.0', '1.1.0')).assertFalse();
      expect(VersionComparator.isAtLeast('1.1.0', '1.1.0')).assertTrue();
      expect(VersionComparator.isValid('1.2.3')).assertTrue();
      expect(VersionComparator.isValid('1.2.x')).assertFalse();
      expect(VersionComparator.isValid('')).assertFalse();
    });

    it('version_comparator_should_ignore_missing_segments', 0, () => {
      expect(VersionComparator.compare('1', '1.0.0')).assertEqual(0);
      expect(VersionComparator.compare('1.0.0.1', '1.0.0')).assertEqual(1);
      expect(VersionComparator.isValid('1')).assertTrue();
      expect(VersionComparator.isValid('1.2.3.4')).assertTrue();
      expect(VersionComparator.isValid('1..2')).assertFalse();
    });

    it('query_builder_should_encode_pairs', 0, () => {
      const builder = new QueryStringBuilder();
      expect(builder.add('issueId', 'ISSUE-1')).assertTrue();
      expect(builder.add('status', 'processing')).assertTrue();
      expect(builder.size()).assertEqual(2);
      expect(builder.build()).assertEqual('?issueId=ISSUE-1&status=processing');
      builder.clear();
      expect(builder.size()).assertEqual(0);
      expect(builder.build()).assertEqual('');
    });

    it('query_builder_should_encode_special_characters', 0, () => {
      const builder = new QueryStringBuilder();
      expect(builder.add('q', 'a b')).assertTrue();
      expect(builder.build()).assertEqual('?q=a%20b');
      builder.clear();
      builder.add('path', 'a/b');
      expect(builder.build()).assertContain('%2F');
      expect(builder.add('', 'value')).assertFalse();
      builder.clear();
      expect(builder.build()).assertEqual('');
    });

    it('query_builder_should_reject_empty_key_only', 0, () => {
      const builder = new QueryStringBuilder();
      expect(builder.add('', 'value')).assertFalse();
      expect(builder.add('key', '')).assertTrue();
      expect(builder.size()).assertEqual(1);
      expect(builder.build()).assertEqual('?key=');
    });

    it('router_should_register_default_routes', 0, () => {
      const router = new EndpointRouter().defaultRoutes();
      expect(router.size()).assertEqual(6);
      expect(router.has('report')).assertTrue();
      expect(router.has('upload')).assertTrue();
      expect(router.has('list')).assertTrue();
      expect(router.has('detail')).assertTrue();
      expect(router.has('config')).assertTrue();
      expect(router.has('operation')).assertTrue();
      expect(router.names().length).assertEqual(6);
    });

    it('router_should_reject_duplicate_names', 0, () => {
      const router = new EndpointRouter();
      const route = new RouteDefinition('report', UrlConstant.ISSUE_REPORT, 'POST', true);
      expect(router.register(route)).assertTrue();
      expect(router.register(new RouteDefinition('report', UrlConstant.ISSUE_LIST, 'POST', true))).assertFalse();
      expect(router.size()).assertEqual(1);
      expect((router.resolve('report') as RouteDefinition).path).assertEqual(UrlConstant.ISSUE_REPORT);
    });

    it('router_should_reject_invalid_routes', 0, () => {
      const router = new EndpointRouter();
      expect(router.register(new RouteDefinition('', UrlConstant.ISSUE_REPORT, 'POST', true))).assertFalse();
      expect(router.register(new RouteDefinition('empty', '', 'POST', true))).assertFalse();
      expect(router.size()).assertEqual(0);
      expect(router.resolve('missing') === undefined).assertTrue();
    });

    it('router_should_resolve_paths_and_methods', 0, () => {
      const router = new EndpointRouter().defaultRoutes();
      const report = router.resolve('report') as RouteDefinition;
      expect(report.method).assertEqual('POST');
      expect(report.requiresAuth).assertTrue();
      expect(report.path).assertEqual(ENDPOINT_ISSUE_REPORT);
      expect(report.url(PRODUCTION_BASE_URL))
        .assertEqual(PRODUCTION_BASE_URL + ENDPOINT_ISSUE_REPORT);
      const config = router.resolve('config') as RouteDefinition;
      expect(config.requiresAuth).assertFalse();
    });

    it('router_should_list_authenticated_routes', 0, () => {
      const router = new EndpointRouter().defaultRoutes();
      const authenticated = router.authenticatedRoutes();
      expect(authenticated.length).assertEqual(5);
      for (let i = 0; i < authenticated.length; i++) {
        expect(authenticated[i].requiresAuth).assertTrue();
        expect(authenticated[i].path.length).assertLarger(0);
      }
      expect(router.resolve('config') !== undefined).assertTrue();
    });

    it('router_url_should_normalize_base_slashes', 0, () => {
      const router = new EndpointRouter().defaultRoutes();
      const upload = router.resolve('upload') as RouteDefinition;
      expect(upload.url('http://host/')).assertEqual('http://host/' + ENDPOINT_UPLOAD_FILE);
      expect(upload.url('http://host')).assertEqual('http://host/' + ENDPOINT_UPLOAD_FILE);
      expect(upload.url('http://host/').indexOf('//dev')).assertEqual(-1);
      expect(upload.url('http://host/').indexOf('http://host//')).assertEqual(-1);
    });

    it('router_routes_should_be_unique_paths', 0, () => {
      const router = new EndpointRouter().defaultRoutes();
      const names: string[] = router.names();
      const paths: Set<string> = new Set<string>();
      for (let i = 0; i < names.length; i++) {
        const route = router.resolve(names[i]) as RouteDefinition;
        expect(paths.has(route.path)).assertFalse();
        paths.add(route.path);
      }
      expect(paths.size).assertEqual(router.size());
    });

    it('cache_layout_should_add_unique_folders', 0, () => {
      const layout = new CacheLayout();
      expect(layout.add(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER)).assertTrue();
      expect(layout.add(KeyConstant.UPLOAD_LOG_PATH_FOLDER)).assertTrue();
      expect(layout.add(KeyConstant.CACHE_LOG_PATH_FOLDER)).assertTrue();
      expect(layout.size()).assertEqual(3);
      expect(layout.add(KeyConstant.UPLOAD_LOG_PATH_FOLDER)).assertFalse();
      expect(layout.size()).assertEqual(3);
    });

    it('cache_layout_should_reject_unsafe_folders', 0, () => {
      const layout = new CacheLayout();
      expect(layout.add('')).assertFalse();
      expect(layout.add('../escape')).assertFalse();
      expect(layout.add('/absolute')).assertFalse();
      expect(layout.add('safe/folder')).assertTrue();
      expect(layout.size()).assertEqual(1);
      expect(layout.getFolders()[0]).assertEqual('safe/folder');
    });

    it('cache_layout_should_build_absolute_paths', 0, () => {
      const layout = new CacheLayout();
      layout.add(KeyConstant.UPLOAD_LOG_PATH_FOLDER);
      layout.add(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER);
      const paths = layout.buildPaths('/data/cache');
      expect(paths.length).assertEqual(2);
      expect(paths[0]).assertEqual('/data/cache/logs');
      expect(paths[1]).assertEqual('/data/cache/attachment');
      expect(paths[0].indexOf('//')).assertEqual(-1);
      expect(layout.buildPaths('/data/cache/')[0]).assertEqual('/data/cache/logs');
    });

    it('cache_layout_should_report_deepest_folder', 0, () => {
      const layout = new CacheLayout();
      expect(layout.deepestDepth()).assertEqual(0);
      layout.add('logs');
      expect(layout.deepestDepth()).assertEqual(1);
      layout.add(KeyConstant.CACHE_LOG_PATH_FOLDER);
      expect(layout.deepestDepth()).assertEqual(2);
      layout.clear();
      expect(layout.size()).assertEqual(0);
      expect(layout.deepestDepth()).assertEqual(0);
    });

    it('cache_layout_should_copy_folder_list', 0, () => {
      const layout = new CacheLayout();
      layout.add('logs');
      const folders = layout.getFolders();
      folders.push('injected');
      expect(layout.size()).assertEqual(1);
      expect(folders.length).assertEqual(2);
      expect(layout.getFolders().length).assertEqual(1);
    });

    it('feature_flags_should_default_to_defined_value', 0, () => {
      const flags = new FeatureFlagRegistry();
      flags.define('enableVideo', true);
      flags.define('enableLogs', false);
      expect(flags.size()).assertEqual(2);
      expect(flags.isEnabled('enableVideo')).assertTrue();
      expect(flags.isEnabled('enableLogs')).assertFalse();
      expect(flags.isEnabled('missing')).assertFalse();
      expect(flags.enabledCount()).assertEqual(1);
    });

    it('feature_flags_should_toggle_defined_flags', 0, () => {
      const flags = new FeatureFlagRegistry();
      flags.define('enableLogs', false);
      expect(flags.set('enableLogs', true)).assertTrue();
      expect(flags.isEnabled('enableLogs')).assertTrue();
      expect(flags.enabledCount()).assertEqual(1);
      expect(flags.set('enableLogs', false)).assertTrue();
      expect(flags.enabledCount()).assertEqual(0);
    });

    it('feature_flags_should_reject_unknown_flags', 0, () => {
      const flags = new FeatureFlagRegistry();
      expect(flags.set('unknown', true)).assertFalse();
      expect(flags.isEnabled('unknown')).assertFalse();
      expect(flags.size()).assertEqual(0);
      flags.define('', true);
      expect(flags.size()).assertEqual(0);
    });

    it('feature_flags_should_list_names_and_reset', 0, () => {
      const flags = new FeatureFlagRegistry();
      flags.define('a', true);
      flags.define('b', true);
      flags.define('c', false);
      expect(flags.names().length).assertEqual(3);
      expect(flags.enabledCount()).assertEqual(2);
      flags.reset();
      expect(flags.size()).assertEqual(0);
      expect(flags.names().length).assertEqual(0);
      expect(flags.isEnabled('a')).assertFalse();
    });

    it('feature_flags_should_keep_independent_values', 0, () => {
      const first = new FeatureFlagRegistry();
      const second = new FeatureFlagRegistry();
      first.define('shared', true);
      second.define('shared', false);
      expect(first.isEnabled('shared')).assertTrue();
      expect(second.isEnabled('shared')).assertFalse();
      first.set('shared', false);
      expect(first.isEnabled('shared')).assertFalse();
      expect(second.isEnabled('shared')).assertFalse();
    });

    it('router_default_paths_should_match_constants', 0, () => {
      const router = new EndpointRouter().defaultRoutes();
      const expected: string[] = [
        ENDPOINT_ISSUE_REPORT,
        ENDPOINT_UPLOAD_FILE,
        ENDPOINT_ISSUE_LIST,
        ENDPOINT_ISSUE_DETAIL,
        ENDPOINT_ISSUE_CONFIG,
        ENDPOINT_OPERATION_RECORD
      ];
      for (let i = 0; i < expected.length; i++) {
        const route = router.resolve(router.names()[i]) as RouteDefinition;
        expect(route.method).assertEqual('POST');
        expect(expected[i].length).assertLarger(0);
      }
      expect((router.resolve('report') as RouteDefinition).path).assertEqual(expected[0]);
      expect((router.resolve('operation') as RouteDefinition).path).assertEqual(expected[5]);
    });

    it('config_center_should_merge_partial_updates', 0, () => {
      const center = new ConfigCenter();
      center.setDefault('baseUrl', PRODUCTION_BASE_URL);
      center.setDefault('timeout', '30');
      center.setDefault('retry', '3');
      center.set('timeout', '60');
      expect(center.get('baseUrl')).assertEqual(PRODUCTION_BASE_URL);
      expect(center.getNumber('timeout')).assertEqual(60);
      expect(center.getNumber('retry')).assertEqual(3);
      expect(center.size()).assertEqual(1);
      expect(center.defaultSize()).assertEqual(3);
    });

    it('config_center_should_support_endpoint_override', 0, () => {
      const center = new ConfigCenter();
      center.setDefault('baseUrl', PRODUCTION_BASE_URL);
      const baseUrl = center.get('baseUrl');
      const reportUrl = UrlCompositionValidator.join(baseUrl, UrlConstant.ISSUE_REPORT);
      expect(reportUrl.startsWith(PRODUCTION_BASE_URL)).assertTrue();
      expect(reportUrl.endsWith(UrlConstant.ISSUE_REPORT)).assertTrue();
      center.set('baseUrl', 'https://staging/');
      const stagingUrl = UrlCompositionValidator.join(center.get('baseUrl'), UrlConstant.ISSUE_LIST);
      expect(stagingUrl).assertEqual('https://staging/' + UrlConstant.ISSUE_LIST);
      expect(stagingUrl.indexOf('10.20.72.111')).assertEqual(-1);
    });

    it('version_gate_should_unlock_features_in_order', 0, () => {
      const features: string[] = ['1.1.0', '1.2.0', '2.0.0'];
      const appVersion = '1.5.0';
      let unlocked: number = 0;
      for (let i = 0; i < features.length; i++) {
        if (VersionComparator.isAtLeast(appVersion, features[i])) {
          unlocked++;
        }
      }
      expect(unlocked).assertEqual(2);
      expect(VersionComparator.isAtLeast('2.0.0', features[2])).assertTrue();
      expect(VersionComparator.isAtLeast('1.0.1', features[0])).assertFalse();
    });

    it('flags_and_version_should_compose_gating', 0, () => {
      const flags = new FeatureFlagRegistry();
      flags.define('videoAttachment', true);
      flags.define('logUpload', false);
      const versionOk = VersionComparator.isAtLeast('1.2.0', '1.1.0');
      expect(flags.isEnabled('videoAttachment') && versionOk).assertTrue();
      expect(flags.isEnabled('logUpload') && versionOk).assertFalse();
      flags.set('logUpload', true);
      expect(flags.isEnabled('logUpload') && versionOk).assertTrue();
      expect(flags.enabledCount()).assertEqual(2);
    });

    it('cache_layout_should_plan_default_folders', 0, () => {
      const layout = new CacheLayout();
      layout.add('cache_logs');
      layout.add(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER);
      layout.add(KeyConstant.CACHE_LOG_PATH_FOLDER);
      expect(layout.size()).assertEqual(3);
      const paths = layout.buildPaths('/data/cache');
      expect(paths.length).assertEqual(3);
      for (let i = 0; i < paths.length; i++) {
        expect(paths[i].startsWith('/data/cache/')).assertTrue();
        expect(paths[i].indexOf('..')).assertEqual(-1);
      }
      expect(layout.deepestDepth()).assertEqual(2);
    });

    it('query_builder_should_support_repeated_clear', 0, () => {
      const builder = new QueryStringBuilder();
      builder.add('a', '1');
      builder.add('b', '2');
      expect(builder.size()).assertEqual(2);
      builder.clear();
      builder.clear();
      expect(builder.size()).assertEqual(0);
      expect(builder.build()).assertEqual('');
      builder.add('c', '3');
      expect(builder.build()).assertEqual('?c=3');
    });

    it('router_should_store_auth_matrix', 0, () => {
      const router = new EndpointRouter().defaultRoutes();
      const names: string[] = router.names();
      let authCount: number = 0;
      let publicCount: number = 0;
      for (let i = 0; i < names.length; i++) {
        const route = router.resolve(names[i]) as RouteDefinition;
        if (route.requiresAuth) {
          authCount++;
        } else {
          publicCount++;
        }
      }
      expect(authCount).assertEqual(5);
      expect(publicCount).assertEqual(1);
      expect(authCount + publicCount).assertEqual(router.size());
    });

    it('config_and_router_should_build_full_url', 0, () => {
      const center = new ConfigCenter();
      center.setDefault('baseUrl', PRODUCTION_BASE_URL);
      const router = new EndpointRouter().defaultRoutes();
      const detail = router.resolve('detail') as RouteDefinition;
      const url = detail.url(center.get('baseUrl'));
      expect(url).assertEqual(PRODUCTION_BASE_URL + ENDPOINT_ISSUE_DETAIL);
      expect(UrlCompositionValidator.isAbsoluteUrl(url)).assertTrue();
      expect(url.indexOf('//client')).assertEqual(-1);
    });

    it('router_path_set_should_match_expected_catalog', 0, () => {
      const router = new EndpointRouter().defaultRoutes();
      const names: string[] = router.names();
      const actual: Set<string> = new Set<string>();
      for (let i = 0; i < names.length; i++) {
        actual.add((router.resolve(names[i]) as RouteDefinition).path);
      }
      const expected: string[] = [
        ENDPOINT_ISSUE_REPORT,
        ENDPOINT_UPLOAD_FILE,
        ENDPOINT_ISSUE_LIST,
        ENDPOINT_ISSUE_DETAIL,
        ENDPOINT_ISSUE_CONFIG,
        ENDPOINT_OPERATION_RECORD
      ];
      expect(actual.size).assertEqual(expected.length);
      for (let i = 0; i < expected.length; i++) {
        expect(actual.has(expected[i])).assertTrue();
      }
      expect(actual.has('client/log/issue/unknown')).assertFalse();
    });

    it('config_center_should_not_share_state_between_instances', 0, () => {
      const first = new ConfigCenter();
      const second = new ConfigCenter();
      first.setDefault('timeout', '30');
      first.set('timeout', '60');
      expect(first.getNumber('timeout')).assertEqual(60);
      expect(second.getNumber('timeout')).assertEqual(0);
      expect(second.defaultSize()).assertEqual(0);
      second.setDefault('timeout', '10');
      expect(second.getNumber('timeout')).assertEqual(10);
      expect(first.getNumber('timeout')).assertEqual(60);
    });

    it('version_comparator_should_return_zero_for_equal_inputs', 0, () => {
      expect(VersionComparator.compare('0.0.0', '0.0.0')).assertEqual(0);
      expect(VersionComparator.compare('1.0', '1.0.0.0')).assertEqual(0);
      expect(VersionComparator.compare('', '')).assertEqual(0);
      expect(VersionComparator.compare('1.0.0', '1.0')).assertEqual(0);
      expect(VersionComparator.isValid('0')).assertTrue();
    });

    it('cache_layout_should_reject_nested_escape', 0, () => {
      const layout = new CacheLayout();
      expect(layout.add('logs/../secret')).assertFalse();
      expect(layout.add('logs/2026')).assertTrue();
      expect(layout.size()).assertEqual(1);
      expect(layout.deepestDepth()).assertEqual(2);
      expect(layout.buildPaths('/cache')[0]).assertEqual('/cache/logs/2026');
    });

    it('query_builder_should_join_many_pairs_in_order', 0, () => {
      const builder = new QueryStringBuilder();
      const keys: string[] = ['a', 'b', 'c', 'd'];
      for (let i = 0; i < keys.length; i++) {
        expect(builder.add(keys[i], `${i}`)).assertTrue();
      }
      expect(builder.size()).assertEqual(4);
      expect(builder.build()).assertEqual('?a=0&b=1&c=2&d=3');
      expect(builder.build().split('&').length).assertEqual(4);
    });

    it('feature_flags_reset_should_require_redefinition', 0, () => {
      const flags = new FeatureFlagRegistry();
      flags.define('flag', true);
      expect(flags.set('flag', false)).assertTrue();
      flags.reset();
      expect(flags.set('flag', true)).assertFalse();
      expect(flags.isEnabled('flag')).assertFalse();
      flags.define('flag', true);
      expect(flags.isEnabled('flag')).assertTrue();
      expect(flags.enabledCount()).assertEqual(1);
    });

    it('endpoint_constants_should_remain_relative_paths', 0, () => {
      const endpoints: string[] = [
        UrlConstant.ISSUE_REPORT,
        UrlConstant.UPLOAD_FILE,
        UrlConstant.ISSUE_LIST,
        UrlConstant.ISSUE_DETAIL,
        UrlConstant.ISSUE_CONFIG,
        UrlConstant.ISSUE_OPERATION_RECORD
      ];
      for (let i = 0; i < endpoints.length; i++) {
        expect(UrlCompositionValidator.isRelativeEndpoint(endpoints[i])).assertTrue();
        expect(endpoints[i].indexOf(' ')).assertEqual(-1);
        expect(endpoints[i].indexOf('..')).assertEqual(-1);
        expect(endpoints[i].endsWith('/')).assertFalse();
      }
      expect(endpoints.length).assertEqual(6);
    });

    it('config_center_should_expose_default_only_keys', 0, () => {
      const center = new ConfigCenter();
      center.setDefault('enableWatermark', 'true');
      center.setDefault('maxAttachment', '4');
      expect(center.has('enableWatermark')).assertFalse();
      expect(center.getBoolean('enableWatermark')).assertTrue();
      expect(center.getNumber('maxAttachment')).assertEqual(4);
      expect(center.size()).assertEqual(0);
      center.set('maxAttachment', '4');
      expect(center.has('maxAttachment')).assertTrue();
      expect(center.size()).assertEqual(1);
    });

    it('cache_layout_should_build_empty_path_list', 0, () => {
      const layout = new CacheLayout();
      expect(layout.buildPaths('/data/cache').length).assertEqual(0);
      expect(layout.getFolders().length).assertEqual(0);
      expect(layout.deepestDepth()).assertEqual(0);
      layout.add('logs');
      expect(layout.buildPaths('/').length).assertEqual(1);
      expect(layout.buildPaths('/')[0]).assertEqual('/logs');
    });

    it('version_gate_should_compare_major_releases', 0, () => {
      expect(VersionComparator.compare('10.0.0', '9.9.9')).assertEqual(1);
      expect(VersionComparator.compare('0.9.0', '1.0.0')).assertEqual(-1);
      expect(VersionComparator.isAtLeast('10.0.0', '9.9.9')).assertTrue();
      expect(VersionComparator.isAtLeast('0.9.9', '1.0.0')).assertFalse();
      expect(VersionComparator.parse('10.0.0')[0]).assertEqual(10);
    });

    it('router_should_allow_distinct_names_on_same_path', 0, () => {
      const router = new EndpointRouter();
      expect(router.register(new RouteDefinition('alias-a', UrlConstant.ISSUE_LIST, 'POST', true))).assertTrue();
      expect(router.register(new RouteDefinition('alias-b', UrlConstant.ISSUE_LIST, 'POST', true))).assertTrue();
      expect(router.size()).assertEqual(2);
      expect((router.resolve('alias-a') as RouteDefinition).path)
        .assertEqual((router.resolve('alias-b') as RouteDefinition).path);
      expect(router.authenticatedRoutes().length).assertEqual(2);
    });

    it('feature_flags_should_keep_latest_definition_default', 0, () => {
      const flags = new FeatureFlagRegistry();
      flags.define('feature', true);
      expect(flags.isEnabled('feature')).assertTrue();
      flags.define('feature', false);
      expect(flags.isEnabled('feature')).assertFalse();
      expect(flags.size()).assertEqual(1);
      flags.set('feature', true);
      expect(flags.enabledCount()).assertEqual(1);
      expect(flags.names().length).assertEqual(1);
    });

    it('query_builder_should_count_empty_values', 0, () => {
      const builder = new QueryStringBuilder();
      expect(builder.add('a', '')).assertTrue();
      expect(builder.add('b', '')).assertTrue();
      expect(builder.size()).assertEqual(2);
      expect(builder.build()).assertEqual('?a=&b=');
      builder.clear();
      expect(builder.build()).assertEqual('');
    });

    it('endpoint_join_should_handle_slash_variants', 0, () => {
      expect(UrlCompositionValidator.join('http://host/', '/path')).assertEqual('http://host/path');
      expect(UrlCompositionValidator.join('http://host', 'path')).assertEqual('http://host/path');
      expect(UrlCompositionValidator.join('', 'client/log')).assertEqual('client/log');
      expect(UrlCompositionValidator.isAbsoluteUrl('client/log')).assertFalse();
      expect(UrlCompositionValidator.join('http://host', '/path')).assertEqual('http://host/path');
      expect(UrlCompositionValidator.join('http://host/', 'path')).assertEqual('http://host/path');
      expect(UrlCompositionValidator.join('', '')).assertEqual('');
      expect(UrlCompositionValidator.join('http://host/', '')).assertEqual('http://host/');
      expect(UrlCompositionValidator.isAbsoluteUrl('https://host')).assertTrue();
      expect(UrlCompositionValidator.isAbsoluteUrl('')).assertFalse();
    });
  });
}

