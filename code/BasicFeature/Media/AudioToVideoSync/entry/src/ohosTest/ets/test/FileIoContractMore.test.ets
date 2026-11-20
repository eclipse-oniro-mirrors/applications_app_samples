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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';


function getTestDir(): string {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir;
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_FileIoContractMore]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function fileIoContractMoreTest() {
  describe('fileIoContractMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_FI_0001
     * @tc.name      testMoreFileIo0001
     * @tc.desc      File open flags read=True write=False create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0001');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0001');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0002
     * @tc.name      testMoreFileIo0002
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0002');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0002');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0003
     * @tc.name      testMoreFileIo0003
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0003');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0003');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0004
     * @tc.name      testMoreFileIo0004
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0004');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0004');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0005
     * @tc.name      testMoreFileIo0005
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0005');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0005');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0006
     * @tc.name      testMoreFileIo0006
     * @tc.desc      File open flags read=False write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0006');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0006');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0007
     * @tc.name      testMoreFileIo0007
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0007');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0007');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0008
     * @tc.name      testMoreFileIo0008
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0008');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0008');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0009
     * @tc.name      testMoreFileIo0009
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0009');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0009');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0010
     * @tc.name      testMoreFileIo0010
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0010');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0010');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0011
     * @tc.name      testMoreFileIo0011
     * @tc.desc      File open flags read=True write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0011');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0011');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0012
     * @tc.name      testMoreFileIo0012
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0012');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0012');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0013
     * @tc.name      testMoreFileIo0013
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0013');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0013');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0014
     * @tc.name      testMoreFileIo0014
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0014');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0014');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0015
     * @tc.name      testMoreFileIo0015
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0015');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0015');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0016
     * @tc.name      testMoreFileIo0016
     * @tc.desc      File open flags read=False write=False create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0016');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0016');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0017
     * @tc.name      testMoreFileIo0017
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0017');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0017');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0018
     * @tc.name      testMoreFileIo0018
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0018');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0018');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0019
     * @tc.name      testMoreFileIo0019
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0019');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0019');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0020
     * @tc.name      testMoreFileIo0020
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0020');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0020');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0021
     * @tc.name      testMoreFileIo0021
     * @tc.desc      File open flags read=True write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0021');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0021');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0022
     * @tc.name      testMoreFileIo0022
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0022');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0022');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0023
     * @tc.name      testMoreFileIo0023
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0023');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0023');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0024
     * @tc.name      testMoreFileIo0024
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0024');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0024');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0025
     * @tc.name      testMoreFileIo0025
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0025');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0025');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0026
     * @tc.name      testMoreFileIo0026
     * @tc.desc      File open flags read=False write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0026');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0026');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0027
     * @tc.name      testMoreFileIo0027
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0027');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0027');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0028
     * @tc.name      testMoreFileIo0028
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0028');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0028');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0029
     * @tc.name      testMoreFileIo0029
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0029');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0029');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0030
     * @tc.name      testMoreFileIo0030
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0030');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0030');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0031
     * @tc.name      testMoreFileIo0031
     * @tc.desc      File open flags read=True write=False create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0031');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0031');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0032
     * @tc.name      testMoreFileIo0032
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0032');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0032');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0033
     * @tc.name      testMoreFileIo0033
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0033');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0033');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0034
     * @tc.name      testMoreFileIo0034
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0034');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0034');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0035
     * @tc.name      testMoreFileIo0035
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0035');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0035');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0036
     * @tc.name      testMoreFileIo0036
     * @tc.desc      File open flags read=False write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0036');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0036');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0037
     * @tc.name      testMoreFileIo0037
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0037');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0037');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0038
     * @tc.name      testMoreFileIo0038
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0038');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0038');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0039
     * @tc.name      testMoreFileIo0039
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0039');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0039');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0040
     * @tc.name      testMoreFileIo0040
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0040');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0040');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0041
     * @tc.name      testMoreFileIo0041
     * @tc.desc      File open flags read=True write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0041');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0041');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0042
     * @tc.name      testMoreFileIo0042
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0042');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0042');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0043
     * @tc.name      testMoreFileIo0043
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0043');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0043');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0044
     * @tc.name      testMoreFileIo0044
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0044');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0044');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0045
     * @tc.name      testMoreFileIo0045
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0045');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0045');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0046
     * @tc.name      testMoreFileIo0046
     * @tc.desc      File open flags read=False write=False create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0046');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0046');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0047
     * @tc.name      testMoreFileIo0047
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0047');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0047');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0048
     * @tc.name      testMoreFileIo0048
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0048');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0048');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0049
     * @tc.name      testMoreFileIo0049
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0049');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0049');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0050
     * @tc.name      testMoreFileIo0050
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0050');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0050');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0051
     * @tc.name      testMoreFileIo0051
     * @tc.desc      File open flags read=True write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0051');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0051');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0052
     * @tc.name      testMoreFileIo0052
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0052');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0052');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0053
     * @tc.name      testMoreFileIo0053
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0053');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0053');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0054
     * @tc.name      testMoreFileIo0054
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0054');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0054');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0055
     * @tc.name      testMoreFileIo0055
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0055');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0055');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0056
     * @tc.name      testMoreFileIo0056
     * @tc.desc      File open flags read=False write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0056');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0056');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0057
     * @tc.name      testMoreFileIo0057
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0057');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0057');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0058
     * @tc.name      testMoreFileIo0058
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0058');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0058');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0059
     * @tc.name      testMoreFileIo0059
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0059');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0059');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0060
     * @tc.name      testMoreFileIo0060
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0060');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0060');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0061
     * @tc.name      testMoreFileIo0061
     * @tc.desc      File open flags read=True write=False create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0061');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0061');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0062
     * @tc.name      testMoreFileIo0062
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0062');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0062');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0063
     * @tc.name      testMoreFileIo0063
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0063');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0063');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0064
     * @tc.name      testMoreFileIo0064
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0064');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0064');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0065
     * @tc.name      testMoreFileIo0065
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0065');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0065');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0066
     * @tc.name      testMoreFileIo0066
     * @tc.desc      File open flags read=False write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0066');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0066');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0067
     * @tc.name      testMoreFileIo0067
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0067');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0067');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0068
     * @tc.name      testMoreFileIo0068
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0068');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0068');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0069
     * @tc.name      testMoreFileIo0069
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0069');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0069');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0070
     * @tc.name      testMoreFileIo0070
     * @tc.desc      File open flags read=False write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0070');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0070');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0071
     * @tc.name      testMoreFileIo0071
     * @tc.desc      File open flags read=True write=True create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0071');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0071');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0072
     * @tc.name      testMoreFileIo0072
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0072');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0072');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0073
     * @tc.name      testMoreFileIo0073
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0073');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0073');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0074
     * @tc.name      testMoreFileIo0074
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0074');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0074');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0075
     * @tc.name      testMoreFileIo0075
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0075');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0075');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0076
     * @tc.name      testMoreFileIo0076
     * @tc.desc      File open flags read=False write=False create=True are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0076');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0076');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0077
     * @tc.name      testMoreFileIo0077
     * @tc.desc      File open flags read=True write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0077');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0077');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0078
     * @tc.name      testMoreFileIo0078
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0078');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0078');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0079
     * @tc.name      testMoreFileIo0079
     * @tc.desc      File open flags read=True write=False create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0079');
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0079');
    })
    /**
     * @tc.number    SUB_AVS_MORE_FI_0080
     * @tc.name      testMoreFileIo0080
     * @tc.desc      File open flags read=False write=True create=False are retained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreFileIo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testMoreFileIo0080');
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
          const __tmpPath: string = getTestDir() + '/tmp_' + Date.now()
        + '_' + Math.floor(Math.random() * 100000) + '.bin';
      let __openMode: number = mode | fileIo.OpenMode.CREATE;
      if ((__openMode & (fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.READ_WRITE)) === 0) {
        __openMode = __openMode | fileIo.OpenMode.READ_WRITE;
      }
      const __tmpFile: fileIo.File = fileIo.openSync(__tmpPath, __openMode);
      expect(fileIo.accessSync(__tmpPath)).assertTrue();
      fileIo.closeSync(__tmpFile);
      fileIo.unlinkSync(__tmpPath);

      logEnd('testMoreFileIo0080');
    })
  })
}
