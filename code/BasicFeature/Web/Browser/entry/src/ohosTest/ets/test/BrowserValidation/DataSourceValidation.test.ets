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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, componentByIdExists, waitForId, countById,
  ID_INPUT_URL, ID_NAV_HOME, PAD_HOME_PAGE, PHONE_HOME_PAGE, SEARCH_ENGINE,
  TIMEOUT_COMPONENT, buildSearchUrl, encodeSearchWord, deviceIsPhone
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockNetwork } from '../Shared/BrowserMock';

const TAG: string = 'BrowserDataSourceValidationTest';

/* ------------------------------------------------------------------ */
/* Data source constants                                               */
/* ------------------------------------------------------------------ */

/** Bundled local start page of the pad layout. */
const LOCAL_PAD_PAGE: string = 'rawfile://pad.html';

/** Bundled local start page of the phone layout. */
const LOCAL_PHONE_PAGE: string = 'rawfile://phone.html';

/** Remote documentation page opened from the start page. */
const REMOTE_DOC: string = 'https://www.example.com/docs/index.html';

/** Remote page served by the sample portal. */
const REMOTE_PORTAL: string = 'https://www.example.com/';

/** Bing search endpoint used by the address bar. */
const SEARCH_BASE: string = 'https://www.bing.com/search?q=';

/** Favicon requested for the active origin. */
const FAVICON_URL: string = 'https://www.example.com/favicon.ico';

/** Hosts the browser is allowed to load remote content from. */
const ALLOWED_HOSTS: string[] = ['www.example.com', 'www.bing.com', 'passport.example.com'];

/** Priority of the bundled start page, the lowest number wins. */
const PRIORITY_LOCAL: number = 0;

/** Priority of the favicon probe. */
const PRIORITY_FAVICON: number = 1;

/** Priority of a remote document. */
const PRIORITY_REMOTE: number = 2;

/** Priority of a search result page. */
const PRIORITY_SEARCH: number = 3;

/** Longest accepted source url. */
const MAX_SOURCE_LENGTH: number = 2048;

/* ------------------------------------------------------------------ */
/* Source descriptor                                                   */
/* ------------------------------------------------------------------ */

/** Kind of content the browser can load. */
enum SourceKind {
  RAWFILE = 0,
  REMOTE = 1,
  SEARCH = 2,
  FAVICON = 3
}

/** One addressable data source of the start page. */
class SourceDescriptor {
  kind: SourceKind;
  url: string;
  priority: number;
  label: string;

  constructor(kind: SourceKind, url: string, priority: number, label: string) {
    this.kind = kind;
    this.url = url;
    this.priority = priority;
    this.label = label;
  }

  isLocal(): boolean {
    return this.kind === SourceKind.RAWFILE;
  }

  isRemote(): boolean {
    return this.kind === SourceKind.REMOTE || this.kind === SourceKind.SEARCH ||
      this.kind === SourceKind.FAVICON;
  }

  /** Scheme up to the colon, empty when the url has none. */
  scheme(): string {
    const colon: number = this.url.indexOf(':');
    if (colon <= 0) {
      return '';
    }
    return this.url.substring(0, colon);
  }

  /** Host part of an https url, empty for local sources. */
  host(): string {
    if (!this.url.startsWith('https://')) {
      return '';
    }
    const rest: string = this.url.substring(8);
    const slash: number = rest.indexOf('/');
    if (slash < 0) {
      return rest;
    }
    return rest.substring(0, slash);
  }

  isHttps(): boolean {
    return this.url.startsWith('https://');
  }

  /** Stable identity used by the cache and by de-duplication. */
  key(): string {
    return `${this.kind}|${this.url}`;
  }

  sameAs(other: SourceDescriptor): boolean {
    return other !== null && other !== undefined && this.key() === other.key();
  }

  describe(): string {
    return `${this.label}(${sourceKindName(this.kind)}) p${this.priority} ${this.url}`;
  }
}

/** Human readable name of a source kind, used by the logs only. */
function sourceKindName(kind: SourceKind): string {
  if (kind === SourceKind.RAWFILE) {
    return 'rawfile';
  }
  if (kind === SourceKind.REMOTE) {
    return 'remote';
  }
  if (kind === SourceKind.SEARCH) {
    return 'search';
  }
  return 'favicon';
}

/** One refused source together with the reason it was refused. */
class SourceRejection {
  url: string;
  reason: string;

  constructor(url: string, reason: string) {
    this.url = url;
    this.reason = reason;
  }

  describe(): string {
    return `${this.reason}: ${this.url}`;
  }
}

/* ------------------------------------------------------------------ */
/* Source validator                                                    */
/* ------------------------------------------------------------------ */

/**
 * Allow list based validator.
 *
 * Remote content must use https and belong to the allow list, local content
 * must stay inside the rawfile bundle, and script or data urls are refused
 * before they can reach the Web controller.
 */
class SourceValidator {
  allowedHosts: string[];
  rejections: SourceRejection[] = [];

  constructor(allowedHosts: string[]) {
    this.allowedHosts = allowedHosts;
  }

  /** Rejection reason, empty string means the source is accepted. */
  reasonFor(source: SourceDescriptor): string {
    if (source === null || source === undefined) {
      return 'null source';
    }
    const url: string = source.url;
    if (url.length === 0) {
      return 'empty url';
    }
    if (url.length > MAX_SOURCE_LENGTH) {
      return 'url too long';
    }
    if (url.indexOf(' ') >= 0 || url.indexOf('\n') >= 0 || url.indexOf('\t') >= 0) {
      return 'whitespace in url';
    }
    if (url.startsWith('javascript:')) {
      return 'script scheme';
    }
    if (url.startsWith('data:')) {
      return 'data scheme';
    }
    if (url.startsWith('file:')) {
      return 'file scheme';
    }
    if (url.indexOf('..') >= 0) {
      return 'path traversal';
    }
    if (source.kind === SourceKind.RAWFILE) {
      if (!url.startsWith('rawfile://')) {
        return 'local source outside rawfile';
      }
      return '';
    }
    if (!source.isHttps()) {
      return source.url.startsWith('http://') ? 'insecure http' : 'remote source not https';
    }
    if (this.allowedHosts.indexOf(source.host()) < 0) {
      return 'host not allowed';
    }
    if (source.kind === SourceKind.SEARCH && !url.startsWith(SEARCH_BASE)) {
      return 'unexpected search endpoint';
    }
    if (source.kind === SourceKind.FAVICON && !url.endsWith('.ico')) {
      return 'favicon must end with .ico';
    }
    return '';
  }

  validate(source: SourceDescriptor): boolean {
    const reason: string = this.reasonFor(source);
    if (reason.length === 0) {
      return true;
    }
    this.rejections.push(new SourceRejection(source === null ? '' : source.url, reason));
    return false;
  }

  rejectedCount(): number {
    return this.rejections.length;
  }

  lastReason(): string {
    if (this.rejections.length === 0) {
      return '';
    }
    return this.rejections[this.rejections.length - 1].reason;
  }

  rejectedUrls(): string[] {
    return this.rejections.map((item: SourceRejection) => item.url);
  }

  reset(): void {
    this.rejections = [];
  }
}

/* ------------------------------------------------------------------ */
/* Registry with priority and cache                                    */
/* ------------------------------------------------------------------ */

/** Cached payload of one source together with its hit counter. */
class CacheEntry {
  key: string;
  payload: string;
  hits: number = 0;
  storedAt: number = 0;

  constructor(key: string, payload: string, storedAt: number) {
    this.key = key;
    this.payload = payload;
    this.storedAt = storedAt;
  }
}

/** Ordered registry of candidate start page sources. */
class DataSourceRegistry {
  validator: SourceValidator;
  sources: SourceDescriptor[] = [];
  cache: CacheEntry[] = [];
  activeKey: string = '';
  cacheHits: number = 0;
  cacheMisses: number = 0;

  constructor(validator: SourceValidator) {
    this.validator = validator;
  }

  indexOfKey(key: string): number {
    for (let index = 0; index < this.sources.length; index++) {
      if (this.sources[index].key() === key) {
        return index;
      }
    }
    return -1;
  }

  /** Adds a validated source, de-duplicating by kind and url. */
  add(source: SourceDescriptor): boolean {
    if (!this.validator.validate(source)) {
      return false;
    }
    if (this.indexOfKey(source.key()) >= 0) {
      return false;
    }
    this.sources.push(source);
    return true;
  }

  /** Sources ordered by ascending priority, ties keep insertion order. */
  ordered(): SourceDescriptor[] {
    const result: SourceDescriptor[] = this.sources.slice(0);
    for (let outer = 1; outer < result.length; outer++) {
      const candidate: SourceDescriptor = result[outer];
      let cursor: number = outer - 1;
      while (cursor >= 0 && result[cursor].priority > candidate.priority) {
        result[cursor + 1] = result[cursor];
        cursor -= 1;
      }
      result[cursor + 1] = candidate;
    }
    return result;
  }

  /** Highest priority source, the one the start page uses first. */
  preferred(): SourceDescriptor | null {
    const ordered: SourceDescriptor[] = this.ordered();
    return ordered.length === 0 ? null : ordered[0];
  }

  activate(key: string): boolean {
    if (this.indexOfKey(key) < 0) {
      return false;
    }
    this.activeKey = key;
    return true;
  }

  active(): SourceDescriptor | null {
    const index: number = this.indexOfKey(this.activeKey);
    return index < 0 ? null : this.sources[index];
  }

  size(): number {
    return this.sources.length;
  }

  rejectedCount(): number {
    return this.validator.rejectedCount();
  }

  /** Loads through the network double and stores the payload. */
  fetch(source: SourceDescriptor, network: MockNetwork, now: number): boolean {
    if (!this.validator.validate(source)) {
      return false;
    }
    const cached: CacheEntry | null = this.cacheLookup(source.key());
    if (cached !== null) {
      this.cacheHits += 1;
      cached.hits += 1;
      return true;
    }
    this.cacheMisses += 1;
    if (!network.fetch(source.url)) {
      return false;
    }
    this.cache.push(new CacheEntry(source.key(), `payload:${source.label}`, now));
    return true;
  }

  cacheLookup(key: string): CacheEntry | null {
    for (let index = 0; index < this.cache.length; index++) {
      if (this.cache[index].key === key) {
        return this.cache[index];
      }
    }
    return null;
  }

  invalidate(key: string): boolean {
    for (let index = 0; index < this.cache.length; index++) {
      if (this.cache[index].key === key) {
        this.cache.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  clearCache(): number {
    const count: number = this.cache.length;
    this.cache = [];
    return count;
  }

  hitCount(): number {
    return this.cacheHits;
  }

  missCount(): number {
    return this.cacheMisses;
  }

  /** Switches the active source and invalidates the previous payload. */
  switchTo(key: string): boolean {
    if (!this.activate(key)) {
      return false;
    }
    const active: SourceDescriptor | null = this.active();
    if (active !== null) {
      this.invalidate(active.key());
    }
    return true;
  }

  /** Deterministic content fingerprint of a source url. */
  integrityOf(source: SourceDescriptor): string {
    let sum: number = 0;
    for (let index = 0; index < source.url.length; index++) {
      sum = (sum + source.url.charCodeAt(index)) % 100000;
    }
    return `integrity-${sum}`;
  }

  summary(): string {
    return `sources=${this.sources.length} rejected=${this.rejectedCount()} ` +
      `hits=${this.cacheHits} misses=${this.cacheMisses}`;
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                            */
/* ------------------------------------------------------------------ */

/** Bundled start page matching the current device form factor. */
function localSource(isPhone: boolean): SourceDescriptor {
  const url: string = isPhone ? LOCAL_PHONE_PAGE : LOCAL_PAD_PAGE;
  const label: string = isPhone ? 'phone home' : 'pad home';
  return new SourceDescriptor(SourceKind.RAWFILE, url, PRIORITY_LOCAL, label);
}

/** Remote documentation page of the portal. */
function remoteSource(): SourceDescriptor {
  return new SourceDescriptor(SourceKind.REMOTE, REMOTE_DOC, PRIORITY_REMOTE, 'portal docs');
}

/** Bing result page for the given search word. */
function searchSource(word: string): SourceDescriptor {
  return new SourceDescriptor(SourceKind.SEARCH, SEARCH_BASE + encodeSearchWord(word),
    PRIORITY_SEARCH, 'bing results');
}

/** Favicon probe for the portal origin. */
function faviconSource(): SourceDescriptor {
  return new SourceDescriptor(SourceKind.FAVICON, FAVICON_URL, PRIORITY_FAVICON, 'portal icon');
}

/** Sources that the validator must refuse, one per rule. */
function hostileSources(): SourceDescriptor[] {
  const rows: SourceDescriptor[] = [];
  rows.push(new SourceDescriptor(SourceKind.REMOTE, '', PRIORITY_REMOTE, 'empty'));
  rows.push(new SourceDescriptor(SourceKind.REMOTE, 'javascript:alert(1)', PRIORITY_REMOTE,
    'script'));
  rows.push(new SourceDescriptor(SourceKind.REMOTE, 'data:text/html,hello', PRIORITY_REMOTE,
    'data'));
  rows.push(new SourceDescriptor(SourceKind.RAWFILE, 'file:///etc/passwd', PRIORITY_LOCAL,
    'file'));
  rows.push(new SourceDescriptor(SourceKind.REMOTE, 'http://www.example.com/', PRIORITY_REMOTE,
    'insecure'));
  rows.push(new SourceDescriptor(SourceKind.REMOTE, 'https://evil.example.net/x', PRIORITY_REMOTE,
    'foreign host'));
  rows.push(new SourceDescriptor(SourceKind.REMOTE, 'https://www.example.com/a b', PRIORITY_REMOTE,
    'whitespace'));
  rows.push(new SourceDescriptor(SourceKind.RAWFILE, 'rawfile://../secret.html', PRIORITY_LOCAL,
    'traversal'));
  return rows;
}

/** Registry preloaded with the four documented sources. */
function populatedRegistry(): DataSourceRegistry {
  const registry: DataSourceRegistry = new DataSourceRegistry(new SourceValidator(ALLOWED_HOSTS));
  registry.add(localSource(false));
  registry.add(faviconSource());
  registry.add(remoteSource());
  registry.add(searchSource('openharmony browser'));
  return registry;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserDataSourceValidationTest() {
  describe('browserDataSourceValidationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin: rawfile, remote, search and favicon sources');
      await startBrowserApp();
      TestLogger.info(TAG, 'browser app started for data source validation');
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
    });

    /** The bundled pad page is a valid rawfile source. */
    it('Data_Rawfile_Home_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Rawfile_Home_001');
      const started: number = Date.now();
      const validator: SourceValidator = new SourceValidator(ALLOWED_HOSTS);
      const home: SourceDescriptor = localSource(false);
      TestLogger.step(TAG, 'validate the bundled pad home page');
      expect(home.kind).assertEqual(SourceKind.RAWFILE);
      expect(home.isLocal()).assertTrue();
      expect(home.isRemote()).assertFalse();
      expect(home.url).assertEqual(LOCAL_PAD_PAGE);
      expect(home.scheme()).assertEqual('rawfile');
      expect(validator.reasonFor(home)).assertEqual('');
      expect(validator.validate(home)).assertTrue();
      expect(validator.rejectedCount()).assertEqual(0);
      expect(PAD_HOME_PAGE).assertEqual('pad.html');
      TestLogger.info(TAG, home.describe());
      TestLogger.caseEnd(TAG, 'Data_Rawfile_Home_001', Date.now() - started);
    });

    /** Phone and pad builds resolve to different bundled pages. */
    it('Data_Rawfile_Device_Variant_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Rawfile_Device_Variant_002');
      const started: number = Date.now();
      const validator: SourceValidator = new SourceValidator(ALLOWED_HOSTS);
      const pad: SourceDescriptor = localSource(deviceIsPhone('default'));
      const phone: SourceDescriptor = localSource(deviceIsPhone('phone'));
      TestLogger.step(TAG, 'compare the pad and phone home sources');
      expect(pad.url).assertEqual(LOCAL_PAD_PAGE);
      expect(phone.url).assertEqual(LOCAL_PHONE_PAGE);
      expect(pad.key() === phone.key()).assertFalse();
      expect(pad.sameAs(phone)).assertFalse();
      expect(validator.validate(pad)).assertTrue();
      expect(validator.validate(phone)).assertTrue();
      expect(PHONE_HOME_PAGE).assertEqual('phone.html');
      expect(pad.isLocal() && phone.isLocal()).assertTrue();
      TestLogger.caseEnd(TAG, 'Data_Rawfile_Device_Variant_002', Date.now() - started);
    });

    /** A remote page must be https and inside the allow list. */
    it('Data_Remote_Https_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Remote_Https_003');
      const started: number = Date.now();
      const validator: SourceValidator = new SourceValidator(ALLOWED_HOSTS);
      const remote: SourceDescriptor = remoteSource();
      TestLogger.step(TAG, 'validate an allow listed https page');
      expect(remote.isHttps()).assertTrue();
      expect(remote.isRemote()).assertTrue();
      expect(remote.host()).assertEqual('www.example.com');
      expect(remote.scheme()).assertEqual('https');
      expect(validator.reasonFor(remote)).assertEqual('');
      expect(validator.validate(remote)).assertTrue();
      expect(remote.url).assertEqual(REMOTE_DOC);
      expect(ALLOWED_HOSTS.length).assertEqual(3);
      TestLogger.info(TAG, remote.describe());
      TestLogger.caseEnd(TAG, 'Data_Remote_Https_003', Date.now() - started);
    });

    /** Plain http remote sources are refused outright. */
    it('Data_Remote_Http_Rejected_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Remote_Http_Rejected_004');
      const started: number = Date.now();
      const validator: SourceValidator = new SourceValidator(ALLOWED_HOSTS);
      const insecure: SourceDescriptor = new SourceDescriptor(SourceKind.REMOTE,
        'http://www.example.com/', PRIORITY_REMOTE, 'insecure portal');
      TestLogger.step(TAG, 'refuse a plain http remote page');
      expect(insecure.isHttps()).assertFalse();
      expect(insecure.host()).assertEqual('');
      expect(validator.reasonFor(insecure)).assertEqual('insecure http');
      expect(validator.validate(insecure)).assertFalse();
      expect(validator.rejectedCount()).assertEqual(1);
      expect(validator.lastReason()).assertEqual('insecure http');
      expect(validator.rejectedUrls()[0]).assertContain('http://');
      TestLogger.warn(TAG, 'plain http remote page refused');
      TestLogger.caseEnd(TAG, 'Data_Remote_Http_Rejected_004', Date.now() - started);
    });

    /** The Bing endpoint is the only accepted search source. */
    it('Data_Search_Url_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Search_Url_005');
      const started: number = Date.now();
      const validator: SourceValidator = new SourceValidator(ALLOWED_HOSTS);
      const search: SourceDescriptor = searchSource('openharmony');
      TestLogger.step(TAG, 'validate the bing search source');
      expect(search.kind).assertEqual(SourceKind.SEARCH);
      expect(search.url).assertEqual(SEARCH_BASE + 'openharmony');
      expect(search.url.indexOf(SEARCH_ENGINE)).assertEqual(0);
      expect(search.host()).assertEqual('www.bing.com');
      expect(validator.reasonFor(search)).assertEqual('');
      expect(validator.validate(search)).assertTrue();
      expect(buildSearchUrl('openharmony')).assertEqual(search.url);
      TestLogger.caseEnd(TAG, 'Data_Search_Url_005', Date.now() - started);
    });

    /** Search words with special characters are percent encoded. */
    it('Data_Search_Encoding_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Search_Encoding_006');
      const started: number = Date.now();
      const validator: SourceValidator = new SourceValidator(ALLOWED_HOSTS);
      TestLogger.step(TAG, 'validate encoded search words');
      const words: string[] = ['a b', '\u4e2d\u6587', 'a&b=c', '100%', 'tab\there'];
      for (let index = 0; index < words.length; index++) {
        const word: string = words[index];
        const encoded: string = encodeSearchWord(word);
        const source: SourceDescriptor = searchSource(word);
        expect(source.url).assertEqual(SEARCH_BASE + encoded);
        expect(source.url.indexOf(' ') < 0).assertTrue();
        expect(validator.validate(source)).assertTrue();
        TestLogger.info(TAG, `encoded word ${index} to ${encoded}`);
      }
      expect(encodeSearchWord('a b')).assertEqual('a%20b');
      expect(encodeSearchWord('\u4e2d\u6587')).assertContain('%');
      expect(validator.rejectedCount()).assertEqual(0);
      TestLogger.caseEnd(TAG, 'Data_Search_Encoding_006', Date.now() - started);
    });

    /** The favicon probe must be an ico file of an allowed host. */
    it('Data_Favicon_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Favicon_007');
      const started: number = Date.now();
      const validator: SourceValidator = new SourceValidator(ALLOWED_HOSTS);
      const icon: SourceDescriptor = faviconSource();
      TestLogger.step(TAG, 'validate the portal favicon');
      expect(icon.kind).assertEqual(SourceKind.FAVICON);
      expect(icon.url).assertEqual(FAVICON_URL);
      expect(icon.url.endsWith('.ico')).assertTrue();
      expect(icon.host()).assertEqual('www.example.com');
      expect(icon.priority).assertEqual(PRIORITY_FAVICON);
      expect(validator.reasonFor(icon)).assertEqual('');
      expect(validator.validate(icon)).assertTrue();
      TestLogger.caseEnd(TAG, 'Data_Favicon_007', Date.now() - started);
    });

    /** Non ico favicon candidates are refused with a precise reason. */
    it('Data_Favicon_Reject_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Favicon_Reject_008');
      const started: number = Date.now();
      const validator: SourceValidator = new SourceValidator(ALLOWED_HOSTS);
      const pngIcon: SourceDescriptor = new SourceDescriptor(SourceKind.FAVICON,
        'https://www.example.com/icon.png', PRIORITY_FAVICON, 'png icon');
      const foreignIcon: SourceDescriptor = new SourceDescriptor(SourceKind.FAVICON,
        'https://cdn.example.net/favicon.ico', PRIORITY_FAVICON, 'foreign icon');
      TestLogger.step(TAG, 'refuse the malformed favicon candidates');
      expect(validator.reasonFor(pngIcon)).assertEqual('favicon must end with .ico');
      expect(validator.validate(pngIcon)).assertFalse();
      expect(validator.reasonFor(foreignIcon)).assertEqual('host not allowed');
      expect(validator.validate(foreignIcon)).assertFalse();
      expect(validator.rejectedCount()).assertEqual(2);
      expect(validator.rejectedUrls().length).assertEqual(2);
      TestLogger.warn(TAG, 'two favicon candidates refused');
      TestLogger.caseEnd(TAG, 'Data_Favicon_Reject_008', Date.now() - started);
    });

    /** Priority ordering must put the local page first and search last. */
    it('Data_Priority_Order_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Priority_Order_009');
      const started: number = Date.now();
      const registry: DataSourceRegistry = populatedRegistry();
      TestLogger.step(TAG, 'sort the registered sources by priority');
      expect(registry.size()).assertEqual(4);
      const ordered: SourceDescriptor[] = registry.ordered();
      expect(ordered.length).assertEqual(4);
      expect(ordered[0].kind).assertEqual(SourceKind.RAWFILE);
      expect(ordered[1].kind).assertEqual(SourceKind.FAVICON);
      expect(ordered[2].kind).assertEqual(SourceKind.REMOTE);
      expect(ordered[3].kind).assertEqual(SourceKind.SEARCH);
      expect(ordered[0].priority).assertEqual(PRIORITY_LOCAL);
      expect(ordered[3].priority).assertEqual(PRIORITY_SEARCH);
      for (let index = 1; index < ordered.length; index++) {
        expect(ordered[index - 1].priority <= ordered[index].priority).assertTrue();
      }
      const preferred: SourceDescriptor | null = registry.preferred();
      expect(preferred === null).assertFalse();
      if (preferred !== null) {
        expect(preferred.url).assertEqual(LOCAL_PAD_PAGE);
      }
      TestLogger.caseEnd(TAG, 'Data_Priority_Order_009', Date.now() - started);
    });

    /** Every hostile source is refused with a distinct reason. */
    it('Data_Illegal_Source_Reject_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Illegal_Source_Reject_010');
      const started: number = Date.now();
      const validator: SourceValidator = new SourceValidator(ALLOWED_HOSTS);
      const rows: SourceDescriptor[] = hostileSources();
      TestLogger.step(TAG, 'walk the hostile source table');
      expect(rows.length).assertEqual(8);
      for (let index = 0; index < rows.length; index++) {
        const reason: string = validator.reasonFor(rows[index]);
        expect(reason.length > 0).assertTrue();
        expect(validator.validate(rows[index])).assertFalse();
        TestLogger.info(TAG, `refused ${rows[index].label}: ${reason}`);
      }
      expect(validator.rejectedCount()).assertEqual(8);
      expect(validator.reasonFor(rows[1])).assertEqual('script scheme');
      expect(validator.reasonFor(rows[2])).assertEqual('data scheme');
      expect(validator.reasonFor(rows[3])).assertEqual('file scheme');
      expect(validator.reasonFor(rows[7])).assertEqual('path traversal');
      TestLogger.caseEnd(TAG, 'Data_Illegal_Source_Reject_010', Date.now() - started);
    });

    /** A registry never stores a refused source. */
    it('Data_Registry_Reject_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Registry_Reject_011');
      const started: number = Date.now();
      const registry: DataSourceRegistry = new DataSourceRegistry(
        new SourceValidator(ALLOWED_HOSTS));
      TestLogger.step(TAG, 'insert hostile sources into the registry');
      const rows: SourceDescriptor[] = hostileSources();
      for (let index = 0; index < rows.length; index++) {
        expect(registry.add(rows[index])).assertFalse();
      }
      expect(registry.size()).assertEqual(0);
      expect(registry.rejectedCount()).assertEqual(8);
      expect(registry.preferred() === null).assertTrue();
      expect(registry.add(localSource(false))).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.rejectedCount()).assertEqual(8);
      TestLogger.caseEnd(TAG, 'Data_Registry_Reject_011', Date.now() - started);
    });

    /** Switching the active source moves the load target. */
    it('Data_Source_Switch_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Source_Switch_012');
      const started: number = Date.now();
      const registry: DataSourceRegistry = populatedRegistry();
      TestLogger.step(TAG, 'switch the active source from local to remote');
      const local: SourceDescriptor = localSource(false);
      const remote: SourceDescriptor = remoteSource();
      expect(registry.activate(local.key())).assertTrue();
      expect(registry.activeKey).assertEqual(local.key());
      const first: SourceDescriptor | null = registry.active();
      expect(first === null).assertFalse();
      if (first !== null) {
        expect(first.kind).assertEqual(SourceKind.RAWFILE);
      }
      expect(registry.switchTo(remote.key())).assertTrue();
      const second: SourceDescriptor | null = registry.active();
      expect(second === null).assertFalse();
      if (second !== null) {
        expect(second.url).assertEqual(REMOTE_DOC);
        expect(second.kind).assertEqual(SourceKind.REMOTE);
      }
      expect(registry.activate('missing|source')).assertFalse();
      expect(registry.activeKey).assertEqual(remote.key());
      TestLogger.caseEnd(TAG, 'Data_Source_Switch_012', Date.now() - started);
    });

    /** A second fetch of the same source is served from the cache. */
    it('Data_Cache_Hit_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Cache_Hit_013');
      const started: number = Date.now();
      const registry: DataSourceRegistry = populatedRegistry();
      const network: MockNetwork = new MockNetwork();
      const source: SourceDescriptor = remoteSource();
      TestLogger.step(TAG, 'fetch the same source twice');
      expect(registry.fetch(source, network, 1700000000000)).assertTrue();
      expect(network.requestCount()).assertEqual(1);
      expect(registry.missCount()).assertEqual(1);
      expect(registry.hitCount()).assertEqual(0);
      expect(registry.fetch(source, network, 1700000000001)).assertTrue();
      expect(network.requestCount()).assertEqual(1);
      expect(registry.hitCount()).assertEqual(1);
      const entry: CacheEntry | null = registry.cacheLookup(source.key());
      expect(entry === null).assertFalse();
      if (entry !== null) {
        expect(entry.payload).assertEqual('payload:portal docs');
        expect(entry.hits).assertEqual(1);
      }
      expect(registry.missCount()).assertEqual(1);
      TestLogger.info(TAG, `cache hits ${registry.hitCount()} misses ${registry.missCount()}`);
      TestLogger.caseEnd(TAG, 'Data_Cache_Hit_013', Date.now() - started);
    });

    /** Invalidating a key forces the next fetch back to the network. */
    it('Data_Cache_Invalidate_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Cache_Invalidate_014');
      const started: number = Date.now();
      const registry: DataSourceRegistry = populatedRegistry();
      const network: MockNetwork = new MockNetwork();
      const source: SourceDescriptor = remoteSource();
      TestLogger.step(TAG, 'invalidate the cached payload');
      registry.fetch(source, network, 1700000000000);
      expect(registry.cache.length).assertEqual(1);
      expect(registry.invalidate(source.key())).assertTrue();
      expect(registry.cache.length).assertEqual(0);
      expect(registry.invalidate(source.key())).assertFalse();
      expect(registry.fetch(source, network, 1700000000002)).assertTrue();
      expect(network.requestCount()).assertEqual(2);
      expect(registry.missCount()).assertEqual(2);
      expect(registry.clearCache()).assertEqual(1);
      expect(registry.cache.length).assertEqual(0);
      TestLogger.caseEnd(TAG, 'Data_Cache_Invalidate_014', Date.now() - started);
    });

    /** Switching source drops the stale payload of the new target. */
    it('Data_Cache_Switch_Flush_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Cache_Switch_Flush_015');
      const started: number = Date.now();
      const registry: DataSourceRegistry = populatedRegistry();
      const network: MockNetwork = new MockNetwork();
      const local: SourceDescriptor = localSource(false);
      const search: SourceDescriptor = searchSource('openharmony browser');
      TestLogger.step(TAG, 'cache both sources then switch');
      registry.fetch(local, network, 1700000000000);
      registry.fetch(search, network, 1700000000000);
      expect(registry.cache.length).assertEqual(2);
      expect(registry.switchTo(search.key())).assertTrue();
      expect(registry.cache.length).assertEqual(1);
      expect(registry.cacheLookup(search.key()) === null).assertTrue();
      expect(registry.cacheLookup(local.key()) === null).assertFalse();
      TestLogger.caseEnd(TAG, 'Data_Cache_Switch_Flush_015', Date.now() - started);
    });

    /** The fingerprint of a source is stable and url specific. */
    it('Data_Integrity_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Integrity_016');
      const started: number = Date.now();
      const registry: DataSourceRegistry = populatedRegistry();
      TestLogger.step(TAG, 'compare source fingerprints');
      const local: SourceDescriptor = localSource(false);
      const remote: SourceDescriptor = remoteSource();
      const first: string = registry.integrityOf(local);
      const second: string = registry.integrityOf(local);
      expect(first).assertEqual(second);
      expect(first.startsWith('integrity-')).assertTrue();
      expect(first === registry.integrityOf(remote)).assertFalse();
      expect(registry.integrityOf(searchSource('a')) === registry.integrityOf(searchSource('b')))
        .assertFalse();
      expect(registry.integrityOf(localSource(true))).assertEqual(
        registry.integrityOf(localSource(true)));
      TestLogger.info(TAG, `pad home fingerprint ${first}`);
      TestLogger.caseEnd(TAG, 'Data_Integrity_016', Date.now() - started);
    });

    /** An offline device must fail the fetch without caching garbage. */
    it('Data_Network_Offline_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Network_Offline_017');
      const started: number = Date.now();
      const registry: DataSourceRegistry = populatedRegistry();
      const network: MockNetwork = new MockNetwork();
      const source: SourceDescriptor = remoteSource();
      TestLogger.step(TAG, 'fetch while offline');
      network.setOnline(false);
      expect(registry.fetch(source, network, 1700000000000)).assertFalse();
      expect(network.requestCount()).assertEqual(1);
      expect(registry.cache.length).assertEqual(0);
      expect(registry.missCount()).assertEqual(1);
      network.setOnline(true);
      expect(registry.fetch(source, network, 1700000000001)).assertTrue();
      expect(registry.cache.length).assertEqual(1);
      expect(registry.missCount()).assertEqual(2);
      expect(network.requestCount()).assertEqual(2);
      TestLogger.info(TAG, 'failed fetch left the cache empty');
      TestLogger.caseEnd(TAG, 'Data_Network_Offline_017', Date.now() - started);
    });

    /** Registering the same source twice keeps a single entry. */
    it('Data_Duplicate_Reject_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Duplicate_Reject_018');
      const started: number = Date.now();
      const registry: DataSourceRegistry = new DataSourceRegistry(
        new SourceValidator(ALLOWED_HOSTS));
      TestLogger.step(TAG, 'register the same source twice');
      const first: SourceDescriptor = localSource(false);
      const copy: SourceDescriptor = localSource(false);
      expect(first.sameAs(copy)).assertTrue();
      expect(registry.add(first)).assertTrue();
      expect(registry.add(copy)).assertFalse();
      expect(registry.size()).assertEqual(1);
      expect(registry.rejectedCount()).assertEqual(0);
      expect(registry.add(remoteSource())).assertTrue();
      expect(registry.add(remoteSource())).assertFalse();
      expect(registry.size()).assertEqual(2);
      expect(registry.ordered().length).assertEqual(2);
      TestLogger.caseEnd(TAG, 'Data_Duplicate_Reject_018', Date.now() - started);
    });

    /** The start page load in the model uses the preferred local source. */
    it('Data_Preferred_Load_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Preferred_Load_019');
      const started: number = Date.now();
      const registry: DataSourceRegistry = populatedRegistry();
      const browser: MockBrowser = new MockBrowser();
      const preferred: SourceDescriptor | null = registry.preferred();
      TestLogger.step(TAG, 'load the preferred source in the browser model');
      expect(preferred === null).assertFalse();
      if (preferred !== null) {
        expect(preferred.kind).assertEqual(SourceKind.RAWFILE);
        expect(browser.loadUrl(preferred.url)).assertTrue();
        const tab = browser.getCurrentTab();
        expect(tab === null).assertFalse();
        if (tab !== null) {
          expect(tab.controller.getPendingUrl()).assertContain('rawfile://pad.html');
        }
      }
      const ordered: SourceDescriptor[] = registry.ordered();
      for (let index = 1; index < ordered.length; index++) {
        expect(browser.loadUrl(ordered[index].url)).assertTrue();
      }
      expect(browser.getCurrentTab() !== null).assertTrue();
      TestLogger.caseEnd(TAG, 'Data_Preferred_Load_019', Date.now() - started);
    });

    /** Consolidated source report plus a live UI reachability probe. */
    it('Data_Registry_Summary_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Data_Registry_Summary_020');
      const started: number = Date.now();
      const registry: DataSourceRegistry = populatedRegistry();
      const network: MockNetwork = new MockNetwork();
      TestLogger.step(TAG, 'assemble the data source report');
      registry.fetch(localSource(false), network, 1700000000000);
      registry.fetch(localSource(false), network, 1700000000001);
      const summary: string = registry.summary();
      expect(summary).assertContain('sources=4');
      expect(summary).assertContain('rejected=0');
      expect(summary).assertContain('hits=1');
      expect(summary).assertContain('misses=1');
      expect(network.requestCount()).assertEqual(1);
      expect(registry.size()).assertEqual(4);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      expect(await countById(driver, ID_NAV_HOME)).assertLarger(0);
      expect(await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT)).assertTrue();
      TestLogger.info(TAG, summary);
      TestLogger.caseEnd(TAG, 'Data_Registry_Summary_020', Date.now() - started);
    });
  });
}

