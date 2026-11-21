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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import contact from '@ohos.contact';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import fileIo from '@ohos.file.fs';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function apiVolume02Test() {
  describe('ApiVolume02Test', () => {
    /**
     * @tc.name   testApiVolume010052
     * @tc.number SUB_Contact_API_0052
     * @tc.desc   @ohos.file.fs.closeSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010052 begin');
      const result: string = typeof fileIo.closeSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.closeSync), String('function'));
      expect(typeof fileIo.closeSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.closeSync === undefined));
      expect(fileIo.closeSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.closeSync.name), String('closeSync'));
      expect(fileIo.closeSync.name).assertEqual('closeSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010052 end');
    });

    /**
     * @tc.name   testApiVolume010053
     * @tc.number SUB_Contact_API_0053
     * @tc.desc   @ohos.file.fs.copyFile 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010053 begin');
      const result: string = typeof fileIo.copyFile;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.copyFile), String('function'));
      expect(typeof fileIo.copyFile).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.copyFile === undefined));
      expect(fileIo.copyFile === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.copyFile.name), String('copyFile'));
      expect(fileIo.copyFile.name).assertEqual('copyFile');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010053 end');
    });

    /**
     * @tc.name   testApiVolume010054
     * @tc.number SUB_Contact_API_0054
     * @tc.desc   @ohos.file.fs.copyFileSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010054 begin');
      const result: string = typeof fileIo.copyFileSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.copyFileSync), String('function'));
      expect(typeof fileIo.copyFileSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.copyFileSync === undefined));
      expect(fileIo.copyFileSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.copyFileSync.name), String('copyFileSync'));
      expect(fileIo.copyFileSync.name).assertEqual('copyFileSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010054 end');
    });

    /**
     * @tc.name   testApiVolume010055
     * @tc.number SUB_Contact_API_0055
     * @tc.desc   @ohos.file.fs.createStream 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010055 begin');
      const result: string = typeof fileIo.createStream;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.createStream), String('function'));
      expect(typeof fileIo.createStream).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.createStream === undefined));
      expect(fileIo.createStream === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.createStream.name), String('createStream'));
      expect(fileIo.createStream.name).assertEqual('createStream');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010055 end');
    });

    /**
     * @tc.name   testApiVolume010056
     * @tc.number SUB_Contact_API_0056
     * @tc.desc   @ohos.file.fs.createStreamSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010056 begin');
      const result: string = typeof fileIo.createStreamSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.createStreamSync), String('function'));
      expect(typeof fileIo.createStreamSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.createStreamSync === undefined));
      expect(fileIo.createStreamSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.createStreamSync.name), String('createStreamSync'));
      expect(fileIo.createStreamSync.name).assertEqual('createStreamSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010056 end');
    });

    /**
     * @tc.name   testApiVolume010057
     * @tc.number SUB_Contact_API_0057
     * @tc.desc   @ohos.file.fs.fdopenStream 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010057 begin');
      const result: string = typeof fileIo.fdopenStream;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.fdopenStream), String('function'));
      expect(typeof fileIo.fdopenStream).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.fdopenStream === undefined));
      expect(fileIo.fdopenStream === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.fdopenStream.name), String('fdopenStream'));
      expect(fileIo.fdopenStream.name).assertEqual('fdopenStream');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010057 end');
    });

    /**
     * @tc.name   testApiVolume010058
     * @tc.number SUB_Contact_API_0058
     * @tc.desc   @ohos.file.fs.fdopenStreamSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010058 begin');
      const result: string = typeof fileIo.fdopenStreamSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.fdopenStreamSync), String('function'));
      expect(typeof fileIo.fdopenStreamSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.fdopenStreamSync === undefined));
      expect(fileIo.fdopenStreamSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.fdopenStreamSync.name), String('fdopenStreamSync'));
      expect(fileIo.fdopenStreamSync.name).assertEqual('fdopenStreamSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010058 end');
    });

    /**
     * @tc.name   testApiVolume010059
     * @tc.number SUB_Contact_API_0059
     * @tc.desc   @ohos.file.fs.fsync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010059 begin');
      const result: string = typeof fileIo.fsync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.fsync), String('function'));
      expect(typeof fileIo.fsync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.fsync === undefined));
      expect(fileIo.fsync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.fsync.name), String('fsync'));
      expect(fileIo.fsync.name).assertEqual('fsync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010059 end');
    });

    /**
     * @tc.name   testApiVolume010060
     * @tc.number SUB_Contact_API_0060
     * @tc.desc   @ohos.file.fs.fsyncSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010060 begin');
      const result: string = typeof fileIo.fsyncSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.fsyncSync), String('function'));
      expect(typeof fileIo.fsyncSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.fsyncSync === undefined));
      expect(fileIo.fsyncSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.fsyncSync.name), String('fsyncSync'));
      expect(fileIo.fsyncSync.name).assertEqual('fsyncSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010060 end');
    });

    /**
     * @tc.name   testApiVolume010061
     * @tc.number SUB_Contact_API_0061
     * @tc.desc   @ohos.file.fs.listFile 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010061 begin');
      const result: string = typeof fileIo.listFile;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.listFile), String('function'));
      expect(typeof fileIo.listFile).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.listFile === undefined));
      expect(fileIo.listFile === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.listFile.name), String('listFile'));
      expect(fileIo.listFile.name).assertEqual('listFile');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010061 end');
    });

    /**
     * @tc.name   testApiVolume010062
     * @tc.number SUB_Contact_API_0062
     * @tc.desc   @ohos.file.fs.listFileSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010062 begin');
      const result: string = typeof fileIo.listFileSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.listFileSync), String('function'));
      expect(typeof fileIo.listFileSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.listFileSync === undefined));
      expect(fileIo.listFileSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.listFileSync.name), String('listFileSync'));
      expect(fileIo.listFileSync.name).assertEqual('listFileSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010062 end');
    });

    /**
     * @tc.name   testApiVolume010063
     * @tc.number SUB_Contact_API_0063
     * @tc.desc   @ohos.file.fs.lstat 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010063 begin');
      const result: string = typeof fileIo.lstat;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.lstat), String('function'));
      expect(typeof fileIo.lstat).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.lstat === undefined));
      expect(fileIo.lstat === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.lstat.name), String('lstat'));
      expect(fileIo.lstat.name).assertEqual('lstat');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010063 end');
    });

    /**
     * @tc.name   testApiVolume010064
     * @tc.number SUB_Contact_API_0064
     * @tc.desc   @ohos.file.fs.lstatSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010064 begin');
      const result: string = typeof fileIo.lstatSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.lstatSync), String('function'));
      expect(typeof fileIo.lstatSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.lstatSync === undefined));
      expect(fileIo.lstatSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.lstatSync.name), String('lstatSync'));
      expect(fileIo.lstatSync.name).assertEqual('lstatSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010064 end');
    });

    /**
     * @tc.name   testApiVolume010065
     * @tc.number SUB_Contact_API_0065
     * @tc.desc   @ohos.file.fs.mkdir 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010065 begin');
      const result: string = typeof fileIo.mkdir;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.mkdir), String('function'));
      expect(typeof fileIo.mkdir).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.mkdir === undefined));
      expect(fileIo.mkdir === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.mkdir.name), String('mkdir'));
      expect(fileIo.mkdir.name).assertEqual('mkdir');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010065 end');
    });

    /**
     * @tc.name   testApiVolume010066
     * @tc.number SUB_Contact_API_0066
     * @tc.desc   @ohos.file.fs.mkdirSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010066 begin');
      const result: string = typeof fileIo.mkdirSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.mkdirSync), String('function'));
      expect(typeof fileIo.mkdirSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.mkdirSync === undefined));
      expect(fileIo.mkdirSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.mkdirSync.name), String('mkdirSync'));
      expect(fileIo.mkdirSync.name).assertEqual('mkdirSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010066 end');
    });

    /**
     * @tc.name   testApiVolume010067
     * @tc.number SUB_Contact_API_0067
     * @tc.desc   @ohos.file.fs.open 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010067 begin');
      const result: string = typeof fileIo.open;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.open), String('function'));
      expect(typeof fileIo.open).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.open === undefined));
      expect(fileIo.open === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.open.name), String('open'));
      expect(fileIo.open.name).assertEqual('open');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010067 end');
    });

    /**
     * @tc.name   testApiVolume010068
     * @tc.number SUB_Contact_API_0068
     * @tc.desc   @ohos.file.fs.openSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010068 begin');
      const result: string = typeof fileIo.openSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.openSync), String('function'));
      expect(typeof fileIo.openSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.openSync === undefined));
      expect(fileIo.openSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.openSync.name), String('openSync'));
      expect(fileIo.openSync.name).assertEqual('openSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010068 end');
    });

    /**
     * @tc.name   testApiVolume010069
     * @tc.number SUB_Contact_API_0069
     * @tc.desc   @ohos.file.fs.read 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010069 begin');
      const result: string = typeof fileIo.read;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.read), String('function'));
      expect(typeof fileIo.read).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.read === undefined));
      expect(fileIo.read === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.read.name), String('read'));
      expect(fileIo.read.name).assertEqual('read');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010069 end');
    });

    /**
     * @tc.name   testApiVolume010070
     * @tc.number SUB_Contact_API_0070
     * @tc.desc   @ohos.file.fs.readSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010070 begin');
      const result: string = typeof fileIo.readSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.readSync), String('function'));
      expect(typeof fileIo.readSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.readSync === undefined));
      expect(fileIo.readSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.readSync.name), String('readSync'));
      expect(fileIo.readSync.name).assertEqual('readSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010070 end');
    });

    /**
     * @tc.name   testApiVolume010071
     * @tc.number SUB_Contact_API_0071
     * @tc.desc   @ohos.file.fs.readText 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010071 begin');
      const result: string = typeof fileIo.readText;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.readText), String('function'));
      expect(typeof fileIo.readText).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.readText === undefined));
      expect(fileIo.readText === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.readText.name), String('readText'));
      expect(fileIo.readText.name).assertEqual('readText');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010071 end');
    });

    /**
     * @tc.name   testApiVolume010072
     * @tc.number SUB_Contact_API_0072
     * @tc.desc   @ohos.file.fs.readTextSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010072 begin');
      const result: string = typeof fileIo.readTextSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.readTextSync), String('function'));
      expect(typeof fileIo.readTextSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.readTextSync === undefined));
      expect(fileIo.readTextSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.readTextSync.name), String('readTextSync'));
      expect(fileIo.readTextSync.name).assertEqual('readTextSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010072 end');
    });

    /**
     * @tc.name   testApiVolume010073
     * @tc.number SUB_Contact_API_0073
     * @tc.desc   @ohos.file.fs.rename 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010073 begin');
      const result: string = typeof fileIo.rename;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.rename), String('function'));
      expect(typeof fileIo.rename).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.rename === undefined));
      expect(fileIo.rename === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.rename.name), String('rename'));
      expect(fileIo.rename.name).assertEqual('rename');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010073 end');
    });

    /**
     * @tc.name   testApiVolume010074
     * @tc.number SUB_Contact_API_0074
     * @tc.desc   @ohos.file.fs.renameSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010074 begin');
      const result: string = typeof fileIo.renameSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.renameSync), String('function'));
      expect(typeof fileIo.renameSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.renameSync === undefined));
      expect(fileIo.renameSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.renameSync.name), String('renameSync'));
      expect(fileIo.renameSync.name).assertEqual('renameSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010074 end');
    });

    /**
     * @tc.name   testApiVolume010075
     * @tc.number SUB_Contact_API_0075
     * @tc.desc   @ohos.file.fs.rmdir 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010075 begin');
      const result: string = typeof fileIo.rmdir;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.rmdir), String('function'));
      expect(typeof fileIo.rmdir).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.rmdir === undefined));
      expect(fileIo.rmdir === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.rmdir.name), String('rmdir'));
      expect(fileIo.rmdir.name).assertEqual('rmdir');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010075 end');
    });

    /**
     * @tc.name   testApiVolume010076
     * @tc.number SUB_Contact_API_0076
     * @tc.desc   @ohos.file.fs.rmdirSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010076 begin');
      const result: string = typeof fileIo.rmdirSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.rmdirSync), String('function'));
      expect(typeof fileIo.rmdirSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.rmdirSync === undefined));
      expect(fileIo.rmdirSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.rmdirSync.name), String('rmdirSync'));
      expect(fileIo.rmdirSync.name).assertEqual('rmdirSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010076 end');
    });

    /**
     * @tc.name   testApiVolume010077
     * @tc.number SUB_Contact_API_0077
     * @tc.desc   @ohos.file.fs.stat 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010077 begin');
      const result: string = typeof fileIo.stat;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.stat), String('function'));
      expect(typeof fileIo.stat).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.stat === undefined));
      expect(fileIo.stat === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.stat.name), String('stat'));
      expect(fileIo.stat.name).assertEqual('stat');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010077 end');
    });

    /**
     * @tc.name   testApiVolume010078
     * @tc.number SUB_Contact_API_0078
     * @tc.desc   @ohos.file.fs.statSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010078 begin');
      const result: string = typeof fileIo.statSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.statSync), String('function'));
      expect(typeof fileIo.statSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.statSync === undefined));
      expect(fileIo.statSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.statSync.name), String('statSync'));
      expect(fileIo.statSync.name).assertEqual('statSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010078 end');
    });

    /**
     * @tc.name   testApiVolume010079
     * @tc.number SUB_Contact_API_0079
     * @tc.desc   @ohos.file.fs.truncate 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010079 begin');
      const result: string = typeof fileIo.truncate;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.truncate), String('function'));
      expect(typeof fileIo.truncate).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.truncate === undefined));
      expect(fileIo.truncate === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.truncate.name), String('truncate'));
      expect(fileIo.truncate.name).assertEqual('truncate');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010079 end');
    });

    /**
     * @tc.name   testApiVolume010080
     * @tc.number SUB_Contact_API_0080
     * @tc.desc   @ohos.file.fs.truncateSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010080 begin');
      const result: string = typeof fileIo.truncateSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.truncateSync), String('function'));
      expect(typeof fileIo.truncateSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.truncateSync === undefined));
      expect(fileIo.truncateSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.truncateSync.name), String('truncateSync'));
      expect(fileIo.truncateSync.name).assertEqual('truncateSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010080 end');
    });

    /**
     * @tc.name   testApiVolume010081
     * @tc.number SUB_Contact_API_0081
     * @tc.desc   @ohos.file.fs.unlink 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010081 begin');
      const result: string = typeof fileIo.unlink;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.unlink), String('function'));
      expect(typeof fileIo.unlink).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.unlink === undefined));
      expect(fileIo.unlink === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.unlink.name), String('unlink'));
      expect(fileIo.unlink.name).assertEqual('unlink');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010081 end');
    });

    /**
     * @tc.name   testApiVolume010082
     * @tc.number SUB_Contact_API_0082
     * @tc.desc   @ohos.file.fs.unlinkSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010082 begin');
      const result: string = typeof fileIo.unlinkSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.unlinkSync), String('function'));
      expect(typeof fileIo.unlinkSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.unlinkSync === undefined));
      expect(fileIo.unlinkSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.unlinkSync.name), String('unlinkSync'));
      expect(fileIo.unlinkSync.name).assertEqual('unlinkSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010082 end');
    });

    /**
     * @tc.name   testApiVolume010083
     * @tc.number SUB_Contact_API_0083
     * @tc.desc   @ohos.file.fs.utimes 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010083 begin');
      const result: string = typeof fileIo.utimes;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.utimes), String('function'));
      expect(typeof fileIo.utimes).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.utimes === undefined));
      expect(fileIo.utimes === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.utimes.name), String('utimes'));
      expect(fileIo.utimes.name).assertEqual('utimes');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010083 end');
    });

    /**
     * @tc.name   testApiVolume010084
     * @tc.number SUB_Contact_API_0084
     * @tc.desc   @ohos.file.fs.write 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010084 begin');
      const result: string = typeof fileIo.write;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.write), String('function'));
      expect(typeof fileIo.write).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.write === undefined));
      expect(fileIo.write === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.write.name), String('write'));
      expect(fileIo.write.name).assertEqual('write');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010084 end');
    });

    /**
     * @tc.name   testApiVolume010085
     * @tc.number SUB_Contact_API_0085
     * @tc.desc   @ohos.file.fs.writeSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010085 begin');
      const result: string = typeof fileIo.writeSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.writeSync), String('function'));
      expect(typeof fileIo.writeSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.writeSync === undefined));
      expect(fileIo.writeSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.writeSync.name), String('writeSync'));
      expect(fileIo.writeSync.name).assertEqual('writeSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010085 end');
    });

    /**
     * @tc.name   testApiVolume010086
     * @tc.number SUB_Contact_API_0086
     * @tc.desc   @ohos.file.fs.moveFile 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010086 begin');
      const result: string = typeof fileIo.moveFile;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.moveFile), String('function'));
      expect(typeof fileIo.moveFile).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.moveFile === undefined));
      expect(fileIo.moveFile === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.moveFile.name), String('moveFile'));
      expect(fileIo.moveFile.name).assertEqual('moveFile');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010086 end');
    });

    /**
     * @tc.name   testApiVolume010087
     * @tc.number SUB_Contact_API_0087
     * @tc.desc   @ohos.file.fs.moveFileSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010087 begin');
      const result: string = typeof fileIo.moveFileSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.moveFileSync), String('function'));
      expect(typeof fileIo.moveFileSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.moveFileSync === undefined));
      expect(fileIo.moveFileSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.moveFileSync.name), String('moveFileSync'));
      expect(fileIo.moveFileSync.name).assertEqual('moveFileSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010087 end');
    });

    /**
     * @tc.name   testApiVolume010088
     * @tc.number SUB_Contact_API_0088
     * @tc.desc   @ohos.file.fs.copyDir 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010088 begin');
      const result: string = typeof fileIo.copyDir;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.copyDir), String('function'));
      expect(typeof fileIo.copyDir).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.copyDir === undefined));
      expect(fileIo.copyDir === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.copyDir.name), String('copyDir'));
      expect(fileIo.copyDir.name).assertEqual('copyDir');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010088 end');
    });

    /**
     * @tc.name   testApiVolume010089
     * @tc.number SUB_Contact_API_0089
     * @tc.desc   @ohos.file.fs.copyDirSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010089 begin');
      const result: string = typeof fileIo.copyDirSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.copyDirSync), String('function'));
      expect(typeof fileIo.copyDirSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.copyDirSync === undefined));
      expect(fileIo.copyDirSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.copyDirSync.name), String('copyDirSync'));
      expect(fileIo.copyDirSync.name).assertEqual('copyDirSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010089 end');
    });

    /**
     * @tc.name   testApiVolume010090
     * @tc.number SUB_Contact_API_0090
     * @tc.desc   @ohos.file.fs.moveDir 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010090 begin');
      const result: string = typeof fileIo.moveDir;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.moveDir), String('function'));
      expect(typeof fileIo.moveDir).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.moveDir === undefined));
      expect(fileIo.moveDir === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.moveDir.name), String('moveDir'));
      expect(fileIo.moveDir.name).assertEqual('moveDir');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010090 end');
    });

    /**
     * @tc.name   testApiVolume010091
     * @tc.number SUB_Contact_API_0091
     * @tc.desc   @ohos.file.fs.moveDirSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010091 begin');
      const result: string = typeof fileIo.moveDirSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.moveDirSync), String('function'));
      expect(typeof fileIo.moveDirSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.moveDirSync === undefined));
      expect(fileIo.moveDirSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.moveDirSync.name), String('moveDirSync'));
      expect(fileIo.moveDirSync.name).assertEqual('moveDirSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010091 end');
    });

    /**
     * @tc.name   testApiVolume010092
     * @tc.number SUB_Contact_API_0092
     * @tc.desc   @ohos.file.fs.mkdtemp 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010092 begin');
      const result: string = typeof fileIo.mkdtemp;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.mkdtemp), String('function'));
      expect(typeof fileIo.mkdtemp).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.mkdtemp === undefined));
      expect(fileIo.mkdtemp === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.mkdtemp.name), String('mkdtemp'));
      expect(fileIo.mkdtemp.name).assertEqual('mkdtemp');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010092 end');
    });

    /**
     * @tc.name   testApiVolume010093
     * @tc.number SUB_Contact_API_0093
     * @tc.desc   @ohos.file.fs.mkdtempSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010093 begin');
      const result: string = typeof fileIo.mkdtempSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.mkdtempSync), String('function'));
      expect(typeof fileIo.mkdtempSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.mkdtempSync === undefined));
      expect(fileIo.mkdtempSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.mkdtempSync.name), String('mkdtempSync'));
      expect(fileIo.mkdtempSync.name).assertEqual('mkdtempSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010093 end');
    });

    /**
     * @tc.name   testApiVolume010094
     * @tc.number SUB_Contact_API_0094
     * @tc.desc   @ohos.file.fs.createRandomAccessFile 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010094 begin');
      const result: string = typeof fileIo.createRandomAccessFile;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.createRandomAccessFile), String('function'));
      expect(typeof fileIo.createRandomAccessFile).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.createRandomAccessFile === undefined));
      expect(fileIo.createRandomAccessFile === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.createRandomAccessFile.name), String('createRandomAccessFile'));
      expect(fileIo.createRandomAccessFile.name).assertEqual('createRandomAccessFile');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010094 end');
    });

    /**
     * @tc.name   testApiVolume010095
     * @tc.number SUB_Contact_API_0095
     * @tc.desc   @ohos.file.fs.createRandomAccessFileSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010095 begin');
      const result: string = typeof fileIo.createRandomAccessFileSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.createRandomAccessFileSync), String('function'));
      expect(typeof fileIo.createRandomAccessFileSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.createRandomAccessFileSync === undefined));
      expect(fileIo.createRandomAccessFileSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.createRandomAccessFileSync.name), String('createRandomAccessFileSync'));
      expect(fileIo.createRandomAccessFileSync.name).assertEqual('createRandomAccessFileSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010095 end');
    });

    /**
     * @tc.name   testApiVolume010096
     * @tc.number SUB_Contact_API_0096
     * @tc.desc   @ohos.file.fs.readLines 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010096 begin');
      const result: string = typeof fileIo.readLines;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.readLines), String('function'));
      expect(typeof fileIo.readLines).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.readLines === undefined));
      expect(fileIo.readLines === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.readLines.name), String('readLines'));
      expect(fileIo.readLines.name).assertEqual('readLines');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010096 end');
    });

    /**
     * @tc.name   testApiVolume010097
     * @tc.number SUB_Contact_API_0097
     * @tc.desc   @ohos.file.fs.readLinesSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010097 begin');
      const result: string = typeof fileIo.readLinesSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.readLinesSync), String('function'));
      expect(typeof fileIo.readLinesSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.readLinesSync === undefined));
      expect(fileIo.readLinesSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.readLinesSync.name), String('readLinesSync'));
      expect(fileIo.readLinesSync.name).assertEqual('readLinesSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010097 end');
    });

    /**
     * @tc.name   testApiVolume010098
     * @tc.number SUB_Contact_API_0098
     * @tc.desc   @ohos.file.fs.dup 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010098 begin');
      const result: string = typeof fileIo.dup;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.dup), String('function'));
      expect(typeof fileIo.dup).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.dup === undefined));
      expect(fileIo.dup === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(fileIo.dup.name), String('dup'));
      expect(fileIo.dup.name).assertEqual('dup');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010098 end');
    });

    /**
     * @tc.name   testApiVolume010099
     * @tc.number SUB_Contact_API_0099
     * @tc.desc   @ohos.file.fs.lseek 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010099 begin');
      const result: string = typeof fileIo.lseek;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.lseek), String('function'));
      expect(typeof fileIo.lseek).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.lseek === undefined));
      expect(fileIo.lseek === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.lseek.name), String('lseek'));
      expect(fileIo.lseek.name).assertEqual('lseek');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010099 end');
    });

    /**
     * @tc.name   testApiVolume010100
     * @tc.number SUB_Contact_API_0100
     * @tc.desc   @ohos.file.fs.stat 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010100 begin');
      const result: string = typeof fileIo.stat;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.stat), String('function'));
      expect(typeof fileIo.stat).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.stat === undefined));
      expect(fileIo.stat === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.stat.name), String('stat'));
      expect(fileIo.stat.name).assertEqual('stat');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010100 end');
    });

    /**
     * @tc.name   testApiVolume010101
     * @tc.number SUB_Contact_API_0101
     * @tc.desc   @ohos.file.fs.statSync 存在且为函数（SDK 26 约定）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiVolume010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010101 begin');
      const result: string = typeof fileIo.statSync;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(typeof fileIo.statSync), String('function'));
      expect(typeof fileIo.statSync).assertEqual('function');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(fileIo.statSync === undefined));
      expect(fileIo.statSync === undefined).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(fileIo.statSync.name), String('statSync'));
      expect(fileIo.statSync.name).assertEqual('statSync');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testApiVolume010101 end');
    });
  });
}
