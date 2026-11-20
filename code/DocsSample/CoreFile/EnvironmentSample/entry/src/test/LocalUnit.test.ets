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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DownloadFileApi, importDownloadFiles, writeDownloadMessage } from '../main/ets/model/DownloadFiles';

// Keep local tests independent of the ohosTest source set.
function logCase(name: string, phase: string): void {
  hilog.info(0xF811, '[Sample_Environment]', '%{public}s %{public}s', name, phase);
}

function logAssertion(name: string, label: string, actual: Object | undefined,
  expected: Object | undefined): void {
  hilog.info(0xF811, '[Sample_Environment]', '%{public}s %{public}s actual=%{private}s expected=%{private}s',
    name, label, JSON.stringify(actual) ?? 'undefined', JSON.stringify(expected) ?? 'undefined');
}

class LocalDownloadApiProbe implements DownloadFileApi {
  entries: string[] = ['temp.txt', 'folder'];
  events: string[] = [];
  failure: string = '';

  list(path: string): string[] {
    this.events.push(`list:${path}`);
    return path === '/download' ? this.entries : ['temp.txt'];
  }

  isFile(path: string): boolean {
    this.events.push(`stat:${path}`);
    return !path.endsWith('/folder');
  }

  copy(source: string, destination: string): void {
    this.events.push(`copy:${source}->${destination}`);
  }

  open(path: string): number {
    this.events.push(`open:${path}`);
    if (this.failure === 'open') {
      throw new Error('local open denied');
    }
    return 17;
  }

  write(fd: number, message: string): void {
    this.events.push(`write:${fd}:${message}`);
    if (this.failure === 'write') {
      throw new Error('local write denied');
    }
  }

  close(fd: number): void {
    this.events.push(`close:${fd}`);
  }
}

export default function localUnitTest(): void {
  describe('localUnitTest', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_LOCAL_001
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_LOCAL_001
     * @tc.desc Exercise the production importer and skip directory entries.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_LOCAL_001', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_LOCAL_001';
      logCase(name, 'begin');
      try {
        const api: LocalDownloadApiProbe = new LocalDownloadApiProbe();
        const actualEntries: string = importDownloadFiles('/download', '/sandbox', api).join(',');
        logAssertion(name, 'imported filenames', actualEntries, 'temp.txt');
        expect(actualEntries).assertEqual('temp.txt');
        const expectedEvents: string = 'list:/download,stat:/download/temp.txt,' +
          'copy:/download/temp.txt->/sandbox/temp.txt,stat:/download/folder,list:/sandbox';
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'regular file import order', actualEvents, expectedEvents);
        expect(actualEvents).assertEqual(expectedEvents);
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_LOCAL_002
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_LOCAL_002
     * @tc.desc Reject a traversal entry before copying any valid earlier entry.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_LOCAL_002', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_LOCAL_002';
      logCase(name, 'begin');
      try {
        const api: LocalDownloadApiProbe = new LocalDownloadApiProbe();
        api.entries = ['temp.txt', '../outside'];
        let thrown: boolean = false;
        let message: string = '';
        try {
          importDownloadFiles('/download', '/sandbox', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'traversal must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'traversal error', actualMessage, 'Invalid download entry');
        expect(actualMessage).assertEqual('Invalid download entry');
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'no partial import', actualEvents, 'list:/download');
        expect(actualEvents).assertEqual('list:/download');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_LOCAL_003
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_LOCAL_003
     * @tc.desc Exercise the production writer and close a successfully written descriptor.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_LOCAL_003', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_LOCAL_003';
      logCase(name, 'begin');
      try {
        const api: LocalDownloadApiProbe = new LocalDownloadApiProbe();
        writeDownloadMessage('/download', 'local content', api);
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'write then close', actualEvents, 'open:/download/temp.txt,write:17:local content,close:17');
        expect(actualEvents).assertEqual('open:/download/temp.txt,write:17:local content,close:17');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_LOCAL_004
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_LOCAL_004
     * @tc.desc Propagate write failure while finally closes the owned descriptor exactly once.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_LOCAL_004', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_LOCAL_004';
      logCase(name, 'begin');
      try {
        const api: LocalDownloadApiProbe = new LocalDownloadApiProbe();
        api.failure = 'write';
        let thrown: boolean = false;
        let message: string = '';
        try {
          writeDownloadMessage('/download', 'local content', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'write failure must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'write failure error', actualMessage, 'local write denied');
        expect(actualMessage).assertEqual('local write denied');
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'close once', actualEvents, 'open:/download/temp.txt,write:17:local content,close:17');
        expect(actualEvents).assertEqual('open:/download/temp.txt,write:17:local content,close:17');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_LOCAL_005
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_LOCAL_005
     * @tc.desc Propagate open failure without writing or closing an unowned descriptor.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_LOCAL_005', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_LOCAL_005';
      logCase(name, 'begin');
      try {
        const api: LocalDownloadApiProbe = new LocalDownloadApiProbe();
        api.failure = 'open';
        let thrown: boolean = false;
        let message: string = '';
        try {
          writeDownloadMessage('/download', 'local content', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'open failure must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'open failure error', actualMessage, 'local open denied');
        expect(actualMessage).assertEqual('local open denied');
        const actualEvents: string = api.events.join(',');
        logAssertion(name, 'no unowned descriptor use', actualEvents, 'open:/download/temp.txt');
        expect(actualEvents).assertEqual('open:/download/temp.txt');
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_LOCAL_006
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_LOCAL_006
     * @tc.desc Reject an empty production write directory without dependency calls.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_LOCAL_006', 0, (): void => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_LOCAL_006';
      logCase(name, 'begin');
      try {
        const api: LocalDownloadApiProbe = new LocalDownloadApiProbe();
        let thrown: boolean = false;
        let message: string = '';
        try {
          writeDownloadMessage('', 'local content', api);
        } catch (error) {
          thrown = true;
          message = (error as Error).message;
        }
        const actualThrown: boolean = thrown;
        logAssertion(name, 'empty directory must throw', actualThrown, true);
        expect(actualThrown).assertEqual(true);
        const actualMessage: string = message;
        logAssertion(name, 'empty directory error', actualMessage, 'Invalid download write directory');
        expect(actualMessage).assertEqual('Invalid download write directory');
        const actualEventCount: number = api.events.length;
        logAssertion(name, 'no filesystem access', actualEventCount, 0);
        expect(actualEventCount).assertEqual(0);
      } finally {
        logCase(name, 'end');
      }
    });
  });
}
