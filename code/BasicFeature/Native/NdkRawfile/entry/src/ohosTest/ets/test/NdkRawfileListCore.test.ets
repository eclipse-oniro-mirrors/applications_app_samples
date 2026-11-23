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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';
import resourceManager from '@ohos.resourceManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testNapi from 'libentry.so';

const DOMAIN: number = 0xF812;
const TAG: string = 'NdkRawfileListCoreTest';
const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function createEntryResMgr(): resourceManager.ResourceManager {
  const appContext: common.Context = delegator.getAppContext();
  const moduleContext: common.Context = appContext.createModuleContext('entry');
  return moduleContext.resourceManager;
}

function sortedJoin(source: Array<string>): string {
  const copy: Array<string> = source.slice().sort();
  let joined: string = '';
  for (let i: number = 0; i < copy.length; i++) {
    if (i > 0) {
      joined += ',';
    }
    joined += copy[i];
  }
  return joined;
}

function joinList(source: Array<string>): string {
  let joined: string = '';
  for (let i: number = 0; i < source.length; i++) {
    if (i > 0) {
      joined += ',';
    }
    joined += source[i];
  }
  return joined;
}

export default function ndkRawfileListCoreTest(): void {
  describe('NdkRawfileListCoreTest', () => {
    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0001
     * @tc.name      testRawfileFileList0001
     * @tc.desc      Verify the rawfile root list exposes exactly three entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0001 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=3`);
      expect(list.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(list)=${Array.isArray(list)}`);
      expect(Array.isArray(list)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof list=${typeof list}, expected='object'`);
      expect(typeof list).assertEqual('object');
      log('testRawfileFileList0001 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0002
     * @tc.name      testRawfileFileList0002
     * @tc.desc      Verify the first root entry is rawfile.txt.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0002 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list[0]=${list[0]}, expected='rawfile.txt'`);
      expect(list[0]).assertEqual('rawfile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=3`);
      expect(list.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof list[0]=${typeof list[0]}, expected='string'`);
      expect(typeof list[0]).assertEqual('string');
      log('testRawfileFileList0002 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0003
     * @tc.name      testRawfileFileList0003
     * @tc.desc      Verify the second root entry is rawfile1.txt.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0003 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list[1]=${list[1]}, expected='rawfile1.txt'`);
      expect(list[1]).assertEqual('rawfile1.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=3`);
      expect(list.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof list[1]=${typeof list[1]}, expected='string'`);
      expect(typeof list[1]).assertEqual('string');
      log('testRawfileFileList0003 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0004
     * @tc.name      testRawfileFileList0004
     * @tc.desc      Verify the third root entry is the subrawfile directory.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0004 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list[2]=${list[2]}, expected='subrawfile'`);
      expect(list[2]).assertEqual('subrawfile');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=3`);
      expect(list.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof list[2]=${typeof list[2]}, expected='string'`);
      expect(typeof list[2]).assertEqual('string');
      log('testRawfileFileList0004 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0005
     * @tc.name      testRawfileFileList0005
     * @tc.desc      Verify the root list order matches the packaged rawfile layout.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0005 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joinList(list)=${joinList(list)}`);
      expect(joinList(list)).assertEqual('rawfile.txt,rawfile1.txt,subrawfile');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual JSON.stringify(list)=${JSON.stringify(list)}`);
      expect(JSON.stringify(list)).assertEqual('["rawfile.txt","rawfile1.txt","subrawfile"]');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=3`);
      expect(list.length).assertEqual(3);
      log('testRawfileFileList0005 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0006
     * @tc.name      testRawfileFileList0006
     * @tc.desc      Verify each expected root entry sits at its stable index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0006 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.indexOf('rawfile.txt')=${list.indexOf('rawfile.txt')}`);
      expect(list.indexOf('rawfile.txt')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.indexOf('rawfile1.txt')=${list.indexOf('rawfile1.txt')}`);
      expect(list.indexOf('rawfile1.txt')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.indexOf('subrawfile')=${list.indexOf('subrawfile')}`);
      expect(list.indexOf('subrawfile')).assertEqual(2);
      log('testRawfileFileList0006 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0007
     * @tc.name      testRawfileFileList0007
     * @tc.desc      Verify every root list element keeps the string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0007 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, '');
      let allStrings: boolean = true;
      for (let i: number = 0; i < list.length; i++) {
        if (typeof list[i] !== 'string') {
          allStrings = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allStrings=${allStrings}`);
      expect(allStrings).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=3`);
      expect(list.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof list[list.length - 1]=${typeof list[list.length - 1]}`);
      expect(typeof list[list.length - 1]).assertEqual('string');
      log('testRawfileFileList0007 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0008
     * @tc.name      testRawfileFileList0008
     * @tc.desc      Verify the root list stays flat without nested path entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0008 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${list.indexOf('subrawfile/rawfile2.txt')}`);
      expect(list.indexOf('subrawfile/rawfile2.txt')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=3`);
      expect(list.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual joinList(list).indexOf('/')=${joinList(list).indexOf('/')}`);
      expect(joinList(list).indexOf('/')).assertEqual(-1);
      log('testRawfileFileList0008 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0009
     * @tc.name      testRawfileFileList0009
     * @tc.desc      Verify the subrawfile directory list exposes one entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0009 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, 'subrawfile');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=1`);
      expect(list.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(list)=${Array.isArray(list)}`);
      expect(Array.isArray(list)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof list=${typeof list}, expected='object'`);
      expect(typeof list).assertEqual('object');
      log('testRawfileFileList0009 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0010
     * @tc.name      testRawfileFileList0010
     * @tc.desc      Verify the subrawfile directory entry is rawfile2.txt.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0010 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, 'subrawfile');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list[0]=${list[0]}, expected='rawfile2.txt'`);
      expect(list[0]).assertEqual('rawfile2.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=1`);
      expect(list.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof list[0]=${typeof list[0]}, expected='string'`);
      expect(typeof list[0]).assertEqual('string');
      log('testRawfileFileList0010 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0011
     * @tc.name      testRawfileFileList0011
     * @tc.desc      Verify the subrawfile list locates rawfile2.txt at index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0011 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, 'subrawfile');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.indexOf('rawfile2.txt')=${list.indexOf('rawfile2.txt')}`);
      expect(list.indexOf('rawfile2.txt')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=1`);
      expect(list.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(list)=${Array.isArray(list)}`);
      expect(Array.isArray(list)).assertTrue();
      log('testRawfileFileList0011 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0012
     * @tc.name      testRawfileFileList0012
     * @tc.desc      Verify repeated root listing calls stay deterministic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0012 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const first: Array<string> = testNapi.getFileList(resMgr, '');
      const second: Array<string> = testNapi.getFileList(resMgr, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual JSON.stringify(first)=${JSON.stringify(first)}`);
      expect(JSON.stringify(first)).assertEqual(JSON.stringify(second));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=3`);
      expect(first.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.length=${second.length}, expected=3`);
      expect(second.length).assertEqual(3);
      log('testRawfileFileList0012 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0014
     * @tc.name      testRawfileFileList0014
     * @tc.desc      Verify listing an unknown directory returns an empty array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0014 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const list: Array<string> = testNapi.getFileList(resMgr, 'no_such_dir_xyz');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual list.length=${list.length}, expected=0`);
      expect(list.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(list)=${Array.isArray(list)}`);
      expect(Array.isArray(list)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof list=${typeof list}, expected='object'`);
      expect(typeof list).assertEqual('object');
      log('testRawfileFileList0014 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0015
     * @tc.name      testRawfileFileList0015
     * @tc.desc      Verify repeated unknown directory listings stay empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0015 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const first: Array<string> = testNapi.getFileList(resMgr, 'no_such_dir_xyz');
      const second: Array<string> = testNapi.getFileList(resMgr, 'no_such_dir_xyz');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=0`);
      expect(first.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.length=${second.length}, expected=0`);
      expect(second.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual JSON.stringify(first)=${JSON.stringify(first)}`);
      expect(JSON.stringify(first)).assertEqual(JSON.stringify(second));
      log('testRawfileFileList0015 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0017
     * @tc.name      testRawfileFileList0017
     * @tc.desc      Verify the native root list matches the ArkTS rawfile list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0017 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const nativeList: Array<string> = testNapi.getFileList(resMgr, '');
      const arkList: Array<string> = resMgr.getRawFileListSync('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual sortedJoin(nativeList)=${sortedJoin(nativeList)}`);
      expect(sortedJoin(nativeList)).assertEqual(sortedJoin(arkList));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeList.length=${nativeList.length}, expected=3`);
      expect(nativeList.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual arkList.length=${arkList.length}, expected=3`);
      expect(arkList.length).assertEqual(3);
      log('testRawfileFileList0017 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0018
     * @tc.name      testRawfileFileList0018
     * @tc.desc      Verify the native subrawfile list matches the ArkTS list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0018 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const nativeList: Array<string> = testNapi.getFileList(resMgr, 'subrawfile');
      const arkList: Array<string> = resMgr.getRawFileListSync('subrawfile');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual sortedJoin(nativeList)=${sortedJoin(nativeList)}`);
      expect(sortedJoin(nativeList)).assertEqual(sortedJoin(arkList));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeList.length=${nativeList.length}, expected=1`);
      expect(nativeList.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual sortedJoin(arkList)=${sortedJoin(arkList)}`);
      expect(sortedJoin(arkList)).assertEqual('rawfile2.txt');
      log('testRawfileFileList0018 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0019
     * @tc.name      testRawfileFileList0019
     * @tc.desc      Verify nested rawfile2.txt is listed only inside subrawfile.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0019 begin');
      const resMgr: resourceManager.ResourceManager = createEntryResMgr();
      const root: Array<string> = testNapi.getFileList(resMgr, '');
      const sub: Array<string> = testNapi.getFileList(resMgr, 'subrawfile');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual root.indexOf('rawfile2.txt')=${root.indexOf('rawfile2.txt')}`);
      expect(root.indexOf('rawfile2.txt')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual root.length=${root.length}, expected=3`);
      expect(root.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual sub.indexOf('rawfile2.txt')=${sub.indexOf('rawfile2.txt')}`);
      expect(sub.indexOf('rawfile2.txt')).assertEqual(0);
      log('testRawfileFileList0019 end');
    })

    /**
     * @tc.number    SUB_NDKRAWFILE_FILELIST_0020
     * @tc.name      testRawfileFileList0020
     * @tc.desc      Verify a fresh resource manager lists the same subrawfile entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRawfileFileList0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRawfileFileList0020 begin');
      const first: Array<string> = testNapi.getFileList(createEntryResMgr(), 'subrawfile');
      const second: Array<string> = testNapi.getFileList(createEntryResMgr(), 'subrawfile');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.length=${first.length}, expected=1`);
      expect(first.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second[0]=${second[0]}, expected='rawfile2.txt'`);
      expect(second[0]).assertEqual('rawfile2.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual JSON.stringify(first)=${JSON.stringify(first)}`);
      expect(JSON.stringify(first)).assertEqual(JSON.stringify(second));
      log('testRawfileFileList0020 end');
    })
  })
}
