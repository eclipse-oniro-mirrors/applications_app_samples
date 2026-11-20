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

const MAX_FILE_SIZE: number = 100 * 1024 * 1024;

const MAX_PATH_LENGTH: number = 256;

const ALLOWED_EXTENSIONS: string[] = ['png', 'jpg', 'jpeg', 'mp4', 'mp3', 'log', 'tar', 'zip'];

const CACHE_DIR: string = '/data/storage/el2/base/cache';

// Path helpers mirroring FileUtils.ets behavior
class FilePathUtil {
  public static join(base: string, name: string): string {
    if (base.length === 0) {
      return name;
    }
    if (name.length === 0) {
      return base;
    }
    const normalizedBase = base.endsWith('/') ? base.substring(0, base.length - 1) : base;
    const normalizedName = name.startsWith('/') ? name.substring(1) : name;
    return normalizedBase + '/' + normalizedName;
  }

  public static basename(path: string): string {
    const index = path.lastIndexOf('/');
    return index < 0 ? path : path.substring(index + 1);
  }

  public static extensionOf(path: string): string {
    const name = FilePathUtil.basename(path);
    const index = name.lastIndexOf('.');
    if (index < 0 || index === name.length - 1) {
      return '';
    }
    return name.substring(index + 1).toLowerCase();
  }

  public static dirname(path: string): string {
    const index = path.lastIndexOf('/');
    return index <= 0 ? '/' : path.substring(0, index);
  }

  public static isAbsolute(path: string): boolean {
    return path.startsWith('/');
  }

  public static hasTraversal(path: string): boolean {
    return path.indexOf('..') >= 0;
  }

  public static isUnderCache(path: string): boolean {
    return path.startsWith(CACHE_DIR);
  }

  public static normalize(path: string): string {
    let result = path.split('\\').join('/');
    while (result.indexOf('//') >= 0) {
      result = result.split('//').join('/');
    }
    return result;
  }

  public static localThumbName(uri: string): string {
    return uri.split('file://').join('').split('/').join('_') + '.thumb';
  }
}

// Validates files before upload
class FileValidator {
  public static isNameValid(name: string): boolean {
    return name.length > 0 && name.length <= MAX_PATH_LENGTH &&
      name.indexOf('/') < 0 && name.indexOf('\\') < 0 && name.indexOf('..') < 0;
  }

  public static isExtensionAllowed(name: string): boolean {
    return ALLOWED_EXTENSIONS.includes(FilePathUtil.extensionOf(name));
  }

  public static isSizeValid(sizeBytes: number): boolean {
    return sizeBytes >= 0 && sizeBytes <= MAX_FILE_SIZE;
  }

  public static isPathLengthValid(path: string): boolean {
    return path.length > 0 && path.length <= MAX_PATH_LENGTH;
  }

  public static isSafe(path: string): boolean {
    return FileValidator.isPathLengthValid(path) && !FilePathUtil.hasTraversal(path) &&
      FileValidator.isExtensionAllowed(path);
  }

  public static canUpload(name: string, sizeBytes: number): boolean {
    return FileValidator.isNameValid(name) && FileValidator.isExtensionAllowed(name) &&
      FileValidator.isSizeValid(sizeBytes);
  }
}

// Reports file validation results
class FileReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function fileUtilValidationTest() {
  describe('FileUtilValidation_Test', () => {

    it('path_should_join_without_double_separators', 0, () => {
      expect(FilePathUtil.join('/cache', 'a.png')).assertEqual('/cache/a.png');
      expect(FilePathUtil.join('/cache/', 'a.png')).assertEqual('/cache/a.png');
      expect(FilePathUtil.join('/cache', '/a.png')).assertEqual('/cache/a.png');
      expect(FilePathUtil.join('', 'a.png')).assertEqual('a.png');
      expect(FilePathUtil.join('/cache', '')).assertEqual('/cache');
      expect(FilePathUtil.join('/cache', 'a.png').indexOf('//')).assertEqual(-1);
    });

    it('path_should_extract_basename_and_extension', 0, () => {
      expect(FilePathUtil.basename('/cache/a.png')).assertEqual('a.png');
      expect(FilePathUtil.basename('a.png')).assertEqual('a.png');
      expect(FilePathUtil.extensionOf('/cache/a.PNG')).assertEqual('png');
      expect(FilePathUtil.extensionOf('/cache/a')).assertEqual('');
      expect(FilePathUtil.extensionOf('/cache/a.')).assertEqual('');
      expect(FilePathUtil.dirname('/cache/sub/a.png')).assertEqual('/cache/sub');
      expect(FilePathUtil.dirname('a.png')).assertEqual('/');
    });

    it('path_should_detect_absolute_and_traversal', 0, () => {
      expect(FilePathUtil.isAbsolute('/cache/a.png')).assertTrue();
      expect(FilePathUtil.isAbsolute('cache/a.png')).assertFalse();
      expect(FilePathUtil.hasTraversal('../a.png')).assertTrue();
      expect(FilePathUtil.hasTraversal('/cache/a.png')).assertFalse();
      expect(FilePathUtil.isUnderCache(CACHE_DIR + '/a.png')).assertTrue();
      expect(FilePathUtil.isUnderCache('/other/a.png')).assertFalse();
    });

    it('path_should_normalize_separators', 0, () => {
      expect(FilePathUtil.normalize('a\\b\\c')).assertEqual('a/b/c');
      expect(FilePathUtil.normalize('a//b///c')).assertEqual('a/b/c');
      expect(FilePathUtil.normalize('a/b')).assertEqual('a/b');
      expect(FilePathUtil.localThumbName('file://media/Photo/1/a.jpg'))
        .assertEqual('media_Photo_1_a.jpg.thumb');
    });

    it('validator_should_check_name', 0, () => {
      expect(FileValidator.isNameValid('a.png')).assertTrue();
      expect(FileValidator.isNameValid('')).assertFalse();
      expect(FileValidator.isNameValid('dir/a.png')).assertFalse();
      expect(FileValidator.isNameValid('a\\b.png')).assertFalse();
      expect(FileValidator.isNameValid('../a.png')).assertFalse();
      expect(FileValidator.isNameValid('a'.repeat(MAX_PATH_LENGTH + 1))).assertFalse();
    });

    it('validator_should_check_extension', 0, () => {
      for (let i = 0; i < ALLOWED_EXTENSIONS.length; i++) {
        expect(FileValidator.isExtensionAllowed(`file.${ALLOWED_EXTENSIONS[i]}`)).assertTrue();
      }
      expect(FileValidator.isExtensionAllowed('file.dmg')).assertFalse();
      expect(FileValidator.isExtensionAllowed('file')).assertFalse();
      expect(ALLOWED_EXTENSIONS.length).assertEqual(8);
    });

    it('validator_should_check_size', 0, () => {
      expect(FileValidator.isSizeValid(0)).assertTrue();
      expect(FileValidator.isSizeValid(MAX_FILE_SIZE)).assertTrue();
      expect(FileValidator.isSizeValid(MAX_FILE_SIZE + 1)).assertFalse();
      expect(FileValidator.isSizeValid(-1)).assertFalse();
      expect(MAX_FILE_SIZE).assertEqual(104857600);
    });

    it('validator_should_check_path_length', 0, () => {
      expect(FileValidator.isPathLengthValid('/cache/a.png')).assertTrue();
      expect(FileValidator.isPathLengthValid('')).assertFalse();
      expect(FileValidator.isPathLengthValid('/' + 'a'.repeat(MAX_PATH_LENGTH))).assertFalse();
      expect(FileValidator.isSafe('/cache/a.png')).assertTrue();
      expect(FileValidator.isSafe('/cache/../a.png')).assertFalse();
    });

    it('validator_should_gate_upload', 0, () => {
      expect(FileValidator.canUpload('a.png', 1024)).assertTrue();
      expect(FileValidator.canUpload('a.exe', 1024)).assertFalse();
      expect(FileValidator.canUpload('a.png', MAX_FILE_SIZE + 1)).assertFalse();
      expect(FileValidator.canUpload('bad/name.png', 1024)).assertFalse();
      expect(FileValidator.canUpload('a.tar', 0)).assertTrue();
    });

    it('report_should_aggregate_file_checks', 0, () => {
      const report = new FileReport();
      report.check('name', FileValidator.isNameValid('a.png'));
      report.check('extension', FileValidator.isExtensionAllowed('a.png'));
      report.check('size', FileValidator.isSizeValid(1024));
      expect(report.count()).assertEqual(3);
      expect(report.isPassed()).assertTrue();
      report.check('traversal', !FileValidator.isSafe('../a.png'));
      expect(report.isPassed()).assertTrue();
      report.check('force', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['force']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('file_flow_should_build_cache_thumb_path', 0, () => {
      const uri = 'file://media/Photo/1/a.jpg';
      const thumbName = FilePathUtil.localThumbName(uri);
      const fullPath = FilePathUtil.join(CACHE_DIR, thumbName);
      expect(FilePathUtil.isUnderCache(fullPath)).assertTrue();
      expect(FilePathUtil.hasTraversal(fullPath)).assertFalse();
      expect(FilePathUtil.extensionOf(fullPath)).assertEqual('thumb');
      expect(FilePathUtil.isAbsolute(fullPath)).assertTrue();
      expect(FileValidator.isPathLengthValid(fullPath)).assertTrue();
    });

    it('file_constants_should_be_stable', 0, () => {
      expect(MAX_FILE_SIZE).assertEqual(104857600);
      expect(MAX_PATH_LENGTH).assertEqual(256);
      expect(ALLOWED_EXTENSIONS.length).assertEqual(8);
      expect(CACHE_DIR).assertEqual('/data/storage/el2/base/cache');
    });
  });
}

