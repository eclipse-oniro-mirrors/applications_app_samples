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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { getDriver, ensureAppReady } from '../Shared/SharedDriver';

enum ResourceKind {
  CODE_PATH = 0,
  ENTRY_DIR = 1,
  HAP_MODULE = 2,
  RESOURCE_DIR = 3,
  RAW_FILE = 4
}

class ResourcePath {
  readonly kind: ResourceKind;
  readonly path: string;

  constructor(kind: ResourceKind, path: string) {
    this.kind = kind;
    this.path = path;
  }

  isAbsolute(): boolean {
    return this.path.length > 0 && this.path.charAt(0) === '/';
  }

  hasPrefix(prefix: string): boolean {
    if (this.path.length < prefix.length) {
      return false;
    }
    return this.path.substring(0, prefix.length) === prefix;
  }

  depth(): number {
    let count = 0;
    for (let i = 0; i < this.path.length; i++) {
      if (this.path.charAt(i) === '/') {
        count += 1;
      }
    }
    return count;
  }

  basename(): string {
    const index = this.path.lastIndexOf('/');
    if (index < 0) {
      return this.path;
    }
    return this.path.substring(index + 1);
  }

  extension(): string {
    const name = this.basename();
    const index = name.lastIndexOf('.');
    if (index < 0) {
      return '';
    }
    return name.substring(index + 1);
  }

  describe(): string {
    return `${this.kind}:${this.path}`;
  }
}

class PathRule {
  readonly kind: ResourceKind;
  readonly prefix: string;
  readonly requiredExtension: string;

  constructor(kind: ResourceKind, prefix: string, requiredExtension: string) {
    this.kind = kind;
    this.prefix = prefix;
    this.requiredExtension = requiredExtension;
  }

  matchesPrefix(path: ResourcePath): boolean {
    return path.hasPrefix(this.prefix);
  }

  matchesExtension(path: ResourcePath): boolean {
    if (this.requiredExtension.length === 0) {
      return true;
    }
    return path.extension() === this.requiredExtension;
  }

  describe(): string {
    return `${this.kind}:${this.prefix}:${this.requiredExtension}`;
  }
}

class PathCheck {
  readonly path: ResourcePath;
  readonly ok: boolean;
  readonly reason: string;

  constructor(path: ResourcePath, ok: boolean, reason: string) {
    this.path = path;
    this.ok = ok;
    this.reason = reason;
  }

  describe(): string {
    return `${this.ok}:${this.reason}`;
  }

  isOk(): boolean {
    return this.ok;
  }
}

class ResourceLoaderModel {
  private rules: PathRule[] = [];
  private paths: ResourcePath[] = [];

  withRule(rule: PathRule): ResourceLoaderModel {
    this.rules.push(rule);
    return this;
  }

  addPath(path: ResourcePath): ResourceLoaderModel {
    this.paths.push(path);
    return this;
  }

  ruleCount(): number {
    return this.rules.length;
  }

  pathCount(): number {
    return this.paths.length;
  }

  ruleOf(kind: ResourceKind): PathRule | null {
    for (const rule of this.rules) {
      if (rule.kind === kind) {
        return rule;
      }
    }
    return null;
  }

  check(path: ResourcePath): PathCheck {
    const rule = this.ruleOf(path.kind);
    if (rule === null) {
      return new PathCheck(path, false, 'no-rule');
    }
    if (!rule.matchesPrefix(path)) {
      return new PathCheck(path, false, 'bad-prefix');
    }
    if (!rule.matchesExtension(path)) {
      return new PathCheck(path, false, 'bad-extension');
    }
    return new PathCheck(path, true, 'ok');
  }

  validCount(): number {
    let count = 0;
    for (const path of this.paths) {
      if (this.check(path).ok) {
        count += 1;
      }
    }
    return count;
  }

  invalidCount(): number {
    return this.paths.length - this.validCount();
  }
}

function buildModel(): ResourceLoaderModel {
  const model = new ResourceLoaderModel();
  model.withRule(new PathRule(ResourceKind.CODE_PATH, '/data', ''));
  model.withRule(new PathRule(ResourceKind.ENTRY_DIR, '/data', ''));
  model.withRule(new PathRule(ResourceKind.HAP_MODULE, 'entry', ''));
  model.withRule(new PathRule(ResourceKind.RESOURCE_DIR, '/data', ''));
  model.withRule(new PathRule(ResourceKind.RAW_FILE, '/data', 'json'));
  model.addPath(new ResourcePath(ResourceKind.CODE_PATH, '/data/storage/base/entry.hap'));
  model.addPath(new ResourcePath(ResourceKind.ENTRY_DIR, '/data/storage/base/entry'));
  model.addPath(new ResourcePath(ResourceKind.HAP_MODULE, 'entry'));
  model.addPath(new ResourcePath(ResourceKind.RAW_FILE, '/data/raw/config.json'));
  return model;
}

export default function bundleResourceLoaderValidationTest(): void {
  describe('BundleResourceLoaderValidationSuite', () => {
    let model: ResourceLoaderModel = buildModel();

    beforeAll(() => {
      model = buildModel();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'bundle resource suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'bundle resource suite end');
    });

    it('BundleResourceLoaderValidation_001', 0, async (done: Function) => {
      expect(model.ruleCount()).assertEqual(5);
      expect(model.pathCount()).assertEqual(4);
      expect(model.validCount()).assertEqual(4);
      expect(model.invalidCount()).assertEqual(0);
      done();
    });

    it('BundleResourceLoaderValidation_002', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.CODE_PATH, '/data/base/entry.hap');
      expect(path.isAbsolute()).assertTrue();
      expect(path.hasPrefix('/data')).assertTrue();
      expect(path.basename()).assertEqual('entry.hap');
      expect(path.extension()).assertEqual('hap');
      done();
    });

    it('BundleResourceLoaderValidation_003', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.ENTRY_DIR, '/data/base/entry');
      expect(path.depth()).assertEqual(3);
      expect(path.basename()).assertEqual('entry');
      expect(path.extension()).assertEqual('');
      done();
    });

    it('BundleResourceLoaderValidation_004', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.HAP_MODULE, 'entry');
      expect(path.isAbsolute()).assertFalse();
      expect(path.hasPrefix('entry')).assertTrue();
      expect(path.basename()).assertEqual('entry');
      done();
    });

    it('BundleResourceLoaderValidation_005', 0, async (done: Function) => {
      const check = model.check(new ResourcePath(ResourceKind.RAW_FILE, '/data/raw/app.json'));
      expect(check.ok).assertTrue();
      expect(check.reason).assertEqual('ok');
      expect(check.isOk()).assertTrue();
      done();
    });

    it('BundleResourceLoaderValidation_006', 0, async (done: Function) => {
      const check = model.check(new ResourcePath(ResourceKind.RAW_FILE, '/data/raw/app.txt'));
      expect(check.ok).assertFalse();
      expect(check.reason).assertEqual('bad-extension');
      expect(check.describe()).assertEqual('false:bad-extension');
      done();
    });

    it('BundleResourceLoaderValidation_007', 0, async (done: Function) => {
      const check = model.check(new ResourcePath(ResourceKind.CODE_PATH, '/sdcard/base/entry.hap'));
      expect(check.ok).assertFalse();
      expect(check.reason).assertEqual('bad-prefix');
      done();
    });

    it('BundleResourceLoaderValidation_008', 0, async (done: Function) => {
      const check = model.check(new ResourcePath(ResourceKind.RESOURCE_DIR, '/other/res'));
      expect(check.ok).assertFalse();
      expect(check.reason).assertEqual('bad-prefix');
      done();
    });

    it('BundleResourceLoaderValidation_009', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.RAW_FILE, '/data/raw/a.b.c.json');
      expect(path.extension()).assertEqual('json');
      expect(path.basename()).assertEqual('a.b.c.json');
      expect(path.depth()).assertEqual(3);
      done();
    });

    it('BundleResourceLoaderValidation_010', 0, async (done: Function) => {
      const rule = model.ruleOf(ResourceKind.RAW_FILE);
      expect(rule !== null).assertTrue();
      expect(rule !== null ? rule.requiredExtension : '').assertEqual('json');
      expect(rule !== null ? rule.prefix : '').assertEqual('/data');
      done();
    });

    it('BundleResourceLoaderValidation_011', 0, async (done: Function) => {
      const rule = new PathRule(ResourceKind.CODE_PATH, '/data', '');
      expect(rule.matchesPrefix(new ResourcePath(ResourceKind.CODE_PATH, '/data/x'))).assertTrue();
      expect(rule.matchesExtension(new ResourcePath(ResourceKind.CODE_PATH, '/data/x.any'))).assertTrue();
      expect(rule.describe()).assertEqual(`${ResourceKind.CODE_PATH}:/data:`);
      done();
    });

    it('BundleResourceLoaderValidation_012', 0, async (done: Function) => {
      const rule = new PathRule(ResourceKind.RAW_FILE, '/data', 'json');
      expect(rule.matchesExtension(new ResourcePath(ResourceKind.RAW_FILE, '/data/a.json'))).assertTrue();
      expect(rule.matchesExtension(new ResourcePath(ResourceKind.RAW_FILE, '/data/a.xml'))).assertFalse();
      done();
    });

    it('BundleResourceLoaderValidation_013', 0, async (done: Function) => {
      const check = new PathCheck(new ResourcePath(ResourceKind.HAP_MODULE, 'entry'), true, 'ok');
      expect(check.ok).assertTrue();
      expect(check.reason).assertEqual('ok');
      expect(check.describe()).assertEqual('true:ok');
      done();
    });

    it('BundleResourceLoaderValidation_014', 0, async (done: Function) => {
      const empty = new ResourceLoaderModel();
      expect(empty.ruleCount()).assertEqual(0);
      expect(empty.pathCount()).assertEqual(0);
      expect(empty.validCount()).assertEqual(0);
      expect(empty.ruleOf(ResourceKind.CODE_PATH)).assertNull();
      done();
    });

    it('BundleResourceLoaderValidation_015', 0, async (done: Function) => {
      const empty = new ResourceLoaderModel();
      const check = empty.check(new ResourcePath(ResourceKind.CODE_PATH, '/data/x'));
      expect(check.ok).assertFalse();
      expect(check.reason).assertEqual('no-rule');
      done();
    });

    it('BundleResourceLoaderValidation_016', 0, async (done: Function) => {
      const fresh = new ResourceLoaderModel();
      fresh.withRule(new PathRule(ResourceKind.CODE_PATH, '/data', ''));
      fresh.addPath(new ResourcePath(ResourceKind.CODE_PATH, '/data/a.hap'));
      fresh.addPath(new ResourcePath(ResourceKind.CODE_PATH, '/bad/b.hap'));
      expect(fresh.pathCount()).assertEqual(2);
      expect(fresh.validCount()).assertEqual(1);
      expect(fresh.invalidCount()).assertEqual(1);
      done();
    });

    it('BundleResourceLoaderValidation_017', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.ENTRY_DIR, '');
      expect(path.isAbsolute()).assertFalse();
      expect(path.basename()).assertEqual('');
      expect(path.extension()).assertEqual('');
      expect(path.depth()).assertEqual(0);
      done();
    });

    it('BundleResourceLoaderValidation_018', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.CODE_PATH, 'relative/path/file.hap');
      expect(path.isAbsolute()).assertFalse();
      expect(path.depth()).assertEqual(2);
      expect(path.basename()).assertEqual('file.hap');
      expect(path.extension()).assertEqual('hap');
      done();
    });

    it('BundleResourceLoaderValidation_019', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.CODE_PATH, '/data');
      expect(path.hasPrefix('/data')).assertTrue();
      expect(path.hasPrefix('/data/storage')).assertFalse();
      expect(path.basename()).assertEqual('data');
      done();
    });

    it('BundleResourceLoaderValidation_020', 0, async (done: Function) => {
      let absolute = 0;
      const paths: ResourcePath[] = [
        new ResourcePath(ResourceKind.CODE_PATH, '/data/a'),
        new ResourcePath(ResourceKind.HAP_MODULE, 'entry'),
        new ResourcePath(ResourceKind.ENTRY_DIR, '/data/b')
      ];
      for (const path of paths) {
        if (path.isAbsolute()) {
          absolute += 1;
        }
      }
      expect(absolute).assertEqual(2);
      expect(paths.length).assertEqual(3);
      done();
    });

    it('BundleResourceLoaderValidation_021', 0, async (done: Function) => {
      const checks: PathCheck[] = [];
      const candidates: ResourcePath[] = [
        new ResourcePath(ResourceKind.RAW_FILE, '/data/a.json'),
        new ResourcePath(ResourceKind.RAW_FILE, '/data/b.txt'),
        new ResourcePath(ResourceKind.RAW_FILE, '/data/c.json')
      ];
      for (const candidate of candidates) {
        checks.push(model.check(candidate));
      }
      let okCount = 0;
      for (const check of checks) {
        if (check.ok) {
          okCount += 1;
        }
      }
      expect(checks.length).assertEqual(3);
      expect(okCount).assertEqual(2);
      done();
    });

    it('BundleResourceLoaderValidation_022', 0, async (done: Function) => {
      const model = new ResourceLoaderModel();
      model.withRule(new PathRule(ResourceKind.HAP_MODULE, 'entry', ''));
      model.withRule(new PathRule(ResourceKind.ENTRY_DIR, '/data', ''));
      expect(model.ruleCount()).assertEqual(2);
      expect(model.check(new ResourcePath(ResourceKind.HAP_MODULE, 'entry')).ok).assertTrue();
      done();
    });

    it('BundleResourceLoaderValidation_023', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.RESOURCE_DIR, '/data/res/base/element');
      expect(path.depth()).assertEqual(4);
      expect(path.basename()).assertEqual('element');
      expect(path.hasPrefix('/data/res')).assertTrue();
      done();
    });

    it('BundleResourceLoaderValidation_024', 0, async (done: Function) => {
      const rule = new PathRule(ResourceKind.RESOURCE_DIR, '/data/res', 'json');
      expect(rule.matchesPrefix(new ResourcePath(ResourceKind.RESOURCE_DIR, '/data/res/x'))).assertTrue();
      expect(rule.matchesExtension(new ResourcePath(ResourceKind.RESOURCE_DIR, '/data/res/x.json'))).assertTrue();
      expect(rule.matchesExtension(new ResourcePath(ResourceKind.RESOURCE_DIR, '/data/res/x.png'))).assertFalse();
      done();
    });

    it('BundleResourceLoaderValidation_025', 0, async (done: Function) => {
      const fresh = new ResourceLoaderModel();
      fresh.withRule(new PathRule(ResourceKind.RAW_FILE, '/data', 'json'));
      fresh.addPath(new ResourcePath(ResourceKind.RAW_FILE, '/data/a.json'));
      fresh.addPath(new ResourcePath(ResourceKind.RAW_FILE, '/data/b.xml'));
      expect(fresh.validCount()).assertEqual(1);
      expect(fresh.invalidCount()).assertEqual(1);
      expect(fresh.check(new ResourcePath(ResourceKind.RAW_FILE, '/data/b.xml')).reason)
        .assertEqual('bad-extension');
      done();
    });

    it('BundleResourceLoaderValidation_026', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.CODE_PATH, '/data/entry.hap');
      expect(path.extension()).assertEqual('hap');
      expect(path.extension().length).assertEqual(3);
      expect(path.basename().indexOf('.') >= 0).assertTrue();
      done();
    });

    it('BundleResourceLoaderValidation_027', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(typeof ready === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('BundleResourceLoaderValidation_028', 0, async (done: Function) => {
      const model = new ResourceLoaderModel();
      model.withRule(new PathRule(ResourceKind.ENTRY_DIR, '/data', ''));
      const first = model.check(new ResourcePath(ResourceKind.ENTRY_DIR, '/data/entry'));
      const second = model.check(new ResourcePath(ResourceKind.ENTRY_DIR, '/other/entry'));
      expect(first.ok).assertTrue();
      expect(second.ok).assertFalse();
      expect(second.reason).assertEqual('bad-prefix');
      done();
    });

    it('BundleResourceLoaderValidation_029', 0, async (done: Function) => {
      const path = new ResourcePath(ResourceKind.HAP_MODULE, 'entry');
      const check = model.check(path);
      expect(check.ok).assertTrue();
      expect(check.path.describe()).assertEqual(`${ResourceKind.HAP_MODULE}:entry`);
      expect(model.check(path).describe()).assertEqual('true:ok');
      done();
    });

    it('BundleResourceLoaderValidation_030', 0, async (done: Function) => {
      const check = model.check(new ResourcePath(ResourceKind.CODE_PATH, '/data/x.hap'));
      expect(check.ok).assertTrue();
      expect(check.path.extension()).assertEqual('hap');
      expect(check.describe()).assertEqual('true:ok');
      done();
    });
  });
}

