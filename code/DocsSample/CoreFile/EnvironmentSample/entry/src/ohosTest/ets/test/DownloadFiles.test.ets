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

import { Environment, fileIo } from '@kit.CoreFileKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { describe, it, beforeEach, afterEach, expect } from '@ohos/hypium';
import { DownloadFileApi, importDownloadFiles, writeDownloadMessage } from '../../../main/ets/model/DownloadFiles';
import { logCase, logAssertion } from './EnvironmentTestSupport';

class DownloadApiProbe implements DownloadFileApi {
  entries: string[] = ['a.txt', 'folder'];
  sandboxEntries: string[] = ['old.txt', 'a.txt'];
  events: string[] = [];
  failure: string = '';
  mutateListing: boolean = false;

  list(path: string): string[] {
    this.events.push(`list:${path}`);
    return path === '/download' ? this.entries : this.sandboxEntries;
  }

  isFile(path: string): boolean {
    this.events.push(`stat:${path}`);
    if (this.mutateListing) {
      this.entries[1] = 'late.txt';
      this.entries.push('late.txt');
    }
    return !path.endsWith('/folder');
  }

  copy(source: string, destination: string): void {
    this.events.push(`copy:${source}->${destination}`);
    if (this.failure === 'copy') {
      throw new Error('copy denied');
    }
  }

  open(path: string): number {
    this.events.push(`open:${path}`);
    if (this.failure === 'open') {
      throw new Error('open denied');
    }
    return 9;
  }

  write(fd: number, message: string): void {
    this.events.push(`write:${fd}:${message}`);
    if (this.failure === 'write') {
      throw new Error('write denied');
    }
  }

  close(fd: number): void {
    this.events.push(`close:${fd}`);
  }
}

// Only called with the unique root created by this suite, never with a user directory.
function removeSdkSandbox(path: string): void {
  const entries: string[] = fileIo.listFileSync(path);
  entries.forEach((entry: string): void => {
    const child: string = `${path}/${entry}`;
    if (fileIo.statSync(child).isDirectory()) {
      removeSdkSandbox(child);
    } else {
      fileIo.unlinkSync(child);
    }
  });
  fileIo.rmdirSync(path);
}

export default function downloadFilesTest(): void {
  describe('DownloadFilesBusiness', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_001
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_001
     * @tc.desc Import regular files only and return the final sandbox listing.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_001', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_001';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        const actualEntries: string = importDownloadFiles('/download', '/sandbox', api).join(',');
        logAssertion(name, 'sandbox entries', actualEntries, 'old.txt,a.txt');
        expect(actualEntries).assertEqual('old.txt,a.txt');
        const expectedEvents: string = 'list:/download,stat:/download/a.txt,' +
          'copy:/download/a.txt->/sandbox/a.txt,stat:/download/folder,list:/sandbox';
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'import order', actualEvents, expectedEvents);
        expect(actualEvents).assertEqual(expectedEvents);
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_002
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_002
     * @tc.desc Preserve existing sandbox entries when the download listing is empty.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_002', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_002';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        api.entries = [];
        const actualEntries: string = importDownloadFiles('/download', '/sandbox', api).join(',');
        logAssertion(name, 'sandbox entries', actualEntries, 'old.txt,a.txt');
        expect(actualEntries).assertEqual('old.txt,a.txt');
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'empty import order', actualEvents, 'list:/download,list:/sandbox');
        expect(actualEvents).assertEqual('list:/download,list:/sandbox');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_003
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_003
     * @tc.desc Reject traversal before copying an earlier valid entry.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_003', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_003';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        api.entries = ['a.txt', '../outside'];
        let thrown: boolean = false;
        let message: string = '';
        try {
          importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'invalid entry must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'invalid entry error', actualMessage, 'Invalid download entry');
        expect(actualMessage).assertEqual('Invalid download entry');
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'no partial copy', actualEvents, 'list:/download');
        expect(actualEvents).assertEqual('list:/download');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_004
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_004
     * @tc.desc Reject identical directories without touching the file dependency.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_004', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_004';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        let thrown: boolean = false;
        let message: string = '';
        try {
          importDownloadFiles('/download', '/download', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'identical directories must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'directory error', actualMessage, 'Invalid download import directories');
        expect(actualMessage).assertEqual('Invalid download import directories');
        const actualEventCount: number = api.events.length;
        logAssertion(name, 'dependency calls', actualEventCount, 0);
        expect(actualEventCount).assertEqual(0);
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_005
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_005
     * @tc.desc Propagate copy failure and skip later entries and the final listing.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_005', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_005';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        api.failure = 'copy';
        let thrown: boolean = false;
        let message: string = '';
        try {
          importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'copy failure must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'copy error', actualMessage, 'copy denied');
        expect(actualMessage).assertEqual('copy denied');
        const expectedEvents: string = 'list:/download,stat:/download/a.txt,copy:/download/a.txt->/sandbox/a.txt';
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'stop after failed copy', actualEvents, expectedEvents);
        expect(actualEvents).assertEqual(expectedEvents);
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_006
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_006
     * @tc.desc Snapshot both listings to isolate dependency and caller mutations.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_006', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_006';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        api.mutateListing = true;
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        result.push('caller-edit');
        const expectedEvents: string = 'list:/download,stat:/download/a.txt,' +
          'copy:/download/a.txt->/sandbox/a.txt,stat:/download/folder,list:/sandbox';
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'planned import order', actualEvents, expectedEvents);
        expect(actualEvents).assertEqual(expectedEvents);
        const actualSandbox: string = api.sandboxEntries.join(',');
        logAssertion(name, 'caller mutation isolation', actualSandbox, 'old.txt,a.txt');
        expect(actualSandbox).assertEqual('old.txt,a.txt');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_007
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_007
     * @tc.desc Close the owned descriptor after a successful write.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_007', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_007';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        writeDownloadMessage('/download', 'write a message', api);
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'write order', actualEvents, 'open:/download/temp.txt,write:9:write a message,close:9');
        expect(actualEvents).assertEqual('open:/download/temp.txt,write:9:write a message,close:9');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_008
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_008
     * @tc.desc Propagate write failure while closing the descriptor exactly once.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_008', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_008';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        api.failure = 'write';
        let thrown: boolean = false;
        let message: string = '';
        try {
          writeDownloadMessage('/download', 'content', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'write failure must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'write error', actualMessage, 'write denied');
        expect(actualMessage).assertEqual('write denied');
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'failure closes once', actualEvents, 'open:/download/temp.txt,write:9:content,close:9');
        expect(actualEvents).assertEqual('open:/download/temp.txt,write:9:content,close:9');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_009
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_009
     * @tc.desc Reject an empty write directory before opening a descriptor.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_009', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_009';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        let thrown: boolean = false;
        let message: string = '';
        try {
          writeDownloadMessage('', 'content', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'empty directory must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'write directory error', actualMessage, 'Invalid download write directory');
        expect(actualMessage).assertEqual('Invalid download write directory');
        const actualEventCount: number = api.events.length;
        logAssertion(name, 'no descriptor opened', actualEventCount, 0);
        expect(actualEventCount).assertEqual(0);
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_010
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_010
     * @tc.desc Propagate open failure without closing an unowned descriptor.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_010', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_010';
      logCase(name, 'begin');
      try {
        const api: DownloadApiProbe = new DownloadApiProbe();
        api.failure = 'open';
        let thrown: boolean = false;
        let message: string = '';
        try {
          writeDownloadMessage('/download', 'content', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'open failure must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'open error', actualMessage, 'open denied');
        expect(actualMessage).assertEqual('open denied');
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'no unowned close', actualEvents, 'open:/download/temp.txt');
        expect(actualEvents).assertEqual('open:/download/temp.txt');
      } finally {
        logCase(name, 'end');
      }
    });
  });

  // Device-only cases: retained, not reported as executed by the host regression.
  describe('DownloadFilesRealSdk', (): void => {
    let root: string = '';
    let sequence: number = 0;
    beforeEach((): void => {
      sequence++;
      const filesDir: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir;
      root = `${filesDir}/task70-baseline-${Date.now()}-${sequence}`;
      fileIo.mkdirSync(root);
    });
    afterEach((): void => {
      if (root !== '' && fileIo.accessSync(root)) {
        removeSdkSandbox(root);
      }
      root = '';
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_011
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_011
     * @tc.desc Import a real SDK file, skip subdirectories, and preserve source bytes.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_011', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_011';
      logCase(name, 'begin');
      try {
        const download: string = `${root}/download`;
        const sandbox: string = `${root}/sandbox`;
        fileIo.mkdirSync(download);
        fileIo.mkdirSync(sandbox);
        fileIo.mkdirSync(`${download}/folder`);
        writeDownloadMessage(download, '实际文件内容');
        const entries: string[] = importDownloadFiles(download, sandbox);
        const actualCount: number = entries.length;
        logAssertion(name, 'imported file count', actualCount, 1);
        expect(actualCount).assertEqual(1);
        const actualName: string = entries[0];
        logAssertion(name, 'imported filename', actualName, 'temp.txt');
        expect(actualName).assertEqual('temp.txt');
        const actualCopy: string = fileIo.readTextSync(`${sandbox}/temp.txt`);
        logAssertion(name, 'copied bytes', actualCopy, '实际文件内容');
        expect(actualCopy).assertEqual('实际文件内容');
        const actualFolder: boolean = fileIo.accessSync(`${sandbox}/folder`);
        logAssertion(name, 'directory skipped', actualFolder, false);
        expect(actualFolder).assertEqual(false);
        const actualSource: string = fileIo.readTextSync(`${download}/temp.txt`);
        logAssertion(name, 'source bytes preserved', actualSource, '实际文件内容');
        expect(actualSource).assertEqual('实际文件内容');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_012
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_012
     * @tc.desc Truncate stale bytes when rewriting a file through the real SDK.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_012', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_012';
      logCase(name, 'begin');
      try {
        writeDownloadMessage(root, 'a much longer previous message');
        writeDownloadMessage(root, 'new');
        const actualText: string = fileIo.readTextSync(`${root}/temp.txt`);
        logAssertion(name, 'rewritten bytes', actualText, 'new');
        expect(actualText).assertEqual('new');
        const actualSize: number = fileIo.statSync(`${root}/temp.txt`).size;
        logAssertion(name, 'truncated file size', actualSize, 3);
        expect(actualSize).assertEqual(3);
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_BASELINE_013
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_BASELINE_013
     * @tc.desc Obtain distinct absolute download and document paths through the real SDK.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_BASELINE_013', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_BASELINE_013';
      logCase(name, 'begin');
      try {
        const download: string = Environment.getUserDownloadDir();
        const documents: string = Environment.getUserDocumentDir();
        const actualDownloadAbsolute: boolean = download.startsWith('/');
        logAssertion(name, 'absolute download path', actualDownloadAbsolute, true);
        expect(actualDownloadAbsolute).assertEqual(true);
        const actualDocumentAbsolute: boolean = documents.startsWith('/');
        logAssertion(name, 'absolute document path', actualDocumentAbsolute, true);
        expect(actualDocumentAbsolute).assertEqual(true);
        const actualSamePath: boolean = download === documents;
        logAssertion(name, 'distinct user paths', actualSamePath, false);
        expect(actualSamePath).assertEqual(false);
      } finally {
        logCase(name, 'end');
      }
    });
  });
}
